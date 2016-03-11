-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 11 Mars 2016 à 16:17
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bd_ppe4_chopin`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `idAdministrateur` smallint(6) NOT NULL,
  `pseudoAdministrateur` varchar(30) NOT NULL,
  `mdpAdministrateur` varchar(50) NOT NULL,
  PRIMARY KEY (`idAdministrateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`idAdministrateur`, `pseudoAdministrateur`, `mdpAdministrateur`) VALUES
(1, 'funflo926', '1234_admin');

-- --------------------------------------------------------

--
-- Structure de la table `attribuer`
--

CREATE TABLE IF NOT EXISTS `attribuer` (
  `IDHEBERGEMENT` smallint(6) NOT NULL,
  `IDEQUIPEMENT` smallint(6) NOT NULL,
  PRIMARY KEY (`IDHEBERGEMENT`,`IDEQUIPEMENT`),
  KEY `I_FK_ATTRIBUER_CAMPING` (`IDHEBERGEMENT`),
  KEY `I_FK_ATTRIBUER_EQUIPEMENTS` (`IDEQUIPEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `avoir_gerant`
--

CREATE TABLE IF NOT EXISTS `avoir_gerant` (
  `IDHEBERGEMENT` smallint(6) NOT NULL,
  `IDGERANT` smallint(6) NOT NULL,
  PRIMARY KEY (`IDHEBERGEMENT`,`IDGERANT`),
  KEY `I_FK_AVOIR_GERANT_HEBERGEMENT` (`IDHEBERGEMENT`),
  KEY `I_FK_AVOIR_GERANT_GERANT` (`IDGERANT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `camping`
--

CREATE TABLE IF NOT EXISTS `camping` (
  `IDHEBERGEMENT` smallint(6) NOT NULL,
  `ADRESSEHEBERGEMENT` char(32) DEFAULT NULL,
  `VILLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDHEBERGEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `chambre_hotte`
--

CREATE TABLE IF NOT EXISTS `chambre_hotte` (
  `IDHEBERGEMENT` smallint(6) NOT NULL,
  `NBCHAMBRE` int(11) DEFAULT NULL,
  `CUISINE` tinyint(4) DEFAULT NULL,
  `ADRESSEHEBERGEMENT` char(32) DEFAULT NULL,
  `VILLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDHEBERGEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `contrevisite`
--

CREATE TABLE IF NOT EXISTS `contrevisite` (
  `IDCONTREVISITE` smallint(6) NOT NULL,
  `IDINSPECTEUR` smallint(6) NOT NULL,
  `IDDATEV` smallint(6) NOT NULL,
  `IDVISITE` smallint(6) NOT NULL,
  `COMMENTAIRECV` text,
  `NBETOILEMOINS` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`IDCONTREVISITE`),
  KEY `I_FK_CONTREVISITE_INSPECTEUR` (`IDINSPECTEUR`),
  KEY `I_FK_CONTREVISITE_DATEV` (`IDDATEV`),
  KEY `I_FK_CONTREVISITE_VISITE` (`IDVISITE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `datev`
--

CREATE TABLE IF NOT EXISTS `datev` (
  `IDDATEV` smallint(6) NOT NULL,
  `IDSAISON` smallint(6) NOT NULL,
  `DATEV` date DEFAULT NULL,
  PRIMARY KEY (`IDDATEV`),
  KEY `I_FK_DATEV_SAISON` (`IDSAISON`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE IF NOT EXISTS `departement` (
  `IDDEPARTEMENT` smallint(6) NOT NULL,
  `NUMDEPARTEMENT` smallint(6) DEFAULT NULL,
  `LIBDEPARTEMENT` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDDEPARTEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`IDDEPARTEMENT`, `NUMDEPARTEMENT`, `LIBDEPARTEMENT`) VALUES
(1, 49, 'Maine et Loire');

-- --------------------------------------------------------

--
-- Structure de la table `equipements`
--

CREATE TABLE IF NOT EXISTS `equipements` (
  `IDEQUIPEMENT` smallint(6) NOT NULL,
  `NOMEQUIPEMENT` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDEQUIPEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gerant`
--

CREATE TABLE IF NOT EXISTS `gerant` (
  `IDGERANT` smallint(6) NOT NULL,
  `NOMGERANT` char(32) DEFAULT NULL,
  `PRENOMGERANT` char(32) DEFAULT NULL,
  `TELGERANT` bigint(20) DEFAULT NULL,
  `ADRESSEGERANT` char(32) DEFAULT NULL,
  `PSEUDOGERANT` varchar(30) NOT NULL,
  `MDPGERANT` varchar(50) NOT NULL,
  PRIMARY KEY (`IDGERANT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `gerant`
--

INSERT INTO `gerant` (`IDGERANT`, `NOMGERANT`, `PRENOMGERANT`, `TELGERANT`, `ADRESSEGERANT`, `PSEUDOGERANT`, `MDPGERANT`) VALUES
(1, 'Cano', 'Florian', 770469714, '60 rue Adrien Recouvreur', 'funflo926', '1234_gerant');

-- --------------------------------------------------------

--
-- Structure de la table `hebergement`
--

CREATE TABLE IF NOT EXISTS `hebergement` (
  `IDHEBERGEMENT` smallint(6) NOT NULL AUTO_INCREMENT,
  `NOMHEBERGEMENT` varchar(30) NOT NULL,
  `IDSPECIALITEH` smallint(6) NOT NULL,
  `IDDEPARTEMENT` smallint(6) NOT NULL,
  `ADRESSEHEBERGEMENT` char(32) DEFAULT NULL,
  `VILLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDHEBERGEMENT`),
  KEY `I_FK_HEBERGEMENT_SPECIALITE` (`IDSPECIALITEH`),
  KEY `I_FK_HEBERGEMENT_DEPARTEMENT` (`IDDEPARTEMENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `hebergement`
--

INSERT INTO `hebergement` (`IDHEBERGEMENT`, `NOMHEBERGEMENT`, `IDSPECIALITEH`, `IDDEPARTEMENT`, `ADRESSEHEBERGEMENT`, `VILLE`) VALUES
(1, 'A la bonne franquette', 1, 1, '60 rue Adrien Recouvreur', 'Angers'),
(2, 'Chez Charlie et Lulu', 1, 1, '13 rue du Soleil', 'Marseille');

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

CREATE TABLE IF NOT EXISTS `historique` (
  `IDHEBERGEMENT` smallint(6) NOT NULL,
  `IDSAISON` smallint(6) NOT NULL,
  `ETOILE` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`IDHEBERGEMENT`,`IDSAISON`),
  KEY `I_FK_HISTORIQUE_HEBERGEMENT` (`IDHEBERGEMENT`),
  KEY `I_FK_HISTORIQUE_SAISON` (`IDSAISON`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `historique`
--

INSERT INTO `historique` (`IDHEBERGEMENT`, `IDSAISON`, `ETOILE`) VALUES
(1, 1, 3),
(1, 2, 4),
(1, 4, 3),
(2, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `IDHEBERGEMENT` smallint(6) NOT NULL,
  `ADRESSEHEBERGEMENT` char(32) DEFAULT NULL,
  `VILLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDHEBERGEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `inspecteur`
--

CREATE TABLE IF NOT EXISTS `inspecteur` (
  `IDINSPECTEUR` smallint(6) NOT NULL,
  `IDSPECIALITEI` smallint(6) NOT NULL,
  `NOMINSPECTEUR` char(32) DEFAULT NULL,
  `PRENOMINSPECTEUR` char(32) DEFAULT NULL,
  `NUMEROTEL` varchar(12) DEFAULT NULL,
  `MDPINSPECTEUR` varchar(30) NOT NULL,
  PRIMARY KEY (`IDINSPECTEUR`),
  KEY `I_FK_INSPECTEUR_SPECIALITE` (`IDSPECIALITEI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `inspecteur`
--

INSERT INTO `inspecteur` (`IDINSPECTEUR`, `IDSPECIALITEI`, `NOMINSPECTEUR`, `PRENOMINSPECTEUR`, `NUMEROTEL`, `MDPINSPECTEUR`) VALUES
(1, 2, 'Baumard', 'Alban', '0651253645', 'test'),
(2, 1, 'Chopin', 'Mathieu', '0612535232', 'test'),
(3, 3, 'Cano', 'Florian', '0614153214', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE IF NOT EXISTS `restaurant` (
  `IDRESTAURANT` char(32) NOT NULL,
  `IDTC` smallint(6) NOT NULL,
  `IDHEBERGEMENT` smallint(6) NOT NULL,
  `CHEF` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDRESTAURANT`),
  KEY `I_FK_RESTAURANT_HOTEL` (`IDHEBERGEMENT`),
  KEY `I_FK_RESTAURANT_TYPE_CUISINE` (`IDTC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE IF NOT EXISTS `saison` (
  `IDSAISON` smallint(6) NOT NULL,
  `LIBSAISON` char(32) DEFAULT NULL,
  `ANNEESAISON` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDSAISON`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `saison`
--

INSERT INTO `saison` (`IDSAISON`, `LIBSAISON`, `ANNEESAISON`) VALUES
(1, 'ete', 2013),
(2, 'hiver', 2013),
(3, 'ete', 2014),
(4, 'automne', 2014);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE IF NOT EXISTS `specialite` (
  `IDSPECIALITE` smallint(6) NOT NULL,
  `LIBSPECIALITE` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDSPECIALITE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specialite`
--

INSERT INTO `specialite` (`IDSPECIALITE`, `LIBSPECIALITE`) VALUES
(1, 'spe1'),
(2, 'spe2'),
(3, 'spe3');

-- --------------------------------------------------------

--
-- Structure de la table `type_cuisine`
--

CREATE TABLE IF NOT EXISTS `type_cuisine` (
  `IDTC` smallint(6) NOT NULL,
  `LIBELLETC` char(32) DEFAULT NULL,
  PRIMARY KEY (`IDTC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

CREATE TABLE IF NOT EXISTS `visite` (
  `IDVISITE` smallint(6) NOT NULL,
  `IDINSPECTEUR` smallint(6) DEFAULT NULL,
  `IDHEBERGEMENT` smallint(6) NOT NULL,
  `IDSAISON` smallint(6) NOT NULL,
  `COMMENTAIREV` text,
  `CONTREVISITE` tinyint(4) DEFAULT NULL,
  `NBETOILEPLUS` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`IDVISITE`),
  KEY `I_FK_VISITE_INSPECTEUR` (`IDINSPECTEUR`),
  KEY `I_FK_VISITE_HEBERGEMENT` (`IDHEBERGEMENT`),
  KEY `IDSAISON` (`IDSAISON`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `visite`
--

INSERT INTO `visite` (`IDVISITE`, `IDINSPECTEUR`, `IDHEBERGEMENT`, `IDSAISON`, `COMMENTAIREV`, `CONTREVISITE`, `NBETOILEPLUS`) VALUES
(1, 1, 1, 3, 'Superbe établissement. Bien aux normes.', 0, 1),
(2, 2, 1, 1, 'Canalisations à revoir.', 1, 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `attribuer`
--
ALTER TABLE `attribuer`
  ADD CONSTRAINT `attribuer_ibfk_1` FOREIGN KEY (`IDHEBERGEMENT`) REFERENCES `camping` (`IDHEBERGEMENT`),
  ADD CONSTRAINT `attribuer_ibfk_2` FOREIGN KEY (`IDEQUIPEMENT`) REFERENCES `equipements` (`IDEQUIPEMENT`);

--
-- Contraintes pour la table `avoir_gerant`
--
ALTER TABLE `avoir_gerant`
  ADD CONSTRAINT `avoir_gerant_ibfk_2` FOREIGN KEY (`IDGERANT`) REFERENCES `gerant` (`IDGERANT`),
  ADD CONSTRAINT `avoir_gerant_ibfk_3` FOREIGN KEY (`IDHEBERGEMENT`) REFERENCES `hebergement` (`IDHEBERGEMENT`);

--
-- Contraintes pour la table `camping`
--
ALTER TABLE `camping`
  ADD CONSTRAINT `camping_ibfk_1` FOREIGN KEY (`IDHEBERGEMENT`) REFERENCES `hebergement` (`IDHEBERGEMENT`);

--
-- Contraintes pour la table `chambre_hotte`
--
ALTER TABLE `chambre_hotte`
  ADD CONSTRAINT `chambre_hotte_ibfk_1` FOREIGN KEY (`IDHEBERGEMENT`) REFERENCES `hebergement` (`IDHEBERGEMENT`);

--
-- Contraintes pour la table `contrevisite`
--
ALTER TABLE `contrevisite`
  ADD CONSTRAINT `contrevisite_ibfk_1` FOREIGN KEY (`IDINSPECTEUR`) REFERENCES `inspecteur` (`IDINSPECTEUR`),
  ADD CONSTRAINT `contrevisite_ibfk_2` FOREIGN KEY (`IDDATEV`) REFERENCES `datev` (`IDDATEV`),
  ADD CONSTRAINT `contrevisite_ibfk_3` FOREIGN KEY (`IDVISITE`) REFERENCES `visite` (`IDVISITE`);

--
-- Contraintes pour la table `datev`
--
ALTER TABLE `datev`
  ADD CONSTRAINT `datev_ibfk_1` FOREIGN KEY (`IDSAISON`) REFERENCES `saison` (`IDSAISON`);

--
-- Contraintes pour la table `gerant`
--
ALTER TABLE `gerant`
  ADD CONSTRAINT `gerant_ibfk_1` FOREIGN KEY (`IDGERANT`) REFERENCES `hebergement` (`IDHEBERGEMENT`);

--
-- Contraintes pour la table `hebergement`
--
ALTER TABLE `hebergement`
  ADD CONSTRAINT `hebergement_ibfk_1` FOREIGN KEY (`IDSPECIALITEH`) REFERENCES `specialite` (`IDSPECIALITE`),
  ADD CONSTRAINT `hebergement_ibfk_2` FOREIGN KEY (`IDDEPARTEMENT`) REFERENCES `departement` (`IDDEPARTEMENT`);

--
-- Contraintes pour la table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `historique_ibfk_2` FOREIGN KEY (`IDSAISON`) REFERENCES `saison` (`IDSAISON`),
  ADD CONSTRAINT `historique_ibfk_3` FOREIGN KEY (`IDHEBERGEMENT`) REFERENCES `hebergement` (`IDHEBERGEMENT`);

--
-- Contraintes pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`IDHEBERGEMENT`) REFERENCES `hebergement` (`IDHEBERGEMENT`);

--
-- Contraintes pour la table `inspecteur`
--
ALTER TABLE `inspecteur`
  ADD CONSTRAINT `inspecteur_ibfk_1` FOREIGN KEY (`IDSPECIALITEI`) REFERENCES `specialite` (`IDSPECIALITE`);

--
-- Contraintes pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`IDHEBERGEMENT`) REFERENCES `hotel` (`IDHEBERGEMENT`),
  ADD CONSTRAINT `restaurant_ibfk_2` FOREIGN KEY (`IDTC`) REFERENCES `type_cuisine` (`IDTC`);

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `visite_ibfk_1` FOREIGN KEY (`IDINSPECTEUR`) REFERENCES `inspecteur` (`IDINSPECTEUR`),
  ADD CONSTRAINT `visite_ibfk_4` FOREIGN KEY (`IDHEBERGEMENT`) REFERENCES `hebergement` (`IDHEBERGEMENT`),
  ADD CONSTRAINT `visite_ibfk_5` FOREIGN KEY (`IDSAISON`) REFERENCES `saison` (`IDSAISON`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
