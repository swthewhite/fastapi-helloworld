# 1. 가벼운 Python 3.10 슬림 이미지를 베이스로 사용
FROM python:3.10-slim

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 의존성 파일 복사 및 설치 (캐싱 효율을 위해 소스코드보다 먼저 실행)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. 소스 코드 복사
COPY . .

# 5. 포트 노출 (Coolify가 이 포트를 감지합니다)
EXPOSE 8000

# 6. 서버 실행 명령어
# 중요: 호스트는 반드시 '0.0.0.0'이어야 외부(Coolify 프록시)에서 접근 가능합니다.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
