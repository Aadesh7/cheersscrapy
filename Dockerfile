FROM python:3.12.1-slim

RUN pip install scrapy scrapy-splash

WORKDIR /app

COPY . /app

