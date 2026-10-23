#!/usr/bin/env python3
"""Build offline MBTiles basemaps for the campus safety project.

Usage:
  python tools/offline_tiles/build_tiles.py --profile province_tiered
"""

from __future__ import annotations

import argparse
import math
import sqlite3
import sys
import time
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Set, Tuple
from urllib import error, request

WEB_MERCATOR_LIMIT = 85.05112878
USER_AGENT = "campus-safety-offline-tiles/1.0"


@dataclass(frozen=True)
class LayerConfig:
    name: str
    url_template: str
    image_format: str
    attribution: str
    source_name: str


@dataclass(frozen=True)
class ZoomRegion:
    name: str
    bounds: Tuple[float, float, float, float]
    min_zoom: int
    max_zoom: int


PROFILES: Dict[str, Dict[str, object]] = {
    "province_tiered": {
        "bounds": (108.4, 18.0, 111.4, 20.4),  # Hainan province
        "regions": [
            ZoomRegion("province_overview", (108.4, 18.0, 111.4, 20.4), 3, 9),
            ZoomRegion("haikou_campus", (110.15, 19.95, 110.55, 20.20), 10, 16),
            ZoomRegion("sanya_campus", (109.40, 19.35, 109.75, 19.65), 10, 16),
        ],
        "layers": [
            LayerConfig(
                name="light",
                url_template="https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                image_format="png",
                attribution="© OpenStreetMap contributors",
                source_name="OpenStreetMap Standard",
            ),
            LayerConfig(
                name="satellite",
                url_template="https://tiles.maps.eox.at/wmts/1.0.0/s2cloudless-2024_3857/default/g/{z}/{y}/{x}.jpg",
                image_format="jpg",
                attribution="Contains modified Copernicus Sentinel data (EOX Sentinel-2 cloudless)",
                source_name="EOX Sentinel-2 Cloudless 2024",
            ),
        ],
    },
    # [新增] 海南科技职业大学两校区精细瓦片
    # 美兰校区: (110.4032, 20.0449) - 琼山大道 18 号
    # 云龙校区: (110.4573, 19.8598) - 云定路 118 号
    # 注意: 这里**只使用 WGS-84 原生坐标系**的瓦片源，避免高德 GCJ-02 与建筑物 WGS-84 坐标出现 300-500m 偏移
    "hvust_campuses": {
        "bounds": (110.39, 19.85, 110.47, 20.06),
        "regions": [
            # 海口宏观预览（方便拉到两校区之间切换）
            ZoomRegion("haikou_overview", (110.20, 19.80, 110.60, 20.10), 9, 13),
            # 美兰校区 ~2km × 2km 精细瓦片，覆盖整个校园
            ZoomRegion("meilan_campus", (110.3932, 20.0349, 110.4132, 20.0549), 14, 18),
            # 云龙校区 ~2km × 2km 精细瓦片
            ZoomRegion("yunlong_campus", (110.4473, 19.8498, 110.4673, 19.8698), 14, 18),
        ],
        "layers": [
            LayerConfig(
                name="light",
                url_template="https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",
                image_format="png",
                attribution="© Esri, DeLorme, NAVTEQ",
                source_name="ArcGIS World Street Map (WGS-84)",
            ),
            LayerConfig(
                name="satellite",
                url_template="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
                image_format="jpg",
                attribution="© Esri, Maxar, Earthstar Geographics",
                source_name="ArcGIS World Imagery (WGS-84)",
            ),
        ],
    },
}


def lonlat_to_xyz(lon: float, lat: float, zoom: int) -> Tuple[int, int]:
    lat = max(min(lat, WEB_MERCATOR_LIMIT), -WEB_MERCATOR_LIMIT)
    n = 2**zoom
    x = int((lon + 180.0) / 360.0 * n)
    lat_rad = math.radians(lat)
    y = int((1.0 - math.log(math.tan(lat_rad) + (1.0 / math.cos(lat_rad))) / math.pi) / 2.0 * n)
    x = min(max(x, 0), n - 1)
    y = min(max(y, 0), n - 1)
    return x, y


