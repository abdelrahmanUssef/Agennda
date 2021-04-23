-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2021 at 11:49 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agenndadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(4) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `adminName`, `email`, `password`) VALUES
(1, 'abdelrahman', 'abdelrahman@3dos.com', '123'),
(2, 'diaa', 'dai@3dos.com ', '123'),
(3, 'nehal', 'nehal@3dos.com', '123'),
(4, 'nouran', 'nouran@3dos.com', '123'),
(5, 'Ganna', 'ganna@3dos.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `prodQuan` int(11) NOT NULL,
  `custId` int(11) NOT NULL,
  `prodId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(4) NOT NULL,
  `custName` varchar(255) NOT NULL,
  `custPassword` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `custName`, `custPassword`, `address`, `email`, `phone`) VALUES
(13, 'abdelrahman', '123', '34 almostaqbal - elsheikh zayed', 'abdelrahman@gmail.com', '01147542249');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(4) NOT NULL,
  `depName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `depName`) VALUES
(5, 'Marketing'),
(6, 'IT'),
(7, 'Sales'),
(8, 'HR'),
(9, 'Customer Services');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(4) NOT NULL,
  `empName` varchar(255) NOT NULL,
  `salary` int(4) NOT NULL,
  `depId` int(4) NOT NULL,
  `empEmail` varchar(255) NOT NULL,
  `empPass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `empName`, `salary`, `depId`, `empEmail`, `empPass`) VALUES
(16, 'mohammed', 2300, 5, 'mohamed@emp.com', '123'),
(17, 'mahmoud', 5200, 7, 'mahmoud@emp.com', '123'),
(18, 'noha', 4300, 5, 'noha@emp.com', '123'),
(19, 'ahmed', 7800, 8, 'ahmed@emp.com', '123'),
(20, 'yousra', 4100, 8, 'yousra@emp.com', '123'),
(21, 'marwan', 1400, 9, 'marwan@emp.com', '123'),
(22, 'moomen', 6300, 8, 'moomen@emp.com', '123\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(4) NOT NULL,
  `content` varchar(255) NOT NULL,
  `custId` int(4) NOT NULL,
  `prodId` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(4) NOT NULL,
  `price` int(4) NOT NULL,
  `prodQuan` int(4) NOT NULL,
  `custId` int(4) NOT NULL,
  `prodId` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `price`, `prodQuan`, `custId`, `prodId`) VALUES
(706, 200, 2, 13, 15),
(707, 200, 2, 13, 15),
(708, 200, 2, 13, 15),
(709, 100, 2, 13, 16),
(710, 800, 4, 13, 17),
(711, 7500, 3, 13, 30),
(712, 200, 2, 13, 15),
(713, 4500, 3, 13, 29);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(4) NOT NULL,
  `proName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(4) NOT NULL,
  `image` mediumtext NOT NULL,
  `adminId` int(4) NOT NULL,
  `categoryId` int(4) NOT NULL,
  `prodQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `proName`, `description`, `price`, `image`, `adminId`, `categoryId`, `prodQuantity`) VALUES
(15, 'the green room', ' punk rock band is forced to fight for survival after witnessing a murder at a neo-Nazi skinhead bar.', 100, 'The-Green-Room-by-Nag-Mani-400x600.webp', 2, 43, 4000),
(16, 'Anna dressed in blood', 'Searching for a ghost the locals call Anna Dressed in Blood, Can expects the usual.', 50, 'KendareBlakesAnnaDressedinBlood.jpg', 4, 43, 3000),
(17, 'Bird Box', ', as she tries to protect herself and two children from entities which push people who look at them to suicide.', 200, 'sub-buzz-27537-1538770241-1.jpg', 3, 43, 800),
(18, 'Fields notes on love', 'Two teens are thrown together on a cross-country train trip that will teach them about love, each other', 20, '81RitjfpepL.jpg', 3, 44, 400),
(19, 'now & when', 'Searching for a ghost the locals call Anna Dressed in Blood, Can expects the usual.', 200, 'nowandwhen (1).jpg', 2, 44, 4000),
(26, 'The happy prince an other stories', 'a comedy book include some of comedy stories take younto another world enjoy reading it ', 100, 'IMG-20210423-WA0176[1].jpg', 1, 43, 100),
(27, 'Secret history', 'Secret History, by Donna Tarte It is preferable to read this book while in college, because it talks about the secret society about the small liberal arts college that lost its way.', 150, 'IMG-20210423-WA0188[1].jpg', 1, 43, 500),
(28, 'JENNIFER EGAN', 'Goofy squad look, Jennifer Egan These interwoven narratives brilliantly crafted, loathing, the tender portraits of life, love, and the little tragedies of modern day-to-day life.', 130, 'IMG-20210423-WA0191[1].jpg', 4, 48, 450),
(29, 'Wood Guitar', 'Guitar (or guitar or ukulele): A stringed musical instrument, which is a development of the oud, and its neck is wider than that of the oud. It is played with a plastic reed or finger, and the guitar is made of 6 strings of metal or nylon', 1500, 'IMG-20210423-WA0201[1].jpg', 2, 54, 100),
(30, 'Electronic Piano', 'An electric piano is a musical instrument which produces sounds when a performer presses the keys of a piano-style musical keyboard. ... Unlike a synthesizer, the electric piano is not an electronic instrument. Instead, it is an electro-mechanical instrum', 2500, 'IMG-20210423-WA0203[1].jpg', 5, 52, 200),
(31, 'The tale of two cities (Novel)', 'The ritual the rvents of the novel revolves around the constant struggle between good and evil and the authir has made a world out of this imagination in the outmost magnification as it takes place at the middle land where many fighters between the two ty', 50, 'IMG-20210423-WA0193[1].jpg', 3, 47, 240),
(32, 'The dream of the red champer', 'The story of stone as it called or hongloumeng composed by cao xueqin it was written some time in the middle ot 18th century during the Qing dynasty', 100, 'IMG-20210423-WA0195[1].jpg', 1, 44, 120),
(33, 'The da vinci code (Dan Brown)', 'This novel was met with much objection and rejection but it captured the hearts of many and attracted them to buy it the novel narrates the events of a very mystrious murde in the louvre museum 8o million copies of the ovel has been sold', 200, 'IMG-20210423-WA0223[1].jpg', 3, 55, 200),
(34, 'The name of Rose', 'This novel was published in 1980 th novel revolves around strange accident that occur inside the monsatery ', 130, 'IMG-20210423-WA0230[1].jpg', 5, 55, 150),
(35, 'Cymbal', 'one of the oldest stringed music instrument it consists of a group of strings the notes of which are controlled by lengthening and shortening the strings it different from other stings instruments ', 1400, 'IMG-20210423-WA0212[1].jpg', 5, 54, 100),
(36, 'Trumpet ', 'one of the brass wind instrument where the group of brass wind instruments includes 4 it has 3 valves and the pressure on one valve gives 11 notes ', 1000, 'IMG-20210423-WA0213[1].jpg', 5, 46, 400),
(37, 'Tambourine and parchment ', 'is leatheer stretched into a wooden frame on one side the parchment resembles a tambourine except that its frame is narrower and small copper gongs may be added to sweeten the percussion beats the tambourine and parchment are played in different ways rang', 550, 'IMG-20210423-WA0209[1].jpg', 3, 53, 500),
(38, 'Tabla', 'Made of pottery or metal widend at one end and narrow n the middle tightened by parchment of leather or plastic ', 150, 'IMG-20210423-WA0219[1].jpg', 5, 53, 1000),
(39, 'Flowerer', 'Similar to parchment machines but it larger in size as it is twice the size of parchment and it has loud sound', 200, 'IMG-20210423-WA0220[1].jpg', 5, 53, 100),
(40, 'bossypants', 'a humorous memoir about her life in show business. She describes growing up as an awkward, smart-mouthed girl and traces the process by which she enters show business.', 30, 'bossypants.jpg', 1, 45, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `subcat`
--

CREATE TABLE `subcat` (
  `id` int(4) NOT NULL,
  `subname` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcat`
--

INSERT INTO `subcat` (`id`, `subname`, `type`) VALUES
(43, 'Horror', 'books'),
(44, 'Romance', 'books'),
(45, 'Comedy', 'books'),
(46, 'Basses', 'music'),
(47, 'Drama', 'books'),
(48, 'Education', 'books'),
(49, 'History', 'books'),
(52, 'Keys and midi', 'music'),
(53, 'percussive instrument', 'music'),
(54, 'Stringed instrument', 'music'),
(55, 'Murder', 'books'),
(56, 'fantasia', 'books');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custId` (`custId`),
  ADD KEY `prodId` (`prodId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custName` (`custName`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `depId` (`depId`),
  ADD KEY `depId_2` (`depId`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodId` (`prodId`),
  ADD KEY `custId` (`custId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodId` (`prodId`),
  ADD KEY `custId` (`custId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminId` (`adminId`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `categoryId_2` (`categoryId`);

--
-- Indexes for table `subcat`
--
ALTER TABLE `subcat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=714;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `subcat`
--
ALTER TABLE `subcat`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`custId`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`prodId`) REFERENCES `product` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`depId`) REFERENCES `department` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`prodId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`custId`) REFERENCES `customer` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`custId`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`prodId`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `subcat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
