-- phpMyAdmin SQL Dump
-- version 2.11.7-rc2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 03, 2010 at 04:34 AM
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
-- Table structure for table `np_emailtemplate`
--

CREATE TABLE IF NOT EXISTS `np_emailtemplate` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  `content` varchar(4096) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `np_emailtemplate`
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
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `np_operation`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `np_user`
--

INSERT INTO `np_user` (`e_oid`, `trackId`, `account`, `password`) VALUES
(1, 'u1156470549053', 'emma', 'emma');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `np_visitor`
--

INSERT INTO `np_visitor` (`e_oid`, `trackId`, `createdDate`, `creator`, `weddingDay`, `brideName`, `bridePhone`, `brideMobile`, `brideEmail`, `brideAddress`, `groomName`, `groomPhone`, `groomMobile`, `groomEmail`, `groomAddress`, `culturalBackground`, `ceremonyLocation`, `receptionLocation`, `source`, `firstVisitMethod`, `firstVisitDate`, `status`) VALUES
(1, 'u1042528726006', 1280793600, 'emma', 1283212800, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Phone', 1280620800, -2),
(2, 'u1066517807092', 1280793600, 'emma', 1283212800, '', '', '', 'ns.zhangjianxin@gmail.com', '', '', '', '', '', '', '', '', '', '', 'Email', 1280620800, 0),
(3, 'u844644471639', 1280793600, 'emma', 1283126400, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Visitor', 1280620800, 0);

-- --------------------------------------------------------

--
-- Table structure for table `np_visitorcancel`
--

CREATE TABLE IF NOT EXISTS `np_visitorcancel` (
  `e_oid` int(12) NOT NULL auto_increment,
  `trackId` varchar(64) default NULL,
  `date` int(16) default NULL,
  `userAccount` varchar(64) default NULL,
  `message` varchar(4096) default NULL,
  PRIMARY KEY  (`e_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `np_visitorcancel`
--

INSERT INTO `np_visitorcancel` (`e_oid`, `trackId`, `date`, `userAccount`, `message`) VALUES
(1, 'u954469883793', 1280793600, 'emma', 'all the same in vistor 2'),
(2, 'u995815284071', 1280793600, '', ''),
(3, 'u370252775547', 1280793600, 'emma', 'bvbvb');

-- --------------------------------------------------------

--
-- Table structure for table `np__ez_relation_visitor_visitorcancel`
--

CREATE TABLE IF NOT EXISTS `np__ez_relation_visitor_visitorcancel` (
  `e_oid` int(12) NOT NULL auto_increment,
  `class_a` varchar(64) default NULL,
  `oid_a` int(11) default NULL,
  `var_a` varchar(64) default NULL,
  `base_b` varchar(64) default NULL,
  `class_b` varchar(64) default NULL,
  `oid_b` int(11) default NULL,
  PRIMARY KEY  (`e_oid`),
  KEY `idx_class_oid_a` (`class_a`,`oid_a`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `np__ez_relation_visitor_visitorcancel`
--

INSERT INTO `np__ez_relation_visitor_visitorcancel` (`e_oid`, `class_a`, `oid_a`, `var_a`, `base_b`, `class_b`, `oid_b`) VALUES
(1, 'Visitor', 1, 'disposal', 'VisitorCancel', 'VisitorCancel', 1),
(2, 'Visitor', 2, 'disposal', 'VisitorCancel', 'VisitorCancel', 2),
(3, 'Visitor', 3, 'disposal', 'VisitorCancel', 'VisitorCancel', 3);
