-- phpMyAdmin SQL Dump
-- version 2.11.7-rc2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 16, 2010 at 12:19 PM
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
-- Table structure for table `np_datezone`
--

CREATE TABLE IF NOT EXISTS `np_datezone` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `start` int(16) default NULL,
  `end` int(16) default NULL,
  `page` varchar(256) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `np_datezone`
--

INSERT INTO `np_datezone` (`e_oid`, `trackId`, `start`, `end`, `page`) VALUES
(3, 'u990882985018', 1280620800, 1280707200, 'performanceattitude'),
(4, 'u1037935317953', 1280620800, 1283126400, 'performancesales');

-- --------------------------------------------------------

--
-- Table structure for table `np_emailtemplate`
--

CREATE TABLE IF NOT EXISTS `np_emailtemplate` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  `subject` varchar(1024) default NULL,
  `content` varchar(4096) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_emailtemplate`
--

INSERT INTO `np_emailtemplate` (`e_oid`, `trackId`, `name`, `subject`, `content`) VALUES
(1, 'u395597339381', 'test email', 'this is a test email', 'hello \n  this is a test email !\n\n\n                       dreamLife opertion');

-- --------------------------------------------------------

--
-- Table structure for table `np_iceremony`
--

CREATE TABLE IF NOT EXISTS `np_iceremony` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `np_iceremony`
--

INSERT INTO `np_iceremony` (`e_oid`, `trackId`, `name`) VALUES
(2, 'u504547816390', 'cccccccccccccccccccccccccccccccc');

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
(1, 'u731126943085', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `np_iopponent`
--

CREATE TABLE IF NOT EXISTS `np_iopponent` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_iopponent`
--

INSERT INTO `np_iopponent` (`e_oid`, `trackId`, `name`) VALUES
(1, 'u477665579661', 'dlmanage.co.nz');

-- --------------------------------------------------------

--
-- Table structure for table `np_ireception`
--

CREATE TABLE IF NOT EXISTS `np_ireception` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_isource`
--

INSERT INTO `np_isource` (`e_oid`, `trackId`, `name`) VALUES
(1, 'u144446192273', 'ddddddddddddddddddddddddddddddddddd');

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
  `prevOperator` varchar(64) default NULL,
  `firstVisited` tinyint(1) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `np_operation`
--

INSERT INTO `np_operation` (`e_oid`, `trackId`, `visitId`, `cancelled`, `operateType`, `operator`, `operatedDate`, `content`, `prevOperator`, `firstVisited`) VALUES
(1, 'u373789009168', '3', 0, 'Email (1)', 'test', 1281916800, 'fddsdf', '', 0),
(2, 'u420741710597', '3', 1, 'Visit (1)', 'test', 1281916800, 'fdsfs', 'test', 1),
(3, 'u1145631706006', '3', 1, 'Visit (1)', 'test', 1281916800, 'cc', 'test', 1),
(4, 'u731287572539', '3', 1, 'Visit (1)', 'test', 1281916800, 'cx', 'test', 1),
(5, 'u40930658770', '3', 1, 'Visit (1)', 'test', 1281916800, 'fdss', 'test', 1),
(6, 'u424942058130', '3', 1, 'Call (1)', 'test', 1281916800, 'fsdfs', 'test', 0),
(7, 'u99173181779', '3', 1, 'Visit (1)', 'test', 1281916800, 'fsdfs', 'test', 1),
(8, 'u910329276894', '3', 1, 'Call (2)', 'test', 1281916800, 'sdfs', 'test', 0),
(9, 'u392597566780', '3', 1, 'Call (3)', 'test', 1281916800, 'fdsfs', 'test', 0),
(10, 'u495940872552', '3', 1, 'Visit (2)', 'test', 1281916800, 'fds', 'test', 1),
(11, 'u399364625236', '3', 1, 'Call (2)', 'test', 1281916800, '121', 'test', 0),
(12, 'u1009543848104', '1', 0, 'Visit (1)', 'test', 1281916800, 'dsfs', '', 1),
(13, 'u1280612099532', '2', 0, 'Call (1)', 'test', 1281916800, 'what is you r ifjemfkduiejflkd', '', 0),
(14, 'u1257502655272', '2', 1, 'Visit (1)', 'test', 1281916800, 'fsd', 'test', 1),
(15, 'u312831787748', '2', 0, 'Visit (1)', 'test', 1281916800, 'dfs', 'test', 1),
(16, 'u1133052530915', '1', 0, 'Call (1)', 'user', 1281916800, 'fds', 'test', 0),
(17, 'u386974896193', '3', 0, 'Visit (1)', 'user', 1281916800, 'fdsf', 'test', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `np_user`
--

INSERT INTO `np_user` (`e_oid`, `trackId`, `account`, `password`) VALUES
(2, 'u1088097874798', 'test', 'test'),
(3, 'u69364137208', 'user', 'user'),
(4, 'u570822602782', 'emma', 'emma');

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
  `operatorDate` int(16) default NULL,
  `operator` varchar(64) default NULL,
  `operatorMessage` varchar(4096) default NULL,
  `isVisited` tinyint(4) default NULL,
  `opponent` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `np_visitor`
--

INSERT INTO `np_visitor` (`e_oid`, `trackId`, `createdDate`, `creator`, `weddingDay`, `brideName`, `bridePhone`, `brideMobile`, `brideEmail`, `brideAddress`, `groomName`, `groomPhone`, `groomMobile`, `groomEmail`, `groomAddress`, `culturalBackground`, `ceremonyLocation`, `receptionLocation`, `source`, `firstVisitMethod`, `firstVisitDate`, `status`, `operatorDate`, `operator`, `operatorMessage`, `isVisited`, `opponent`) VALUES
(1, 'u284446300656', 1281916800, 'test', 1283212800, '1', '1', '', '1', '', '1', '', '1', '1', '', '', '', '', '', 'Email', 1281916800, 0, 1281916800, 'user', 'cxcxc', 1, 'dlmanage.co.nz'),
(2, 'u430247815599', 1281916800, 'test', 1283126400, 'b', '', 'b', 'b', 'b', '', 'b', 'b', 'b', '', '', '', '', '', 'Visitor', 1281830400, 0, 1281916800, '', '', 1, ''),
(3, 'u424367865289', 1281916800, 'test', 0, 'x', '', 'x', '', 'x', '', 'x', '', 'x', '', '', '', '', '', 'Phone', 0, 0, 1281916800, '', '', 1, '');
