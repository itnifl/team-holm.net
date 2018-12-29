-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: team-holm.net.mysql:3306
-- Generation Time: Dec 28, 2018 at 09:35 AM
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
('Centos 7 Template checklist for SCVMM 2012R2', '/blogs/Hyper-V/', 2, 14, 12),
('ESXi Scripted USB Install', '/blogs/VMWare/', 10, 9, 3),
('SQL 2016 High-Availability', '/blogs/Microsoft/', 15, NULL, NULL),
('OpenVPN server on RaspberryPI 1 vs RaspberryPI 3', '/blogs/Linux/', 2, 3, 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
