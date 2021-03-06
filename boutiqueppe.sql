-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 avr. 2022 à 15:32
-- Version du serveur : 8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boutiqueppe`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(500) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nomCategorie`) VALUES
(1, 'Jeux vidéo & consoles'),
(2, 'Informatique & bureau'),
(3, 'Livres'),
(4, 'Musique, DVD & Blu-ray');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(500) NOT NULL,
  `prenomClient` varchar(500) NOT NULL,
  `emailClient` varchar(500) NOT NULL,
  `motDePasseClient` varchar(1000) NOT NULL,
  `rueClient` varchar(1000) NOT NULL,
  `cpClient` varchar(10) NOT NULL,
  `villeClient` varchar(500) NOT NULL,
  `telClient` varchar(10) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `prenomClient`, `emailClient`, `motDePasseClient`, `rueClient`, `cpClient`, `villeClient`, `telClient`, `admin`) VALUES
(3, 'Lucas', 'Chevalot', 'lucas.chevalot@gmail.com', '$2y$10$qJZGoizlRObBHtcfHlNztOwjSumUsSqmJYAf.bKqIWzCq6W7VVp6C', '15 rue du gué', '55000', 'Bar le duc', '0648789090', 0),
(4, 'Bourgoin', 'Arnaud', 'arnaud.bourgoin@outlook.com', '$2y$10$yFTJgyRhc2urHJYc/dOGOu3E3PjQNJNKSj/cE8VToGH4Z1RgSFdwi', '54 quai victor hugo', '55000', 'Bar-Le-Duc', '', 1),
(5, 'Test', 'test2', 'test@orange.com', '$2y$10$s5eNzrcAKpiiLJojpW5kC.zXatCF3mQ0gRqPVdHBPokX6HtWntF1G', '6 rue des test', '84567', 'Testville', '', 0),
(6, 'Duck', 'Donal', 'donald.duck@gmail.com', '$2y$10$3zqAnamEkOuj3JR6FKf0RuMQYsAVtvp.oIwDJwh8Vq/eZ8wbFyZUy', '54 quai victor hugo', '55000', 'Bar-Le-Duc', '', 0),
(7, 'admin', 'root', 'admin@gmail.com', '$2y$10$Cw9nCz1x7h3DDlUF1jCmWejPXwClbP2sryJ9uSipUEn/CNZ/d2BbO', '6 rue des test', '98563', 'Root', '', 1),
(8, 'Divine', 'Tom', 'tom.divine@gmail.com', 'azerty', '56 rue des fou', '95862', 'Nancy', NULL, 0),
(25, 'Divine', 'Tom', 'tom.divine@gmail.com', 'azerty', '56 rue des fou', '95862', 'Nancy', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `numeroCommande` int NOT NULL AUTO_INCREMENT,
  `dateCommande` date NOT NULL,
  `idClient` int NOT NULL,
  PRIMARY KEY (`numeroCommande`),
  KEY `commande_client_FK` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`numeroCommande`, `dateCommande`, `idClient`) VALUES
(15, '2020-11-13', 3),
(16, '2020-11-13', 3),
(17, '2020-11-13', 3),
(18, '2022-03-30', 7);

-- --------------------------------------------------------

--
-- Structure de la table `commander`
--

