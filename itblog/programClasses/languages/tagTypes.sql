-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: team-holm.net.mysql:3306
-- Generation Time: Dec 28, 2018 at 09:33 AM
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
-- Table structure for table `tagTypes`
--

CREATE TABLE IF NOT EXISTS `tagTypes` (
  `tagTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  PRIMARY KEY (`tagTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tagTypes`
--

INSERT INTO `tagTypes` (`tagTypeID`, `name`) VALUES
(1, 'Cryptography'),
(2, 'Linux'),
(3, 'Routers'),
(4, 'Network'),
(5, 'Active Directory'),
(6, 'Commands'),
(7, 'Tools'),
(8, 'SQL 2008'),
(9, 'Scripts'),
(10, 'VMWare'),
(11, 'Games'),
(12, 'HowTo'),
(13, 'Citrix'),
(14, 'Hyper-V'),
(15, 'SQL 2016');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
