-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 10, 2015 at 01:31 PM
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
-- Table structure for table `UserUploads`
--

CREATE TABLE IF NOT EXISTS `UserUploads` (

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

  `file_size` int(11) NOT NULL,
-- this will be measured in megabytes 

  `times_downloaded` int(11) NOT NULL,
-- This is the amount of times that other users buy and download the file. It relates to the 
-- popularity of the file. I might also include a "rating" system in the future. This 
-- will allow users to give a file 1-5 stars. Similar to itunes.

  `comments` text NOT NULL,
-- This will allow users to write notes regarding files. 
-- eg. "thank you for the well written source code"

  `version` int(11) NOT NULL,
-- This is if users choose to include multiple versions of their files
-- v1.2, v1.3 etc

  `price` decimal(10,0) NOT NULL,
-- Will be displayed as a $ dollar value
-- I'm still not sure how to include multiple currency options for conversion 
-- but US dollar should hopefully be good enough.


  `status` enum('a','b','c') NOT NULL DEFAULT 'a'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Status could either be: accepted file (by default since users can always flag issues)
-- or pending (pending approval by administrator)
-- or deleted (duplicate files/offensive/copyrighted/virus/unstable files)

--
-- Indexes for dumped tables
--

--
-- Indexes for table `UserUploads`
--
ALTER TABLE `UserUploads`
  ADD PRIMARY KEY (`file_id`);
-- file ID is currently the primary key for this table


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
