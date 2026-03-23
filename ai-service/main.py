"""
高校应急安全管理系统 - AI 风险分析服务
基于FastAPI，提供风险预测、热力图生成、历史事件分析功能
"""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Optional
import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
from datetime import datetime, timedelta
import random

app = FastAPI(
    title="校园安全AI分析服务",
    description="提供风险预测、热力图生成和历史事件智能分析",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173", "http://localhost:8088"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# ==================== 数据模型 ====================

class EventData(BaseModel):
    event_type: str
    severity: str
    location: str
    lng: float
    lat: float
    occurred_at: str
    description: Optional[str] = None


class RiskPredictionRequest(BaseModel):
    campus_id: int
    location: Optional[str] = None
    event_type: Optional[str] = None
    time_range_days: int = 30


class HeatmapRequest(BaseModel):
    campus_id: int
    center_lng: float = 110.3308
    center_lat: float = 20.0588
    radius_km: float = 1.0
    grid_size: int = 20


class RiskArea(BaseModel):
    name: str
    lng: float
    lat: float
    risk_score: float
    risk_level: str
    main_risk_type: str
    suggestion: str


# ==================== 模拟数据生成 ====================

EVENT_TYPES = ["FIRE", "EARTHQUAKE", "FLOOD", "CHEMICAL_LEAK", "POWER_OUTAGE",
               "VIOLENCE", "MEDICAL", "TRAFFIC", "THEFT", "OTHER"]
SEVERITIES = ["LOW", "MEDIUM", "HIGH", "CRITICAL"]
LOCATIONS = [
    {"name": "理工楼", "lng": 110.3310, "lat": 20.0590},
    {"name": "图书馆", "lng": 110.3295, "lat": 20.0585},
    {"name": "学生食堂", "lng": 110.3320, "lat": 20.0575},
    {"name": "体育馆", "lng": 110.3280, "lat": 20.0600},
    {"name": "学生宿舍1栋", "lng": 110.3335, "lat": 20.0570},
    {"name": "行政楼", "lng": 110.3300, "lat": 20.0595},
    {"name": "化学实验楼", "lng": 110.3315, "lat": 20.0592},
    {"name": "东门", "lng": 110.3340, "lat": 20.0588},
    {"name": "操场", "lng": 110.3282, "lat": 20.0602},
    {"name": "学生宿舍2栋", "lng": 110.3338, "lat": 20.0565},
]


def generate_historical_events(n: int = 200) -> pd.DataFrame:
    """生成模拟的历史事件数据用于训练和分析"""
    events = []
    base_time = datetime.now()

    # 定义不同地点的风险权重
    location_risk_weights = {
        "化学实验楼": {"FIRE": 0.3, "CHEMICAL_LEAK": 0.4, "MEDICAL": 0.2},
        "学生宿舍1栋": {"FIRE": 0.25, "THEFT": 0.3, "MEDICAL": 0.15, "POWER_OUTAGE": 0.2},
        "学生宿舍2栋": {"FIRE": 0.2, "THEFT": 0.25, "MEDICAL": 0.15, "POWER_OUTAGE": 0.2},
        "学生食堂": {"FIRE": 0.3, "MEDICAL": 0.2, "POWER_OUTAGE": 0.15},
        "体育馆": {"MEDICAL": 0.4, "TRAFFIC": 0.1},
        "图书馆": {"FIRE": 0.1, "THEFT": 0.15},
    }

    for i in range(n):
        loc = random.choice(LOCATIONS)
        weights = location_risk_weights.get(loc["name"], {})

        # 根据权重选择事件类型
        if weights and random.random() < 0.7:
            types = list(weights.keys())
            probs = list(weights.values())
            total = sum(probs)
            probs = [p / total for p in probs]
            event_type = np.random.choice(types, p=probs)
        else:
            event_type = random.choice(EVENT_TYPES)

        # 严重程度与事件类型相关
        if event_type in ["FIRE", "CHEMICAL_LEAK", "EARTHQUAKE"]:
            severity = np.random.choice(SEVERITIES, p=[0.2, 0.3, 0.3, 0.2])
        else:
            severity = np.random.choice(SEVERITIES, p=[0.4, 0.35, 0.2, 0.05])

        # 时间分布 - 某些时段风险更高
        hour = int(np.random.normal(14, 5)) % 24
        days_ago = random.randint(0, 365)
        occurred = base_time - timedelta(days=days_ago, hours=random.randint(0, 23))

        events.append({
            "event_type": event_type,
            "severity": severity,
            "location": loc["name"],
            "lng": loc["lng"] + random.uniform(-0.0005, 0.0005),
            "lat": loc["lat"] + random.uniform(-0.0005, 0.0005),
            "hour": hour,
            "month": occurred.month,
            "day_of_week": occurred.weekday(),
            "occurred_at": occurred.isoformat(),
        })

    return pd.DataFrame(events)


# 全局: 初始化历史数据和模型
historical_df = generate_historical_events(300)
le_type = LabelEncoder()
le_location = LabelEncoder()
le_severity = LabelEncoder()

historical_df["type_enc"] = le_type.fit_transform(historical_df["event_type"])
historical_df["loc_enc"] = le_location.fit_transform(historical_df["location"])
historical_df["sev_enc"] = le_severity.fit_transform(historical_df["severity"])

# 训练风险分类模型
features = historical_df[["loc_enc", "hour", "month", "day_of_week"]].values
labels = historical_df["sev_enc"].values

risk_model = RandomForestClassifier(n_estimators=50, random_state=42)
risk_model.fit(features, labels)


# ==================== API 接口 ====================

@app.get("/")
async def root():
    return {"service": "校园安全AI分析服务", "version": "1.0.0", "status": "running"}


@app.get("/api/ai/health")
async def health():
    return {"status": "healthy", "model_loaded": True, "data_points": len(historical_df)}


@app.post("/api/ai/risk-prediction")
async def predict_risk(request: RiskPredictionRequest):
    """
    基于历史数据和机器学习模型预测各区域风险等级
    """
    risk_areas = []
    now = datetime.now()

    for loc in LOCATIONS:
        # 获取该地点的历史事件
        loc_events = historical_df[historical_df["location"] == loc["name"]]
        event_count = len(loc_events)

        # 模型预测
        loc_enc = le_location.transform([loc["name"]])[0] if loc["name"] in le_location.classes_ else 0
        feature = np.array([[loc_enc, now.hour, now.month, now.weekday()]])
        predicted_severity = risk_model.predict(feature)[0]
        severity_proba = risk_model.predict_proba(feature)[0]

        # 综合风险评分 (0-100)
        base_risk = (predicted_severity / 3) * 40  # 模型预测贡献40%
        freq_risk = min(event_count / 50, 1) * 30   # 历史频率贡献30%
        severity_risk = np.max(severity_proba) * 30  # 预测置信度贡献30%
        risk_score = round(base_risk + freq_risk + severity_risk, 1)

        # 风险等级
        if risk_score >= 70:
            risk_level = "HIGH"
        elif risk_score >= 40:
            risk_level = "MEDIUM"
        else:
            risk_level = "LOW"

        # 主要风险类型
        if len(loc_events) > 0:
            main_type = loc_events["event_type"].mode().iloc[0]
        else:
            main_type = "OTHER"

        # 建议
        suggestions = {
            "HIGH": f"⚠️ {loc['name']}为高风险区域，建议增加巡逻频次，检查消防设施",
            "MEDIUM": f"🔔 {loc['name']}存在中等风险，建议定期安全排查",
            "LOW": f"✅ {loc['name']}风险较低，保持常规安全管理即可"
        }

        risk_areas.append(RiskArea(
            name=loc["name"],
            lng=loc["lng"],
            lat=loc["lat"],
            risk_score=risk_score,
            risk_level=risk_level,
            main_risk_type=main_type,
            suggestion=suggestions[risk_level]
        ))

    # 按风险分数排序
    risk_areas.sort(key=lambda x: x.risk_score, reverse=True)

    return {
        "code": 200,
        "message": "预测成功",
        "data": {
            "prediction_time": now.isoformat(),
            "model": "RandomForest",
            "data_points": len(historical_df),
            "risk_areas": [area.model_dump() for area in risk_areas],
            "summary": {
                "high_risk_count": sum(1 for a in risk_areas if a.risk_level == "HIGH"),
                "medium_risk_count": sum(1 for a in risk_areas if a.risk_level == "MEDIUM"),
                "low_risk_count": sum(1 for a in risk_areas if a.risk_level == "LOW"),
                "avg_risk_score": round(np.mean([a.risk_score for a in risk_areas]), 1)
            }
        }
    }


@app.post("/api/ai/heatmap")
async def generate_heatmap(request: HeatmapRequest):
    """
    生成校园风险热力图数据
    返回网格化的风险强度值，供前端渲染
    """
    grid_size = request.grid_size
    lng_range = request.radius_km / 111.0  # 粗略经度换算
    lat_range = request.radius_km / 111.0

    heatmap_points = []

    for i in range(grid_size):
        for j in range(grid_size):
            lng = request.center_lng - lng_range + (2 * lng_range * i / grid_size)
            lat = request.center_lat - lat_range + (2 * lat_range * j / grid_size)

            # 计算该网格点附近的历史事件密度
            distances = np.sqrt(
                (historical_df["lng"].values - lng) ** 2 +
                (historical_df["lat"].values - lat) ** 2
            )
            nearby_events = historical_df[distances < 0.002]  # ~200m范围
            intensity = len(nearby_events)

            # 加权 - 严重事件权重更高
            if len(nearby_events) > 0:
                severity_weights = {"LOW": 1, "MEDIUM": 2, "HIGH": 3, "CRITICAL": 5}
                weighted_intensity = sum(
                    severity_weights.get(s, 1) for s in nearby_events["severity"]
                )
            else:
                weighted_intensity = 0

            if weighted_intensity > 0:
                heatmap_points.append({
                    "lng": round(lng, 6),
                    "lat": round(lat, 6),
                    "intensity": round(weighted_intensity / 5, 2),  # 归一化
                    "event_count": intensity
                })

    return {
        "code": 200,
        "data": {
            "grid_size": grid_size,
            "total_points": len(heatmap_points),
            "points": heatmap_points
        }
    }


@app.get("/api/ai/event-analysis")
async def analyze_events(days: int = 90):
    """
    历史事件智能分析：
    - 事件类型分布
    - 时间趋势
    - 高发区域Top5
    - AI安全建议
    """
    cutoff = datetime.now() - timedelta(days=days)
    recent = historical_df[pd.to_datetime(historical_df["occurred_at"]) > cutoff]

    # 事件类型分布
    type_dist = recent["event_type"].value_counts().to_dict()

    # 严重程度分布
    severity_dist = recent["severity"].value_counts().to_dict()

    # 按月趋势
    recent_copy = recent.copy()
    recent_copy["month"] = pd.to_datetime(recent_copy["occurred_at"]).dt.to_period("M").astype(str)
    monthly_trend = recent_copy.groupby("month").size().to_dict()

    # 高发区域 Top5
    hotspots = recent["location"].value_counts().head(5).to_dict()

    # 时段分布 (按小时)
    hourly = recent["hour"].value_counts().sort_index().to_dict()

    # AI 安全建议
    insights = []
    total = len(recent)
    if total > 0:
        # 找出最高频事件类型
        top_type = recent["event_type"].mode().iloc[0]
        top_type_pct = round(recent["event_type"].value_counts().iloc[0] / total * 100, 1)
        insights.append({
            "level": "WARNING",
            "title": f"最常见事件类型: {top_type}",
            "description": f"占比{top_type_pct}%，建议针对性加强防范措施"
        })

        # 高危区域
        top_hotspot = recent["location"].mode().iloc[0]
        insights.append({
            "level": "IMPORTANT",
            "title": f"高发区域: {top_hotspot}",
            "description": f"该区域事件最为频繁，建议增加安保巡逻频次和监控覆盖"
        })

        # 高严重级别占比
        high_critical = len(recent[recent["severity"].isin(["HIGH", "CRITICAL"])])
        hc_pct = round(high_critical / total * 100, 1)
        if hc_pct > 30:
            insights.append({
                "level": "CAUTION",
                "title": f"高严重级别事件占比{hc_pct}%",
                "description": "高危事件占比偏高，建议全面排查安全隐患并加强应急预案"
            })
        else:
            insights.append({
                "level": "NOTE",
                "title": f"严重事件占比{hc_pct}%，整体可控",
                "description": "安全形势相对平稳，继续保持常态化安全管理"
            })

        # 时段风险
        peak_hour = max(hourly, key=hourly.get) if hourly else 14
        insights.append({
            "level": "TIP",
            "title": f"事件高发时段: {peak_hour}:00",
            "description": f"建议在{peak_hour}:00前后加强安全值守和巡查力度"
        })

    return {
        "code": 200,
        "data": {
            "analysis_period_days": days,
            "total_events": total,
            "type_distribution": type_dist,
            "severity_distribution": severity_dist,
            "monthly_trend": monthly_trend,
            "hotspots": hotspots,
            "hourly_distribution": hourly,
            "insights": insights
        }
    }


@app.post("/api/ai/event-ingest")
async def ingest_event(event: EventData):
    """
    接收新事件数据，更新模型训练集
    供Java后端在新事件发生时调用
    """
    global historical_df

    new_row = pd.DataFrame([{
        "event_type": event.event_type,
        "severity": event.severity,
        "location": event.location,
        "lng": event.lng,
        "lat": event.lat,
        "hour": datetime.fromisoformat(event.occurred_at).hour,
        "month": datetime.fromisoformat(event.occurred_at).month,
        "day_of_week": datetime.fromisoformat(event.occurred_at).weekday(),
        "occurred_at": event.occurred_at,
    }])

    historical_df = pd.concat([historical_df, new_row], ignore_index=True)

    return {"code": 200, "message": "事件数据已接收", "total_data_points": len(historical_df)}


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8089)
