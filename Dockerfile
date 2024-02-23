FROM python:3.12.1

RUN pip install scrapy scrapy-splash

RUN apt-get update && apt-get install -y lua5.1 liblua5.1-dev

EXPOSE 8050

COPY . /app

WORKDIR /app

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

CMD ["bash", "-c", "docker-entrypoint.sh start-splash --disable-browser-sandbox && scrapy crawl totalspider"]
