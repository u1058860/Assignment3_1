-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 10, 2015 at 02:38 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Files`
--

-- --------------------------------------------------------

--
-- Table structure for table `File_Sorting`
--

CREATE TABLE IF NOT EXISTS `File_Sorting` (

  `file_id` int(10) NOT NULL,
-- This could be used instead of "file_name" as a foreign key (for downloaded file)
-- eg. "0045993291.zip could contain the users source code they are selling.
-- or I might make the "file_name" the title of the file. When a buyer pays for and 
-- downloads the source files, it would appear as; eg. angry_birds_files.zip

  `file_name` varchar(255) NOT NULL,
-- This will be the name of the app/asset the user is trying to sell. 
-- eg. "Angry Birds source files" for sale. I will probably have this appended to the 
-- "Title" of the listing (as a foreign key). Or I might let the user include their
-- own title for their listing. In other words, the filename.zip could be different 
-- to the actual ad.

  `category` varchar(255) NOT NULL,
-- this relates to the listing category. It will either be IOS code, Android code, C++,
-- Code snippets, sprite-sheets, user interface templates, images or other app assets. 

  `date_uploaded` datetime NOT NULL,
-- I chose datetime instead of just "date" 

  `file_size` double NOT NULL,
-- this will be measured in megabytes 

  `file_uploader` int(1) NOT NULL,
-- user ID of the original owner/uploader of the file
-- can only be 1 (as duplicate items not allowed to be uploaded)

  `file_owners` double NOT NULL
-- Users IDs of all the users who bought and downloaded the file



) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
