-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 26 Mars 2025 à 19:15
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `findyourcourt`
--

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `idreservation` int(11) NOT NULL AUTO_INCREMENT,
  `idutilisateur` int(11) NOT NULL,
  `idterrain` int(11) NOT NULL,
  `horaire` varchar(255) NOT NULL,
  `date_reservation` date NOT NULL,
  PRIMARY KEY (`idreservation`),
  KEY `idutilisateur` (`idutilisateur`),
  KEY `idterrain` (`idterrain`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`idreservation`, `idutilisateur`, `idterrain`, `horaire`, `date_reservation`) VALUES
(1, 1, 19, '12:00 - 13:00', '0000-00-00'),
(2, 1, 25, '11:00 - 12:00', '0000-00-00'),
(3, 6, 19, '12:00 - 13:00', '0000-00-00'),
(5, 8, 19, '12:00 - 13:00', '0000-00-00'),
(6, 9, 19, '12:00 - 13:00', '0000-00-00'),
(7, 10, 19, '12:00 - 13:00', '0000-00-00'),
(8, 11, 19, '12:00 - 13:00', '0000-00-00'),
(11, 13, 29, '12:00 - 14:00', '2025-03-20');

-- --------------------------------------------------------

--
-- Structure de la table `terrain`
--

CREATE TABLE IF NOT EXISTS `terrain` (
  `idterrain` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idterrain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `terrain`
--

INSERT INTO `terrain` (`idterrain`, `nom`, `adresse`, `type`, `prix`) VALUES
(1, 'Terrain Quai des sportifs', '12 Quai des sportifs, Issy-les-Moulineaux', 'Football', '20.00'),
(2, 'Stade des Quatre Saisons', '39 Boulevard des Marronniers, Issy-les-Moulineaux', 'Football', '25.00'),
(3, 'Stade Etoile d''Issy', '88 Avenue des Champions, Issy-les-Moulineaux', 'Football', '30.00'),
(4, 'Le Play Horizon', '42 rue du General Leclerc, Issy-les-Moulineaux', 'Basket', '20.00'),
(5, 'Le Parquet Etoile', '23 avenue Victor Cresson, Issy-les-Moulineaux', 'Basket', '25.00'),
(6, 'Le All Star', '15 rue Diderot, Issy-les-Moulineaux', 'Basket', '30.00'),
(7, 'Les Filets d''Azur', '2 bis rue Hoche, Issy-les-Moulineaux', 'Tennis', '20.00'),
(8, 'Le Court Emeraude', '17 rue du Capitaine Ferber, Issy-les-Moulineaux', 'Tennis', '25.00'),
(9, 'Le Smash Club', '5 rue Rouget de Lisle, Issy-les-Moulineaux', 'Tennis', '30.00'),
(10, 'Terrain des Buclos', '2 rue Carnot, Issy-Les-Moulineaux', 'Handball', '20.00'),
(11, 'Terrain Reynies Bayard', '25 rue Monge, Issy-Les-Moulineaux', 'Handball', '25.00'),
(12, 'Terrain La Palestre', '17 rue Antoine Courbarien, Issy-Les-Moulineaux', 'Handball', '30.00'),
(13, 'Terrain Ferdinand Buisson', '2 rue Carnot, Issy-Les-Moulineaux', 'Volleyball', '20.00'),
(14, 'Terrain Pablo Picasso', '25 rue Monge, Issy-Les-Moulineaux', 'Volleyball', '25.00'),
(15, 'Terrain Colette Besson', '17 rue Antoine Courbarien, Issy-Les-Moulineaux', 'Volleyball', '30.00'),
(16, 'Golf des Alizes', '15 Rue des Vents, Issy-les-Moulineaux', 'Golf', '50.00'),
(17, 'Golf de la Riviere Verte', '21 Quai des Rivieres, Issy-les-Moulineaux', 'Golf', '60.00'),
(18, 'Golf des Cedres', '32 Avenue des Cedres, Issy-les-Moulineaux', 'Golf', '70.00'),
(19, 'Le Smash Dome', '4 rue du General Leclerc, Issy-les-Moulineaux', 'Badminton', '20.00'),
(20, 'Les Plumes Volantes', '11 rue Maurice Champeau, Issy-les-Moulineaux', 'Badminton', '25.00'),
(21, 'Le Shuttle Club', '14 rue Eliane Jeannin-Garreau, Issy-les-Moulineaux', 'Badminton', '30.00'),
(22, 'Le Cage Paddle', '23 rue Ernest Renan, Issy-les-Moulineaux', 'Padel', '20.00'),
(23, 'Le Rebond Arena', '16 rue de l''Abbe Derry, Issy-les-Moulineaux', 'Padel', '25.00'),
(24, 'La Volea Club', '7 rue de l''Abbe Derry, Issy-les-Moulineaux', 'Padel', '30.00'),
(25, 'Square Théodore-Monod', '23 Rue du Fer à Moulin, Issy-les-Moulineaux', 'Ping-Pong', '20.00'),
(26, 'Square Henri Cadiou', 'Square Henri Cadiou, Issy-les-Moulineaux', 'Ping-Pong', '25.00'),
(27, 'Square René Le Gall', 'Square René Le Gall, Issy-les-Moulineaux', 'Ping-Pong', '30.00'),
(28, 'Terrain Rose', '170 Quai de Stalingrad, Issy-les-Moulineaux', 'Rugby', '20.00'),
(29, 'Terrain Alexandrie', '52 Quai du Président Roosevelt, Issy-les-Moulineaux', 'Rugby', '25.00'),
(30, 'Terrain Pigalle', '20 Avenue de Verdun, Issy-les-Moulineaux', 'Rugby', '30.00');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idutilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `niveau` varchar(50) NOT NULL,
  `poste` varchar(50) NOT NULL,
  PRIMARY KEY (`idutilisateur`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `prenom`, `nom`, `email`, `adresse`, `date_naissance`, `telephone`, `pseudo`, `mot_de_passe`, `niveau`, `poste`) VALUES
(1, 'Ange Nolwen', 'DJUISSI KENMOE', 'angenolwen@mil.com', 'hjkkljhg', '2025-01-09', '0656976451', 'Nolwen', '$2y$10$G24wNt4GRJHJCtiHa20TPOTqkUU9CBGpMVt5oVqqHEpeDSHdUePAq', 'proo', 'pro'),
(2, 'toto', 'rere', 'azerty@p.COM', 'fffj', '2025-01-06', '0670452686', 'Noli', '$2y$10$OKz72VFqWMF8eTVoIH32GeSAzl/aoBmXhEXDCH.JhG9c5ZS9Vz2ge', 'proo', 'gardien'),
(5, 'iNNA', 'ana', 'azerty@p.CO', 'fffj', '2025-01-06', '0670452686', 'Nol', '$2y$10$XptDs9Ex4UaeFcfpZr6DrOin3nORfzN88VjRL9uN834ps/gETe3yy', 'proo', 'gardien'),
(6, 'Victor', 'POUSSIER', 'victor@example.com', '1 rue Victor, Paris', '1990-05-15', '0601020304', 'victor', 'motdepassehashed', 'débutant', 'joueur'),
(8, 'Clotilde', 'GUINAULT', 'clotilde@example.com', '3 rue des Fleurs, Paris', '1992-02-17', '0689080706', 'clotilde', 'motdepassehashed', 'avancé', 'joueur'),
(9, 'Ivan', 'SIMO', 'ivan@example.com', '4 rue de la Lune, Paris', '1989-11-11', '0622345678', 'ivan', 'motdepassehashed', 'intermédiaire', 'joueur'),
(10, 'Jamil', 'OBAME', 'jamil@example.com', '5 rue du Soleil, Paris', '1993-07-25', '0612345678', 'jamil', 'motdepassehashed', 'débutant', 'joueur'),
(11, 'Raphael', 'NOBLE', 'raphael@example.com', '6 rue des Acacias, Paris', '1990-12-05', '0634567890', 'raphael', 'motdepassehashed', 'avancé', 'joueur'),
(13, 'Ange Nolwen', 'DJUISSI KENMOE', 'Ange@gmail.cm', '20-20 BIS RUE DU COLONEL PIERRE AVIA', '2025-03-10', '0670452686', 'Ang', '$2y$10$2AjLMFi1EfgGt/7CRCuPyeRI8AH2F0qHSgsYALojrd7IFSZIE7Yja', 'pro', 'pro');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`idterrain`) REFERENCES `terrain` (`idterrain`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
