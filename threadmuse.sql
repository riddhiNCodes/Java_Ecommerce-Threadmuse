-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2025 at 06:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `threadmuse`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_amount`, `name`, `phone`, `address`, `payment_mode`, `status`, `created_at`) VALUES
(27, 4, 345, 'Siddharth', '4567890123', 'virar', 'COD', 'Out for Delivery', '2025-12-05'),
(28, 2, 3034, 'Rohit', '0987654321', 'mumbai', 'Card', 'Shipped', '2025-12-06'),
(29, 8, 2000, 'Siddhi', '4567890123', 'Thane', 'COD', 'Out for Delivery', '2025-12-06'),
(30, 8, 1045, 'Siddhi', '7886744342', 'vasai', 'Card', 'Out for Delivery', '2025-12-06'),
(31, 9, 3105, 'om', '1234567890', 'nsp dadar', 'Card', 'Shipped', '2025-12-07'),
(32, 10, 690, 'Rohit', '7886744789', 'mumbai', 'Card', 'Pending', '2025-12-08'),
(33, 11, 5460, 'Bhumi', '7864726378', 'bhayandar', 'Card', 'Shipped', '2025-12-09'),
(34, 14, 2345, 'Sneha', '7889322122', 'Mumbai', 'COD', 'Pending', '2025-12-11'),
(35, 4, 345, 'Siddharth', '7787666666', 'Bandra', 'COD', 'Pending', '2025-12-12'),
(36, 15, 760, 'Tina', '1234567890', 'oni', 'COD', 'Shipped', '2025-12-14'),
(37, 1, 3645, 'riddhi', '893434533', 'Nallasopara', 'Card', 'Pending', '2025-12-14'),
(38, 4, 600, 'Siddharth', '1234567890', 'Tulinj, Nallasopara 401209', 'Card', 'Pending', '2025-12-24'),
(39, 14, 700, 'Sneha', '6784536722', 'Mumbai', 'Card', 'Pending', '2025-12-24'),
(40, 14, 2000, 'Sneha', '6784536722', 'MUmbai', 'COD', 'Pending', '2025-12-24'),
(41, 17, 4000, 'sidhu nuse', '6755644555', 'mumbai', 'Card', 'Pending', '2025-12-24'),
(42, 1, 1400, 'riddhi', '893434533', 'dadar', 'Card', 'Delivered', '2025-12-25'),
(43, 18, 18200, 'veer', '9960769410', 'singapur', 'Card', 'Out for Delivery', '2025-12-27'),
(44, 19, 70034, 'Suman', '0987654321', 'Dadar, Mumbai', 'Card', 'Pending', '2025-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `size` varchar(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `product_name`, `category`, `size`, `price`, `quantity`, `subtotal`, `image`) VALUES
(1, 27, 106, 'formal pant womens', '', 'XS', 345, 1, 0, 'formalpant.jpg'),
(2, 28, 103, 'Jump Suite Round Neck Full Sleeve Dress for Girls', '', 'M', 2344, 1, 2344, 'kids1.jpg'),
(3, 28, 106, 'formal pant womens', '', 'XS', 345, 2, 690, 'formalpant.jpg'),
(4, 29, 112, 'Men\'s Half Sleeve Polyester Lycra Regular Fit Casual', '', 'L', 2000, 1, 2000, '61EE6mtxi3L._SY879_.jpg'),
(5, 30, 106, 'formal pant womens', '', 'XS', 345, 1, 345, 'formalpant.jpg'),
(6, 30, 111, '  Mens t-shirt  Half Sleeves, Round Neck', '', 'M', 700, 1, 700, '41jXNEFgC+L.jpg'),
(7, 31, 106, 'formal pant womens', '', 'XS', 345, 9, 3105, 'formalpant.jpg'),
(8, 32, 106, 'formal pant womens', '', 'XS', 345, 2, 690, 'formalpant.jpg'),
(9, 33, 105, 'kids western frock', '', 'XS', 380, 2, 760, 'kids1.jpg'),
(10, 33, 112, 'Men\'s Half Sleeve Polyester Lycra Regular Fit Casual', '', 'L', 2000, 2, 4000, '61EE6mtxi3L._SY879_.jpg'),
(11, 33, 111, '  Mens t-shirt  Half Sleeves, Round Neck', '', 'M', 700, 1, 700, '41jXNEFgC+L.jpg'),
(12, 34, 106, 'formal pant womens', '', 'XS', 345, 1, 345, 'formalpant.jpg'),
(13, 34, 112, 'Men\'s Half Sleeve Polyester Lycra Regular Fit Casual', '', 'L', 2000, 1, 2000, '61EE6mtxi3L._SY879_.jpg'),
(14, 35, 106, 'formal pant womens', '', 'XS', 345, 1, 345, 'formalpant.jpg'),
(15, 36, 105, 'kids western frock', '', 'XS', 380, 2, 760, 'kids1.jpg'),
(20, 37, 106, 'formal pant womens', '', 'XS', 345, 1, 345, 'formalpant.jpg'),
(21, 37, 117, 'Symbol Premium Women\'s Solid Desk-to-Dinner', '', 'XL', 2000, 1, 2000, 'top.jpg'),
(22, 37, 119, 'TOPLOT Women\'s Solid Color Co-ord Set', '', 'L', 600, 1, 600, 'office2.jpg'),
(23, 37, 120, 'Shirt for Women Stylish ', '', 'XXL', 700, 1, 700, 'office3.jpg'),
(24, 38, 119, 'TOPLOT Women\'s Solid Color Co-ord Set', '', 'L', 600, 1, 600, 'office2.jpg'),
(25, 39, 120, 'Shirt for Women Stylish ', '', 'XXL', 700, 1, 700, 'office3.jpg'),
(26, 40, 117, 'Symbol Premium Women\'s Solid Desk-to-Dinner', '', 'XL', 2000, 1, 2000, 'top.jpg'),
(27, 41, 112, 'Men\'s Half Sleeve Polyester Lycra Regular Fit Casual', '', 'L', 2000, 2, 4000, '61EE6mtxi3L._SY879_.jpg'),
(28, 42, 110, '  Mens t-shirt  Half Sleeves, Round Neck', '', 'M', 700, 2, 1400, '41jXNEFgC+L.jpg'),
(29, 43, 120, 'Shirt for Women Stylish ', '', 'XXL', 700, 26, 18200, 'office3.jpg'),
(30, 44, 103, 'Jump Suite Round Neck Full Sleeve Dress for Girls', '', 'M', 2344, 1, 2344, 'kids1.jpg'),
(31, 44, 112, 'Men\'s Half Sleeve Polyester Lycra Regular Fit Casual', '', 'L', 2000, 1, 2000, '61EE6mtxi3L._SY879_.jpg'),
(32, 44, 122, 'Western Knee length Frock/Onepiece for girls', '', 'S', 690, 1, 690, 'cw.jpg'),
(33, 44, 116, 'India Silk SareeDhakai Jamdani with Blouse Piece in Pastel Yellow ', '', 'XXL', 65000, 1, 65000, '51gcYn1GgFL._SY879_.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `descript` varchar(1000) NOT NULL,
  `category` varchar(50) NOT NULL,
  `sub_category` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `sizes` varchar(20) NOT NULL,
  `colors` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `descript`, `category`, `sub_category`, `gender`, `price`, `discount`, `sizes`, `colors`, `image`) VALUES
(102, 'Womens 3 Piece ,Suit & Pant with Dupatta', 'Dry clean only', 'office', 'Dress', 'women', 7677, 15, 'XXL', '#e4d3d3,#000000', '61KYwfYK0xL._SY879_.jpg'),
(103, 'Jump Suite Round Neck Full Sleeve Dress for Girls', 'Material typePolyester Blend\r\nLengthKnee-Length\r\nOccasion typeEngagement, Christmas, Wedding, Birthday, Reception\r\nSleeve typeLong Sleeve\r\nPatternCheckered\r\nStyleA-Line\r\nCountry of OriginIndia', 'casuals', 'dress', 'kids', 2344, 45, 'M', '#000000', 'kids1.jpg'),
(106, 'formal pant womens', 'ubefhbfhub  hjd hj dh h das c  ckjd skj ', 'office', 'dress', 'kids', 345, 0, 'XS', '#000000', 'formalpant.jpg'),
(110, '  Mens t-shirt  Half Sleeves, Round Neck', 'Product details\r\nMaterial compositionCotton\r\nFit typeRegular Fit\r\nSleeve typeHalf Sleeve\r\nLengthStandard Length\r\nNeck styleRound Neck\r\nStyleWestern\r\nCountry of OriginIndia\r\n', 'office', 'tshirt', 'men', 1000, 1, 'M,M', '#cd6565,#1a83b7,#000000', '41jXNEFgC+L.jpg'),
(112, 'Men\'s Half Sleeve Polyester Lycra Regular Fit Casual', 'Product details\r\nMaterial compositionPolyLycra\r\nFit typeRegular Fit\r\nSleeve typeHalf Sleeve\r\nCollar styleCollarless\r\nLengthStandard Length\r\nNeck styleHenley Neck\r\nCountry of OriginIndia\r\n', 'casuals', 'shirt', 'men', 2000, 10, 'L', '#ad8a8a', '61EE6mtxi3L._SY879_.jpg'),
(114, 'High-Waist Korean Style Trousers |', 'Product details\r\nMaterial typePOLY LYCRA\r\nLengthStandard Length\r\nStyleSingle Pack\r\nClosure typePull On\r\nOccasion typeNew Year, Anniversary, Honeymoon, Birthday, Valentine\'s Day\r\nCare instructionsMachine Wash\r\nCountry of OriginIndia', 'college', 'dress', 'women', 3000, 20, 'XL', '#', '51Mz22IcS6L._SY879_.jpg'),
(115, 'Bengal-looms India Silk Saree Traditional Needle Karat Nakashi with Blouse Piece in Pastel Orange', 'Product details\r\nMaterial compositionSilk\r\nWeave typeJamdani\r\nOccasion typeFestival, Party, Wedding\r\nPatternFloral\r\nCare instructionsDry Clean Only\r\nCountry of Origin india', 'ethnic', 'dress', 'women', 75000, 10, 'XXL', '#d98208,#fbf309', '51gcYn1GgFL._SY879_.jpg'),
(116, 'India Silk SareeDhakai Jamdani with Blouse Piece in Pastel Yellow ', 'Product details\r\nMaterial compositionSilk\r\nWeave typeJamdani\r\nOccasion typeFestival, Party, Wedding\r\nPatternFloral\r\nCare instructionsDry Clean Only\r\nCountry of Origin india', 'ethnic', 'saree', 'women', 65000, 10, 'XXL', '#d98208', '51gcYn1GgFL._SY879_.jpg'),
(117, 'Symbol Premium Women\'s Solid Desk-to-Dinner', 'Material composition100% Polyester\r\nPatternSolid\r\nFit typeRegular Fit\r\nSleeve typeLong Sleeve\r\nCollar styleBand Collar\r\nLengthStandard Length\r\nCountry of OriginIndia', 'office', 'dress', 'women', 2000, 10, 'XL', '#c03535', 'top.jpg'),
(119, 'TOPLOT Women\'s Solid Color Co-ord Set', 'Material typePolyester\r\nFit typeRegular\r\nStyleRegular\r\nClosure typeButton\r\nCare instructionsMachine Wash\r\nAge range descriptionAdult\r\nCountry of OriginIndia\r\n', 'office', 'dress', 'women', 600, 5, 'L', '#', 'office2.jpg'),
(120, 'Shirt for Women Stylish ', 'Material compositionCrepe\r\nFit typeRegular Fit\r\nSleeve typeLong Sleeve\r\nCollar styleSpread Collar\r\nNeck styleCollared Neck\r\nStyleSingle Pack\r\nCountry of OriginIndia\r\n', 'office', 'dress', 'women', 700, 5, 'XXL', '#24431e', 'office3.jpg'),
(122, 'Western Knee length Frock/Onepiece for girls', 'cotton, wash in cold water, do not bleach', 'casuals', 'other', 'women', 690, 10, 'S', '#ec7b4b', 'cw.jpg'),
(124, 'Globus Women Dress', 'Product details\r\nMaterial typePolyester\r\nLengthKnee-Length\r\nOccasion typeValentine\'s Day\r\nSleeve type3/4 Sleeve\r\nPatternEmbellished\r\nStyleSheath\r\nCountry of OriginIndia\r\n', 'party', 'dress', 'women', 999, 10, 'M', '#e4b4b4', 'part1.jpg'),
(125, 'Men\'s Satin Formal Shirt for Party and Office Wear', 'Product details\r\nMaterial compositionSatin\r\nPatternSolid\r\nFit typeRegular Fit\r\nSleeve typeLong Sleeve\r\nCollar styleSpread Collar\r\nNeck styleCollared Neck\r\nCountry of OriginIndia\r\n', 'party', 'shirt', 'men', 800, 5, 'XXL', '#4f4a4a', 'party2.jpg'),
(126, 'Men\'s Satin Formal Shirt for Party and Office Wear', 'Product details\r\nMaterial compositionSatin\r\nPatternSolid\r\nFit typeRegular Fit\r\nSleeve typeLong Sleeve\r\nCollar styleSpread Collar\r\nNeck styleCollared Neck\r\nCountry of OriginIndia\r\n', 'office', 'shirt', 'men', 900, 10, 'XXL', '#7f7a7a', 'party2.jpg'),
(127, 'Mens Dupion Silky Kurta Set For Festive Party Ceremony Wear', 'Product details\r\nMaterial typeSilk Blend\r\nFit typeRegular\r\nStyleClassic\r\nThemeFestive\r\nClosure typeButton\r\nCare instructionsMachine Wash\r\nCountry of OriginIndia\r\n', 'party', 'other', 'men', 2000, 15, 'Free', '#', 'party3.jpg'),
(128, 'IndoPrimo Men Shirt ', 'Product details\r\nMaterial compositionSatin\r\nFit typeRegular Fit\r\nSleeve typeLong Sleeve\r\nStyleWestern\r\nCare instructionsMachine Wash\r\nCountry of OriginIndia\r\n', 'party', 'shirt', 'men', 500, 0, 'XL', '#31033a', 'part4.jpg'),
(129, 'LITZO Western Dresses for Women (L-19-20)', 'Product details\r\nMaterial typeGeorgette\r\nLengthMaxi\r\nOccasion typeAnniversary\r\nSleeve typeLong Sleeve\r\nPatternSolid\r\nStyleDress\r\nCountry of OriginIndia', 'party', 'frock', 'women', 900, 10, 'Free', '#', 'party5.jpg'),
(130, ' Dress for Women || Western Dresses for Women || One Piece Maxi Dress ', 'Material typeGeorgette\r\nLengthMaxi\r\nOccasion typeNew Year, Bachelor Party, Honeymoon, Birthday, Valentine\'s Day\r\nSleeve typeSleeveless\r\nP', 'party', 'other', 'women', 2000, 20, 'M', '#e3cece', 'party6.jpg'),
(131, 'Miss Chase Women\'s Brick Red & Dusty Green Boat Neck Sleeveless Self Design Lace Overlaid', 'Material typePolyester\r\nLengthMaxi\r\nOccasion typeGraduation, Bachelor Party, Anniversary, Birthday, Date', 'party', 'frock', 'women', 1500, 8, 'Free', '#', 'party7.jpg'),
(132, 'Women\'s Kurta Pant Set with Embroidered Organza Dupatta', 'Material composition83% Viscose, 17% Polyester\r\nLengthCalf Length\r\nSleeve type3/4 Sleeve\r\nNeck styleV Neck\r\nStyleRegular\r\n', 'ethnic', 'dress', 'women', 2000, 10, 'L', '#ecc083', 'ethnic1.jpg'),
(133, 'Women\'s Pure Cotton Rust Co-ord Set', 'Material typeRayon\r\nFit typeRegular\r\nStyleA-Line', 'ethnic', 'dress', 'women', 8000, 20, 'XL', '#7c3638', 'ethnic2.jpg'),
(134, 'MOKOSH Women\'s Silk Anarkali & Pant with Dupatta Set', 'Material compositionSilk\r\nLengthCalf Length\r\nSleeve typeFull Sleeve\r\nNeck styleRound Neck\r\nStyleAnarkali', 'ethnic', 'dress', 'women', 30000, 25, 'XL', '#d57c7c', 'ethnic3.jpg'),
(135, 'Men\'s Silk Blend Kurta Churidar Pyjama with Ethnic Bundi Jacket Set', 'Material typeSilk Blend\r\nFit typeRegular\r\nStyleClassic\r\nThemeSilk\r\nClosure typeButton', 'ethnic', 'jacket', 'men', 4000, 10, 'XXL', '#382c90', 'ethnic4.jpg'),
(136, 'Zombom Cotton Polyester Chinese Collor Short Kurta for Men', 'Material compositionCotton Blend\r\nSleeve typeFull Sleeve\r\nLengthWaist Length', 'casuals', 'tshirt', 'men', 2000, 5, 'XL', '#3d5e31', 'ethnic5.jpg'),
(137, 'KISAH Men\'s Navy Blue Jacquard Cotton Kurta- Regular Fit Long ', 'Material compositionCotton\r\nSleeve typeFull Sleeve\r\nLengthKnee Length\r\nNeck styleMandarin Neck', 'ethnic', 'other', 'men', 5000, 20, 'XL', '#', 'ethnic6.jpg'),
(138, 'Ethluxis Men Kurta Pyjama Jacket Set', 'Material typeSilk Blend\r\nFit typeRegular\r\nStyleClassic\r\nThemeOccasion', 'ethnic', 'jacket', 'men', 3000, 5, 'XXL', '#534141', 'ethnic7.jpg'),
(139, 'DEELMO Men\'s Cotton Blend Mandarin Collar Self One Design Full Sleeve Casual Short Kurta', 'Material compositionCotton Blend\r\nSleeve typeFull Sleeve\r\nLengthShort Length\r\nNeck styleV-Neck\r\nPatternGeometric\r\n', 'casuals', 'tshirt', 'men', 600, 5, 'XL', '#', 'casual1.jpg'),
(140, 'Leriya Fashion Men\'s Formal Button Down Shirt – Slim Fit Shirt\'s for Men', 'Material compositionPOLYY COTTON\r\nPatternSolid\r\nFit typeRegular Fit\r\nSleeve typeLong Sleeve', 'casuals', 'jacket', 'unisex', 900, 10, 'XL', '#', 'cas2.jpg'),
(141, 'Dream Beauty Fashion Women\'s Bell Bottom High Waist Trouser', 'Material typePolyester Blend\r\nLengthLong Length\r\nStyleBell Bottom\r\nClosure typeElastic', 'casuals', 'pant', 'women', 500, 5, 'Free', '#', 'casy3.jpg'),
(142, 'Track Pant for Men - Stylish, Comfort Joggers for Casual & Gym Wear, Loose fit', 'Material typePolycotton\r\nLengthStandard Length\r\nStyleJogger\r\nClosure typePull On\r\nCare instructionsMachine Wash , Hand Wash', 'casuals', 'pant', 'unisex', 600, 20, 'XL', '#562424', 'casy4.jpg'),
(143, 'Womens Rayon Full Sleeve Square Neck Printed Short Kurti ', 'Womens Rayon Full Sleeve Square Neck Printed Short Kurti Stylish Ethnic & Casual Wear Top for Office, College & Daily Use\r\n', 'college', 'top', 'women', 600, 0, 'Free', '#1f0d77', 'col1.jpg'),
(144, 'Lifestyle Women\'s Chanderi', 'Sun Fashion And Lifestyle Women\'s Chanderi Stitched Printed Kurti for Girls Kurta\r\n', 'college', 'top', 'women', 500, 5, 'L', '#cf7d7d', 'col2.jpg'),
(145, ' Women\'s Oversized Half Sleeve Drop Shoulder Printed Tshirt (Color Brown)', 'LEOTUDE Women\'s Oversized Cottonblend Half Sleeve Drop Shoulder Printed Tshirt (Color Brown)\r\n', 'college', 'tshirt', 'unisex', 600, 10, 'Free', '#', 'col3.jpg'),
(146, 'Stylish Men\'s Shirt Soild Regular Fit Long Sleeve Formal Wear Purple', 'Pinkmint Casual Shirt for Men Stylish Men\'s Shirt Soild Regular Fit Long Sleeve Formal Wear Purple\r\n', 'college', 'shirt', 'men', 500, 0, 'XL', '#', 'col4.jpg'),
(147, 'TAGAS Men\'s Cargo Pant || Trousers Casual Pant|| Trackpant for Mans ', 'Material typeCotton\r\nLengthStandard Length\r\nStyleModern', 'college', 'pant', 'men', 900, 10, 'XL', '#604848', 'col5.jpg'),
(148, 'Bellstone Men\'s Polycotton Floral Regular Shirt', 'Material composition80% Cotton, 20% Polyester\r\nSleeve typeLong Sleeve\r\nNeck styleMandarin Neck\r\nPatternFloral\r\n', 'college', 'tshirt', 'men', 1000, 10, 'Free', '#837777', 'col6.jpg'),
(149, 'Women\'s Rayon Paisley Printed Tunic Western ', 'Leriya Fashion Women\'s Rayon Paisley Printed Tunic Western Tops Short Kurti – Comfortable Everyday Wear & Half Sleeves, Collar Neck (Available in Plus Size and Combo Pack of 2)\r\n', 'office', 'dress', 'women', 1000, 10, 'Free', '#a47474', 'ofice2.jpg'),
(150, 'LookMark Women\'s Cotton Blend Printed Kurta Set', 'Material typeCotton Blend\r\nFit typeRegular\r\nStyleRegular\r\nClosure typePull On\r\nCare instructionsMachine Wash', 'office', 'dress', 'women', 2000, 20, 'XXL', '#c39292', 'office4.jpg'),
(151, 'Jack and Jini Formal Pant for Men. Regular Fit, Lightweight, office', 'Jack and Jini Formal Pant for Men. Regular Fit, Lightweight, Flat Front, Premium Cotton Polyester Blend Fabric. Office, Party and Casual Wear. Non Stretchable.\r\n', 'office', 'shirt', 'men', 800, 10, 'XXL', '#5bbebc', 'office5.jpg'),
(152, 'Symbol Premium Men\'s Wrinkle-Resistant Regular Fit Cotton Formal Shirt', 'Material composition100% Cotton\r\nPatternSolid - In Twill Weave\r\nFit typeRegular Fit\r\nSleeve typeLong Sleeve', 'office', 'shirt', 'men', 2000, 10, 'XXL', '#', 'office6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`Id`, `Name`, `Email`, `Password`, `phone`) VALUES
(1, 'riddhi', 'ridd@gmail.in', '1234', '893434533'),
(4, 'Siddharth', 'sidd@gmail.com', '345', '1234567890'),
(9, 'om', 'om@gmail.com', '2323', '1234567890'),
(11, 'Bhumi', 'bhumi@gmail.com', '81204', '7584394747'),
(13, 'Rohit', 'rohit@gmail.com', '555', '4653756735'),
(14, 'Sneha', 'sneha@gmail.com', '0000', '6784536722'),
(15, 'Tina', 'tina@gmail.com', '0000', '1234567890'),
(16, 'Rishabh', 'rish@gmail.com', '1111', '8976453245'),
(17, 'sidhu nuse', 'sidhu@gmail.com', '1', '6755644555'),
(18, 'veer', 'veer@gmail.com', '0', '9960769410'),
(19, 'Suman', 'suman@gmail.com', '666', '0987654321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
