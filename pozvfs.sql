-- phpMyAdmin SQL Dump
-- version 2.11.7-rc2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 26, 2010 at 11:59 PM
-- Server version: 5.0.27
-- PHP Version: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pozvfs`
--

-- --------------------------------------------------------

--
-- Table structure for table `np_user`
--

CREATE TABLE IF NOT EXISTS `np_user` (
  `e_oid` int(11) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `account` varchar(64) default NULL,
  `password` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `np_user`
--

INSERT INTO `np_user` (`e_oid`, `trackId`, `account`, `password`) VALUES
(1, 'u251865685940', 'emma', 'emma'),
(2, 'u571003815230', 'test', 'test');
