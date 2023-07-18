# 파이썬 빌드중 bookworm 선택
FROM --platform=linux/amd64 python:3.10-bookworm

# 권장
ENV PYTHONDONTWRITEBYTECODE=1
# 디버깅
ENV PYTHONUNBUFFERED 1

# 도커 컨테이너의 작업 폴더
WORKDIR /django

# 의존성 문서 복사
COPY requirements.txt /django/


# 필요한 의존성 설치
RUN pip3 install -r requirements.txt

# 나머지 소스코드 복사
COPY . .

# gunicorn 으로 서버 실행. <master-app> 이름 변경 필요
# CMD gunicorn docker_django.wsgi:application --bind 0.0.0.0:8000

# 포트 열기
EXPOSE 8000
