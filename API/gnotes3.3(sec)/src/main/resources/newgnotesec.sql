-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 03 mai 2025 à 17:49
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `newgnotesec`
--

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `mat_id` int NOT NULL AUTO_INCREMENT,
  `mat_libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`mat_id`, `mat_libelle`) VALUES
(17, 'Mathématiques'),
(18, 'Physique'),
(19, 'Informatique'),
(20, 'Anglais'),
(21, 'Cybersécurité'),
(22, 'Électronique'),
(23, 'Algorithmique'),
(24, 'Réseaux'),
(25, 'Développement Web'),
(26, 'Systèmes d’exploitation');

-- --------------------------------------------------------

--
-- Structure de la table `matiere_association`
--

DROP TABLE IF EXISTS `matiere_association`;
CREATE TABLE IF NOT EXISTS `matiere_association` (
  `mat_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`mat_id`,`user_id`),
  KEY `FKprybq444hholl3nnhvjj19tu9` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id_enseignant` int DEFAULT NULL,
  `user_id_eleve` int DEFAULT NULL,
  `mat_id` int DEFAULT NULL,
  `note_coef` decimal(38,2) DEFAULT NULL,
  `note_data` decimal(38,2) DEFAULT NULL,
  `note_type_id` int DEFAULT NULL,
  `note_commentaire` varchar(255) DEFAULT NULL,
  `note_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_id_enseignant_idx` (`user_id_enseignant`),
  KEY `FK_user_id_eleve_idx` (`user_id_eleve`),
  KEY `FK_user_mat_id_idx` (`mat_id`),
  KEY `FK_note_note_type_id_idx` (`note_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id`, `user_id_enseignant`, `user_id_eleve`, `mat_id`, `note_coef`, `note_data`, `note_type_id`, `note_commentaire`, `note_date`) VALUES
(27, 17, 35, 18, '4.00', '14.00', 2, 'Travail propre et bien structuré, les concepts sont maîtrisés.', '2025-05-17'),
(28, 18, 38, 23, '1.00', '15.00', 1, 'Projet fonctionnel et bien présenté, l’architecture du code est claire.', '2025-05-22'),
(29, 21, 41, 24, '2.00', '13.00', 1, 'Bonne maîtrise du sujet, les résultats sont cohérents et bien interprétés.', '2025-05-06'),
(30, 17, 42, 18, '1.00', '16.00', 1, 'Travail propre et bien structuré', '2025-04-28'),
(31, 21, 43, 24, '3.00', '8.00', 3, 'insuffisant ', '2025-05-08');

-- --------------------------------------------------------

--
-- Structure de la table `note_type`
--

DROP TABLE IF EXISTS `note_type`;
CREATE TABLE IF NOT EXISTS `note_type` (
  `note_type_id` int NOT NULL,
  `note_type_libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`note_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `note_type`
--

INSERT INTO `note_type` (`note_type_id`, `note_type_libelle`) VALUES
(1, 'Contrôle'),
(2, 'Examen final'),
(3, 'Devoir maison');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int NOT NULL,
  `role_libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`role_id`, `role_libelle`) VALUES
(1, 'ADMIN'),
(2, 'ENSEIGNANT'),
(3, 'ETUDIANT');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_nom` varchar(255) DEFAULT NULL,
  `user_prenom` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `user_mail` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_adresse` varchar(255) DEFAULT NULL,
  `user_tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_role_role_id_idx` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `user_nom`, `user_prenom`, `role_id`, `user_mail`, `password`, `user_adresse`, `user_tel`) VALUES
(16, 'Durand', 'Claire', 2, 'claire.durand@ecole.fr', '$2a$12$sa6xARurlsew6R6I4N0VKOz7mDK5ZBKQbCY7jVPxwPnINFgXcZtxm', '123 Rue des Sciences', '0123456790'),
(17, 'Martin', 'Jean', 2, 'jean.martin@ecole.fr', '$2a$12$sa6xARurlsew6R6I4N0VKOz7mDK5ZBKQbCY7jVPxwPnINFgXcZtxm', '89 Boulevard Universitaire', '0123456791'),
(18, 'Nguyen', 'Linh', 2, 'linh.nguyen@ecole.fr', '$2a$12$sa6xARurlsew6R6I4N0VKOz7mDK5ZBKQbCY7jVPxwPnINFgXcZtxm', '12 Impasse des Connaissances', '0123456792'),
(21, 'Petit', 'Julie', 2, 'julie.petit@ecole.fr', '$2a$12$sa6xARurlsew6R6I4N0VKOz7mDK5ZBKQbCY7jVPxwPnINFgXcZtxm', '34 Cité Pédagogique', '0123456795'),
(35, 'Dubois', 'Lucas', 3, 'lucas.dubois@ecole.fr', '$2a$12$sa6xARurlsew6R6I4N0VKOz7mDK5ZBKQbCY7jVPxwPnINFgXcZtxm', '10 Rue des Élèves', '0612345001'),
(38, 'Lopez', 'Inès', 3, 'ines.lopez@ecole.fr', '$2a$12$sa6xARurlsew6R6I4N0VKOz7mDK5ZBKQbCY7jVPxwPnINFgXcZtxm', '13 Avenue du Savoir', '0612345004'),
(41, 'Leclerc', 'Enzo', 3, 'enzo.leclerc@ecole.fr', '$2a$12$sa6xARurlsew6R6I4N0VKOz7mDK5ZBKQbCY7jVPxwPnINFgXcZtxm', '16 Cité des Apprentis', '0612345007'),
(42, 'Benoit', 'Léa', 3, 'lea.benoit@ecole.fr', '$2a$12$sa6xARurlsew6R6I4N0VKOz7mDK5ZBKQbCY7jVPxwPnINFgXcZtxm', '17 Rue des Révisions', '0612345008'),
(43, 'Marchand', 'Axel', 3, 'axel.marchand@ecole.fr', '$2a$12$sa6xARurlsew6R6I4N0VKOz7mDK5ZBKQbCY7jVPxwPnINFgXcZtxm', '18 Boulevard des Études', '0612345009'),
(45, 'Davison', 'Evan', 1, 'evan@admin.fr', '$2a$12$ifsWZ1Kho2N4vM0qNjnMq.QVlJViL0OCyvetQsHXU5s5XLvzTMdzu', 'par ici', '0614158475'),-- EvanSecure@2025
(46, 'Davison', 'Evan', 2, 'evan@prof.fr', '$2a$12$xw/jWTeSz/ywgUk.6b2m.e.y5GOi7Gt9YqZCxg4cW.tNgCtZpTFXm', 'ici', '0514980651'); -- Evanprof@2025

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `matiere_association`
--
ALTER TABLE `matiere_association`
  ADD CONSTRAINT `FKm0vq49eq4i02ottgxw89ry6t2` FOREIGN KEY (`mat_id`) REFERENCES `matiere` (`mat_id`),
  ADD CONSTRAINT `FKprybq444hholl3nnhvjj19tu9` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FK_note_id_enseignant` FOREIGN KEY (`user_id_enseignant`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FK_note_mat_id` FOREIGN KEY (`mat_id`) REFERENCES `matiere` (`mat_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_note_note_type_id` FOREIGN KEY (`note_type_id`) REFERENCES `note_type` (`note_type_id`),
  ADD CONSTRAINT `FKqs4t3nygcpmpbtqj8ivq2tbtj` FOREIGN KEY (`user_id_eleve`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
