CREATE DATABASE EsposizioneProdotti;


CREATE TABLE Negozio (
    NomeNeg VARCHAR(15) PRIMARY KEY,
    Provincia VARCHAR(15) NOT NULL,
    Budget INT UNSIGNED DEFAULT 0 NOT NULL
);


CREATE TABLE Prodotto (
    CodProdotto INT UNSIGNED PRIMARY KEY,
    Nome VARCHAR(15) NOT NULL,
    Costo DECIMAL(5, 2) UNSIGNED NOT NULL,
    NumRepliche INT UNSIGNED DEFAULT 0 NOT NULL
);


CREATE TABLE RIchiestaEsposizione (
    CodProdotto INT UNSIGNED,
    NomeNeg VARCHAR(15),
    Tipologia VARCHAR(15) NOT NULL,
    Decisione BOOLEAN NOT NULL,
    PRIMARY KEY (CodProdotto, NomeNeg, Tipologia),
    CONSTRAINT fk_CodProdottoEsposizione FOREIGN KEY (CodProdotto) REFERENCES
        Prodotto(CodProdotto) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_NomeNeg FOREIGN KEY (NomeNeg) REFERENCES
        Negozio(NomeNeg) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Autore (
    Id CHAR(2) PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Cognome VARCHAR(20) NOT NULL
);


CREATE TABLE Produzione	(
    CodProdotto INT UNSIGNED,
    IdAutore CHAR(2),
    CONSTRAINT fk_CodProdottoProduzione FOREIGN KEY (CodProdotto) REFERENCES
        Prodotto(CodProdotto) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_IdAutore FOREIGN KEY (IdAutore) REFERENCES
        Autore(Id) ON UPDATE CASCADE ON DELETE SET NULL
);
