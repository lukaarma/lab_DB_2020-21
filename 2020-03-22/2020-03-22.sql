-- Crea database di nome Fiorista

CREATE DATABASE Fiorista;


-- Crea relazione Fiore(Id, Nome, Colore, Tipo, Prezzo)
-- Id è autoincrementante
-- Nome non può essere null
-- Se non è specificato il Colore è bianco
-- Non somo ammessi fiori con uguale nome e colore

CREATE TABLE Fiore (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(10) NOT NULL,
    Colore VARCHAR(15) DEFAULT 'bianco',
    Tipo VARCHAR(15) NULL,
    Prezzo DECIMAL(13, 2) NOT NULL,
    UNIQUE(Nome, Colore)
);


-- Crea relazione Cliente(CF, Nome, Cognome, NumTel)
-- Cognome non deve essere nullo

CREATE TABLE Cliente (
    CF CHAR(16) PRIMARY KEY,
    Nome VARCHAR(20),
    Cognome VARCHAR(20) NOT NULL,
    NumTel VARCHAR(20)
);


-- Crea relazione Consegna(Numero, IdFiore, CFCliente, CittaConsegna, DataConsegna);
-- Numero è autoincrementante;
-- Sono ammessi solo fiori e clienti esistenti;
-- Update di fiori e clienti sono ammessi, cancellazioni no;

CREATE TABLE Consegna (
    Numero INT AUTO_INCREMENT PRIMARY KEY,
    IdFiore INT,
    CFCliente CHAR(16),
    CittaConsegna VARCHAR(20),
    DataConsegna DATE,
    -- creo i vincoli per IdFiore e CFCliente, con nome
    CONSTRAINT fk_idfiore FOREIGN KEY (IdFiore) REFERENCES Fiore(Id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    -- questo comando crea un link con nome 'fk_cfcliente' che specifica che la chiave
    -- 'CFCliente' in 'Consegna' ha un riferimento a 'CF' nella tabella 'Cliente' e che
    -- in caso di update dei record di Fiore l'update avviene anche qui in 'CASCATA',
    -- mentre le delete vengono 'RISTRETTE' e non affliggono i record di 'Consegna'
    CONSTRAINT fk_cfcliente FOREIGN KEY (CFCliente) REFERENCES Cliente(CF)
        ON UPDATE CASCADE ON DELETE RESTRICT
);
