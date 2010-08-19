-- phpMyAdmin SQL Dump
-- version 2.11.7-rc2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 19, 2010 at 08:42 AM
-- Server version: 5.0.27
-- PHP Version: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `albumpi1_pozvfs`
--

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_datezone`
--

CREATE TABLE IF NOT EXISTS `np_pz_datezone` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `start` int(16) default NULL,
  `end` int(16) default NULL,
  `page` varchar(256) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `np_pz_datezone`
--

INSERT INTO `np_pz_datezone` (`e_oid`, `trackId`, `start`, `end`, `page`) VALUES
(3, 'u990882985018', 1280620800, 1280707200, 'performanceattitude'),
(4, 'u1037935317953', 1280620800, 1283126400, 'performancesales'),
(5, 'u528257078792', 1281225600, 1281916800, 'performanceattitude'),
(6, 'u1047089717242', 1280620800, 1281398400, 'statbasic');

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_emailtemplate`
--

CREATE TABLE IF NOT EXISTS `np_pz_emailtemplate` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  `subject` varchar(1024) default NULL,
  `content` varchar(4096) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_pz_emailtemplate`
--

INSERT INTO `np_pz_emailtemplate` (`e_oid`, `trackId`, `name`, `subject`, `content`) VALUES
(1, 'u395597339381', 'test email', 'this is a test email', 'hello \n  this is a test email !\n\n\n                       dreamLife opertion');

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_icategory`
--

CREATE TABLE IF NOT EXISTS `np_pz_icategory` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `np_pz_icategory`
--

INSERT INTO `np_pz_icategory` (`e_oid`, `trackId`, `name`) VALUES
(1, 'u192937180297', 'category1'),
(2, 'u172601940226', 'category2');

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_iceremony`
--

CREATE TABLE IF NOT EXISTS `np_pz_iceremony` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `np_pz_iceremony`
--

INSERT INTO `np_pz_iceremony` (`e_oid`, `trackId`, `name`) VALUES
(2, 'u504547816390', 'cccccc');

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_iculture`
--

CREATE TABLE IF NOT EXISTS `np_pz_iculture` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_pz_iculture`
--

INSERT INTO `np_pz_iculture` (`e_oid`, `trackId`, `name`) VALUES
(1, 'u731126943085', 'aaaaaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_iopponent`
--

CREATE TABLE IF NOT EXISTS `np_pz_iopponent` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_pz_iopponent`
--

INSERT INTO `np_pz_iopponent` (`e_oid`, `trackId`, `name`) VALUES
(1, 'u477665579661', 'dlmanage.co.nz');

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_ireception`
--

CREATE TABLE IF NOT EXISTS `np_pz_ireception` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_pz_ireception`
--

INSERT INTO `np_pz_ireception` (`e_oid`, `trackId`, `name`) VALUES
(1, 'u534598788436', 'rrrrr');

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_isource`
--

CREATE TABLE IF NOT EXISTS `np_pz_isource` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `np_pz_isource`
--

