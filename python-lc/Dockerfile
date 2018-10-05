FROM microsoft/mssql-tools as mssql
FROM python:3.6-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY --from=mssql /opt/microsoft/ /opt/microsoft/
COPY --from=mssql /opt/mssql-tools/ /opt/mssql-tools/
COPY --from=mssql /usr/lib/libmsodbcsql-13.so /usr/lib/libmsodbcsql-13.so

RUN apk add --update --no-cache \
     alpine-sdk \
     mariadb-connector-c-dev \
     libc-dev \
     unixodbc-dev \
     freetds-dev
