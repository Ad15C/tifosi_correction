-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 24 jan. 2025 à 14:27
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tifosi_db`
--
CREATE DATABASE IF NOT EXISTS `tifosi_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tifosi_db`;

CREATE USER 'TIFOSI'@'localhost' IDENTIFIED BY 'Tifosi_psswrd';
GRANT ALL PRIVILEGES ON tifosi_db.* TO 'TIFOSI'@'localhost';
FLUSH PRIVILEGES;

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
CREATE TABLE IF NOT EXISTS `boisson` (
  `id_boisson` int(11) NOT NULL,
  `nom_boisson` varchar(45) NOT NULL,
  `id_marque` int(11) NOT NULL,
  PRIMARY KEY (`id_boisson`),
  KEY `marque_id` (`id_marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `boisson`:
--   `id_marque`
--       `marque` -> `id_marque`
--

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`id_boisson`, `nom_boisson`, `id_marque`) VALUES
(1, 'Coca cola zero', 1),
(2, 'Coca cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi max zero', 4),
(8, 'Lipton max zero', 4),
(9, 'Lipton peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `cp_client` int(11) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `client`:
--

-- --------------------------------------------------------

--
-- Structure de la table `client_achete`
--

DROP TABLE IF EXISTS `client_achete`;
CREATE TABLE IF NOT EXISTS `client_achete` (
  `id_achat` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_focaccia` int(11) NOT NULL,
  PRIMARY KEY (`id_achat`),
  KEY `id_client` (`id_client`),
  KEY `focaccia_id` (`id_focaccia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `client_achete`:
--   `id_focaccia`
--       `focaccia` -> `id_focaccia`
--   `id_client`
--       `client` -> `id_client`
--

-- --------------------------------------------------------

--
-- Structure de la table `client_paie`
--

DROP TABLE IF EXISTS `client_paie`;
CREATE TABLE IF NOT EXISTS `client_paie` (
  `id_paiement` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `jour` date DEFAULT NULL,
  PRIMARY KEY (`id_paiement`),
  KEY `menu` (`id_menu`),
  KEY `client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `client_paie`:
--   `id_client`
--       `client` -> `id_client`
--   `id_menu`
--       `menu` -> `id_menu`
--

-- --------------------------------------------------------

--
-- Structure de la table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
CREATE TABLE IF NOT EXISTS `focaccia` (
  `id_focaccia` int(11) NOT NULL AUTO_INCREMENT,
  `nom_focaccia` varchar(45) NOT NULL,
  `prix_focaccia` float NOT NULL,
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `focaccia`:
--

--
-- Déchargement des données de la table `focaccia`
--

INSERT INTO `focaccia` (`id_focaccia`, `nom_focaccia`, `prix_focaccia`) VALUES
(1, 'Mozaccia', 9.8),
(2, 'Gorgonzollaccia', 10.8),
(3, 'Raclaccia', 8.9),
(4, 'Emmentalaccia', 9.8),
(5, 'Tradizione', 8.9),
(6, 'Hawaienne', 11.2),
(7, 'Americaine', 10.8),
(8, 'Paysanne', 12.8);

-- --------------------------------------------------------

--
-- Structure de la table `focaccia_comprend`
--

DROP TABLE IF EXISTS `focaccia_comprend`;
CREATE TABLE IF NOT EXISTS `focaccia_comprend` (
  `id_focaccia` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL,
  KEY `id_focaccia` (`id_focaccia`),
  KEY `id_ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `focaccia_comprend`:
--   `id_focaccia`
--       `focaccia` -> `id_focaccia`
--   `id_ingredient`
--       `ingredient` -> `id_ingredient`
--

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `ingredient`:
--

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base tomate'),
(6, 'Base creme'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fume'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id_marque` int(11) NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(45) NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `marque`:
--

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom_marque`) VALUES
(1, 'Coca Cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(45) NOT NULL,
  `prix_menu` float NOT NULL,
  `id_boisson` int(11) NOT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `boisson` (`id_boisson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `menu`:
--   `id_boisson`
--       `boisson` -> `id_boisson`
--

-- --------------------------------------------------------

--
-- Structure de la table `menu_comprend`
--

DROP TABLE IF EXISTS `menu_comprend`;
CREATE TABLE IF NOT EXISTS `menu_comprend` (
  `id_menu` int(11) NOT NULL,
  `id_focaccia` int(11) NOT NULL,
  KEY `focaccia` (`id_focaccia`),
  KEY `menu_id` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `menu_comprend`:
--   `id_focaccia`
--       `focaccia` -> `id_focaccia`
--   `id_menu`
--       `menu` -> `id_menu`
--

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD CONSTRAINT `marque_id` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`);

--
-- Contraintes pour la table `client_achete`
--
ALTER TABLE `client_achete`
  ADD CONSTRAINT `focaccia_id` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `client_paie`
--
ALTER TABLE `client_paie`
  ADD CONSTRAINT `client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Contraintes pour la table `focaccia_comprend`
--
ALTER TABLE `focaccia_comprend`
  ADD CONSTRAINT `id_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `id_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `boisson` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`);

--
-- Contraintes pour la table `menu_comprend`
--
ALTER TABLE `menu_comprend`
  ADD CONSTRAINT `focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `menu_id` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
