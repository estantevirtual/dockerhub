FROM python:3.6.4-alpine3.7

RUN apk upgrade && apk add --no-cache --virtual build-dependencies linux-headers make gcc g++
    ca-certificates zlib-dev jpeg-dev tiff-dev freetype-dev lcms2-dev libwebp-dev
    tcl-dev tk-dev libxml2-dev libxslt-dev && rm -rf /var/cache/apk/*
    
ADD requirements.txt
RUN pip install -r requirements.txt
