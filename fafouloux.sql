-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 11 Décembre 2020 à 16:56
-- Version du serveur :  5.7.32-0ubuntu0.18.04.1
-- Version de PHP :  7.2.32-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `fafouloux`
--

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `comment` text COLLATE utf16_unicode_ci,
  `image` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `seats` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `place_id` int(11) NOT NULL,
  `canceled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Contenu de la table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `comment`, `image`, `start_date_time`, `end_date_time`, `seats`, `price`, `place_id`, `canceled`) VALUES
(1, 'Evénément n°1', 'description 1', 'Infos complémentaires 1', '/images/evenement1.jpg', '2020-12-10 18:00:00', '2020-12-10 20:00:00', 20, '15.50', 3, 0),
(2, 'Evénement n°2', 'description 2', 'Info complémentaire 2', '/images/evenement2.jpg', '2020-12-16 11:00:00', '2020-12-16 15:00:00', 15, '12.50', 6, 0),
(3, 'Evénement n° 3', 'description 3', 'Info complémentaire 3', '/images/evenement3.jpg', '2020-12-22 08:00:00', '2020-12-25 10:00:00', 15, '0.00', 6, 0);

-- --------------------------------------------------------

--
-- Structure de la table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `zipcode` char(5) COLLATE utf16_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `default_seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Contenu de la table `places`
--

INSERT INTO `places` (`id`, `name`, `address`, `zipcode`, `city`, `default_seats`) VALUES
(3, 'Salle n°1', '22 rue Philipe Risoli', '88000', 'Epinal', 40),
(4, 'Salle n°2', '14 place Clémenceau', '88150', 'Thaon les Vosges', 70),
(5, 'Salle n°3', '16 rue Jacob Delafont', '88000', 'Epinal', 25),
(6, 'Salle N°4', '6 rue de Golbey', '88000', 'Epinal', 64),
(7, 'Salle n°5', '16  rue de la Prairie enchantée', '88000', 'Epinal', 15);

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf16_unicode_ci NOT NULL,
  `seats` tinyint(4) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `event_id` int(1) NOT NULL DEFAULT '0',
  `transaction_code` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Contenu de la table `tickets`
--

INSERT INTO `tickets` (`id`, `name`, `email`, `phone`, `seats`, `is_paid`, `event_id`, `transaction_code`) VALUES
(21, 'qsdsqd', 'qsdq', 'qsdqsd', 3, 0, 1, 'PENDING'),
(22, 'dsf', 'sdfsdf', 'sdfsdf', 5, 1, 1, 'acrdpvwm'),
(23, 'dsfsdf', 'sdf', 'sdfsd', 4, 1, 3, 'FREE'),
(24, 'sdfs', 'sdfsdf', 'sdfsdfsdf', 4, 1, 3, 'FREE'),
(25, 'sqdsq', 'qsdqs', 'qsd', 3, 1, 1, '2qyez5dr'),
(26, 'sdfsd f s', 'fsdsdf@sdfsdf.fr', '000000', 3, 1, 3, 'FREE'),
(27, 'dgdf dfg dfg', 'dfgdfg@dfgdf.fr', 'dsfsdfsdf', 4, 1, 1, '96yct3af');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_fk0` (`place_id`);

--
-- Index pour la table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_fk0` (`event_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_fk0` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`);

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_fk0` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
