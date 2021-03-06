# sparql-sql

This is a PoC to evaluate and learn about semantic web and SPARQL queries over an sql-based triples-backend

Basicly, we are setting up a docker container with an instance of [apache-jana-fuseki](https://jena.apache.org/documentation/fuseki2/) server to work with SPARQL queries. The *triples* used will be backed in a sql data store (PostgreSQL, in our case, although it could be other) by using the [sdb](https://jena.apache.org/documentation/sdb/sdb_index.html) library from the same project.

The idea is to quickly set up an environment to play with SPARQL queries over a certain Ontology defined in a .owl file.

## Prerrequisites

You only need to have *maven* an *docker* installed.

## Quick Start Guide

You can follow these steps to quickly start playing:

### Set Up PostgreSQL

Get into your postgres instance (local, by docker or whatever, or remote) and create a database and user for this purpose:
```
> psql -U postgres
> CREATE USER fuseki
> CREATE DATABASE sdb2
> GRANT CONNECT ON DATABASE sdb2 TO fuseki;
> GRANT ALL PRIVILEGES ON DATABASE sdb2 TO fuseki;
```

Then, get into your just-created database with the just-created user and create the schema for the backend ([layout1](sql/layout1.sql) or [layout2/hash](sql/layout2_hash.sql)):
```
> psql -U fuseki -d sdb2
<execute script>
```
NOTE: layout1 is recommended to understand better how *triples* work.

### Build and start fuseki server

Just install to build the docker image:
```
> mvn clean install
```

Verify the variables in [run.sh](run.sh) en execute to run the container:
```
> ./run.sh
```

### Upload an Ontology and execute SPARQL queries

Next step is to upload an ontology defined in a .owl file. If you take your .owl to the utils/files folder, you could upload it with next utility (let's see it with the included example Person.owl):
```
> ./utils/upload.sh Person.owl
```

You could have done this step by using the endpoint. We can verify it this way:
```
> curl http://localhost:3030/dataset/data?default
```

Finally you could execute SPARQL queries with this utility:
```
> utils/query.sh "select * {?s ?p ?o}"
```

You can check [apache-jana-fuseki](https://jena.apache.org/documentation/fuseki2/) documention for further information.
