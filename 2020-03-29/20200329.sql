-- Aggoingiamo un limite agli sconti in modo che non superino il 50%
ALTER TABLE Consegna ADD CONSTRAINT ck_sconto CHECK (Sconto <= 50);

-- Ora aggiorniamo uno sconto
UPDATE Consegna SET Sconto = 40 WHERE IdFiore = '1';


-- Modificare il CF del cliente 'LRABNC70B52A247X' in 'LRABNC70B52A247Y'
UPDATE Cliente SET CF = 'LRABNC70B52A247Y' WHERE CF = 'LRABNC70B52A247X';
-- Questo modifica è permessa, se inceve provassi a fare un delete non è permessa
DELETE FROM Cliente WHERE CF = 'LRABNC70B52A247Y';

-- Quindi dovrei eliminare il vincolo 'fk_cfcliente' per poi crearlo modificato
ALTER TABLE Consegna DROP CONSTRAINT fk_cfcliente;
-- Ora è possibile eliminare i cliente, grazie a 'ON DELETE CASCADE'
ALTER TABLE Consegna ADD CONSTRAINT fk_cfcliente FOREIGN KEY (CFCliente)
REFERENCES Cliente(CF) ON UPDATE CASCADE ON DELETE CASCADE;


-- Importare un dump
-- Prima di tutto creo il database poi uso phpmyadmin
CREATE DATABASE EsposizioneProdotti2021;


-- ESERCIZI QUERY

-- 1) Determina il codice e il nome dei prodotti per cui esiste almeno una richiesta
-- di esposizione ad un negozio con 'tipologia' scaffale
SELECT CodProdotto, Nome
FROM Prodotto
WHERE CodProdotto in (
    SELECT CodProdotto
    FROM RichiestaEsposizione
    WHERE tipologia = 'scaffale'
);

SELECT DISTINCT Prodotto.CodProdotto, Nome
FROM Prodotto, RichiestaEsposizione
WHERE Prodotto.CodProdotto = RichiestaEsposizione.CodProdotto AND
Tipologia = 'scaffale';


-- 2) Determina il nome dei prodotti per cui esiste almeno una richiesta
-- di esposizione ad un negozio con 'tipologia' scaffale
SELECT DISTINCT Nome
FROM Prodotto
WHERE CodProdotto in (
    SELECT CodProdotto
    FROM RichiestaEsposizione
    WHERE tipologia = 'scaffale'
);

SELECT DISTINCT Nome
FROM Prodotto, RichiestaEsposizione
WHERE Prodotto.CodProdotto = RichiestaEsposizione.CodProdotto AND
Tipologia = 'scaffale';

-- 2) Determina il costo dei prodotti per cui esiste almeno una richiesta
-- di esposizione ad un negozio con 'tipologia' scaffale
SELECT DISTINCT Costo
FROM Prodotto
WHERE CodProdotto in (
    SELECT CodProdotto
    FROM RichiestaEsposizione
    WHERE tipologia = 'scaffale'
);

SELECT DISTINCT Costo
FROM Prodotto, RichiestaEsposizione
WHERE Prodotto.CodProdotto = RichiestaEsposizione.CodProdotto AND
Tipologia = 'scaffale';
