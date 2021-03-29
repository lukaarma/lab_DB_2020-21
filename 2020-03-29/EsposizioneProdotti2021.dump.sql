-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 29, 2021 at 01:20 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EsposizioneProdotti2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `Autore`
--

CREATE TABLE `Autore` (
  `Id` char(2) NOT NULL,
  `Nome` varchar(20) DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Autore`
--

INSERT INTO `Autore` (`Id`, `Nome`, `Cognome`) VALUES
('BB', 'Bruno', 'Bianchi'),
('LR', 'Luisa', 'Rossi'),
('LV', 'Luisa', 'Verdi'),
('MB', 'Marco', 'Bruni'),
('MR', 'Maria', 'Rossi');

-- --------------------------------------------------------

--
-- Table structure for table `Negozio`
--

CREATE TABLE `Negozio` (
  `NomeNeg` varchar(20) NOT NULL,
  `Provincia` varchar(15) NOT NULL,
  `budget` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Negozio`
--

INSERT INTO `Negozio` (`NomeNeg`, `Provincia`, `budget`) VALUES
('NegozioA', 'Milano', '15000.00'),
('NegozioB', 'Milano', '20000.00'),
('NegozioC', 'Torino', '10000.00'),
('NegozioD', 'Roma', '17000.00');

-- --------------------------------------------------------

--
-- Table structure for table `Prodotto`
--

CREATE TABLE `Prodotto` (
  `CodProdotto` char(3) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `costo` decimal(6,2) DEFAULT NULL,
  `NumRepliche` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Prodotto`
--

INSERT INTO `Prodotto` (`CodProdotto`, `Nome`, `costo`, `NumRepliche`) VALUES
('123', 'Alpha', '95.00', 1),
('234', 'Beta', '89.00', 2),
('345', 'Gamma', '87.00', 2),
('456', 'Delta', '95.00', 1),
('543', 'Gamma', '85.00', 1),
('567', 'Epsilon', '78.00', 3),
('654', 'Alpha', '95.00', 0),
('678', 'Zeta', '93.00', 2),
('752', 'Omega', '50.00', 2),
('765', 'Kappa', '78.00', 0),
('789', 'Eta', '85.00', 1),
('876', 'Iota', '95.00', 2),
('987', 'Theta', '90.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Produzione`
--

CREATE TABLE `Produzione` (
  `CodProdotto` char(3) NOT NULL,
  `IdAutore` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Produzione`
--

INSERT INTO `Produzione` (`CodProdotto`, `IdAutore`) VALUES
('123', 'BB'),
('456', 'BB'),
('234', 'LR'),
('543', 'LR'),
('567', 'LR'),
('678', 'LR'),
('765', 'LR'),
('789', 'LR'),
('987', 'LR'),
('123', 'LV'),
('345', 'LV'),
('345', 'MB'),
('456', 'MB'),
('543', 'MB'),
('654', 'MB'),
('752', 'MB'),
('876', 'MB'),
('123', 'MR'),
('234', 'MR');

-- --------------------------------------------------------

--
-- Table structure for table `RichiestaEsposizione`
--

CREATE TABLE `RichiestaEsposizione` (
  `CodProdotto` char(3) NOT NULL,
  `NomeNegozio` varchar(20) NOT NULL,
  `Tipologia` varchar(20) NOT NULL,
  `Decisione` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `RichiestaEsposizione`
--

INSERT INTO `RichiestaEsposizione` (`CodProdotto`, `NomeNegozio`, `Tipologia`, `Decisione`) VALUES
('123', 'NegozioA', 'Scaffale', 1),
('123', 'NegozioA', 'Stand', 0),
('123', 'NegozioB', 'Scaffale', 1),
('123', 'NegozioD', 'Stand', 1),
('234', 'NegozioB', 'Vetrina', 0),
('345', 'NegozioC', 'ATerra', 1),
('345', 'NegozioD', 'ATerra', 0),
('345', 'NegozioD', 'Scaffale', 1),
('345', 'NegozioD', 'Stand', 0),
('543', 'NegozioC', 'Scaffale', 0),
('678', 'NegozioA', 'Appeso', 1),
('752', 'NegozioA', 'Scaffale', 1),
('752', 'NegozioC', 'ATerra', 1),
('765', 'NegozioA', 'Appeso', 1),
('765', 'NegozioD', 'Appeso', 0),
('765', 'NegozioD', 'Muro', 1),
('876', 'NegozioA', 'Scaffale', 0),
('876', 'NegozioC', 'Espositore', 0),
('876', 'NegozioC', 'Vetrina', 1),
('987', 'NegozioA', 'Scaffale', 1),
('987', 'NegozioB', 'Scaffale', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Autore`
--
ALTER TABLE `Autore`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Negozio`
--
ALTER TABLE `Negozio`
  ADD PRIMARY KEY (`NomeNeg`);

--
-- Indexes for table `Prodotto`
--
ALTER TABLE `Prodotto`
  ADD PRIMARY KEY (`CodProdotto`);

--
-- Indexes for table `Produzione`
--
ALTER TABLE `Produzione`
  ADD PRIMARY KEY (`IdAutore`,`CodProdotto`),
  ADD KEY `fk_codprodotto` (`CodProdotto`);

--
-- Indexes for table `RichiestaEsposizione`
--
ALTER TABLE `RichiestaEsposizione`
  ADD PRIMARY KEY (`CodProdotto`,`NomeNegozio`,`Tipologia`),
  ADD KEY `fk_codprod` (`NomeNegozio`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Produzione`
--
ALTER TABLE `Produzione`
  ADD CONSTRAINT `fk_codprodotto` FOREIGN KEY (`CodProdotto`) REFERENCES `prodotto` (`CodProdotto`),
  ADD CONSTRAINT `fk_idautore` FOREIGN KEY (`IdAutore`) REFERENCES `autore` (`Id`);

--
-- Constraints for table `RichiestaEsposizione`
--
ALTER TABLE `RichiestaEsposizione`
  ADD CONSTRAINT `fk_codprod` FOREIGN KEY (`NomeNegozio`) REFERENCES `Negozio` (`NomeNeg`),
  ADD CONSTRAINT `fk_nomeneg` FOREIGN KEY (`CodProdotto`) REFERENCES `Prodotto` (`CodProdotto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