INSERT INTO `np_pz_isource` (`e_oid`, `trackId`, `name`) VALUES
(1, 'u144446192273', 'ddddddddddd'),
(2, 'u732516267643', 'Chinese');

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_operation`
--

CREATE TABLE IF NOT EXISTS `np_pz_operation` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `visitId` varchar(64) default NULL,
  `cancelled` tinyint(1) default NULL,
  `operateType` varchar(64) default NULL,
  `operator` varchar(64) default NULL,
  `operatedDate` int(16) default NULL,
  `content` varchar(5120) default NULL,
  `prevOperator` varchar(64) default NULL,
  `firstVisited` tinyint(1) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `np_pz_operation`
--

INSERT INTO `np_pz_operation` (`e_oid`, `trackId`, `visitId`, `cancelled`, `operateType`, `operator`, `operatedDate`, `content`, `prevOperator`, `firstVisited`) VALUES
(1, 'u929531416048', '1', 0, 'Call (1)', 'test', 1282089600, 'xxx', '', 0),
(2, 'u288921422912', '1', 0, 'Visit (1)', 'test', 1282089600, 'dfsfs', 'test', 1),
(3, 'u1037101274405', '1', 0, 'Call (2)', 'test', 1282089600, 'fdfs', 'test', 0),
(4, 'u1261501638582', '', 0, '', '', 0, '', '', 0),
(5, 'u610222180605', '2', 0, 'Call (1)', 'test', 1282089600, 'dfd', '', 0),
(6, 'u1104316515474', '2', 1, 'Visit (1)', 'test', 1282089600, 'fdsf', 'test', 1),
(7, '', '', 0, '', '', 0, '', '', 1),
(8, 'u1060755549166', '2', 1, 'Visit (2)', 'test', 1282089600, 'cxcx', 'test', 0),
(9, '', '', 0, '', '', 0, '', '', 1),
(10, 'u958515279957', '2', 0, 'Visit (1)', 'test', 1282089600, 'cxcs', 'test', 1),
(11, '', '', 0, '', '', 0, '', '', 1),
(12, '', '', 0, '', '', 0, '', '', 1),
(13, '', '', 0, '', '', 0, '', '', 1),
(14, 'u257724217042', '3', 0, 'Visit (1)', 'test', 1282089600, 'vcvc', '', 1),
(15, 'u603808691397', '3', 0, 'Call (1)', 'test', 1282089600, 'fdsfs', 'test', 0),
(16, 'u292604706005', '3', 0, 'Visit (2)', 'test', 1282089600, 'fdsfsfds', 'test', 0),
(17, 'u944134548339', '4', 1, 'Visit (1)', 'test', 1282176000, 'dfdfd', '', 1),
(18, 'u1039240999056', '4', 0, 'Call (1)', 'test', 1282176000, 'fdfd', 'test', 0),
(19, 'u561428014017', '4', 1, 'Visit (2)', 'test', 1282176000, 'fdfdf', 'test', 1),
(20, 'u654509030501', '4', 0, 'Visit (1)', 'test', 1282176000, 'dfsf', 'test', 1),
(21, 'u780343543472', '4', 0, 'Visit (2)', 'test', 1282176000, 'fdsfs', 'test', 0),
(22, 'u255371328471', '4', 0, 'Call (2)', 'test', 1282176000, 'fdsfs', 'test', 0),
(23, 'u1232365739543', '4', 0, 'Call (3)', 'test', 1282176000, 'fsdfd', 'test', 0),
(24, 'u755025117247', '4', 0, 'Visit (3)', 'test', 1282176000, 'fdsf', 'test', 0),
(25, 'u700410263306', '3', 0, 'Call (2)', 'test', 1282176000, 'fds', 'test', 0);

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_user`
--

CREATE TABLE IF NOT EXISTS `np_pz_user` (
  `e_oid` int(11) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `account` varchar(64) default NULL,
  `password` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `np_pz_user`
--

INSERT INTO `np_pz_user` (`e_oid`, `trackId`, `account`, `password`) VALUES
(2, 'u1088097874798', 'test', 'test'),
(3, 'u69364137208', 'user', 'user'),
(4, 'u570822602782', 'emma', 'emma');

-- --------------------------------------------------------

--
-- Table structure for table `np_pz_visitor`
--

CREATE TABLE IF NOT EXISTS `np_pz_visitor` (
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
  `operatorDate` int(16) default NULL,
  `operator` varchar(64) default NULL,
  `operatorMessage` varchar(4096) default NULL,
  `isVisited` tinyint(4) default NULL,
  `opponent` varchar(64) default NULL,
  `category` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `np_pz_visitor`
--

INSERT INTO `np_pz_visitor` (`e_oid`, `trackId`, `createdDate`, `creator`, `weddingDay`, `brideName`, `bridePhone`, `brideMobile`, `brideEmail`, `brideAddress`, `groomName`, `groomPhone`, `groomMobile`, `groomEmail`, `groomAddress`, `culturalBackground`, `ceremonyLocation`, `receptionLocation`, `source`, `firstVisitMethod`, `firstVisitDate`, `status`, `operatorDate`, `operator`, `operatorMessage`, `isVisited`, `opponent`, `category`) VALUES
(1, 'u1243556884378', 1282089600, 'test', 1283212800, '1', '1', '1', '', '1', '', '', '', '', '', '', '', '', '', 'Phone', 1280620800, 0, 1282089600, '', '', 1, '', ''),
(2, 'u236578880906', 1282089600, 'test', 0, '', '', '', '', '', '', '', '', '', '', 'aaaaaaaa', 'cccccc', 'rrrrr', 'Chinese', 'Phone', 0, 0, 0, '', '', 1, '', ''),
(3, 'u996143500590', 1282089600, 'test', 0, 'c', 'c', 'c', '', 'cc', '', '', '', '', '', '', '', '', '', 'Phone', 0, 0, 1282089600, '', '', 1, '', ''),
(4, 'u1261501638582', 1282176000, 'test', 0, 'c', 'c', 'c', '', 'c', 'c', 'c', 'c', '', 'c', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '', '', 'Chinese', 'Phone', 0, 0, 0, '', '', 1, '', '');
