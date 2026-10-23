#!/bin/bash
set -e
cd /srv/campus-safety/backend
fuser -k 8088/tcp 2>/dev/null || true
sleep 2
export JAVA_HOME=/usr/lib/jvm/java-21-alibaba-dragonwell-21.0.5.0.5-1.1.al8.x86_64
export PATH="$JAVA_HOME/bin:$PATH"
nohup java -jar campus-safety-backend-1.0.0.jar \
  --spring.profiles.active=demo \
  --server.port=8088 \
  --spring.datasource.url=jdbc:postgresql://localhost:5432/campus_safety \
  --spring.datasource.username=postgres \
  --spring.datasource.password='REPLACE_DB_PASS' \
  --spring.data.redis.host=127.0.0.1 \
  --spring.data.redis.port=6379 \
  --spring.data.redis.password='REPLACE_REDIS_PASS' \
  --ai.service.url=http://127.0.0.1:8089/api/ai \
  >> /srv/campus-safety/logs/backend.log 2>&1 &
echo "backend PID: $!"
cd /srv/campus-safety/ai-service
fuser -k 8089/tcp 2>/dev/null || true
sleep 1
source venv/bin/activate
nohup python main.py >> /srv/campus-safety/logs/ai.log 2>&1 &
echo "ai PID: $!"
