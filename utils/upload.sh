#!/bin/bash

docker exec -it sparqlsql1 /opt/app/apache-jena-fuseki/bin/s-post http://localhost:3030/dataset/data default /opt/app/files/$1
