-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 13 nov. 2024 à 15:00
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `centre_formation`
--
DROP DATABASE IF EXISTS `centre_formation`;

CREATE DATABASE `centre_formation`;

USE `centre_formation`;

-- --------------------------------------------------------

--
-- Structure de la table `Appartenance`
--

CREATE TABLE `Appartenance` (
  `codeSpec` int(11) NOT NULL,
  `codeForm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Etudiant`
--

CREATE TABLE `Etudiant` (
  `NumCINetu` int(11) NOT NULL,
  `NomEtu` varchar(50) DEFAULT NULL,
  `prenomEtu` varchar(50) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `adresseEtu` varchar(100) DEFAULT NULL,
  `villeEtu` varchar(50) DEFAULT NULL,
  `niveauEtu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Formation`
--

CREATE TABLE `Formation` (
  `codeForm` int(11) NOT NULL,
  `titreForm` varchar(100) DEFAULT NULL,
  `dureeForm` double DEFAULT NULL,
  `prixForm` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Inscription`
--

CREATE TABLE `Inscription` (
  `NumCINEtu` int(11) NOT NULL,
  `codeSess` int(11) NOT NULL,
  `typeCours` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Session`
--

CREATE TABLE `Session` (
  `codeSess` int(11) NOT NULL,
  `nomSess` varchar(50) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL CHECK (`dateFin` > `dateDebut`),
  `codeForm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Specialite`
--

CREATE TABLE `Specialite` (
  `codeSpec` int(11) NOT NULL,
  `nomSpec` varchar(50) DEFAULT NULL,
  `desSpec` varchar(200) DEFAULT NULL,
  `active` int(11) DEFAULT 1 CHECK (`active` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Appartenance`
--
ALTER TABLE `Appartenance`
  ADD PRIMARY KEY (`codeSpec`,`codeForm`),
  ADD KEY `codeForm` (`codeForm`);

--
-- Index pour la table `Etudiant`
--
ALTER TABLE `Etudiant`
  ADD PRIMARY KEY (`NumCINetu`);

--
-- Index pour la table `Formation`
--
ALTER TABLE `Formation`
  ADD PRIMARY KEY (`codeForm`);

--
-- Index pour la table `Inscription`
--
ALTER TABLE `Inscription`
  ADD PRIMARY KEY (`NumCINEtu`,`codeSess`),
  ADD KEY `codeSess` (`codeSess`);

--
-- Index pour la table `Session`
--
ALTER TABLE `Session`
  ADD PRIMARY KEY (`codeSess`),
  ADD KEY `fk_sess_for` (`codeForm`);

--
-- Index pour la table `Specialite`
--
ALTER TABLE `Specialite`
  ADD PRIMARY KEY (`codeSpec`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Etudiant`
--
ALTER TABLE `Etudiant`
  MODIFY `NumCINetu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Formation`
--
ALTER TABLE `Formation`
  MODIFY `codeForm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Session`
--
ALTER TABLE `Session`
  MODIFY `codeSess` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Specialite`
--
ALTER TABLE `Specialite`
  MODIFY `codeSpec` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Appartenance`
--
ALTER TABLE `Appartenance`
  ADD CONSTRAINT `appartenance_ibfk_1` FOREIGN KEY (`codeSpec`) REFERENCES `Specialite` (`codeSpec`),
  ADD CONSTRAINT `appartenance_ibfk_2` FOREIGN KEY (`codeForm`) REFERENCES `Formation` (`codeForm`);

--
-- Contraintes pour la table `Inscription`
--
ALTER TABLE `Inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`NumCINEtu`) REFERENCES `Etudiant` (`NumCINetu`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`codeSess`) REFERENCES `Session` (`codeSess`);

--
-- Contraintes pour la table `Session`
--
ALTER TABLE `Session`
  ADD CONSTRAINT `fk_sess_for` FOREIGN KEY (`codeForm`) REFERENCES `Formation` (`codeForm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