DROP TABLE IF EXISTS `commander`;
CREATE TABLE IF NOT EXISTS `commander` (
  `numeroCommande` int NOT NULL,
  `codeProduit` int NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`numeroCommande`,`codeProduit`),
  KEY `commander_produit0_FK` (`codeProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commander`
--

INSERT INTO `commander` (`numeroCommande`, `codeProduit`, `quantite`) VALUES
(15, 7, 1),
(15, 8, 2),
(16, 9, 1),
(16, 10, 1),
(17, 4, 2),
(18, 8, 5);

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

DROP TABLE IF EXISTS `devis`;
CREATE TABLE IF NOT EXISTS `devis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProduit` int NOT NULL,
  `idClient` int NOT NULL,
  `tarif` int DEFAULT NULL,
  `commentaire` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `etat` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1` (`idClient`),
  KEY `FK2` (`idProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `devis`
--

INSERT INTO `devis` (`id`, `idProduit`, `idClient`, `tarif`, `commentaire`, `etat`) VALUES
(3, 7, 4, 25, 'Voici la réponse à votre devis', 1),
(4, 5, 4, NULL, NULL, 0),
(5, 11, 5, 125, 'dsqdqsdqsd', 1),
(6, 7, 5, 146, 'azerffqfsfq', 1),
(7, 7, 6, NULL, NULL, 0),
(8, 1, 6, NULL, NULL, 0),
(9, 9, 6, NULL, NULL, 0),
(10, 11, 6, 185, 'C\'est cadeau !', 1),
(12, 3, 6, NULL, NULL, 0),
(14, 5, 6, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

DROP TABLE IF EXISTS `photos`;
CREATE TABLE IF NOT EXISTS `photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imgProd` varchar(50) DEFAULT NULL,
  `idProduit` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK__produit` (`idProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `photos`
--

INSERT INTO `photos` (`id`, `imgProd`, `idProduit`) VALUES
(2, '514fHMab5eL._SX316_BO1,204,203,200_.jpg', 1),
(3, '71aaz7oUpBL._AC._SR360,460.jpg', 1),
(4, '619v-GUF7tL._AC._SR360,460.jpg', 7),
(5, '91JA5-hAnoL._AC_SL1500_.jpg', 7),
(6, '41RD5yQSrOL._SY291_BO1,204,203,200_QL40_ML2_.jpg', 2),
(7, '41Z9OLWVIQL._SX303_BO1,204,203,200_.jpg', 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `codeProduit` int NOT NULL AUTO_INCREMENT,
  `designationProduit` varchar(500) NOT NULL,
  `prixProduit` decimal(10,2) NOT NULL,
  `stockProduit` int NOT NULL,
  `photoProduit` varchar(1000) NOT NULL,
  `idCategorie` int NOT NULL,
  `typeProduit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`codeProduit`),
  KEY `produit_categorie_FK` (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`codeProduit`, `designationProduit`, `prixProduit`, `stockProduit`, `photoProduit`, `idCategorie`, `typeProduit`) VALUES
(1, 'Skidamarink (Guillaume Musso)', '19.90', 45, '71aaz7oUpBL._AC._SR360,460.jpg', 3, 'Devis'),
(2, 'Le Crépuscule et l\'Aube (Ken FOLLETT)', '24.50', 35, '514fHMab5eL._SX316_BO1,204,203,200_.jpg', 3, 'Fixe'),
(3, 'D\'un monde à l\'autre: Le temps des consciences (de Frédéric Lenoir, Nicolas Hulot)', '21.50', 64, '41vbzQVGIOL._SX311_BO1,204,203,200_.jpg', 3, 'Devis'),
(4, 'SanDisk Carte Mémoire MicroSDHC Ultra 128 Go + Adaptateur SD Classe 10, U1, Homologuée A1', '30.39', 195, '617NtexaW2L._AC_SL1500_.jpg', 2, 'Fixe'),
(5, 'Logitech Webcam C920 HD Pro, Appels et Enregistrements Vidéo Full HD 1080p, Gaming Stream, Deux Microphones, Petite, Agile, Réglable, Noir', '109.00', 32, '51r+t90LYxL._AC_SL1023_.jpg', 2, 'Devis'),
(6, 'Samsung SSD Interne 860 EVO 2.5\" (500 Go) - MZ-76E500B/EU', '70.12', 254, '91JA5-hAnoL._AC_SL1500_.jpg', 2, 'Fixe'),
(7, 'Corsair HS35 Casque de Gaming Stéréo', '43.65', 20, '619v-GUF7tL._AC._SR360,460.jpg', 1, 'Devis'),
(8, 'Razer Wolverine Ultimate for Xbox One - Manette de Jeu pour Xbox One ', '179.99', 230, '618f9UKaVmL._AC._SR360,460.jpg', 1, 'Fixe'),
(9, 'Sign O’ The Times-Deluxe Edition 3CD', '19.99', 15, 'A1bbWtAHUtL._AC._SR360,460.jpg', 4, 'Devis'),
(10, 'Batman - The Dark Knight, le Chevalier Noir - 4K Ultra HD', '20.00', 164, '81jSFtA8LOL._AC._SR360,460.jpg', 4, 'Fixe'),
(11, 'Game Of Thrones (Le Trône de Fer) - Saison 8', '39.99', 98, '71-we6++h2L._AC._SR360,460.jpg', 4, 'Devis');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_client_FK` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `commander`
--
ALTER TABLE `commander`
  ADD CONSTRAINT `commander_commande_FK` FOREIGN KEY (`numeroCommande`) REFERENCES `commande` (`numeroCommande`),
  ADD CONSTRAINT `commander_produit0_FK` FOREIGN KEY (`codeProduit`) REFERENCES `produit` (`codeProduit`);

--
-- Contraintes pour la table `devis`
--
ALTER TABLE `devis`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`codeProduit`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `FK__produit` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`codeProduit`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_categorie_FK` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
