-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: 10.246.16.210:3306
-- Generation Time: Aug 16, 2015 at 06:12 AM
-- Server version: 5.5.44-MariaDB-1~wheezy
-- PHP Version: 5.3.3-7+squeeze15

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
-- Table structure for table `blogTitles`
--

CREATE TABLE IF NOT EXISTS `blogTitles` (
  `name` varchar(145) NOT NULL,
  `blogpath` varchar(145) NOT NULL,
  `tagType_1` int(11) NOT NULL DEFAULT '0',
  `tagType_2` int(11) DEFAULT NULL,
  `tagType_3` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `tagType_2` (`tagType_2`),
  KEY `tagType_1` (`tagType_1`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogTitles`
--

INSERT INTO `blogTitles` (`name`, `blogpath`, `tagType_1`, `tagType_2`, `tagType_3`) VALUES
('Basic Cryptography', '/blogs/Kryptografi/', 1, 2, NULL),
('Half-Life Dedicated Linux Server - Howto', '/blogs/Linux/', 2, 11, NULL),
('Linux Firewalls', '/blogs/Linux/', 2, 4, NULL),
('Netmap, Netcat, Nmap, Netstat and TCPDump', '/blogs/Linux/', 2, 6, 4),
('Router Setup - Howto', '/blogs/Linux/', 2, 3, 12),
('Sed, Cut and Awk', '/blogs/Linux/', 2, 6, NULL),
('Software RAID - Howto', '/blogs/Linux/', 2, 12, NULL),
('Active Directory Forests and Domains', '/blogs/Microsoft/', 5, NULL, NULL),
('List of Windows Tools and Commands', '/blogs/Microsoft/', 6, 7, NULL),
('SQL 2008 Discovering Database Deadlocks', '/blogs/Microsoft/', 8, 12, NULL),
('SQL 2008 Policy Based Management', '/blogs/Microsoft/', 8, NULL, NULL),
('SQL 2008 Troubleshooting and Diagnosing Service Failures', '/blogs/Microsoft/', 8, 12, NULL),
('SQL Joins', '/blogs/Scripts/', 9, NULL, NULL),
('Syntax Comparisons', '/blogs/Scripts/', 9, NULL, NULL),
('DoS Attacks', '/blogs/Sikkerhet/', 4, NULL, NULL),
('Local Network Security Actions', '/blogs/Sikkerhet/', 4, NULL, NULL),
('Configuring and Checking HA Slot Size', '/blogs/VMWare/', 10, 12, NULL),
('Monitoring Virtual Machine Performance', '/blogs/VMWare/', 10, 12, NULL),
('How to Setup BDscan', '/blogs/Linux/', 2, 12, 7),
('How to convert IMG to ISO', '/blogs/Linux/', 2, 12, 6),
('NXServer Notes', '/blogs/Linux/', 2, NULL, NULL),
('How to Clean up a Windows System Drive', '/blogs/Microsoft/', 6, 7, 12),
('Mapping of local printers on Windows terminal servers through Citrix', '/blogs/Microsoft/', 13, NULL, NULL),
('Deep Security Virtual Patching', '/blogs/VMWare/', 10, 12, 4),
('SQL 2008 How to trunc a log file', '/blogs/Scripts/', 8, 9, 12),
('SQL Select Limiting', '/blogs/Scripts/', 9, NULL, NULL),
('Expand logical volume - LVM', '/blogs/Linux/', 2, 12, 6),
('How to shrink a disk', '/blogs/VMWare/', 10, 12, NULL),
('SQL 2008 Useful TSQL queries', '/blogs/Microsoft/', 8, 9, NULL),
('SQL 2008 How to reset lost SA account password', '/blogs/Microsoft/', 8, 12, NULL),
('General links on Raw Device mapping(RDM)', '/blogs/VMWare/', 10, NULL, NULL),
('Active Directory Trust Relationships', '/blogs/Microsoft/', 5, 12, NULL),
('Upsert against MongoDB with PowerShell', '/blogs/Scripts/', 9, 12, NULL),
('Change and verify the NTP client in Windows', '/blogs/Microsoft/', 7, 6, 12),
('SQL 2008 Performing an SQL Server Performance Trace', '/blogs/Microsoft/', 9, 8, NULL),
('How to write C# code against UCS Central', '/blogs/Scripts/', 9, 7, 12),
('JavaScript Essentials', '/blogs/Scripts/', 9, NULL, NULL),
('make targets - an overview', '/blogs/Linux/', 2, 6, NULL),
('Report last logged in users on VDI', '/blogs/VMWare/', 10, 9, 12),
('Getting started with Hyper-V for the VMWare Admin', '/blogs/Hyper-V/', 14, 12, 9),
('Copying Windows 7 to a new drive, using Linux', '/blogs/Linux/', 2, 7, 12),
('Centos 7 Template checklist for SCVMM 2012R2', '/blogs/Hyper-V/', 2, 14, 12);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short` varchar(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `languages` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `short`, `name`) VALUES
(1, 'en', 'English'),
(2, 'no', 'Norwegian'),
(3, 'is', 'Icelandic');

-- --------------------------------------------------------

--
-- Table structure for table `tagTypes`
--

CREATE TABLE IF NOT EXISTS `tagTypes` (
  `tagTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  PRIMARY KEY (`tagTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

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
(14, 'Hyper-V');

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
