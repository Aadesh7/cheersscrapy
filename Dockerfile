FROM python:3.12.1

RUN pip install scrapy scrapy-splash

WORKDIR /app

COPY . /app

