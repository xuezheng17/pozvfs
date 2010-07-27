-- phpMyAdmin SQL Dump
-- version 2.11.7-rc2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 01, 2010 at 04:30 AM
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
-- Table structure for table `np_iceremony`
--

CREATE TABLE IF NOT EXISTS `np_iceremony` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `np_iceremony`
--


-- --------------------------------------------------------

--
-- Table structure for table `np_iculture`
--

CREATE TABLE IF NOT EXISTS `np_iculture` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_iculture`
--

INSERT INTO `np_iculture` (`e_oid`, `trackId`, `name`) VALUES
(1, 'u387852298762', 'unkown');

-- --------------------------------------------------------

--
-- Table structure for table `np_ireception`
--

CREATE TABLE IF NOT EXISTS `np_ireception` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `np_ireception`
--


-- --------------------------------------------------------

--
-- Table structure for table `np_isource`
--

CREATE TABLE IF NOT EXISTS `np_isource` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `np_isource`
--


-- --------------------------------------------------------

--
-- Table structure for table `np_operation`
--

CREATE TABLE IF NOT EXISTS `np_operation` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `visitId` varchar(64) default NULL,
  `cancelled` tinyint(1) default NULL,
  `operateType` varchar(64) default NULL,
  `operator` varchar(64) default NULL,
  `operatedDate` int(16) default NULL,
  `content` varchar(5120) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `np_operation`
--

INSERT INTO `np_operation` (`e_oid`, `trackId`, `visitId`, `cancelled`, `operateType`, `operator`, `operatedDate`, `content`) VALUES
(1, 'u886466055776', '1', 0, 'call(1)', 'emma', 1280102400, ''),
(2, 'u1083901298140', '2', 0, 'email(1)', 'emma', 1280188800, 'dd'),
(3, 'u406236394488', '3', 0, 'visit(1)', 'emma', 1280275200, 'cc'),
(4, 'u513210221268', '1', 0, 'visit(1)', 'emma', 1280361600, 'ss'),
(5, 'u612711903911', '4', 0, 'email(1)', 'emma', 1280448000, ''),
(6, 'u813169222439', '2', 0, 'call(1)', 'emma', 1280534400, ''),
(7, 'u801279979833', '3', 0, 'Succeed', 'emma', 1280620800, 'created');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `np_user`
--

INSERT INTO `np_user` (`e_oid`, `trackId`, `account`, `password`) VALUES
(1, 'u251865685940', 'emma', 'emma'),
(2, 'u571003815230', 'test', 'test'),
(3, 'u608729168008', 'user', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `np_visitor`
--

CREATE TABLE IF NOT EXISTS `np_visitor` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `createdDate` int(16) default NULL,
  `creator` varchar(64) default NULL,
  `weddingDay` int(16) default NULL,
  `brideName` varchar(64) default NULL,
  `bridePhone` varchar(64) default NULL,
  `brideMobile` varchar(64) default NULL,
  `brideEmail` varchar(64) default NULL,
  `brideAddress` varchar(512) default NULL,
  `groomName` varchar(64) default NULL,
  `groomPhone` varchar(64) default NULL,
  `groomMobile` varchar(64) default NULL,
  `groomEmail` varchar(64) default NULL,
  `groomAddress` varchar(512) default NULL,
  `culturalBackground` varchar(64) default NULL,
  `ceremonyLocation` varchar(64) default NULL,
  `receptionLocation` varchar(64) default NULL,
  `source` varchar(64) default NULL,
  `firstVisitMethod` varchar(64) default NULL,
  `firstVisitDate` int(16) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `np_visitor`
--

INSERT INTO `np_visitor` (`e_oid`, `trackId`, `createdDate`, `creator`, `weddingDay`, `brideName`, `bridePhone`, `brideMobile`, `brideEmail`, `brideAddress`, `groomName`, `groomPhone`, `groomMobile`, `groomEmail`, `groomAddress`, `culturalBackground`, `ceremonyLocation`, `receptionLocation`, `source`, `firstVisitMethod`, `firstVisitDate`, `status`) VALUES
(1, 'u1046346167106', 1280102400, 'emma', 1280102400, 'a', 'a', 'a', 'a', '', 'a', 'a', 'a', 'a', '', '', '', '', '', 'Phone', 1280102400, 0),
(2, 'u900757766563', 1280188800, 'emma', 1280188800, '', '', '', '', '', '', '', '', '', '', 'unkown', '', '', '', 'Email', 1280188800, 0),
(3, 'u135011680132', 1280275200, 'emma', 1280275200, 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'null', '', '', '', 'Visitor', 1280275200, 1),
(4, 'u461141392978', 1280448000, 'emma', 1280448000, 'd', '', '', 'dd', 'd', 'd', 'd', '', 'dd', 'd', 'null', '', '', '', 'Email', 1280448000, 0);
