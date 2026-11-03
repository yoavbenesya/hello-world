FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY hello_world.py .

ARG APP_VERSION=0.0.0-dev
ENV APP_VERSION=${APP_VERSION}

RUN useradd --uid 10001 --no-create-home app
USER 10001

EXPOSE 8080
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "hello_world:app"]