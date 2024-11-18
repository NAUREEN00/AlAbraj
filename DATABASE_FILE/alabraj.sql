-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2024 at 11:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alabraj`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_cred`
--

CREATE TABLE `admin_cred` (
  `sr_no` int(11) NOT NULL,
  `admin_name` varchar(150) NOT NULL,
  `admin_pass` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_cred`
--

INSERT INTO `admin_cred` (`sr_no`, `admin_name`, `admin_pass`) VALUES
(1, 'AlAbraj', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `total_pay` int(11) NOT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`sr_no`, `booking_id`, `room_name`, `price`, `total_pay`, `room_no`, `user_name`, `phonenum`, `address`) VALUES
(1, 1, 'Basic Umrah', 3500, 3500, NULL, 'Hakim Al Sani', '123', 'ad'),
(2, 2, 'Brunei Muara Tour', 50, 50, '-', 'John Michael', '123', 'ad'),
(3, 3, 'Temburong Tour', 90, 90, '-', 'Sarah Ali', '123', 'ad'),
(4, 4, 'Exclusive Umrah Package ', 5600, 5600, '-', 'Haji ali', '123', 'ad'),
(5, 5, 'Temburong Tour', 90, 90, 'b12', 'Xi jau li', '123', 'ad'),
(6, 6, 'Kuala Belait Tour', 80, 80, '52g', 'Mathew lee', '12323432', 'ad2342343'),
(7, 7, 'Basic Family Package(Umrah)', 3800, 3800, NULL, 'Siti Hamsah hj Rauf', '123', 'ad'),
(8, 8, 'Basic Family Package (Umrah)', 3800, 3800, '-', 'Hj Risdhwan', '123', 'ad'),
(9, 9, 'Exclusive Umrah Package (Umrah)', 5600, 5600, '159A', 'Adam Said', '123', 'ad'),
(10, 10, 'Basic Package (Umrah)', 3800, 3800, '15S', 'Jumat bin Hj Salih', '123', 'ad'),
(11, 11, 'Premium Family Package (Umrah)', 4500, 4500, '1', 'Ismail ali', '123', 'ad'),
(12, 12, 'Basic Package (Umrah)', 3500, 3500, '2', 'Daniel lee', '123', 'ad'),
(13, 13, 'Tutong Tour', 60, 60, '23A', 'Abdullah Said', '123', 'ad'),
(14, 14, 'Basic Family Package (Umrah)', 3500, 3500, '-', 'Sadiah hj Kamil', '123', 'ad'),
(15, 15, 'Basic Family Package (Umrah)', 3500, 3500, '-', 'Shazwan321', '123', 'ad'),
(16, 16, 'Premium Package (Umrah)', 4500, 4500, '1', 'Hj Danish', '123', 'ad'),
(18, 18, 'Brunei Muara Tour', 300, 3300, NULL, 'apadayo', '7150073', 'Brunei'),
(19, 19, 'Brunei Muara Tour', 300, 300, '3', 'apadayo', '7150073', 'Brunei'),
(20, 22, 'Kuala Belait Tour', 80, 80, '6', 'apadayo', '7150073', 'Brunei'),
(21, 23, 'Brunei Muara Tour', 50, 50, '3', 'apadayo', '7150073', 'Brunei'),
(22, 24, 'Brunei Muara Tour', 50, 50, '3', 'apadayo', '7150073', 'Brunei'),
(23, 25, 'Brunei Muara Tour', 50, 50, '3', 'apadayo', '7150073', 'Brunei');

-- --------------------------------------------------------

--
-- Table structure for table `booking_order`
--

CREATE TABLE `booking_order` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `arrival` int(11) NOT NULL DEFAULT 0,
  `refund` int(11) DEFAULT NULL,
  `booking_status` varchar(100) NOT NULL DEFAULT 'pending',
  `order_id` varchar(150) NOT NULL,
  `trans_id` varchar(200) DEFAULT NULL,
  `trans_amt` int(11) NOT NULL,
  `trans_status` varchar(100) NOT NULL DEFAULT 'pending',
  `trans_resp_msg` varchar(200) DEFAULT NULL,
  `rate_review` int(11) DEFAULT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_order`
--

INSERT INTO `booking_order` (`booking_id`, `user_id`, `room_id`, `check_in`, `check_out`, `arrival`, `refund`, `booking_status`, `order_id`, `trans_id`, `trans_amt`, `trans_status`, `trans_resp_msg`, `rate_review`, `datentime`) VALUES
(1, 2, 3, '2022-07-20', '2022-07-21', 0, NULL, 'pending', 'ORD_21055700', NULL, 0, 'pending', NULL, NULL, '2022-07-20 01:50:12'),
(2, 2, 3, '2022-07-20', '2022-07-22', 1, NULL, 'booked', 'ORD_24215693', '20220720111212800110168128204225279', 600, 'TXN_SUCCESS', 'Txn Success', NULL, '2022-07-20 02:14:44'),
(3, 2, 3, '2022-07-20', '2022-07-26', 0, 1, 'cancelled', 'ORD_26312547', '20220720111212800110168165603901976', 1800, 'TXN_SUCCESS', 'Txn Success', NULL, '2022-07-20 02:19:00'),
(4, 2, 6, '2022-07-20', '2022-07-25', 0, NULL, 'payment failed', 'ORD_28394638', '20220720111212800110168372503893816', 4500, 'TXN_FAILURE', 'Your payment has been declined by your bank. Please try again or use a different method to complete the payment.', NULL, '2022-07-20 02:30:52'),
(5, 2, 6, '2022-07-20', '2022-07-21', 0, 1, 'cancelled', 'ORD_22877860', '20220720111212800110168627705312020', 900, 'TXN_SUCCESS', 'Txn Success', NULL, '2022-07-20 02:32:09'),
(6, 2, 6, '2022-07-20', '2022-07-28', 1, NULL, 'booked', 'ORD_28689687', '20220720111212800110168303704048087', 7200, 'TXN_SUCCESS', 'Txn Success', 1, '2022-07-20 02:34:46'),
(7, 2, 6, '2022-07-29', '2022-07-30', 0, NULL, 'pending', 'ORD_24272313', NULL, 0, 'pending', NULL, NULL, '2022-07-29 01:13:42'),
(8, 2, 3, '2022-08-14', '2022-08-16', 0, 1, 'cancelled', 'ORD_22541670', '20220814111212800110168092803967754', 600, 'TXN_SUCCESS', 'Txn Success', NULL, '2022-08-14 01:16:05'),
(9, 2, 5, '2022-08-15', '2022-08-20', 1, NULL, 'booked', 'ORD_25267746', '20220815111212800110168656003990120', 3000, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-15 19:32:05'),
(10, 2, 5, '2022-08-18', '2022-08-21', 1, NULL, 'booked', 'ORD_27668816', '20220815111212800110168905703947446', 1800, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-15 19:32:58'),
(11, 2, 6, '2022-08-20', '2022-08-23', 1, NULL, 'booked', 'ORD_25750549', '20220820111212800110168431303975409', 2700, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-20 00:19:57'),
(12, 2, 3, '2022-08-20', '2022-08-24', 1, NULL, 'booked', 'ORD_2445093', '20220820111212800110168173403969278', 1200, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-20 00:20:23'),
(13, 2, 4, '2022-08-20', '2022-08-26', 1, NULL, 'booked', 'ORD_29233995', '20220820111212800110168584503978338', 3000, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-20 00:20:45'),
(14, 2, 5, '2022-08-20', '2022-08-24', 1, NULL, 'booked', 'ORD_28902800', '20220820111212800110168816503988359', 2400, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-20 00:21:06'),
(15, 2, 5, '2022-08-25', '2022-08-27', 0, 1, 'cancelled', 'ORD_2240367', '20220825111212800110168807304010818', 1200, 'TXN_SUCCESS', 'Txn Success', NULL, '2019-08-21 01:51:28'),
(16, 2, 5, '2022-08-26', '2022-08-28', 1, NULL, 'booked', 'ORD_28784829', '20220825111212800110168627505415606', 1200, 'TXN_SUCCESS', 'Txn Success', 1, '2022-08-25 01:52:04'),
(17, 2, 3, '2022-09-08', '2022-09-11', 1, NULL, 'booked', 'ORD_21289330', '20220908111212800110168809204050263', 900, 'TXN_SUCCESS', 'Txn Success', 0, '2022-09-08 01:15:30'),
(18, 9, 3, '2024-11-22', '2024-12-03', 0, NULL, 'pending', 'ORD_94460762', NULL, 0, 'pending', NULL, NULL, '2024-11-18 00:59:00'),
(19, 9, 3, '0000-00-00', '0000-00-00', 0, NULL, 'confirmed', 'ORDER_673a23eb58278', NULL, 300, 'pending', NULL, NULL, '2024-11-18 01:12:11'),
(20, 9, 12, '2024-12-11', '2024-12-25', 0, NULL, 'confirmed', 'ORDER_673a2b123d067', NULL, 3200, 'pending', NULL, NULL, '2024-11-18 01:42:42'),
(21, 9, 12, '2024-12-04', '2025-01-09', 0, NULL, 'confirmed', 'ORDER_673a33b273e32', NULL, 3200, 'pending', NULL, NULL, '2024-11-18 02:19:30'),
(22, 9, 6, '0000-00-00', '0000-00-00', 0, NULL, 'confirmed', 'ORDER_673a344491d77', NULL, 80, 'pending', NULL, NULL, '2024-11-18 02:21:56'),
(23, 9, 3, '0000-00-00', '0000-00-00', 0, NULL, 'confirmed', 'ORDER_673a398fd82c2', NULL, 50, 'pending', NULL, NULL, '2024-11-18 02:44:31'),
(24, 9, 3, '0000-00-00', '0000-00-00', 0, NULL, 'confirmed', 'ORDER_673a39e8286c8', NULL, 50, 'pending', NULL, NULL, '2024-11-18 02:46:00'),
(25, 9, 3, '0000-00-00', '0000-00-00', 0, NULL, 'confirmed', 'ORDER_673a41e5a5389', NULL, 50, 'pending', NULL, NULL, '2024-11-18 03:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `sr_no` int(11) NOT NULL,
  `image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`sr_no`, `image`) VALUES
(4, 'Homepage1.png'),
(5, 'Homepage2.png'),
(6, 'Homepage3.png'),
(8, 'Homepage4.png'),
(9, 'Homepage5.png');

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `sr_no` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `gmap` varchar(100) NOT NULL,
  `pn1` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fb` varchar(100) NOT NULL,
  `insta` varchar(100) NOT NULL,
  `iframe` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`sr_no`, `address`, `gmap`, `pn1`, `email`, `fb`, `insta`, `iframe`) VALUES
(1, 'UNIT 10 BLOCK B SPG.322 WARISAN, COMPLEX GADONG, BE1718', 'https://maps.app.goo.gl/Wk5w836MzDuDFqv69', 6738782300, 'alabraj@gmail.com', 'https://www.facebook.com/', 'https://www.facebook.com/', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15900.896330886571!2d114.8808826!3d4.9021235!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x32225fa0f34b6fc1%3A0x700bcce439b6f6eb!2sAl%20Abraj%20Travels%20And%20Tours%20Sdn%20Bhd!5e0!3m2!1sen!2sbn!4v1731844443860!5m2!1sen!2sbn\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `icon`, `name`, `description`) VALUES
(13, 'IMG_43553.svg', 'Wifi', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(14, 'IMG_49949.svg', 'Air conditioner', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(15, 'IMG_41622.svg', 'Television', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(17, 'IMG_47816.svg', 'Spa', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(18, 'IMG_96423.svg', 'Room Heater', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(19, 'IMG_27079.svg', 'Geyser', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus incidunt odio quos dolore commodi repudiandae tenetur.'),
(20, 'IMG_28990.svg', 'Basic Family Package', 'Description: 4-star hotel, no breakfast or dinner, family room. Distance: 2 km from Al-Masjid An-Nabawi, 2.5 km from Masjid Al-Haram.\r\n\r\nDuration: 9 Days\r\n\r\nFeatures: Family Room, Budget-Friendly, 4-star Hotel\r\n\r\nPrice: BND 3200.00'),
(21, 'IMG_85479.svg', 'Basic Package', ''),
(22, 'IMG_41040.svg', 'Premium Package', ''),
(23, 'IMG_33160.svg', 'Exclusive Package', ''),
(24, 'IMG_24308.svg', 'Premium Family Package', ''),
(25, 'IMG_21584.svg', 'Exclusive Family Package', '');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`) VALUES
(13, 'bedroom'),
(14, 'balcony'),
(15, 'kitchen'),
(17, 'sofa');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `features` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `image`, `name`, `description`, `price`, `duration`, `features`) VALUES
(13, 'IMG_package1.jpg', 'Basic Package', '4-star hotel, no breakfast or dinner, one single bed only. Distance: 2 km from Al-Masjid An-Nabawi, 2.5 km from Masjid Al-Haram.', 3500.00, '9 Days', 'Single Bed, 4-star Hotel, Budget-Friendly'),
(14, 'IMG_package2.jpg', 'Premium Package', '4-star hotel, breakfast and dinner included, 2 single beds. Distance: 1.1 km from Al-Masjid An-Nabawi, 1.2 km from Masjid Al-Haram.', 4500.00, '14 Days', 'Breakfast, Dinner, Single Beds, 4-star Hotel, Close to Mosques'),
(15, 'IMG_package3.jpg', 'Exclusive Package', '5-star hotel, breakfast, lunch, and dinner included, twin room with 2 extra-large double beds. Distance: 0.4 km from Al-Masjid An-Nabawi, 0.6 km from Masjid Al-Haram.', 5500.00, '14 Days', 'All Meals, 5-star Hotel, Twin Beds, Luxury, Close to Mosques'),
(16, 'IMG_package4.jpg', 'Basic Family Package', '4-star hotel, no breakfast or dinner, family room. Distance: 2 km from Al-Masjid An-Nabawi, 2.5 km from Masjid Al-Haram.', 3200.00, '9 Days', 'Family Room, Budget-Friendly, 4-star Hotel'),
(17, 'IMG_package5.jpg', 'Premium Family Package', '4-star hotel, breakfast and dinner included, family room. Distance: 1.1 km from Al-Masjid An-Nabawi, 1.2 km from Masjid Al-Haram.', 4300.00, '14 Days', 'Family Room, Breakfast, Dinner, 4-star Hotel, Close to Mosques'),
(18, 'IMG_package6.jpg', 'Exclusive Family Package', '5-star hotel, breakfast, lunch, and dinner included, family suite. Distance: 0.4 km from Al-Masjid An-Nabawi, 0.6 km from Masjid Al-Haram.', 5200.00, '14 Days', 'Family Suite, All Meals, 5-star Hotel, Luxury, Close to Mosques');

-- --------------------------------------------------------

--
-- Table structure for table `rating_review`
--

CREATE TABLE `rating_review` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(200) NOT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating_review`
--

INSERT INTO `rating_review` (`sr_no`, `booking_id`, `room_id`, `user_id`, `rating`, `review`, `seen`, `datentime`) VALUES
(4, 14, 5, 2, 5, 'Every detail was meticulously planned, offering a flawless and extraordinary experience. Truly a service beyond expectations!', 1, '2022-08-20 00:22:25'),
(5, 13, 4, 3, 3, 'From start to finish, the journey was seamless and luxurious. Al Abraj sets a new standard of excellence!', 1, '2022-08-20 00:22:30'),
(6, 12, 3, 4, 1, 'Every moment was crafted with precision and care. The service was impeccable, leaving no room for improvement.', 1, '2022-08-20 00:22:34'),
(8, 14, 5, 5, 5, 'Outstanding attention to detail, unmatched professionalism, and absolute comfort made this an extraordinary experience. Highly recommended!', 1, '2022-08-20 00:22:25'),
(9, 12, 3, 6, 1, 'Exceptional quality, personalized care, and flawless execution make Al Abraj a leader in travel services. Simply perfect!', 1, '2022-08-20 00:22:34'),
(10, 12, 3, 7, 1, 'Beyond extraordinary! The level of service, comfort, and care provided went above and beyond anything I could have imagined.', 1, '2022-08-20 00:22:34'),
(11, 16, 5, 8, 3, 'Exceptional service exceeding all expectations. Al Abraj delivers flawless experiences with unparalleled attention to detail, ensuring unmatched comfort, reliability, and satisfaction.', 1, '2022-09-08 01:14:18');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `area` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `description` varchar(350) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `removed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `area`, `price`, `quantity`, `adult`, `children`, `description`, `status`, `removed`) VALUES
(1, 'hh', 159, 58, 56, 12, 2, 'asdf asd', 1, 1),
(2, 'simple room 2', 785, 159, 85, 452, 10, 'adfasdfa sd', 1, 1),
(3, 'Brunei Muara Tour', 250, 50, 10, 5, 1, 'Our agency is dedicated to providing an unforgettable Brunei-Muara tour experience, taking care of everything from transportation and itinerary planning to comfortable accommodations. We offer expert guides to showcase the region’s rich culture, iconic landmarks, and natural beauty, ensuring a memorable journey. With our comprehensive packages, you', 1, 0),
(4, 'Tutong Tour', 300, 60, 10, 3, 2, 'Our agency is dedicated to providing an enriching Tutong tour experience, managing everything from transportation and itinerary planning to comfortable accommodations. We offer expert guides to showcase Tutong’s unique culture, breathtaking landscapes, and hidden gems, ensuring a memorable journey. With our comprehensive packages, you can immerse y', 1, 0),
(5, 'Temburong Tour', 600, 90, 10, 4, 3, 'Our agency is committed to offering an unforgettable Temburong tour experience, handling everything from transportation and itinerary planning to comfortable accommodations. We provide expert guides to help you explore Temburong’s pristine rainforests, iconic Ulu Temburong National Park, and rich cultural heritage. With our comprehensive packages, ', 1, 0),
(6, 'Kuala Belait Tour', 500, 80, 12, 9, 10, '4-star hotel, no breakfast or dinner, family room. Distance: 2 km from Al-Masjid An-Nabawi, 2.5 km from Masjid Al-Haram.', 1, 0),
(9, 'Basic package (Umrah)', 760, 3800, 1, 3, 1, 'Our Basic Umrah Package offers an affordable and spiritually enriching experience, covering all the essentials for your pilgrimage. The package includes visa processing, round-trip economy flights, and comfortable standard accommodations near the holy sites in Makkah and Madinah. With shared transportation, expert religious guidance, and pre-depart', 1, 0),
(10, 'Premium Package (Umrah)', 750, 4500, 11, 1, 1, 'Our 4-Star Umrah Package combines comfort and affordability, offering a balanced and enriching pilgrimage experience. This package includes visa processing, economy-class flights, and accommodations in high-quality 4-star hotels conveniently located near the holy sites in Makkah and Madinah. With shared transportation, knowledgeable religious guide', 1, 0),
(11, 'Exclusive Package (Umrah)', 750, 5800, 11, 1, 1, 'Our Exclusive 5-Star Umrah Package offers an unparalleled pilgrimage experience, where luxury meets devotion. This distinguished package includes expedited visa processing, first-class flights, and stays in luxurious 5-star hotels, located in prime areas close to the holy sites in Makkah and Madinah. With private transportation, expert religious gu', 1, 0),
(12, 'Basic Family Package (Umrah)', 450, 3200, 10, 1, 1, 'Our Basic Family Umrah Package provides a comfortable and affordable experience for families, ensuring a fulfilling pilgrimage with ease. This package includes visa processing, economy-class flights, and accommodations in well-appointed 3-star hotels conveniently located near the holy sites in Makkah and Madinah. Families will enjoy shared transpor', 1, 0),
(13, 'Exclusive Family Package', 750, 5300, 11, 1, 1, 'Our Family Exclusive Umrah Package offers a premium and personalized pilgrimage experience for families seeking comfort and spiritual fulfillment. This exclusive package includes expedited visa processing, business-class flights, and stays in luxurious 4- or 5-star hotels, strategically located near the holy sites in Makkah and Madinah. Families wi', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_facilities`
--

CREATE TABLE `room_facilities` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `facilities_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_facilities`
--

INSERT INTO `room_facilities` (`sr_no`, `room_id`, `facilities_id`) VALUES
(78, 6, 13),
(79, 6, 14),
(80, 6, 18),
(81, 6, 19),
(82, 4, 13),
(83, 4, 14),
(84, 5, 13),
(85, 5, 14),
(86, 5, 17),
(87, 5, 18),
(88, 9, 13),
(89, 9, 14),
(90, 9, 21),
(91, 10, 13),
(92, 10, 14),
(93, 10, 15),
(94, 10, 18),
(95, 10, 22),
(96, 11, 13),
(97, 11, 14),
(98, 11, 15),
(99, 11, 18),
(100, 11, 23),
(101, 12, 20),
(102, 13, 13),
(103, 13, 14),
(104, 13, 15),
(105, 13, 18),
(106, 13, 25);

-- --------------------------------------------------------

--
-- Table structure for table `room_features`
--

CREATE TABLE `room_features` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `features_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_features`
--

INSERT INTO `room_features` (`sr_no`, `room_id`, `features_id`) VALUES
(57, 6, 13),
(58, 6, 14),
(59, 6, 15),
(60, 3, 13),
(61, 4, 13),
(62, 5, 13),
(63, 5, 14),
(64, 5, 15),
(65, 9, 13),
(66, 10, 13),
(67, 10, 14),
(68, 11, 13),
(69, 11, 14),
(70, 11, 15),
(71, 13, 13),
(72, 13, 14),
(73, 13, 15);

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `image` varchar(150) NOT NULL,
  `thumb` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`sr_no`, `room_id`, `image`, `thumb`) VALUES
(15, 6, 'KualaBelait.png', 1),
(16, 3, 'BruneiMuara.png', 1),
(17, 4, 'Tutong.png', 0),
(18, 4, 'Tutong.png', 1),
(19, 4, 'Tutong.png', 0),
(21, 5, 'Temburong.png', 0),
(22, 5, 'Temburong.png', 1),
(23, 10, 'umrah.png', 0),
(24, 10, 'umrah.png', 1),
(25, 9, 'umrah.png', 1),
(26, 12, 'IMG_94281.png', 1),
(27, 11, 'IMG_53535.png', 1),
(28, 13, 'IMG_67272.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `sr_no` int(11) NOT NULL,
  `site_title` varchar(50) NOT NULL,
  `site_about` varchar(250) NOT NULL,
  `shutdown` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`sr_no`, `site_title`, `site_about`, `shutdown`) VALUES
(1, 'Al Abraj', 'Al Abraj offers unforgettable tours around Brunei’s iconic landmarks and expert-guided Hajj and Umrah packages. Experience cultural wonders, spiritual journeys, and seamless travel services tailored for your ultimate comfort and convenience.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_details`
--

CREATE TABLE `team_details` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `picture` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_details`
--

INSERT INTO `team_details` (`sr_no`, `name`, `picture`) VALUES
(9, 'person 1', 'IMG_69318.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_cred`
--

CREATE TABLE `user_cred` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(120) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `pincode` int(11) NOT NULL,
  `dob` date NOT NULL,
  `profile` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `token` varchar(200) DEFAULT NULL,
  `t_expire` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_cred`
--

INSERT INTO `user_cred` (`id`, `name`, `email`, `address`, `phonenum`, `pincode`, `dob`, `profile`, `password`, `is_verified`, `token`, `t_expire`, `status`, `datentime`) VALUES
(2, 'Mariam Abdul Aziz', 'tjwebdev@gmail.com', 'ad', '123', 123324, '2022-06-12', 'Testimonial1.jpeg', '$2y$10$2IsUjaIwxb/UuaR7abvUNOs/VKmwy848VPsNnswF4bIFRIMDE36zm', 1, NULL, NULL, 1, '2022-06-12 16:05:59'),
(3, 'Ali Hassan', 'alihassan@gmail.com', 'Street 1', '456789123', 12345, '1990-05-14', 'testimonial2.jpeg', 'password_hash_here', 0, NULL, NULL, 1, '2024-11-17 20:02:30'),
(4, 'Sarah Khan', 'sarahkhan@gmail.com', 'Street 2', '789456123', 67890, '1992-08-20', 'testimonial3.jpeg', 'password_hash_here', 0, NULL, NULL, 1, '2024-11-17 20:02:30'),
(5, 'Ahmed Faiz', 'ahmedfaiz@gmail.com', 'Street 3', '123789456', 11223, '1995-02-11', 'testimonial4.jpeg', 'password_hash_here', 0, NULL, NULL, 1, '2024-11-17 20:02:30'),
(6, 'Zara Noor', 'zaranoor@gmail.com', 'Street 4', '987654321', 44556, '1998-10-06', 'testimonial5.jpeg', 'password_hash_here', 0, NULL, NULL, 1, '2024-11-17 20:02:30'),
(7, 'Omar Yaseen', 'omaryaseen@gmail.com', 'Street 5', '321654987', 77889, '1988-04-22', 'testimonial6.jpeg', 'password_hash_here', 0, NULL, NULL, 1, '2024-11-17 20:02:30'),
(8, 'Laila Ibrahim', 'lailaibrahim@gmail.com', 'Street 6', '654987321', 33445, '1993-07-18', 'testimonial7.jpeg', 'password_hash_here', 0, NULL, NULL, 1, '2024-11-17 20:02:30'),
(9, 'apadayo', 'apadayo544@gmail.com', 'Brunei', '7150075', 150153, '2024-10-24', 'IMG_37404.jpeg', '$2y$10$s6WHC70.bWKX6PdTfDsS3Orje4eXtBCCX9HcXVOkHHh/66SDsp.3u', 1, NULL, NULL, 1, '2024-11-18 00:57:24');

-- --------------------------------------------------------

--
-- Table structure for table `user_queries`
--

CREATE TABLE `user_queries` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` varchar(500) NOT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp(),
  `seen` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_queries`
--

INSERT INTO `user_queries` (`sr_no`, `name`, `email`, `subject`, `message`, `datentime`, `seen`) VALUES
(11, 'touseef', 'ask.tjwebdev@gmail.com', 'This is one subject', 'orem ipsum dolor sit amet, consectetur adipisicing elit. Quos voluptate vero sed tempore illo atque beatae asperiores, adipisci dicta quia nisi voluptates im', '2022-03-11 00:00:00', 1),
(13, 'test', 'apadayo544@gmail.com', 'aaa', 'aa', '2024-11-18 02:30:26', 1),
(14, 'test', 'apadayo544@gmail.com', 'aaa', 'aa', '2024-11-18 02:32:33', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_cred`
--
ALTER TABLE `admin_cred`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `facilities id` (`facilities_id`),
  ADD KEY `room id` (`room_id`);

--
-- Indexes for table `room_features`
--
ALTER TABLE `room_features`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `features id` (`features_id`),
  ADD KEY `rm id` (`room_id`);

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `team_details`
--
ALTER TABLE `team_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `user_cred`
--
ALTER TABLE `user_cred`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_queries`
--
ALTER TABLE `user_queries`
  ADD PRIMARY KEY (`sr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_cred`
--
ALTER TABLE `admin_cred`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `booking_order`
--
ALTER TABLE `booking_order`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `rating_review`
--
ALTER TABLE `rating_review`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `room_facilities`
--
ALTER TABLE `room_facilities`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `room_features`
--
ALTER TABLE `room_features`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_details`
--
ALTER TABLE `team_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_cred`
--
ALTER TABLE `user_cred`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_queries`
--
ALTER TABLE `user_queries`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`);

--
-- Constraints for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD CONSTRAINT `booking_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`),
  ADD CONSTRAINT `booking_order_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD CONSTRAINT `rating_review_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`),
  ADD CONSTRAINT `rating_review_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `rating_review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`);

--
-- Constraints for table `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD CONSTRAINT `facilities id` FOREIGN KEY (`facilities_id`) REFERENCES `facilities` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `room id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `room_features`
--
ALTER TABLE `room_features`
  ADD CONSTRAINT `features id` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `rm id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `room_images_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
