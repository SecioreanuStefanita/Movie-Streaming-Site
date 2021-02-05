-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2021 at 10:26 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `filme`
--

-- --------------------------------------------------------

--
-- Table structure for table `filme`
--

CREATE TABLE `filme` (
  `id` int(10) NOT NULL,
  `nume` varchar(100) NOT NULL,
  `descriere` varchar(1000) NOT NULL,
  `imagine` varchar(100) NOT NULL,
  `categorie` varchar(100) NOT NULL,
  `box_office` int(100) NOT NULL,
  `data` date NOT NULL,
  `varsta_recomandata` set('12+','16+','18+','none') NOT NULL,
  `cast` varchar(100) NOT NULL,
  `e_premiat` tinyint(1) NOT NULL,
  `cale_video` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filme`
--

INSERT INTO `filme` (`id`, `nume`, `descriere`, `imagine`, `categorie`, `box_office`, `data`, `varsta_recomandata`, `cast`, `e_premiat`, `cale_video`) VALUES
(1, 'About Time ', 'At the age of 21, Tim discovers he can travel in time and change what happens and has happened in hi', '/images/galerie_statica4_300.jpg', ' Comedy,Drama,Fantasy', 88000000, '2013-11-08', '18+', ' Domhnall Gleeson,Rachel McAdams,Bill Nighy,Lindsay Duncan,Richard Cordery', 1, '/videos/about_time.mkv'),
(2, 'Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', '/images/galerie_statica1_300.jpg', 'Adventure, Drama, Sci-Fi', 701800000, '2014-11-07', '12+', 'Ellen Burstyn,Matthew McConaughey,Mackenzie Foy,John Lithgow,Michael Caine', 1, '/videos/interstellar.mkv'),
(3, 'Love Actually', 'Follows the lives of eight very different couples in dealing with their love lives in various loosel', '/images/galerie_statica2_300.jpeg', ' Comedy,Drama,Romance', 248000000, '2003-11-14', '18+', 'Hugh Grant,Martine McCutcheon,Liam Neeson,Colin Firth,Emma Thompson', 0, '/videos/love_actually.mkv'),
(4, 'Catch Me If You Can', 'Barely 21 yet, Frank is a skilled forger who has passed as a doctor, lawyer and pilot. FBI agent Carl becomes obsessed with tracking down the con man, who only revels in the pursuit.', '/images/galerie_statica3_300.jpg', ' Biography,Crime,Drama', 352000000, '2002-12-25', '12+', 'Leonardo DiCaprio,Tom Hanks,Christopher Walken,Martin Sheen', 0, '/videos/catch_me_if_you_can.mkv'),
(5, 'A Beautiful Mind', 'After John Nash, a brilliant but asocial mathematician, accepts secret work in cryptography, his life takes a turn for the nightmarish.', '/images/galerie_statica5_300.jpg', ' Biography,Drama', 313000000, '2001-01-04', '12+', 'Russell Crowe,Ed Harris,Jennifer Connelly,Christopher Plummer', 1, '/videos/a_beautiful_mind.mkv'),
(6, 'The Hateful Eight', 'In the dead of a Wyoming winter, a bounty hunter and his prisoner find shelter in a cabin currently inhabited by a collection of nefarious characters.', '/images/galerie_statica6_300.jpg', 'Crime,Drama,Mystery ', 155000000, '2015-12-30', '18+', 'Samuel L. Jackson,Kurt Russell,Jennifer Jason Leigh,Walton Goggins', 1, '/videos/hateful_eight.mkv'),
(7, 'Dead Poets Society', 'Maverick teacher John Keating uses poetry to embolden his boarding school students to new heights of self-expression.', '/images/galerie_statica7_300.jpg', 'Comedy,Drama ', 235000000, '1989-06-09', '12+', 'Robin Williams,Robert Sean Leonard,Ethan Hawke,Josh Charles,Gale Hansen', 1, '/videos/dead_society.mkv'),
(8, 'Good Will Hunting', 'Will Hunting, a janitor at M.I.T., has a gift for mathematics, but needs help from a psychologist to find direction in his life.', '/images/galerie_statica8_300.jpg', ' Drama,Romance', 225000000, '1997-01-09', '16+', 'Matt Damon,Ben Affleck,Stellan Skarsgård,Robin Williams', 1, '/videos/good_will_hunting.mkv'),
(9, 'Your Name.', 'Two strangers find themselves linked in a bizarre way. When a connection forms, will distance be the only thing to keep them apart?', '/images/galerie_statica9_300.png\r\n', 'Animation,Drama,Fantasy', 358000000, '2017-04-07', 'none', 'Ryûnosuke Kamiki,Mone Kamishiraishi,Ryô Narita', 0, '/videos/your_name.mkv'),
(10, 'Spirited Away', 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.', '/images/spirited_away_300.jpg', 'Animation,Adventure,Family', 383000000, '2003-03-28', 'none', 'Rumi Hiiragi,Miyu Irino,Mari Natsuki', 0, '/videos/spirited_away.mkv');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filme`
--
ALTER TABLE `filme`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
