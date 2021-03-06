#!/bin/bash

docker run \
	--name=sparqlsql1 \
	-v $(pwd)/utils/files:/opt/app/files \
	-p 3030:3030 \
	-d \
	--memory=128m   \
	--memory-swap=-1 \
	-e JDBC_URL=jdbc:postgresql://192.168.1.40:5432/sdb2?user=fuseki \
	giorbernal/sparqlsql