def xyz_to_tms_y(y: int, zoom: int) -> int:
    return (2**zoom - 1) - y


def iter_tiles_for_bbox(bounds: Tuple[float, float, float, float], zoom: int) -> Iterable[Tuple[int, int, int]]:
    min_lon, min_lat, max_lon, max_lat = bounds
    x_min, y_max = lonlat_to_xyz(min_lon, max_lat, zoom)
    x_max, y_min = lonlat_to_xyz(max_lon, min_lat, zoom)
    for x in range(min(x_min, x_max), max(x_min, x_max) + 1):
        for y in range(min(y_min, y_max), max(y_min, y_max) + 1):
            yield zoom, x, y


def collect_tiles(regions: List[ZoomRegion]) -> List[Tuple[int, int, int]]:
    tile_set: Set[Tuple[int, int, int]] = set()
    for region in regions:
        for zoom in range(region.min_zoom, region.max_zoom + 1):
            for tile in iter_tiles_for_bbox(region.bounds, zoom):
                tile_set.add(tile)
    return sorted(tile_set)


def ensure_mbtiles_schema(conn: sqlite3.Connection) -> None:
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS metadata (
            name TEXT PRIMARY KEY,
            value TEXT
        )
        """
    )
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS tiles (
            zoom_level INTEGER NOT NULL,
            tile_column INTEGER NOT NULL,
            tile_row INTEGER NOT NULL,
            tile_data BLOB NOT NULL,
            PRIMARY KEY (zoom_level, tile_column, tile_row)
        )
        """
    )
    conn.execute(
        """
        CREATE UNIQUE INDEX IF NOT EXISTS tile_index
        ON tiles (zoom_level, tile_column, tile_row)
        """
    )
    conn.commit()


def tile_exists(conn: sqlite3.Connection, z: int, x: int, y: int) -> bool:
    tms_y = xyz_to_tms_y(y, z)
    row = conn.execute(
        "SELECT 1 FROM tiles WHERE zoom_level=? AND tile_column=? AND tile_row=? LIMIT 1",
        (z, x, tms_y),
    ).fetchone()
    return row is not None


def write_tile(conn: sqlite3.Connection, z: int, x: int, y: int, tile_data: bytes) -> None:
    tms_y = xyz_to_tms_y(y, z)
    conn.execute(
        """
        INSERT OR IGNORE INTO tiles (zoom_level, tile_column, tile_row, tile_data)
        VALUES (?, ?, ?, ?)
        """,
        (z, x, tms_y, tile_data),
    )


def update_metadata(
    conn: sqlite3.Connection,
    profile: str,
    layer: LayerConfig,
    bounds: Tuple[float, float, float, float],
    min_zoom: int,
    max_zoom: int,
) -> None:
    metadata = {
        "name": f"Campus Safety {layer.name} ({profile})",
        "type": "baselayer",
        "version": "1",
        "description": f"Offline {layer.name} layer generated for {profile}",
        "format": layer.image_format,
        "bounds": ",".join(f"{v:.6f}" for v in bounds),
        "minzoom": str(min_zoom),
        "maxzoom": str(max_zoom),
        "attribution": layer.attribution,
        "generator": "tools/offline_tiles/build_tiles.py",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "source_name": layer.source_name,
    }
    for key, value in metadata.items():
        conn.execute(
            "INSERT OR REPLACE INTO metadata(name, value) VALUES (?, ?)",
            (key, value),
        )
    conn.commit()


def fetch_tile_bytes(url: str, timeout: int, max_retries: int, retry_delay: float) -> Optional[bytes]:
    for attempt in range(1, max_retries + 1):
        req = request.Request(url, headers={"User-Agent": USER_AGENT})
        try:
            with request.urlopen(req, timeout=timeout) as resp:
                if resp.status != 200:
                    if resp.status in (404, 410):
                        return None
                    raise RuntimeError(f"HTTP {resp.status}")
                return resp.read()
        except error.HTTPError as exc:
            if exc.code in (404, 410):
                return None
            if attempt >= max_retries:
                print(f"[WARN] fetch failed ({exc.code}) {url}", file=sys.stderr)
                return None
        except Exception as exc:
            if attempt >= max_retries:
                print(f"[WARN] fetch failed ({exc}) {url}", file=sys.stderr)
                return None
        time.sleep(retry_delay * attempt)
    return None


