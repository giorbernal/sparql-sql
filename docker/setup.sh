#!/bin/bash

# Replace environment variables

JDBC_URL=${JDBC_URL:-jdbc:postgresql://localhost:5432/sdb2?user=fuseki}
DRIVER_CLASS=${DRIVER_CLASS:-org.postgresql.Driver}
LAYOUT=${LAYOUT:-layout1}

sed -i "s|JDBC_URL|$JDBC_URL|g" /opt/app/conf/config.ttl
sed -i "s|DRIVER_CLASS|$DRIVER_CLASS|g" /opt/app/conf/config.ttl
sed -i "s|LAYOUT|$LAYOUT|g" /opt/app/conf/config.ttl
