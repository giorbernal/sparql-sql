-- jena-sdb storage for postgres: layout2/hash

DROP TABLE IF EXISTS Prefixes;
CREATE TABLE Prefixes (
	prefix VARCHAR(50) NOT NULL,
	uri VARCHAR(500) NOT null,
	PRIMARY KEY(prefix)
);

DROP TABLE IF EXISTS Triples;
CREATE TABLE Triples (
	s BIGINT NOT NULL,
	p BIGINT NOT NULL,
	o BIGINT NOT NULL,
	PRIMARY KEY (s, p, o)
);

DROP TABLE IF EXISTS quads;
CREATE TABLE Quads (
	g BIGINT NOT NULL,
	s BIGINT NOT NULL,
	p BIGINT NOT NULL,
	o BIGINT NOT NULL,
	PRIMARY KEY (g, s, p, o)
);

DROP TABLE IF EXISTS nodes;
CREATE TABLE Nodes (
	hash BIGINT NOT NULL,
	lex TEXT NOT NULL,
	lang varchar NOT NULL default E'',
	datatype varchar(200) NOT NULL default '',
	type integer NOT NULL default E'0',
	PRIMARY KEY (hash)
);