def build_layer(
    profile_name: str,
    layer: LayerConfig,
    tile_list: List[Tuple[int, int, int]],
    output_file: Path,
    bounds: Tuple[float, float, float, float],
    timeout: int,
    max_retries: int,
    retry_delay: float,
    commit_interval: int,
) -> None:
    output_file.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(output_file)
    conn.execute("PRAGMA journal_mode=WAL")
    conn.execute("PRAGMA synchronous=NORMAL")
    ensure_mbtiles_schema(conn)

    total = len(tile_list)
    downloaded = 0
    skipped = 0
    failed = 0

    min_zoom = min(t[0] for t in tile_list)
    max_zoom = max(t[0] for t in tile_list)

    started_at = time.time()
    print(f"\n[build] layer={layer.name} file={output_file}")
    print(f"[build] target tiles={total}, zoom={min_zoom}-{max_zoom}")

    for idx, (z, x, y) in enumerate(tile_list, start=1):
        if tile_exists(conn, z, x, y):
            skipped += 1
        else:
            url = layer.url_template.format(z=z, x=x, y=y)
            tile_data = fetch_tile_bytes(url, timeout, max_retries, retry_delay)
            if tile_data is None:
                failed += 1
            else:
                write_tile(conn, z, x, y, tile_data)
                downloaded += 1

        if idx % commit_interval == 0:
            conn.commit()

        if idx % 500 == 0 or idx == total:
            elapsed = max(time.time() - started_at, 0.1)
            rate = idx / elapsed
            print(
                f"[progress] {idx}/{total} ({idx / total:.1%}) "
                f"downloaded={downloaded} skipped={skipped} failed={failed} rate={rate:.1f} tiles/s"
            )

    conn.commit()
    update_metadata(conn, profile_name, layer, bounds, min_zoom, max_zoom)
    total_stored = conn.execute("SELECT COUNT(1) FROM tiles").fetchone()[0]
    conn.close()

    print(
        f"[done] layer={layer.name} downloaded={downloaded} skipped={skipped} "
        f"failed={failed} stored={total_stored}"
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Build offline MBTiles layers")
    parser.add_argument("--profile", default="province_tiered", choices=sorted(PROFILES.keys()))
    parser.add_argument("--output-dir", default="tools/offline_tiles/output")
    parser.add_argument("--timeout", type=int, default=20)
    parser.add_argument("--max-retries", type=int, default=4)
    parser.add_argument("--retry-delay", type=float, default=0.8)
    parser.add_argument("--commit-interval", type=int, default=200)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    profile_name = args.profile
    profile = PROFILES[profile_name]

    regions = profile["regions"]
    if not isinstance(regions, list):
        raise RuntimeError("Invalid profile: regions")

    layers = profile["layers"]
    if not isinstance(layers, list):
        raise RuntimeError("Invalid profile: layers")

    bounds = profile["bounds"]
    if not isinstance(bounds, tuple):
        raise RuntimeError("Invalid profile: bounds")

    tile_list = collect_tiles(regions)
    print(f"[profile] {profile_name}")
    print(f"[profile] regions={len(regions)} total_unique_tiles={len(tile_list)}")

    output_dir = Path(args.output_dir).resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    for layer in layers:
        output_file = output_dir / f"{layer.name}.mbtiles"
        build_layer(
            profile_name=profile_name,
            layer=layer,
            tile_list=tile_list,
            output_file=output_file,
            bounds=bounds,
            timeout=args.timeout,
            max_retries=args.max_retries,
            retry_delay=args.retry_delay,
            commit_interval=max(args.commit_interval, 50),
        )

    print("\nAll layers completed.")
    print(f"Output directory: {output_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
