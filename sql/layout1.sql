-- jena-sdb storage for postgres: layout1

DROP TABLE IF EXISTS Prefixes;
CREATE TABLE Prefixes (
	prefix VARCHAR(50) NOT NULL,
	uri VARCHAR(500) NOT null,
	PRIMARY KEY(prefix)
);

INSERT INTO Prefixes VALUES ('x',       'http://example/');
INSERT INTO Prefixes VALUES ('ex',      'http://example.org/');
INSERT INTO Prefixes VALUES ('rdf',     'http://www.w3.org/1999/02/22-rdf-syntax-ns#');
INSERT INTO Prefixes VALUES ('rdfs',    'http://www.w3.org/2000/01/rdf-schema#');
INSERT INTO Prefixes VALUES ('xsd',     'http://www.w3.org/2001/XMLSchema#');
INSERT INTO Prefixes VALUES ('owl' ,    'http://www.w3.org/2002/07/owl#');
INSERT INTO Prefixes VALUES ('foaf',    'http://xmlns.com/foaf/0.1/');
INSERT INTO Prefixes VALUES ('dc',      'http://purl.org/dc/elements/1.1/');
INSERT INTO Prefixes VALUES ('dcterms', 'http://purl.org/dc/terms/');

DROP TABLE IF EXISTS Triples;
CREATE TABLE Triples (
	s VARCHAR(500) NOT NULL,
	p VARCHAR(500) NOT NULL,
	o VARCHAR(500) NOT NULL,
	PRIMARY KEY (s,p,o)
);
