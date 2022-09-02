-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 26 Août 2022 à 14:31
-- Version du serveur: 5.5.15
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `ramatbet`
--

--
-- Structure de la table `partner`
--

CREATE TABLE IF NOT EXISTS `partner` (
  `idPartner` int(11) NOT NULL AUTO_INCREMENT,
  `coderace` varchar(16) NOT NULL,
  `zone` varchar(254) DEFAULT NULL,
  `bonuskamount` double NOT NULL DEFAULT '600',
  `bonuskcode` int(11) NOT NULL DEFAULT '1',
  `bonusbamount` double NOT NULL DEFAULT '600',
  `bonusbcode` int(11) NOT NULL DEFAULT '0',
  `bonusramount` double NOT NULL DEFAULT '600',
  `bonusrcode` int(11) NOT NULL DEFAULT '0',
  `bonusdamount` double NOT NULL DEFAULT '600',
  `bonusdcode` int(11) NOT NULL DEFAULT '0',
  `bonuspamount` double NOT NULL DEFAULT '600',
  `bonuspcode` int(11) NOT NULL DEFAULT '0',
  `COB` enum('closed','opened') NOT NULL DEFAULT 'closed',
  `actif` int(11) DEFAULT '0',
  `groupe` int(11) NOT NULL,
  PRIMARY KEY (`idPartner`),
  UNIQUE KEY `coderace` (`coderace`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `partner`
--

INSERT INTO `partner` (`idPartner`, `coderace`, `zone`, `bonuskamount`, `bonuskcode`, `bonusbamount`, `bonusbcode`, `bonusramount`, `bonusrcode`, `bonusdamount`, `bonusdcode`, `bonuspamount`, `bonuspcode`, `COB`, `actif`, `groupe`) VALUES
(1, 'ramatbet', 'yaounde', 0, 1, 600, 0, 600, 0, 600, 0, 603, 1, 'opened', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `bonus`
--

CREATE TABLE IF NOT EXISTS `bonus` (
  `idbonus` int(11) NOT NULL AUTO_INCREMENT,
  `bonusdog` double NOT NULL DEFAULT '0',
  `bonusdogcode` int(11) NOT NULL DEFAULT '1',
  `bonusbingo` double NOT NULL DEFAULT '0',
  `bonusbingocode` int(11) NOT NULL DEFAULT '1',
  `bonuskeno` double NOT NULL DEFAULT '0',
  `bonuskenocode` int(11) NOT NULL DEFAULT '1',
  `bonusbingocol` double NOT NULL DEFAULT '0',
  `bonuscolorcode` int(11) NOT NULL DEFAULT '1',
  `bonusmoto` double NOT NULL DEFAULT '0',
  `bonusmotocode` int(11) NOT NULL DEFAULT '1',
  `sbonuskeno` double NOT NULL DEFAULT '0',
  `sbonuskenocode` int(11) NOT NULL DEFAULT '1',
  `sbonusdog` double NOT NULL DEFAULT '0',
  `sbonusdogcode` int(11) NOT NULL DEFAULT '1',
  `sbonusbingo` double NOT NULL DEFAULT '0',
  `sbonusbingocode` int(11) NOT NULL DEFAULT '1',
  `bonusbingomys` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idbonus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------


--
-- Structure de la table `groupe`
--

CREATE TABLE IF NOT EXISTS `groupe` (
  `idgroupe` int(11) NOT NULL AUTO_INCREMENT,
  `nomgroupe` varchar(16) DEFAULT NULL,
  `zone` varchar(16) DEFAULT NULL,
  `idPartner` int(11) DEFAULT NULL,
  `idbonus` int(11) NOT NULL,
  `state` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`idgroupe`),
  KEY `FK_groupe_idpartner_partner` (`idPartner`),
  KEY `FK_groupe_idbonus` (`idbonus`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `groupe`
--

INSERT INTO `groupe` (`idgroupe`, `nomgroupe`, `zone`, `idPartner`, `idbonus`, `state`) VALUES
(1, 'ramatbet', 'yaounde', 1, 1, '1');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `idsalle` int(11) NOT NULL AUTO_INCREMENT,
  `nomsalle` varchar(32) DEFAULT NULL,
  `localisation` varchar(16) DEFAULT NULL,
  `idgroupe` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsalle`),
  UNIQUE KEY `unik_salle_groupe` (`nomsalle`,`idgroupe`),
  KEY `FK_salle_idgroupe_groupe` (`idgroupe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`idsalle`, `nomsalle`, `localisation`, `idgroupe`) VALUES
(1, 'ramatbet carriere', 'carriere', 1);

-- --------------------------------------------------------


--
-- Structure de la table `profil`
--

CREATE TABLE IF NOT EXISTS `profil` (
  `idProfil` int(11) NOT NULL AUTO_INCREMENT,
  `liblProfil` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idProfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `profil`
--

INSERT INTO `profil` (`idProfil`, `liblProfil`) VALUES
(1, 'administrateur'),
(2, 'caissier');

-- --------------------------------------------------------

--
-- Structure de la table `caissier`
--

CREATE TABLE IF NOT EXISTS `caissier` (
  `idCaissier` int(11) NOT NULL AUTO_INCREMENT,
  `idProfil` int(11) NOT NULL,
  `nomC` varchar(254) DEFAULT NULL,
  `loginC` varchar(254) DEFAULT NULL,
  `mdpC` varchar(254) NOT NULL,
  `idPartner` int(11) NOT NULL,
  `statut` enum('C','N') NOT NULL DEFAULT 'N',
  `idgroupe` int(11) DEFAULT '1',
  `idsalle` int(11) DEFAULT '1',
  PRIMARY KEY (`idCaissier`),
  UNIQUE KEY `unik_log_part` (`idPartner`,`loginC`),
  KEY `FK_association8` (`idProfil`),
  KEY `idPartner` (`idPartner`),
  KEY `fk_idgroupe` (`idgroupe`),
  KEY `ibk_salle_caissier` (`idsalle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `caissier`
--

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Structure de la table `airtime`
--

CREATE TABLE IF NOT EXISTS `airtime` (
  `idairtime` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `credit` double NOT NULL DEFAULT '0',
  `debit` double NOT NULL DEFAULT '0',
  `balance` double NOT NULL DEFAULT '0',
  `caissier` int(11) NOT NULL,
  `libelle` varchar(32) NOT NULL,
  `eta` varchar(3) NOT NULL DEFAULT 'NV',
  PRIMARY KEY (`idairtime`),
  KEY `caissier` (`caissier`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `bingo`
--

CREATE TABLE IF NOT EXISTS `bingo` (
  `iddraw` int(11) NOT NULL AUTO_INCREMENT,
  `drawnumb` varchar(128) NOT NULL DEFAULT '''1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20-21-22-23-24-25-26-27-28-29-30-31-32-33-34-35''',
  `bonusbingocod` bigint(20) DEFAULT '0',
  `bonusamount` decimal(8,0) DEFAULT '0',
  `drawnum` int(11) NOT NULL DEFAULT '0',
  `idsalle` int(11) NOT NULL,
  `bonuscoloramount` decimal(10,0) NOT NULL DEFAULT '0',
  `bonuscolorcod` bigint(20) NOT NULL DEFAULT '0',
  `heureTirage` varchar(32) NOT NULL DEFAULT '01/01/2015-12:00:00',
  `bonusmoto` decimal(10,0) NOT NULL DEFAULT '0',
  `bonuscodmoto` bigint(20) NOT NULL DEFAULT '0',
  `sbonusbcod` int(11) NOT NULL DEFAULT '0',
  `start` int(11) NOT NULL DEFAULT '0',
  `coderace` varchar(32) NOT NULL,
  PRIMARY KEY (`iddraw`),
  UNIQUE KEY `drawnum` (`drawnum`,`idsalle`),
  KEY `ibk_salle` (`idsalle`),
  KEY `coderace` (`coderace`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Structure de la table `clientstatus`
--

CREATE TABLE IF NOT EXISTS `clientstatus` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(64) NOT NULL,
  `etat` enum('C','N') NOT NULL DEFAULT 'N',
  `displayMode` int(11) NOT NULL DEFAULT '0',
  `mac` varchar(32) NOT NULL,
  `coderace` varchar(64) NOT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `mac` (`mac`),
  KEY `coderace` (`coderace`),
  KEY `coderace_2` (`coderace`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `idconfig` int(11) NOT NULL AUTO_INCREMENT,
  `percent` double NOT NULL DEFAULT '0.92',
  `bonusrate` double NOT NULL DEFAULT '0.02',
  `idsalle` int(11) DEFAULT '1',
  `coderace` varchar(32) NOT NULL,
  `bnkmin` double NOT NULL DEFAULT '600',
  `bnkmax` double NOT NULL DEFAULT '5000',
  `bnpmin` double NOT NULL DEFAULT '600',
  `bnpmax` double NOT NULL DEFAULT '5000',
  `bndmin` double NOT NULL DEFAULT '600',
  `bndmax` double NOT NULL DEFAULT '5000',
  `config` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idconfig`),
  UNIQUE KEY `coderace` (`coderace`),
  UNIQUE KEY `idsalle` (`idsalle`,`coderace`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `config`
--

INSERT INTO `config` (`idconfig`, `percent`, `bonusrate`, `idsalle`, `coderace`, `bnkmin`, `bnkmax`, `bnpmin`, `bnpmax`, `bndmin`, `bndmax`, `config`) VALUES
(1, 0.92, 0.005, 1, 'ramatbet', 500, 600, 600, 5000, 600, 5000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `effchoiceb`
--

CREATE TABLE IF NOT EXISTS `effchoiceb` (
  `ideffchoiceB` int(11) NOT NULL AUTO_INCREMENT,
  `idmiseb` int(11) DEFAULT NULL,
  `dcombi` varchar(64) NOT NULL,
  `idDraw` int(11) NOT NULL,
  `mtantchoix` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ideffchoiceB`),
  KEY `eff_ibfk3` (`idmiseb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `effchoicek`
--

CREATE TABLE IF NOT EXISTS `effchoicek` (
  `ideffchoicek` int(11) NOT NULL AUTO_INCREMENT,
  `idparil` int(11) DEFAULT NULL,
  `idmisek` int(11) DEFAULT NULL,
  `kchoice` varchar(32) NOT NULL,
  `idkeno` int(11) NOT NULL,
  `mtantchoix` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ideffchoicek`),
  KEY `idparil` (`idparil`),
  KEY `idmisek` (`idmisek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `effchoicep`
--

CREATE TABLE IF NOT EXISTS `effchoicep` (
  `ideffchoicep` int(11) NOT NULL AUTO_INCREMENT,
  `idparis` int(11) DEFAULT NULL,
  `idmisep` int(11) DEFAULT NULL,
  `pchoice` varchar(32) NOT NULL,
  `idspin` int(11) NOT NULL,
  `mtantchoix` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ideffchoicep`),
  KEY `idparis` (`idparis`),
  KEY `idmisep` (`idmisep`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure de la table `effchoicer`
--

CREATE TABLE IF NOT EXISTS `effchoicer` (
  `ideffchoice` int(11) NOT NULL AUTO_INCREMENT,
  `idparir` int(11) DEFAULT NULL,
  `idmiserl` int(11) DEFAULT NULL,
  `dchoice` varchar(16) NOT NULL,
  `cote` double NOT NULL,
  `idRace` int(11) NOT NULL,
  `mtantchoix` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ideffchoice`),
  KEY `idparir` (`idparir`),
  KEY `idmiserl` (`idmiserl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `freeslip`
--

CREATE TABLE IF NOT EXISTS `freeslip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freekeno` double NOT NULL DEFAULT '0',
  `freebingo` double NOT NULL DEFAULT '0',
  `freedog` double NOT NULL DEFAULT '0',
  `freespin` double NOT NULL DEFAULT '0',
  `idpartner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_slip` (`idpartner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `game_cycle`
--

CREATE TABLE IF NOT EXISTS `game_cycle` (
  `idcycle` int(11) NOT NULL AUTO_INCREMENT,
  `percent` double NOT NULL DEFAULT '90',
  `curr_percent` double NOT NULL DEFAULT '0',
  `tour` int(11) NOT NULL DEFAULT '100',
  `hitfrequence` int(11) NOT NULL DEFAULT '20',
  `refundp` double NOT NULL DEFAULT '0',
  `stake` double NOT NULL DEFAULT '0',
  `payout` double NOT NULL DEFAULT '0',
  `jkpt` double NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `arrangement` varchar(2048) NOT NULL,
  `idpartner` int(11) NOT NULL,
  `jeu` enum('M','D','L','B','S','K') NOT NULL,
  `mise` int(11) NOT NULL,
  `misef` int(11) NOT NULL,
  `date_fin` varchar(20) NOT NULL,
  `archive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcycle`),
  UNIQUE KEY `fk_cycle_partner` (`idpartner`,`jeu`,`mise`,`archive`,`idcycle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Structure de la table `keno`
--

CREATE TABLE IF NOT EXISTS `keno` (
  `idKeno` int(11) NOT NULL AUTO_INCREMENT,
  `drawnumbK` varchar(128) NOT NULL DEFAULT '''1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20''',
  `bonusKcod` bigint(20) NOT NULL DEFAULT '0',
  `bonusKamount` double NOT NULL DEFAULT '0',
  `drawnumK` int(11) NOT NULL DEFAULT '0',
  `heureTirage` varchar(20) NOT NULL DEFAULT '01/01/2015-12:00:00',
  `multiplicateur` varchar(5) NOT NULL DEFAULT '0',
  `sbonuskcod` int(11) NOT NULL DEFAULT '0',
  `idsalle` int(11) NOT NULL,
  `started` int(11) DEFAULT '0',
  `coderace` varchar(32) NOT NULL,
  PRIMARY KEY (`idKeno`),
  UNIQUE KEY `drawnumK` (`drawnumK`,`coderace`),
  KEY `FK_keno_salle_idsalle` (`idsalle`),
  KEY `coderace` (`coderace`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contraintes pour la table `keno`
--
ALTER TABLE `keno`
  ADD CONSTRAINT `keno_ibfk_1` FOREIGN KEY (`coderace`) REFERENCES `partner` (`coderace`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contenu de la table `keno`
--

INSERT INTO `keno` (`idKeno`, `drawnumbK`, `bonusKcod`, `bonusKamount`, `drawnumK`, `heureTirage`, `multiplicateur`, `sbonuskcod`, `idsalle`, `started`, `coderace`) VALUES
(1, '1-2-3-4-5-6-7-8-9-10-11-12-13-14-15-16-17-18-19-20', 0, 0, 0, '01/01/2020-12:00:00', '2', 0, 1, 1, 'ramatbet');

-- --------------------------------------------------------

--
-- Structure de la table `miseb`
--

CREATE TABLE IF NOT EXISTS `miseb` (
  `idmiseb` int(11) NOT NULL AUTO_INCREMENT,
  `idcaissier` int(11) DEFAULT NULL,
  `heuremise` varchar(254) DEFAULT NULL,
  `summise` int(11) DEFAULT NULL,
  `datemise` varchar(254) DEFAULT NULL,
  `drawnum` int(11) NOT NULL,
  `etatmise` varchar(254) DEFAULT NULL,
  `bonusBingoCod` bigint(20) DEFAULT NULL,
  `idmiset` int(11) NOT NULL,
  `iddraw` int(11) NOT NULL,
  `bonusColorCod` bigint(20) NOT NULL DEFAULT '0',
  `bonuscodMoto` bigint(20) NOT NULL DEFAULT '0',
  `archive` int(11) NOT NULL DEFAULT '0',
  `sbonusbcod` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idmiseb`),
  KEY `fk_asso` (`idcaissier`),
  KEY `miseb_ibfk2` (`idmiset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `misek`
--

CREATE TABLE IF NOT EXISTS `misek` (
  `idMiseK` int(11) NOT NULL AUTO_INCREMENT,
  `idCaissier` int(11) DEFAULT NULL,
  `heureMise` varchar(254) DEFAULT NULL,
  `sumMise` int(11) DEFAULT NULL,
  `dateMise` varchar(254) DEFAULT NULL,
  `drawnumk` int(11) NOT NULL,
  `etatMise` enum('attente','perdant','gagnant') DEFAULT 'attente',
  `bonusCod` bigint(20) DEFAULT NULL,
  `idMiseT` int(11) NOT NULL,
  `idKeno` int(11) NOT NULL,
  `sumWin` double NOT NULL DEFAULT '0',
  `archive` int(11) NOT NULL DEFAULT '0',
  `xmulti` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMiseK`),
  KEY `FK_association14` (`idCaissier`),
  KEY `FK_association56` (`idMiseT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `misek_temp`
--

CREATE TABLE IF NOT EXISTS `misek_temp` (
  `id_misek_temp` int(11) NOT NULL AUTO_INCREMENT,
  `multi` int(11) NOT NULL,
  `sum` double(10,2) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `idMiseK` int(11) NOT NULL,
  PRIMARY KEY (`id_misek_temp`),
  UNIQUE KEY `idMiseK` (`idMiseK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `misep`
--

CREATE TABLE IF NOT EXISTS `misep` (
  `idMiseP` int(11) NOT NULL AUTO_INCREMENT,
  `idCaissier` int(11) DEFAULT NULL,
  `heureMise` varchar(254) DEFAULT NULL,
  `sumMise` int(11) DEFAULT NULL,
  `dateMise` varchar(254) DEFAULT NULL,
  `drawnump` int(11) NOT NULL,
  `etatMise` varchar(254) DEFAULT NULL,
  `bonusCod` bigint(20) DEFAULT NULL,
  `idMiseT` int(11) NOT NULL,
  `idSpin` int(11) NOT NULL,
  `bonusCodMoto` bigint(20) NOT NULL DEFAULT '0',
  `archive` int(11) NOT NULL DEFAULT '0',
  `sbonuspcod` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMiseP`),
  KEY `FK_association14` (`idCaissier`),
  KEY `FK_association56` (`idMiseT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `miserl`
--

CREATE TABLE IF NOT EXISTS `miserl` (
  `idMiseRL` int(11) NOT NULL AUTO_INCREMENT,
  `idCaissier` int(11) DEFAULT NULL,
  `heureMise` varchar(254) DEFAULT NULL,
  `sumMise` int(11) DEFAULT NULL,
  `dateMise` varchar(254) DEFAULT NULL,
  `racenum` int(11) NOT NULL,
  `etatMise` varchar(254) DEFAULT NULL,
  `bonusCod` bigint(20) DEFAULT NULL,
  `idMiseT` int(11) NOT NULL,
  `idRace` int(11) NOT NULL,
  `bonusCodMoto` bigint(20) NOT NULL DEFAULT '0',
  `archive` int(11) NOT NULL DEFAULT '0',
  `sbonusdcod` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMiseRL`),
  KEY `FK_association14` (`idCaissier`),
  KEY `FK_association56` (`idMiseT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `miset`
--

CREATE TABLE IF NOT EXISTS `miset` (
  `idMiseT` int(11) NOT NULL AUTO_INCREMENT,
  `typeJeu` enum('M','D','L','B','S','K') NOT NULL,
  `barcode` varchar(254) NOT NULL,
  `idsalle` int(11) NOT NULL DEFAULT '1',
  `summise` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMiseT`),
  KEY `miset_ibfk_1` (`idsalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

CREATE TABLE IF NOT EXISTS `mouvement` (
  `caissier` int(11) NOT NULL,
  `mvt` double NOT NULL DEFAULT '0',
  KEY `caissier` (`caissier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------
DROP TABLE IF EXISTS `cagnotte`;
CREATE TABLE IF NOT EXISTS `cagnotte` (
  `idCagnotte` bigint(20) NOT NULL,
  `barcode` bigint(20) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `give` int(11) DEFAULT NULL,
  `heur` varchar(255) DEFAULT NULL,
  `jeu` varchar(255) DEFAULT NULL,
  `lot` varchar(255) DEFAULT NULL,
  `idmise` bigint(20) DEFAULT NULL,
  `idPartner` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idCagnotte`),
  KEY `FKs2gj8vok62o9l6tuf4xs0gdp5` (`idPartner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

--
-- Contraintes pour la table `cagnotte`
--
ALTER TABLE `cagnotte`
  ADD CONSTRAINT `FKs2gj8vok62o9l6tuf4xs0gdp5` FOREIGN KEY (`idPartner`) REFERENCES `partner` (`idPartner`);
COMMIT;

--
-- Structure de la table `paril`
--

CREATE TABLE IF NOT EXISTS `paril` (
  `idParil` int(11) NOT NULL AUTO_INCREMENT,
  `codeParil` varchar(254) DEFAULT NULL,
  `libelle` varchar(32) NOT NULL,
  PRIMARY KEY (`idParil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Contenu de la table `paril`
--

INSERT INTO `paril` (`idParil`, `codeParil`, `libelle`) VALUES
(1, 'num10', '10 numéros'),
(2, 'num9', '9 numéros'),
(3, 'num8', '8 numéros'),
(4, 'num7', '7 numéros'),
(5, 'num6', '6 numéros'),
(6, 'num5', '5 numéros'),
(7, 'num4', '4 numéros'),
(8, 'num3', '3 numéros'),
(9, 'num2', '2 numéros'),
(10, 'numOut', 'Non sortants'),
(11, 'numAll', 'Sortants'),
(12, 'num1p', '1er numéro pair'),
(13, 'num1ip', '1er numéro impair'),
(14, 'num20p', '20eme numéro pair'),
(15, 'num20ip', '20eme numéro impair'),
(16, 'nums5m', 'Somme cinq 1er < 202.5'),
(17, 'nums5p', 'Somme cinq 1er > 202.5'),
(18, 'nums20m', 'Somme totale < 810.5'),
(19, 'nums20p', 'Somme totale > 810.5'),
(20, 'num1cv', '1ere boule verte'),
(21, 'num1cb', '1ere boule bleu'),
(22, 'num1cr', '1ere boule rouge'),
(23, 'num1co', '1ere boule orange'),
(24, 'num20cv', '20eme boule verte'),
(25, 'num20cb', '20eme boule bleu'),
(26, 'num20cr', '20eme boule rouge'),
(27, 'num20co', '20eme boule orange'),
(28, 'numS40', '1er numéro < 40.5'),
(29, 'numI40', '1er numéro > 40.5');

-- --------------------------------------------------------

--
-- Structure de la table `parir`
--

CREATE TABLE IF NOT EXISTS `parir` (
  `idParir` int(11) NOT NULL AUTO_INCREMENT,
  `codeParir` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idParir`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `parir`
--

INSERT INTO `parir` (`idParir`, `codeParir`) VALUES
(1, 'single'),
(2, 'straight'),
(3, 'forecast'),
(4, 'place'),
(5, 'firstWO'),
(6, 'secondWO'),
(7, 'tricast'),
(8, 'cmbtricast');

-- --------------------------------------------------------

--
-- Structure de la table `paris`
--

CREATE TABLE IF NOT EXISTS `paris` (
  `idParis` int(11) NOT NULL AUTO_INCREMENT,
  `codeParis` varchar(16) NOT NULL,
  `libelle` varchar(16) NOT NULL,
  PRIMARY KEY (`idParis`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Contenu de la table `paris`
--

INSERT INTO `paris` (`idParis`, `codeParis`, `libelle`) VALUES
(1, 'numb', 'number'),
(2, 'numcv', 'couleur verte'),
(3, 'numcn', 'couleur noir'),
(4, 'numcr', 'couleur rouge'),
(5, 'mir12', 'mirroir 12'),
(6, 'mir13', 'mirroir 13'),
(7, 'mir23', 'mirroir 23'),
(8, 'twin11', 'twin 11'),
(9, 'twin22', 'twin 22'),
(10, 'twin33', 'twin 33'),
(11, 'secta', 'secteur a'),
(12, 'sectb', 'secteur b'),
(13, 'sectc', 'secteur c'),
(14, 'sectd', 'secteur d'),
(15, 'secte', 'secteur e'),
(16, 'sectf', 'secteur f'),
(17, 'low', 'low'),
(18, 'high', 'high'),
(19, 'fin0', 'final 0'),
(20, 'fin1', 'final 1'),
(21, 'fin2', 'final 2'),
(22, 'fin3', 'final 3'),
(23, 'douz1', 'douzaine 1'),
(24, 'douz2', 'douzaine 2'),
(25, 'douz3', 'douzaine 3'),
(26, 'pair', 'pair'),
(27, 'ipair', 'impair'),
(28, 'fin4', 'final 4'),
(29, 'fin5', 'final 5'),
(30, 'fin6', 'final 6'),
(31, 'lr', 'low rouge'),
(32, 'ln', 'low noir'),
(33, 'hr', 'high rouge'),
(34, 'hn', 'high noir');


-- --------------------------------------------------------

--
-- Structure de la table `race`
--

CREATE TABLE IF NOT EXISTS `race` (
  `idRace` int(11) NOT NULL AUTO_INCREMENT,
  `arrive` varchar(32) NOT NULL DEFAULT '''1-2-3-4-5-6''',
  `bonusCode` bigint(20) DEFAULT '0',
  `bonusAmount` decimal(8,0) DEFAULT '600',
  `raceNumber` int(11) NOT NULL DEFAULT '0',
  `idsalle` int(11) NOT NULL,
  `bonusmoto` decimal(10,0) NOT NULL DEFAULT '0',
  `bonusCodMoto` bigint(20) NOT NULL DEFAULT '0',
  `un` double(8,2) NOT NULL DEFAULT '1.00',
  `deux` double(8,2) NOT NULL DEFAULT '1.00',
  `trois` double(8,2) NOT NULL DEFAULT '1.00',
  `quatre` double(8,2) NOT NULL DEFAULT '1.00',
  `cinq` double(8,2) NOT NULL DEFAULT '1.00',
  `six` double(8,2) NOT NULL DEFAULT '1.00',
  `start` int(11) NOT NULL DEFAULT '0',
  `sbonusdcod` int(11) NOT NULL DEFAULT '0',
  `coderace` varchar(32) NOT NULL,
  PRIMARY KEY (`idRace`),
  UNIQUE KEY `raceNumber` (`raceNumber`,`idsalle`),
  KEY `ibk_race_sal` (`idsalle`),
  KEY `coderace` (`coderace`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Structure de la table `spin`
--

CREATE TABLE IF NOT EXISTS `spin` (
  `idSpin` int(11) NOT NULL AUTO_INCREMENT,
  `drawnumbP` varchar(128) NOT NULL DEFAULT '''0''',
  `bonusPcod` bigint(20) NOT NULL DEFAULT '0',
  `bonusPamount` double NOT NULL DEFAULT '0',
  `drawnumP` int(11) NOT NULL DEFAULT '0',
  `heureTirage` varchar(20) NOT NULL DEFAULT '01/01/2020-12:00:00',
  `sbonuspcod` int(11) NOT NULL DEFAULT '0',
  `idsalle` int(11) NOT NULL,
  `started` int(11) DEFAULT '0',
  `coderace` varchar(32) NOT NULL,
  PRIMARY KEY (`idSpin`),
  UNIQUE KEY `drawnumP` (`drawnumP`,`coderace`),
  KEY `FK_spin_salle_idsalle` (`idsalle`),
  KEY `coderace` (`coderace`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `versement`
--

CREATE TABLE IF NOT EXISTS `versement` (
  `idVersement` int(11) NOT NULL AUTO_INCREMENT,
  `idCaissier` int(11) NOT NULL,
  `mtantVers` double NOT NULL DEFAULT '0',
  `heurVers` varchar(254) DEFAULT NULL,
  `dateVers` varchar(254) DEFAULT NULL,
  `typeVers` varchar(2) NOT NULL,
  `idMiset` int(11) NOT NULL,
  `archive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idVersement`),
  KEY `FK_association12` (`idCaissier`),
  KEY `idMiset` (`idMiset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `winning`
--

CREATE TABLE IF NOT EXISTS `winning` (
  `idwin` int(11) NOT NULL AUTO_INCREMENT,
  `idmiset` int(11) NOT NULL,
  `montant` double NOT NULL,
  PRIMARY KEY (`idwin`),
  KEY `FK_ag` (`idmiset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `xtradraw`
--

CREATE TABLE IF NOT EXISTS `xtradraw` (
  `idxtra` int(11) NOT NULL AUTO_INCREMENT,
  `xtraMin` int(11) NOT NULL DEFAULT '20',
  `xtraMax` int(11) NOT NULL DEFAULT '100',
  `countDraw` int(11) NOT NULL DEFAULT '80',
  `countDrawx` int(11) NOT NULL DEFAULT '0',
  `coderace` varchar(16) NOT NULL,
  PRIMARY KEY (`idxtra`),
  KEY `coderace` (`coderace`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `xtradraw`
--

INSERT INTO `xtradraw` (`idxtra`, `xtraMin`, `xtraMax`, `countDraw`, `countDrawx`, `coderace`) VALUES
(1, 20, 100, 2, 0, 'ramatbet');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bingo`
--
ALTER TABLE `bingo`
  ADD CONSTRAINT `bingo_ibfk_1` FOREIGN KEY (`coderace`) REFERENCES `partner` (`coderace`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `ibk_salle` FOREIGN KEY (`idsalle`) REFERENCES `salle` (`idsalle`);

--
-- Contraintes pour la table `caissier`
--
ALTER TABLE `caissier`
  ADD CONSTRAINT `caissier_ibfk_1` FOREIGN KEY (`idPartner`) REFERENCES `partner` (`idPartner`),
  ADD CONSTRAINT `FK_association8` FOREIGN KEY (`idProfil`) REFERENCES `profil` (`idProfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idgroupe` FOREIGN KEY (`idgroupe`) REFERENCES `groupe` (`idgroupe`),
  ADD CONSTRAINT `ibk_salle_caissier` FOREIGN KEY (`idsalle`) REFERENCES `salle` (`idsalle`);

--
-- Contraintes pour la table `freeslip`
--
ALTER TABLE `freeslip`
  ADD CONSTRAINT `fk_slip_1` FOREIGN KEY (`idpartner`) REFERENCES `partner` (`idPartner`);

--
-- Contraintes pour la table `game_cycle`
--
ALTER TABLE `game_cycle`
  ADD CONSTRAINT `game_cycle_ibfk_2` FOREIGN KEY (`idpartner`) REFERENCES `partner` (`idPartner`) ON DELETE CASCADE ON UPDATE CASCADE;
  
--
-- Contraintes pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `FK_assoc12` FOREIGN KEY (`caissier`) REFERENCES `caissier` (`idCaissier`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `race`
--
ALTER TABLE `race`
  ADD CONSTRAINT `race_ibfk_1` FOREIGN KEY (`coderace`) REFERENCES `partner` (`coderace`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
