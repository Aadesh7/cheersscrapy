FROM python:3.12.1

RUN pip install scrapy scrapy-splash

RUN apt-get update && apt-get install -y lua5.1 liblua5.1-dev

WORKDIR /app

COPY . /app

EXPOSE 8050

CMD ["scrapy", "crawl", "totalspider"]
