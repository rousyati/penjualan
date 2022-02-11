-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2022 at 07:57 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`, `stok`) VALUES
('BRG01', 'Laptop HP', '10000000', 6),
('BRG02', 'Laptop Acer', '11000000', 3),
('BRG03', 'Infinix', '11000000', 2),
('BRG04', 'Sony', '10000000', 1),
('BRG05', 'Acer 2021', '5000000', 2),
('BRG06', 'MacBoox', '11000000', 5),
('BRG07', 'MacBoox 2021', '12000000', 1),
('BRG08', 'MacBoox 2003', '12000000', 1),
('BRG09', 'MacBoox 2019', '12000000', 4),
('BRG10', 'MacBoox Air 2019', '14000000', 3),
('BRG11', 'MacBoox Air 2019', '14000000', 3),
('BRG12', 'MacBoox 2019', '12000000', 3),
('BRG13', 'Lenovo IdeaPad Slim 3 Laptop', '12000000', 2),
('BRG14', 'Laptop HP', '12500000', 5),
('BRG15', 'Laptop HP', '14000000', 7),
('BRG16', 'Acer', '5000000', 9),
('BRG17', 'MacBoox', '5000000', 9),
('BRG19', 'MacBoox 2021', '5000000', 7),
('BRG20', 'MacBoox', '12000000', 10),
('BRG21', 'MacBoox', '12500000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_create` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_create`) VALUES
(1, 'Rousyati', 'rous@gmail.com', 'default.jpg', '$2y$10$aMpxW5jn7m3JC.Ey.MA.dO6b5L1WuiVbGH0ocxuW/Bc3vRGT829te', 2, 1, 1636706255),
(2, 'Sopian Aji', 'aji@gmail.com', 'default.jpg', '$2y$10$I8RUpRhzAJ84igY1ErgG1u7Rn0ncxc7Hxyd/UZWRWg8noE765lspu', 2, 1, 1636706484),
(3, 'Lala', 'lala@gmail.com', 'default.jpg', '$2y$10$UbfunNgi3PtFR.fe/Z6Tx.trOwRN3A3TAXhkS4UQEmSmbmao5OE8a', 2, 1, 1636706531),
(4, 'Lila', 'lila@gmail.com', 'default.jpg', '$2y$10$GWDh.ZBbMilwce96ZH06defnyNblLwzA8.K.6oyK/YXQNyts8bXLW', 2, 1, 1636878535),
(5, 'Riska Bima', 'riska@gmail.com', 'pro1637303604.jpg', '$2y$10$gZWa9KRWL21zkYRt/ozvXu8vx8iqcNPetKCjTET2qL4Wkf.R61rsq', 2, 1, 1636942099),
(6, 'Tutik', 'tutik@gmail.com', 'default.jpg', '$2y$10$m5Id4oYKCYPYl9xPRXLUc.2/QptQZN4w7iAuvWX4a5NkL6nlLn5JO', 2, 1, 1637218537);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
