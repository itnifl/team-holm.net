-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: team-holm.net.mysql:3306
-- Generation Time: Dec 28, 2018 at 09:32 AM
-- Server version: 10.1.30-MariaDB-1~xenial
-- PHP Version: 5.4.45-0+deb7u13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `team_holm_net`
--

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(128) NOT NULL,
  `lang` int(11) NOT NULL,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `keyword`, `lang`, `value`) VALUES
(1, 'personalia', 1, 'personalia'),
(2, 'personalia', 2, 'personalia'),
(3, 'personalia', 3, 'ferilskr&#225;'),
(4, 'utdanning', 3, 'mentun'),
(5, 'utdanning', 2, 'utdanning'),
(6, 'utdanning', 1, 'education'),
(7, 'interesser', 1, 'interests'),
(8, 'interesser', 2, 'interesser'),
(9, 'interesser', 3, '&#193;hugam&#225;l'),
(10, 'lenker', 3, 'tenglar'),
(11, 'lenker', 2, 'lenker'),
(12, 'lenker', 1, 'links'),
(13, 'Kryptografi', 1, 'Cryptography'),
(14, 'Sikkerhet', 1, 'Security'),
(15, 'Microsoft', 1, 'Microsoft'),
(16, 'Linux', 1, 'Linux'),
(17, 'Scripts', 1, 'Scripts'),
(18, 'VMWare', 1, 'VMWare'),
(19, 'Hyper-V', 1, 'Hyper-V');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
