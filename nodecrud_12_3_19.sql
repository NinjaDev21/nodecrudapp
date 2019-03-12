-- phpMyAdmin SQL Dump
-- version 5.0.0-dev
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 12, 2019 at 08:20 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.1.27-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodecrud`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookAddOrUpdate` (IN `_id` INT, IN `_book_name` VARCHAR(80), IN `_book_desc` VARCHAR(255), IN `_book_author` VARCHAR(80), IN `_price` INT)  BEGIN
if _id = 0 then
insert into book_info(book_name,book_desc,book_author,price) values (_book_name,_book_desc,_book_author,_price);
set _id = last_insert_id();
else 
update book_info set book_name = _book_name,book_desc = _book_desc ,book_author = _book_author,price = _price where id = _id;
END if;
select * from book_info order by id desc;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book_info`
--

CREATE TABLE `book_info` (
  `id` int(11) NOT NULL,
  `book_name` varchar(45) NOT NULL,
  `book_desc` varchar(255) NOT NULL,
  `book_author` varchar(45) NOT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_info`
--

INSERT INTO `book_info` (`id`, `book_name`, `book_desc`, `book_author`, `price`) VALUES
(1, 'jungle book', 'this is a book about the jungle ', 'i dont know', 0),
(3, 'Sindrela', 'about a girl with some shou don\'t really know', 'i dont know', 0),
(4, 'Harry potter', 'this is the heroic story of harry poter ', 'i dont know', 0),
(5, 'Superman Commice', 'this is about superman', 'i dont know ', 0),
(6, 'something', 'something went wrong ', 'i dont know ', 23),
(9, 'somename', 'somename', 'somename', 0),
(10, 'somename', 'somename', 'author', 41),
(13, 'Malay 111', 'become 11', 'onskkdsds 13', 12),
(18, 'Pink Floyed', 'all about pink floyed', 'PINK FLOYED', 0),
(19, ' Floyed', 'all about pink floyed', ' FLOYED', 0),
(20, 'asdasd', 'asdasd', 'asdfasd', 20),
(21, 'some Name Is this', 'DESC', 'Author ! ', 300),
(22, 'some Name Is this 2', 'DESC', 'Author ! ', 12),
(24, 'JAVA ', 'DESC', 'JOPY ', 243),
(26, 'React JS', 'this is a description! ', 'malay Dhar', 3999),
(36, 'Venom', 'venom is the villain of Spiderman! ', 'Spiderman', 599),
(41, 'dekhi', 'hobe ! Na ', 'kicu ekta', 452),
(47, 'My new Book', 'select * from motherFuckers;', 'malay', 571),
(53, 'my Bokk ', 'SDLC', 'Waterfall model  32', 20),
(57, 'coffee Break', 'only coffee! B) ', 'i am the author ', 45),
(58, 'sdf', 'sdfasd', 'sdfgdsf', 3454);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_info`
--
ALTER TABLE `book_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_info`
--
ALTER TABLE `book_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
