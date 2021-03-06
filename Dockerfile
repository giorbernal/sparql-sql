FROM ubuntu:20.10
MAINTAINER "Gior Bernal"

ARG JENA_VERSION=3.17.0
ARG PG_DRIVER_VERSION=42.2.19

RUN apt-get update -y && \
    apt-get install -y wget apt-utils openjdk-8-jre ruby

RUN ["mkdir", "opt/app"]
RUN ["mkdir", "opt/app/files"]

COPY docker/setup.sh /opt/app
COPY docker/conf /opt/app/conf
COPY docker/entrypoint.sh /opt/app

RUN cd /opt/app && \
    wget https://ftp.cixug.es/apache/jena/binaries/apache-jena-fuseki-$JENA_VERSION.tar.gz && \
    tar xvf apache-jena-fuseki-$JENA_VERSION.tar.gz && \
    mv apache-jena-fuseki-$JENA_VERSION apache-jena-fuseki && \
    cd apache-jena-fuseki && mkdir run && mkdir run/extra

COPY target/lib/jena-sdb-*.jar /opt/app/apache-jena-fuseki/run/extra
COPY target/lib/postgresql-*.jar /opt/app/apache-jena-fuseki/run/extra

CMD ["/opt/app/entrypoint.sh"]
