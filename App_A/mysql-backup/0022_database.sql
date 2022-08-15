SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `0022_Lab_Exam`;
CREATE DATABASE `0022_Lab_Exam` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `0022_Lab_Exam`;

DROP TABLE IF EXISTS `Hero`;
CREATE TABLE `Hero` (
  `Hero_id` int(8) unsigned NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_thai_520_w2 NOT NULL,
  `Detail` varchar(255) COLLATE utf8mb4_thai_520_w2 NOT NULL,
  `Picture_link` varchar(255) COLLATE utf8mb4_thai_520_w2 NOT NULL,
  PRIMARY KEY (`Hero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_thai_520_w2;

INSERT INTO `Hero` (`Hero_id`, `Name`, `Detail`, `Picture_link`) VALUES
(1,	'Captain America',	'Captain Steven Grant \"Steve\" Rogers is the only living, successful test subject of the Super Soldier Serum developed by Abraham Erskine during World War 2',	'1.png'),
(2,	'Iron Man',	'Anthony \"Tony\" Edward Stark was a billionaire industrialist and inventor.',	'2.png'),
(3,	'Thor Odinson',	'Thor Odinson is the Asgardian God of Thunder',	'3.png'),
(4,	'Dead Pool',	'Wad Winston Wilson is a mercenary. He has superhuman strength',	'4.png');

DROP TABLE IF EXISTS `Hero_in_movie`;
CREATE TABLE `Hero_in_movie` (
  `Hero_id` int(8) unsigned NOT NULL,
  `Movie_id` int(10) unsigned NOT NULL,
  KEY `Hero_id` (`Hero_id`),
  KEY `Movie_id` (`Movie_id`),
  CONSTRAINT `Hero_in_movie_ibfk_1` FOREIGN KEY (`Hero_id`) REFERENCES `Hero` (`Hero_id`),
  CONSTRAINT `Hero_in_movie_ibfk_2` FOREIGN KEY (`Movie_id`) REFERENCES `Movie` (`Movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_thai_520_w2;

INSERT INTO `Hero_in_movie` (`Hero_id`, `Movie_id`) VALUES
(1,	1),
(1,	2),
(1,	3),
(2,	4),
(2,	5),
(2,	2),
(3,	6),
(3,	7),
(3,	2),
(4,	8),
(4,	9);

DROP TABLE IF EXISTS `Movie`;
CREATE TABLE `Movie` (
  `Movie_id` int(10) unsigned NOT NULL,
  `Name` varchar(200) COLLATE utf8mb4_thai_520_w2 NOT NULL,
  `Trailer_link` varchar(255) COLLATE utf8mb4_thai_520_w2 NOT NULL,
  PRIMARY KEY (`Movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_thai_520_w2;

INSERT INTO `Movie` (`Movie_id`, `Name`, `Trailer_link`) VALUES
(1,	'Captain America: The First Avenger',	'https://www.youtube.com/watch?v=JerVrbLldXw'),
(2,	'The Avengers',	'https://www.youtube.com/watch?v=eOrNdBpGMv8'),
(3,	'Captain America: The Winter Soldier',	'https://www.youtube.com/watch?v=7SlILk2WMTI'),
(4,	'Iron Man',	'https://www.youtube.com/watch?v=8ugaeA-nMTc'),
(5,	'Iron Man 2',	'https://www.youtube.com/watch?v=wKtcmiifycU'),
(6,	'Thor',	'https://www.youtube.com/watch?v=JOddp-nlNvQ'),
(7,	'Thor: The Dark World',	'https://www.youtube.com/watch?v=npvJ9FTgZbM'),
(8,	'Deadpool',	'https://www.youtube.com/watch?v=ONHBaC-pfsk'),
(9,	'Deadpool 2: No Good Deed',	'https://www.youtube.com/watch?v=EICnFsgA9D4');

-- 2022-08-14 23:58:59