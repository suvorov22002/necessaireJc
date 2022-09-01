-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 26 Août 2022 à 14:30
-- Version du serveur: 5.5.15
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `supergamebd`
--

-- --------------------------------------------------------

INSERT INTO `config` (`idconfig`, `bndmax`, `bndmin`, `bnkmax`, `bnkmin`, `bnpmax`, `bnpmin`, `bonusrate`, `percent`, `partner_id`) VALUES
(3, 5000, 600, 5000, 600, 5000, 600, 0.02, 0.92, 4);

-- --------------------------------------------------------
INSERT INTO `game_cycle` (`idcycle`, `archive`, `arrangement`, `curr_percent`, `date_fin`, `hitfrequence`, `jeu`, `jkpt`, `mise`, `misef`, `payout`, `percent`, `position`, `refundp`, `stake`, `tour`, `idPartner`) VALUES
(2, 1, '3-4-5-7-9-10-11-17-18-20', 0, '23-08-2022,01:55', 10, 'K', 0, 0, 143, 0, 95, 1, 14530, 3000, 100, 4);

-- --------------------------------------------------------


INSERT INTO `keno` (`idKeno`, `bonusKamount`, `bonusKcod`, `coderace`, `drawnumK`, `drawnumbK`, `heureTirage`, `multiplicateur`, `started`, `idPartner`) VALUES
(1, 0, 0, 'ramatbet', 1, '49-33-64-30-73-10-76-67-6-70-11-62-26-32-61-3-9-72-1-45', '19-08-2022,12:49', '0.5', 1, 4);

-- --------------------------------------------------------
INSERT INTO `partner` (`idPartner`, `actif`, `bonusBamount`, `bonusDamount`, `bonusPamount`, `bonusRamount`, `bonusbcode`, `bonusdcode`, `bonuskamount`, `bonuskcode`, `bonuspcode`, `bonusrcode`, `cob`, `coderace`, `zone`, `idGroupe`) VALUES
(4, 1, 600, 600, 600, 600, 0, 0, 221, 2, 0, 0, 'CLOSED', 'ramatbet', 'carriere', NULL);

-- --------------------------------------------------------

INSERT INTO `profil` (`idProfil`, `liblProfil`) VALUES
(1, 'administrateur'),
(2, 'caissier');
