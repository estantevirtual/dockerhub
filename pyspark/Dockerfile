# baseado em: https://github.com/r4z3c/dockerhub/blob/master/pyspark/Dockerfile

FROM debian:stable

LABEL maintainer="EstanteVirtual <ti@estantevirtual.com.br>"

ENV TMP /tmp
WORKDIR $TMP

RUN echo 'deb http://deb.debian.org/debian stable main contrib non-free\n\
deb http://deb.debian.org/debian stable-updates main contrib non-free\n\
deb http://security.debian.org/debian-security stable/updates main contrib non-free\n\
deb http://ftp.us.debian.org/debian sid main'\
> /etc/apt/sources.list

# install apt dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends vim curl build-essential zlib1g-dev default-mysql-client \
    syslog-ng libssl-dev git libsqlite3-dev gnupg2 wget openjdk-8-jre && \
    service syslog-ng start && \
    rm -rf /var/lib/apt/lists/*

# install spark
ENV SPARK_VERSION spark-2.3.0-bin-hadoop2.7
ENV SPARK_TAR $SPARK_VERSION.tgz
ENV SPARK_HOME /usr/local/spark

RUN curl -L https://archive.apache.org/dist/spark/spark-2.3.0/$SPARK_TAR > ./$SPARK_TAR && \
    tar -xzvf $SPARK_TAR && rm $SPARK_TAR && mv $SPARK_VERSION $SPARK_HOME

# install spark jars
ENV SPARK_JARS $SPARK_HOME/jars
WORKDIR $SPARK_JARS

ENV MAVEN_URL https://repo1.maven.org/maven2/
ENV AWS_JAVA_SDK_PATH com/amazonaws/aws-java-sdk/1.7.4/
ENV ELASTICSEARCH_HADOOP_PATH org/elasticsearch/elasticsearch-hadoop/7.4.0/
ENV HADOOP_AWS_PATH org/apache/hadoop/hadoop-aws/2.7.2/
ENV JODA_TIME_PATH joda-time/joda-time/2.9.9/
ENV MYSQL_CONNECTOR_JAVA_PATH mysql/mysql-connector-java/5.1.45/

ENV AWS_JAVA_SDK_JAR aws-java-sdk-1.7.4.jar
ENV ELASTICSEARCH_HADOOP_JAR elasticsearch-hadoop-7.4.0.jar
ENV HADOOP_AWS_JAR hadoop-aws-2.7.2.jar
ENV JODA_TIME_JAR joda-time-2.9.9.jar
ENV MYSQL_CONNECTOR_JAVA_JAR mysql-connector-java-5.1.45.jar

RUN curl -L $MAVEN_URL$AWS_JAVA_SDK_PATH$AWS_JAVA_SDK_JAR > ./$AWS_JAVA_SDK_JAR && \
    curl -L $MAVEN_URL$ELASTICSEARCH_HADOOP_PATH$ELASTICSEARCH_HADOOP_JAR > ./$ELASTICSEARCH_HADOOP_JAR && \
    curl -L $MAVEN_URL$HADOOP_AWS_PATH$HADOOP_AWS_JAR > ./$HADOOP_AWS_JAR && \
    curl -L $MAVEN_URL$JODA_TIME_PATH$JODA_TIME_JAR > ./$JODA_TIME_JAR && \
    curl -L $MAVEN_URL$MYSQL_CONNECTOR_JAVA_PATH$MYSQL_CONNECTOR_JAVA_JAR > ./$MYSQL_CONNECTOR_JAVA_JAR && \
    chmod 555 $AWS_JAVA_SDK_JAR $ELASTICSEARCH_HADOOP_JAR $HADOOP_AWS_JAR $JODA_TIME_JAR $MYSQL_CONNECTOR_JAVA_JAR

# install python
ENV PYTHON_VERSION 3.6.5
ENV PYTHON_FOLDER Python-$PYTHON_VERSION
ENV PYTHON_TAR $PYTHON_FOLDER.tgz

RUN curl -L https://www.python.org/ftp/python/$PYTHON_VERSION/$PYTHON_TAR > ./$PYTHON_TAR && \
    tar -xzvf $PYTHON_TAR && cd Python-3.6.5 && \
    ./configure --enable-optimizations --with-ensurepip=install && make -j8 build_all && make -j8 altinstall && \
    update-alternatives --install /usr/bin/python python /usr/local/bin/python3.6 50 && \
    update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.6 50 && \
    cd .. && rm -rf $PYTHON_FOLDER $PYTHON_TAR

WORKDIR /

# remove build dependencies
RUN apt-get remove -y curl vim

# overwrite paths
ENV PATH $PATH:$SPARK_HOME/bin
ENV PYTHONPATH=$PYTHONPATH:\
/usr/local/spark/python/:\
/usr/local/spark/python/lib/:\
/usr/local/spark/python/lib/py4j-0.10.6-src.zip

################################

ENV APP_PATH /app/

WORKDIR $APP_PATH

RUN pip install python-dotenv==0.8.2 envparse==0.2.0 py4j==0.10.6 requests==2.18.4 pytest==3.4.2 \
    pytest-cov==2.5.1 pytest-xdist==1.22.2 inflection==0.3.1 vcrpy==1.12.0 boto3==1.8.4 pytz==2018.5

CMD bash -c "pip install -r requirements.txt && tail -f /var/log/syslog"
