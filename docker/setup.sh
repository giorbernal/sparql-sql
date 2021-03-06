#!/bin/bash

# Replace environment variables

JDBC_URL=${JDBC_URL:-jdbc:postgresql://localhost:5432/sdb2?user=fuseki}

sed -i "s|JDBC_URL|$JDBC_URL|g" /opt/app/conf/config.ttl
