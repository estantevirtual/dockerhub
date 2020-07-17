# PySpark with AWS and Elasticsearch support

This image provides a clean _PySpark_ environment, plus _AWS_ and _Elasticsearch_ support.

Please, refer to [source on github](https://github.com/estantevirtual/dockerhub/blob/master/pyspark/Dockerfile) for
more details.

**Included JARs**

- aws-java-sdk-1.7.4
- hadoop-aws-2.7.2
- mysql-connector-java-5.1.45
- elasticsearch-hadoop-7.4.0
- joda-time-2.9.9

**Included Python Packages**

- python-dotenv==0.8.2
- envparse==0.2.0
- pprint==0.1
- py4j==0.10.6
- requests==2.18.4
- pytest==3.4.2
- pytest-cov==2.5.1
- pytest-xdist==1.22.2
- inflection==0.3.1
- vcrpy==1.12.0
- boto3==1.8.4
- pytz==2018.5

**TODO**

- _"Implementar script para parametrizar a instrução `CMD`"_ (https://github.com/estantevirtual/dockerhub/issues/2)
