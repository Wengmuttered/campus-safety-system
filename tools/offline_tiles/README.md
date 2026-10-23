# Offline Tiles Builder

Build local MBTiles layers for the system:

```bash
python tools/offline_tiles/build_tiles.py --profile province_tiered
```

Output files:

- `tools/offline_tiles/output/light.mbtiles`
- `tools/offline_tiles/output/satellite.mbtiles`

Notes:

- Script is resumable. Existing tiles are skipped.
- Failed downloads are retried automatically.
- Re-running the same command does not re-download existing tiles.
- The default profile uses Hainan province as overview coverage and adds high-zoom detail around two campus areas.
