-- jena-sdb storage for postgres: layout1

drop table if exists Prefixes;
CREATE TABLE Prefixes (
	prefix VARCHAR(50) NOT NULL,
	uri VARCHAR(500) NOT null,
	PRIMARY KEY(prefix)
);

drop table if exists Triples;
CREATE TABLE Triples (
	s BIGINT NOT NULL,
	p BIGINT NOT NULL,
	o BIGINT NOT NULL,
	PRIMARY KEY (s, p, o)
);

DROP INDEX IF EXISTS PredObj;
DROP INDEX IF EXISTS ObjSubj;

drop table if exists quads;
CREATE TABLE Quads (
	g BIGINT NOT NULL,
	s BIGINT NOT NULL,
	p BIGINT NOT NULL,
	o BIGINT NOT NULL,
	PRIMARY KEY (g, s, p, o)
);

drop table if exists nodes;
CREATE TABLE Nodes (
	hash BIGINT NOT NULL,
	lex TEXT NOT NULL,
	lang varchar NOT NULL default E'',
	datatype varchar(200) NOT NULL default '',
	type integer NOT NULL default E'0',
	PRIMARY KEY (hash)
);
