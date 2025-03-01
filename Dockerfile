# Base stage
FROM python:3.11.4-slim-bullseye as base

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Common stage for staging and production
FROM base as common

COPY . .
RUN mkdir -p /app/static
ENV STATIC_ROOT=/app/static
RUN python manage.py collectstatic --no-input

# Development stage
FROM base as dev
COPY . .
CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8000

# Staging stage
FROM common as staging
CMD python manage.py migrate && gunicorn api.wsgi --bind 0.0.0.0:8002

# Production stage
FROM common as prod
CMD python manage.py migrate && gunicorn api.wsgi --bind 0.0.0.0:8003
