CREATE DATABASE company;
USE company;

CREATE TABLE usine(
    nu INT NOT NULL AUTO_INCREMENT, 
    nomu VARCHAR(255),
    ville VARCHAR(255),
    PRIMARY KEY (nu)
);

CREATE TABLE produit(
    np INT NOT NULL AUTO_INCREMENT,
    nomp VARCHAR(255),
    couleur VARCHAR(255),
    poids FLOAT NOT NULL,
    CONSTRAINT poidsProduit CHECK (poids > 0),
    PRIMARY KEY (np)
);

CREATE TABLE fournisseur(
    nf INT NOT NULL AUTO_INCREMENT,
    nomf VARCHAR(255),
    status VARCHAR(255),
    ville VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    CONSTRAINT correctEmail CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')),
    PRIMARY KEY (nf)
);

CREATE TABLE livraison(
    np INT NOT NULL,
    nf INT NOT NULL,
    nu INT NOT NULL,
    quantite INT,
    PRIMARY KEY (nu,np,nf),
    FOREIGN KEY (nu) REFERENCES usine(nu) ON DELETE CASCADE,
    FOREIGN KEY (nf) REFERENCES fournisseur(nf) ON DELETE CASCADE,
    FOREIGN KEY (np) REFERENCES produit(np) ON DELETE CASCADE
);