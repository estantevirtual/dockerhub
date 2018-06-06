FROM r4z3c/pyspark

LABEL maintainer="EstanteVirtual <ti@estantevirtual.com.br>"

ENV APP_PATH /app/

WORKDIR $APP_PATH

RUN pip install python-dotenv==0.8.2 envparse==0.2.0 pprint==0.1 py4j==0.10.6 requests==2.18.4 pytest==3.4.2 \
    pytest-cov==2.5.1 pytest-xdist==1.22.2

CMD bash -c "pip install -r requirements.txt && tail -f /var/log/syslog"
