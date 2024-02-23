FROM python:3.12.1

RUN apt-get update && apt-get install -y \
    lua5.1 \
    liblua5.1-dev \
    python3-dev \
    python3-pip \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    libjpeg-dev \
    zlib1g-dev

RUN pip install scrapy scrapy-splash scrapyrt

RUN apt-get install -y python3-pandas python3-lxml python3-yaml python3-zope.interface

RUN apt-get install -y curl
RUN curl -L https://github.com/scrapinghub/splash/raw/master/extras/render.html/render.html.lua -o /usr/local/lib/python3.12/site-packages/scrapy_splash/scripts/render.html.lua

WORKDIR /app

COPY . /app

EXPOSE 8050

CMD ["scrapy", "crawl", "totalspider"]
