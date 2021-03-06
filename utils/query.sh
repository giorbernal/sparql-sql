#!/bin/bash

docker exec -it sparqlsql1 /opt/app/apache-jena-fuseki/bin/s-query --service=http://localhost:3030/dataset/query "$1"
