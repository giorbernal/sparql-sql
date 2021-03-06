#!/bin/bash

BASE_PATH=/opt/app

echo 'configuring ...'
cd $BASE_PATH
./setup.sh

echo 'Initiating server ..'
cd $BASE_PATH/apache-jena-fuseki
./fuseki-server --conf $BASE_PATH/conf/config.ttl
