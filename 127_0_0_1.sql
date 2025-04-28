-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2025 at 01:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist`
--
CREATE DATABASE IF NOT EXISTS `todolist` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `todolist`;

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int(12) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` varchar(555) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `isAcitve` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `title`, `description`, `date`, `isAcitve`) VALUES
(1, 'Buy groceries test ', 'Need to buy milk, eggs, and bread ', '2025-04-28 17:31:26', b'1'),
(2, 'Finish homework', 'Complete the math and science assignments', '2025-04-28 17:31:26', b'1'),
(3, 'Clean the house', 'Vacuum and dust the living room and kitchen', '2025-04-28 17:31:26', b'1'),
(4, 'Go for a walk', 'Take a 30-minute walk in the park', '2025-04-28 17:31:26', b'1'),
(5, 'Read a book', 'Finish reading \"The Catcher in the Rye\"', '2025-04-28 17:31:26', b'1'),
(6, 'Call mom', 'Catch up with mom over the phone', '2025-04-28 17:31:26', b'1'),
(7, 'Pay bills', 'Pay electricity and internet bills', '2025-04-28 17:31:26', b'1'),
(8, 'Watch a movie', 'Watch \"Inception\" tonight', '2025-04-28 17:31:26', b'1'),
(9, 'Workout', 'Do a 45-minute workout session', '2025-04-28 17:31:26', b'1'),
(10, 'Prepare dinner', 'Cook a healthy meal for the evening', '2025-04-28 17:31:26', b'1'),
(11, 'Sleep', 'Sleep 24 hours cuz im so tired', '2025-04-28 18:50:07', b'1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
