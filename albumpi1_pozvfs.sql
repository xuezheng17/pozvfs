-- phpMyAdmin SQL Dump
-- version 2.11.7-rc2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 05, 2010 at 03:09 AM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_iceremony`
--

INSERT INTO `np_iceremony` (`e_oid`, `trackId`, `name`) VALUES
(1, 'u949972293270', 's');

-- --------------------------------------------------------

--
-- Table structure for table `np_iculture`
--

CREATE TABLE IF NOT EXISTS `np_iculture` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `np_iculture`
--


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
  `prevOperator` varchar(64) default NULL,
  `firstVisited` tinyint(1) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `np_operation`
--

INSERT INTO `np_operation` (`e_oid`, `trackId`, `visitId`, `cancelled`, `operateType`, `operator`, `operatedDate`, `content`, `prevOperator`, `firstVisited`) VALUES
(1, 'u79194078997', '6', 0, 'Call (1)', 'test', 1280880000, 'xxx', '', 0),
(2, 'u284964124376', '5', 0, 'Call (1)', 'test', 1280880000, 'cxcx', '', 0),
(3, 'u1252058043055', '3', 0, 'Call (1)', 'user', 1280880000, 'xxxx', '', 0),
(4, 'u912828468640', '2', 1, 'Call (1)', 'test', 1280880000, 'vcvc', '', 0),
(5, 'u322813446666', '4', 0, 'Call (1)', 'user', 1280880000, 'DFD', '', 0),
(6, 'u593966329748', '4', 0, 'Visit (1)', 'user', 1280880000, 'FDSF ', 'user', 1),
(7, 'u867801431978', '2', 1, 'Visit (1)', 'user', 1280880000, 'vcvcv', '', 1),
(8, 'u1116723042686', '2', 1, 'Visit (1)', 'user', 1280880000, 'vc', '', 1),
(9, 'u597199630470', '2', 0, 'Visit (1)', 'user', 1280880000, 'fds', 'emma', 1),
(10, 'u181888684304', '8', 0, 'Call (1)', 'emma', 1280880000, 'ieie ', 'user', 0),
(11, 'u1167243189147', '7', 0, 'Email (1)', 'emma', 1280880000, 'hello \n  this is a test email !\n\n\n                       dreamLife opertion', 'test', 0);

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
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `np_visitor`
--

INSERT INTO `np_visitor` (`e_oid`, `trackId`, `createdDate`, `creator`, `weddingDay`, `brideName`, `bridePhone`, `brideMobile`, `brideEmail`, `brideAddress`, `groomName`, `groomPhone`, `groomMobile`, `groomEmail`, `groomAddress`, `culturalBackground`, `ceremonyLocation`, `receptionLocation`, `source`, `firstVisitMethod`, `firstVisitDate`, `status`, `operatorDate`, `operator`, `operatorMessage`) VALUES
(1, 'u1010803953216', 1280793600, 'emma', 1283212800, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Phone', 1280620800, -2, 1280793600, 'emma', 'fsfsfffsfsd'),
(2, 'u1019438005858', 1280793600, 'emma', 1283126400, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', '', '', '', '', 'Visitor', 1280620800, 0, 1280880000, 'user', 'æˆ¿è´·é¦–ä»˜'),
(3, 'u842115074563', 1280793600, 'emma', 1283212800, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Email', 1280620800, 0, 0, '', ''),
(4, 'u518074974429', 1280793600, 'emma', 1285718400, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Phone', 1279670400, 0, 0, '', ''),
(5, 'u640512020893', 1280793600, 'emma', 1285200000, 'å•Š', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Visitor', 1280534400, -2, 1280880000, 'user', 'è¾…å¯¼è´¹'),
(6, 'u939197781887', 1280793600, 'emma', 1283212800, '', '', '', 'ns.zhangjianxin@gmail.com', '', '', '', '', '', '', '', '', '', '', 'Phone', 1280620800, -2, 1280880000, 'test', 'cxcxc'),
(7, 'u502815738908', 1280880000, 'test', 1285804800, '', '', '', 'ns.zhangjianxin@gmail.com', '', '', '', '', '', '', '', '', '', '', 'Phone', 1280707200, 0, 1280880000, '', ''),
(8, 'u820761298496', 1280880000, 'user', 1283212800, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Visitor', 1280707200, 0, 1280880000, '', '');
