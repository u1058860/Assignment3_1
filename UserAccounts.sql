-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 10, 2015 at 01:12 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `RegisteredUsers`
--

-- --------------------------------------------------------

--
-- Table structure for table `UserAccounts`
--

CREATE TABLE IF NOT EXISTS `UserAccounts` (

  `id` int(11) NOT NULL,
-- User ID will be up to 11 numbers (similar to USQ student ID)

  `username` varchar(255) NOT NULL,
-- username is the name that will display on users hub pages etc

  `sign_up_date` datetime NOT NULL,
-- I chose datetime instead of just "date" 

  `email` varchar(255) NOT NULL,
-- users email address

  `bio` text NOT NULL,
-- a reasonable sized description of the users hobbies and interestes and favorite platform

  `account_permissions` enum('a','b','c') NOT NULL DEFAULT 'a',
-- I decided on 3 (a,b,c) permission levels just in case they are needed - default is a.
-- I should really only need 2 permission levels; one for a good account, one for a bad
-- (unregistered) account, however in the future I may wish to incorporate a "pending"
-- account level. Especially if users become "flagged" or if there are complaints from
-- other users and I need to remove the offending account.

  `email_activation` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- This will ensure that users need to click on "confirm" email link. They will then be 
-- registered to my GoannaApps.com source code listing website.

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
