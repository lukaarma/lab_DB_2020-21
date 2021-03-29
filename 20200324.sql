-- Inserimento nella tabella Fiore
INSERT INTO Fiore (Id, Nome, Colore, Tipo, Prezzo) VALUES
('1', 'Rosa', 'Rosso', 'fiore reciso', '12.50');

-- Non è necessario inserire tutti gli attributi, l'importante è che
-- l'ordine della dichiarazione degli attributi da inserire e i 'values'
-- specificati combaci
INSERT INTO Fiore (Nome, Colore, Tipo, Prezzo) VALUES
('Giglio', '', 'fiore reciso', '12.50');


-- Vediamo come si comporta l'incremento automatico dell'Id, specifico 5
INSERT INTO Fiore (Id, Nome, Colore, Tipo, Prezzo) VALUES
(5, 'Giglio', 'giallo', 'fiore reciso', '8.10');

-- Ora sarà 6 o altro? => Incrementa l'ultimo 'Id' inserito, quindi 6
INSERT INTO Fiore (Nome, Colore, Tipo, Prezzo) VALUES
('Primula', 'giallo', NULL, '2.80');


-- Nell'esempio di prima abbiamo specificato un 'Colore' = 'strina vuota' e
-- il DB lo ha accettato come valido. Non è un comportamento che vogliamo
-- sia esattamente così perchè non fa senso, stessa cosa con NULL
INSERT INTO Fiore (Nome, Colore, Tipo, Prezzo) VALUES
('Margherita', NULL, NULL, '2.80');

-- I NULL sono diversi tra loro, quindi se noi mettiamo due "Margherite"
-- con colore NULL non avremo errore nonostante noi avessimo specificato
-- che non potevamo avere due fiori uguali con lo stesso colore.
INSERT INTO Fiore (Nome, Colore, Tipo, Prezzo) VALUES
('Margherita', NULL, NULL, '2.80');


-- Inseriamo ancora un paio di campi

INSERT INTO Fiore (Nome, Colore, Tipo, Prezzo) VALUES
('Rosa', 'rosa', 'fiore reciso', '1.50');

-- I confronti sono case insensitive, abbiamo già questo campo solamente
-- con il colore maiuscolo anzichè minuscolo
-- NOTA: anche se questo inserimento non andrà a buon fine il contatore
-- 'Id' incrementerà comunque
INSERT INTO Fiore (Nome, Colore, Tipo, Prezzo) VALUES
('Rosa', 'rosso', 'fiore reciso', '12.50');

-- Anche il 'Nome' può essere una stringa vuote
INSERT INTO Fiore (Nome, Colore, Tipo, Prezzo) VALUES
('', 'verde', 'ornamento', '3.10');

-- Ogni stringa non nulla in realtà rispetta e può essere inserita ora come ora
INSERT INTO Fiore (Nome, Colore, Tipo, Prezzo) VALUES
('xasx', 'xsaxas', 'xsaxas', '10.00');

-- Elimino il record casuale creato
DELETE FROM Fiore WHERE Id = 12;


-- L'ultima lezione avevamo creato un attributo 'Prezzo' di dimensione enorme,
-- andiamo a modificarlo
ALTER TABLE Fiore MODIFY Prezzo DECIMAL(6, 2);

-- Controlliamo sia stato effettivamente cambiato
SHOW COLUMNS FROM Fiore;


-- Ora sistemiamo alcuni problemi della table 'Fiore':

-- Permettiamo solamente fiori con nomi Rosa, Giglio, Primula e Margherita
ALTER TABLE Fiore ADD CONSTRAINT check_nome_fiore CHECK (
    Nome = 'Rosa' OR
    Nome = 'Giglio' OR
    Nome = 'Primula' OR
    Nome = 'Margherita'
);

-- 'check_nome_fiore'non può essere aggiunto perchè c'è un nome vuoto e
-- non si può aggiungere un vincolo se l'istanza non rispetta il vincolo.
-- Quindi eliminiamo l'elemento che non rispetta (Id = 11)
DELETE FROM Fiore WHERE Id = 11;
-- oppure
DELETE FROM Fiore WHERE Nome = '';

-- Provo a inserire nuovamente il vincolo e andrà a buon fine.
-- Ora provo a inserire una stringa vuota
INSERT INTO Fiore (Nome, Colore, Tipo, Prezzo)
VALUES ('', 'verde', 'ornamento', '3.10');

-- Abbiamo decidiamo che 'check_nome_fiore' non è più necessario, eliminiamolo
ALTER TABLE Fiore DROP CONSTRAINT check_nome_fiore;

-- Creiamone uno migliore per rimpiazzarlo, controlliamo che nome
-- non sia una stringa vuota
ALTER TABLE Fiore ADD CONSTRAINT check_nome_fiore CHECK (Nome <> '');


-- Popoliamo la tabella 'Cliente'
INSERT INTO Cliente (CF, Nome, Cognome, NumTel) VALUES
('LRABNC70B52A247X', 'Laura', 'Bianchi', '0373859562'),
('MRARSS65F12I935J', 'Mario', 'Rossi', NULL),
('NDRVRD80C25N864W', 'Andrea', 'Verdi', '0363541298');


-- Popoliamo la tabella 'Consegna'
INSERT INTO Consegna (IdFiore, CFCliente) VALUES
(1, 'LRABNC70B52A247X');

-- Non posso inserire queste entry perchè il fiore con Id = 3 manca
INSERT INTO Consegna (IdFiore, CFCliente, CittaConsegna, DataConsegna) VALUES
(3, 'MRARSS65F12I935J', 'Milano', '2012-04-10'),
(3, 'MRARSS65F12I935J', 'Roma', '2012-04-10');

-- Anche fosse in parte ok, finchè almeno uno fallisce tutto quanto fallisce
INSERT INTO Consegna (IdFiore, CFCliente, CittaConsegna, DataConsegna) VALUES
(3, 'MRARSS65F12I935J', 'Milano', '2012-04-10'),
(1, 'MRARSS65F12I935J', 'Roma', '2012-04-10');

INSERT INTO Consegna (IdFiore, CFCliente, CittaConsegna, DataConsegna) VALUES
(9, 'NDRVRD80C25N864W', 'Trieste', '2012-04-11');

-- Aggiungere attributo sconto alla relazione 'Consegna' con valore di default 0
ALTER TABLE Consegna ADD Sconto DECIMAL(5, 2) DEFAULT 0.0 AFTER DataConsegna;



SELECT * FROM Fiore;
SELECT * FROM Cliente;
SELECT * FROM Consegna;
