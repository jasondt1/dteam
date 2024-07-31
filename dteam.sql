-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jul 2024 pada 05.22
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dteam`
--
CREATE DATABASE IF NOT EXISTS `dteam` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dteam`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `age_ratings`
--

DROP TABLE IF EXISTS `age_ratings`;
CREATE TABLE IF NOT EXISTS `age_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `age_ratings`
--

INSERT INTO `age_ratings` (`id`, `created_at`, `updated_at`, `title`, `description`, `image_url`) VALUES
(1, '2024-07-08 22:14:54', '2024-07-08 22:14:54', 'PEGI 3', 'The content of games with a PEGI 3 rating is considered suitable for all age groups. The game should not contain any sounds or pictures that are likely to frighten young children. A very mild form of violence (in a comical context or a childlike setting) is acceptable. No bad language should be heard.', 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/2000px-PEGI_3.svg_.png'),
(2, '2024-07-08 22:14:54', '2024-07-08 22:14:54', 'PEGI 7', 'Game content with scenes or sounds that can possibly frightening to younger children should fall in this category. Very mild forms of violence (implied, non- pegi info detailed, or non-realistic violence) are acceptable for a game with a PEGI 7 rating.', 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/pegi7.png'),
(3, '2024-07-08 22:14:54', '2024-07-08 22:14:54', 'PEGI 12', 'Video games that show violence of a slightly more graphic nature towards fantasy characters or non-realistic violence towards human-like characters would fall in this age category. Sexual innuendo or sexual posturing can be present, while any bad language in this category must be mild.', 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/PEGI_12.png'),
(4, '2024-07-08 22:14:54', '2024-07-08 22:14:54', 'PEGI 16', 'This rating is applied once the depiction of violence or sexual activity reaches a stage that looks the same as would be expected in real life. The use of bad language in games with a PEGI 16 rating can be more extreme, while the use of tobacco, alcohol or illegal drugs can also be present.', 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/pegi16.png'),
(5, '2024-07-08 22:14:54', '2024-07-08 22:14:54', 'PEGI 18', 'The adult classification is applied when the level of violence reaches a stage where it becomes a depiction of gross violence, apparently motiveless killing, or violence towards defenceless characters. The glamorisation of the use of illegal drugs and of the simulation of gambling, and explicit sexual activity should also fall into this age category.', 'https://pegi.info/sites/default/files/styles/medium/public/2017-03/pegi18.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `countries`
--

INSERT INTO `countries` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, NULL, NULL, 'Afghanistan'),
(2, NULL, NULL, 'Albania'),
(3, NULL, NULL, 'Algeria'),
(4, NULL, NULL, 'Andorra'),
(5, NULL, NULL, 'Angola'),
(6, NULL, NULL, 'Antigua and Barbuda'),
(7, NULL, NULL, 'Argentina'),
(8, NULL, NULL, 'Armenia'),
(9, NULL, NULL, 'Australia'),
(10, NULL, NULL, 'Austria'),
(11, NULL, NULL, 'Azerbaijan'),
(12, NULL, NULL, 'Bahamas'),
(13, NULL, NULL, 'Bahrain'),
(14, NULL, NULL, 'Bangladesh'),
(15, NULL, NULL, 'Barbados'),
(16, NULL, NULL, 'Belarus'),
(17, NULL, NULL, 'Belgium'),
(18, NULL, NULL, 'Belize'),
(19, NULL, NULL, 'Benin'),
(20, NULL, NULL, 'Bhutan'),
(21, NULL, NULL, 'Bolivia'),
(22, NULL, NULL, 'Bosnia and Herzegovina'),
(23, NULL, NULL, 'Botswana'),
(24, NULL, NULL, 'Brazil'),
(25, NULL, NULL, 'Brunei'),
(26, NULL, NULL, 'Bulgaria'),
(27, NULL, NULL, 'Burkina Faso'),
(28, NULL, NULL, 'Burundi'),
(29, NULL, NULL, 'Cabo Verde'),
(30, NULL, NULL, 'Cambodia'),
(31, NULL, NULL, 'Cameroon'),
(32, NULL, NULL, 'Canada'),
(33, NULL, NULL, 'Central African Republic'),
(34, NULL, NULL, 'Chad'),
(35, NULL, NULL, 'Chile'),
(36, NULL, NULL, 'China'),
(37, NULL, NULL, 'Colombia'),
(38, NULL, NULL, 'Comoros'),
(39, NULL, NULL, 'Congo'),
(40, NULL, NULL, 'Costa Rica'),
(41, NULL, NULL, 'Croatia'),
(42, NULL, NULL, 'Cuba'),
(43, NULL, NULL, 'Cyprus'),
(44, NULL, NULL, 'Czech Republic'),
(45, NULL, NULL, 'Denmark'),
(46, NULL, NULL, 'Djibouti'),
(47, NULL, NULL, 'Dominica'),
(48, NULL, NULL, 'Dominican Republic'),
(49, NULL, NULL, 'Ecuador'),
(50, NULL, NULL, 'Egypt'),
(51, NULL, NULL, 'El Salvador'),
(52, NULL, NULL, 'Equatorial Guinea'),
(53, NULL, NULL, 'Eritrea'),
(54, NULL, NULL, 'Estonia'),
(55, NULL, NULL, 'Eswatini'),
(56, NULL, NULL, 'Ethiopia'),
(57, NULL, NULL, 'Fiji'),
(58, NULL, NULL, 'Finland'),
(59, NULL, NULL, 'France'),
(60, NULL, NULL, 'Gabon'),
(61, NULL, NULL, 'Gambia'),
(62, NULL, NULL, 'Georgia'),
(63, NULL, NULL, 'Germany'),
(64, NULL, NULL, 'Ghana'),
(65, NULL, NULL, 'Greece'),
(66, NULL, NULL, 'Grenada'),
(67, NULL, NULL, 'Guatemala'),
(68, NULL, NULL, 'Guinea'),
(69, NULL, NULL, 'Guinea-Bissau'),
(70, NULL, NULL, 'Guyana'),
(71, NULL, NULL, 'Haiti'),
(72, NULL, NULL, 'Honduras'),
(73, NULL, NULL, 'Hungary'),
(74, NULL, NULL, 'Iceland'),
(75, NULL, NULL, 'India'),
(76, NULL, NULL, 'Indonesia'),
(77, NULL, NULL, 'Iran'),
(78, NULL, NULL, 'Iraq'),
(79, NULL, NULL, 'Ireland'),
(80, NULL, NULL, 'Israel'),
(81, NULL, NULL, 'Italy'),
(82, NULL, NULL, 'Jamaica'),
(83, NULL, NULL, 'Japan'),
(84, NULL, NULL, 'Jordan'),
(85, NULL, NULL, 'Kazakhstan'),
(86, NULL, NULL, 'Kenya'),
(87, NULL, NULL, 'Kiribati'),
(88, NULL, NULL, 'Korea, North'),
(89, NULL, NULL, 'Korea, South'),
(90, NULL, NULL, 'Kosovo'),
(91, NULL, NULL, 'Kuwait'),
(92, NULL, NULL, 'Kyrgyzstan'),
(93, NULL, NULL, 'Laos'),
(94, NULL, NULL, 'Latvia'),
(95, NULL, NULL, 'Lebanon'),
(96, NULL, NULL, 'Lesotho'),
(97, NULL, NULL, 'Liberia'),
(98, NULL, NULL, 'Libya'),
(99, NULL, NULL, 'Liechtenstein'),
(100, NULL, NULL, 'Lithuania'),
(101, NULL, NULL, 'Luxembourg'),
(102, NULL, NULL, 'Madagascar'),
(103, NULL, NULL, 'Malawi'),
(104, NULL, NULL, 'Malaysia'),
(105, NULL, NULL, 'Maldives'),
(106, NULL, NULL, 'Mali'),
(107, NULL, NULL, 'Malta'),
(108, NULL, NULL, 'Marshall Islands'),
(109, NULL, NULL, 'Mauritania'),
(110, NULL, NULL, 'Mauritius'),
(111, NULL, NULL, 'Mexico'),
(112, NULL, NULL, 'Micronesia'),
(113, NULL, NULL, 'Moldova'),
(114, NULL, NULL, 'Monaco'),
(115, NULL, NULL, 'Mongolia'),
(116, NULL, NULL, 'Montenegro'),
(117, NULL, NULL, 'Morocco'),
(118, NULL, NULL, 'Mozambique'),
(119, NULL, NULL, 'Myanmar'),
(120, NULL, NULL, 'Namibia'),
(121, NULL, NULL, 'Nauru'),
(122, NULL, NULL, 'Nepal'),
(123, NULL, NULL, 'Netherlands'),
(124, NULL, NULL, 'New Zealand'),
(125, NULL, NULL, 'Nicaragua'),
(126, NULL, NULL, 'Niger'),
(127, NULL, NULL, 'Nigeria'),
(128, NULL, NULL, 'North Macedonia'),
(129, NULL, NULL, 'Norway'),
(130, NULL, NULL, 'Oman'),
(131, NULL, NULL, 'Pakistan'),
(132, NULL, NULL, 'Palau'),
(133, NULL, NULL, 'Palestine'),
(134, NULL, NULL, 'Panama'),
(135, NULL, NULL, 'Papua New Guinea'),
(136, NULL, NULL, 'Paraguay'),
(137, NULL, NULL, 'Peru'),
(138, NULL, NULL, 'Philippines'),
(139, NULL, NULL, 'Poland'),
(140, NULL, NULL, 'Portugal'),
(141, NULL, NULL, 'Qatar'),
(142, NULL, NULL, 'Romania'),
(143, NULL, NULL, 'Russia'),
(144, NULL, NULL, 'Rwanda'),
(145, NULL, NULL, 'Saint Kitts and Nevis'),
(146, NULL, NULL, 'Saint Lucia'),
(147, NULL, NULL, 'Saint Vincent and the Grenadines'),
(148, NULL, NULL, 'Samoa'),
(149, NULL, NULL, 'San Marino'),
(150, NULL, NULL, 'Sao Tome and Principe'),
(151, NULL, NULL, 'Saudi Arabia'),
(152, NULL, NULL, 'Senegal'),
(153, NULL, NULL, 'Serbia'),
(154, NULL, NULL, 'Seychelles'),
(155, NULL, NULL, 'Sierra Leone'),
(156, NULL, NULL, 'Singapore'),
(157, NULL, NULL, 'Slovakia'),
(158, NULL, NULL, 'Slovenia'),
(159, NULL, NULL, 'Solomon Islands'),
(160, NULL, NULL, 'Somalia'),
(161, NULL, NULL, 'South Africa'),
(162, NULL, NULL, 'South Sudan'),
(163, NULL, NULL, 'Spain'),
(164, NULL, NULL, 'Sri Lanka'),
(165, NULL, NULL, 'Sudan'),
(166, NULL, NULL, 'Suriname'),
(167, NULL, NULL, 'Sweden'),
(168, NULL, NULL, 'Switzerland'),
(169, NULL, NULL, 'Syria'),
(170, NULL, NULL, 'Taiwan'),
(171, NULL, NULL, 'Tajikistan'),
(172, NULL, NULL, 'Tanzania'),
(173, NULL, NULL, 'Thailand'),
(174, NULL, NULL, 'Timor-Leste'),
(175, NULL, NULL, 'Togo'),
(176, NULL, NULL, 'Tonga'),
(177, NULL, NULL, 'Trinidad and Tobago'),
(178, NULL, NULL, 'Tunisia'),
(179, NULL, NULL, 'Turkey'),
(180, NULL, NULL, 'Turkmenistan'),
(181, NULL, NULL, 'Tuvalu'),
(182, NULL, NULL, 'Uganda'),
(183, NULL, NULL, 'Ukraine'),
(184, NULL, NULL, 'United Arab Emirates'),
(185, NULL, NULL, 'United Kingdom'),
(186, NULL, NULL, 'United States'),
(187, NULL, NULL, 'Uruguay'),
(188, NULL, NULL, 'Uzbekistan'),
(189, NULL, NULL, 'Vanuatu'),
(190, NULL, NULL, 'Vatican City'),
(191, NULL, NULL, 'Venezuela'),
(192, NULL, NULL, 'Vietnam'),
(193, NULL, NULL, 'Yemen'),
(194, NULL, NULL, 'Zambia'),
(195, NULL, NULL, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Struktur dari tabel `friendlists`
--

DROP TABLE IF EXISTS `friendlists`;
CREATE TABLE IF NOT EXISTS `friendlists` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id_1` bigint(20) UNSIGNED NOT NULL,
  `user_id_2` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `friendlists_user_id_1_foreign` (`user_id_1`),
  KEY `friendlists_user_id_2_foreign` (`user_id_2`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `friendlists`
--

INSERT INTO `friendlists` (`id`, `created_at`, `updated_at`, `user_id_1`, `user_id_2`) VALUES
(8, '2024-07-16 03:19:10', '2024-07-16 03:19:10', 8, 6),
(10, '2024-07-16 19:01:06', '2024-07-16 19:01:06', 5, 8),
(54, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 120),
(55, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 121),
(56, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 122),
(57, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 123),
(58, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 124),
(59, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 125),
(60, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 126),
(61, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 127),
(62, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 128),
(63, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 129),
(64, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 130),
(65, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 131),
(66, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 132),
(67, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 133),
(68, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 134),
(69, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 135),
(70, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 136),
(71, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 137),
(72, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 138),
(73, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 139),
(74, '2024-07-22 08:27:34', '2024-07-22 08:27:34', 8, 140),
(75, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 130),
(76, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 131),
(77, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 132),
(78, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 133),
(79, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 134),
(80, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 135),
(81, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 136),
(82, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 137),
(83, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 138),
(85, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 140),
(86, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 141),
(87, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 142),
(88, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 143),
(89, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 144),
(90, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 145),
(91, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 146),
(92, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 147),
(93, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 148),
(94, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 149),
(95, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 150),
(96, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 151),
(97, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 152),
(98, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 153),
(99, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 154),
(100, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 155),
(101, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 156),
(102, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 157),
(103, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 158),
(104, '2024-07-22 08:37:45', '2024-07-22 08:37:45', 5, 159);

-- --------------------------------------------------------

--
-- Struktur dari tabel `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE IF NOT EXISTS `friend_requests` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id_1` bigint(20) UNSIGNED NOT NULL,
  `user_id_2` bigint(20) UNSIGNED NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `friend_requests_user_id_1_foreign` (`user_id_1`),
  KEY `friend_requests_user_id_2_foreign` (`user_id_2`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `created_at`, `updated_at`, `user_id_1`, `user_id_2`, `status`) VALUES
(42, '2024-07-16 21:31:24', '2024-07-16 21:31:24', 5, 6, 'pending'),
(43, '2024-07-16 21:36:24', '2024-07-16 21:36:24', 6, 110, 'pending'),
(44, '2024-07-16 21:36:45', '2024-07-16 21:36:45', 6, 111, 'pending'),
(45, '2024-07-16 21:36:46', '2024-07-16 21:36:46', 6, 112, 'pending'),
(46, '2024-07-16 21:40:51', '2024-07-16 21:40:51', 6, 114, 'pending'),
(47, '2024-07-16 21:42:21', '2024-07-16 21:42:21', 6, 123, 'pending'),
(48, '2024-07-16 21:43:25', '2024-07-16 21:43:25', 6, 128, 'pending'),
(49, '2024-07-16 21:44:05', '2024-07-16 21:44:05', 6, 133, 'pending'),
(50, '2024-07-16 21:44:47', '2024-07-16 21:44:47', 6, 139, 'pending'),
(51, '2024-07-16 21:44:50', '2024-07-16 21:44:50', 6, 140, 'pending'),
(52, '2024-07-16 21:45:40', '2024-07-16 21:45:40', 6, 158, 'pending'),
(53, '2024-07-16 21:46:01', '2024-07-16 21:46:01', 6, 206, 'pending'),
(54, '2024-07-16 22:12:10', '2024-07-16 22:12:10', 5, 111, 'pending'),
(55, '2024-07-16 22:12:11', '2024-07-16 22:12:11', 112, 5, 'pending'),
(56, '2024-07-16 22:18:01', '2024-07-16 22:18:01', 5, 110, 'pending'),
(59, '2024-07-26 04:22:38', '2024-07-26 04:22:38', 5, 115, 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trailer_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `released_date` date NOT NULL,
  `price` bigint(20) NOT NULL,
  `discount_percentage` bigint(20) NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `age_rating_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `games_publisher_id_foreign` (`publisher_id`),
  KEY `games_age_rating_id_foreign` (`age_rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `games`
--

INSERT INTO `games` (`id`, `created_at`, `updated_at`, `title`, `trailer_url`, `brief_description`, `full_description`, `released_date`, `price`, `discount_percentage`, `publisher_id`, `age_rating_id`) VALUES
(5, '2024-07-08 22:56:35', '2024-07-08 22:56:35', 'Batman™: Arkham Knight', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1720504496980?alt=media&token=88cbed5f-eec6-47ea-a20a-abc8dbc38ba7', 'Batman™: Arkham Knight brings the award-winning Arkham trilogy from Rocksteady Studios to its epic conclusion. Developed exclusively for New-Gen platforms, Batman: Arkham Knight introduces Rocksteady\'s uniquely designed version of the Batmobile.', '<p>Batman&trade;: Arkham Knight brings the award-winning Arkham trilogy from Rocksteady Studios to its epic conclusion. Developed exclusively for New-Gen platforms, Batman: Arkham Knight introduces Rocksteady\'s uniquely designed version of the Batmobile. The highly anticipated addition of this legendary vehicle, combined with the acclaimed gameplay of the Arkham series, offers gamers the ultimate and complete Batman experience as they tear through the streets and soar across the skyline of the entirety of Gotham City. In this explosive finale, Batman faces the ultimate threat against the city that he is sworn to protect, as Scarecrow returns to unite the super criminals of Gotham and destroy the Batman forever.</p>\r\n<h2 class=\"bb_tag\">Product Features:</h2>\r\n<ul class=\"bb_ul\">\r\n<li>&ldquo;Be The Batman&rdquo; &ndash; Live the complete Batman experience as the Dark Knight enters the concluding chapter of Rocksteady&rsquo;s Arkham trilogy. Players will become The World&rsquo;s Greatest Detective like never before with the introduction of the Batmobile and enhancements to signature features such as FreeFlow Combat, stealth, forensics and navigation.<br><br></li>\r\n<li>Introducing the Batmobile &ndash; The Batmobile is brought to life with a completely new and original design featuring a distinct visual appearance and a full range of on-board high-tech gadgetry. Designed to be fully drivable throughout the game world and capable of transformation from high speed pursuit mode to military grade battle mode, this legendary vehicle sits at the heart of the game&rsquo;s design and allows players to tear through the streets at incredible speeds in pursuit of Gotham City&rsquo;s most dangerous villains. This iconic vehicle also augments Batman&rsquo;s abilities in every respect, from navigation and forensics to combat and puzzle solving creating a genuine and seamless sense of the union of man and machine.<br><br></li>\r\n<li>The Epic Conclusion to Rocksteady&rsquo;s Arkham Trilogy &ndash; Batman: Arkham Knight brings all-out war to Gotham City. The hit-and-run skirmishes of Batman: Arkham Asylum, which escalated into the devastating conspiracy against the inmates in Batman: Arkham City, culminates in the ultimate showdown for the future of Gotham. At the mercy of Scarecrow, the fate of the city hangs in the balance as he is joined by the Arkham Knight, a completely new and original character in the Batman universe, as well as a huge roster of other infamous villains including Harley Quinn, The Penguin, Two-Face and the Riddler.<br><br></li>\r\n<li>Explore the entirety of Gotham City &ndash; For the first time, players have the opportunity to explore all of Gotham City in a completely open and free-roaming game world. More than five times that of Batman: Arkham City, Gotham City has been brought to life with the same level of intimate, hand-crafted attention to detail for which the Arkham games are known.<br><br></li>\r\n<li>Most Wanted Side Missions &ndash; Players can fully immerse themselves in the chaos that is erupting in the streets of Gotham. Encounters with high-profile criminal masterminds are guaranteed while also offering gamers the opportunity to focus on and takedown individual villains or pursue the core narrative path.<br><br></li>\r\n<li>New Combat and Gadget Features &ndash; Gamers have at their disposal more combat moves and high-tech gadgetry than ever before. The new &lsquo;gadgets while gliding&rsquo; ability allows Batman to deploy gadgets such as batarangs, the grapnel gun or the line launcher mid-glide while Batman&rsquo;s utility belt is once again upgraded to include all new gadgets that expand his range of forensic investigation, stealth incursion and combat skills.</li>\r\n</ul>', '2024-02-06', 0, 0, 1, 5),
(6, '2024-07-08 23:00:11', '2024-07-08 23:00:11', 'The Witcher 3: Wild Hunt', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1720504708265?alt=media&token=fb420fda-012c-41bc-9a34-ee601d998dd8', 'You are Geralt of Rivia, mercenary monster slayer. Before you stands a war-torn, monster-infested continent you can explore at will. Your current contract? Tracking down Ciri — the Child of Prophecy, a living weapon that can alter the shape of the world.', '<div class=\"game_page_autocollapse_ctn expanded\">\r\n<div id=\"aboutThisGame\" class=\"game_page_autocollapse\" data-panel=\"{&quot;type&quot;:&quot;PanelGroup&quot;}\">\r\n<div id=\"game_area_description\" class=\"game_area_description\">THE MOST AWARDED GAME OF A GENERATION<br>NOW ENHANCED FOR THE NEXT<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/extras/ABOUT_600x225_EN.png?t=1716793585\"><br><br>You are Geralt of Rivia, mercenary monster slayer. Before you stands a war-torn, monster-infested continent you can explore at will. Your current contract? Tracking down Ciri &mdash; the Child of Prophecy, a living weapon that can alter the shape of the world.<br><br>Updated to the latest version, The Witcher 3: Wild Hunt comes with new features and items, including a built-in Photo Mode, swords, armor, and alternate outfits inspired by The Witcher Netflix series &mdash; and more!<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/extras/Updated_600x255__EN.png?t=1716793585\"><br><br>Behold the dark fantasy world of the Continent like never before! This edition of The Witcher 3: Wild Hunt has been enhanced with numerous visual and technical improvements, including vastly improved level of detail, a range of community created and newly developed mods for the game, real-time ray tracing, and more &mdash; all implemented with the power of modern PCs in mind.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/extras/Monster_Slayer_600x255_EN.png?t=1716793585\"><br><br>Trained from early childhood and mutated to gain superhuman skills, strength, and reflexes, witchers are a counterbalance to the monster-infested world in which they live.<br>&bull; Gruesomely destroy foes as a professional monster hunter armed with a range of upgradeable weapons, mutating potions, and combat magic.<br>&bull; Hunt down a wide variety of exotic monsters, from savage beasts prowling mountain passes to cunning supernatural predators lurking in the shadowy back alleys of densely populated cities.<br>&bull; Invest your rewards to upgrade your weaponry and buy custom armor, or spend them on horse races, card games, fist fighting, and other pleasures life brings.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/extras/Open_World_600x255_EN.png?t=1716793585\"><br><br>Built for endless adventure, the massive open world of The Witcher sets new standards in terms of size, depth, and complexity.<br>&bull; Traverse a fantastical open world: explore forgotten ruins, caves, and shipwrecks, trade with merchants and dwarven smiths in cities, and hunt across the open plains, mountains, and seas.<br>&bull; Deal with treasonous generals, devious witches, and corrupt royalty to provide dark and dangerous services.<br>&bull; Make choices that go beyond good &amp; evil, and face their far-reaching consequences.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/extras/Child_of_Prophercy_600x255_EN.png?t=1716793585\"><br><br>Take on the most important contract of your life: to track down the child of prophecy, the key to saving or destroying this world.<br>&bull; In times of war, chase down the child of prophecy, a living weapon foretold by ancient elven legends.<br>&bull; Struggle against ferocious rulers, spirits of the wilds, and even a threat from beyond the veil &ndash; all hell-bent on controlling this world.<br>&bull; Define your destiny in a world that may not be worth saving.</div>\r\n</div>\r\n</div>\r\n<div class=\"game_page_autocollapse_ctn\">\r\n<div class=\"game_page_autocollapse\">\r\n<div id=\"game_area_content_descriptors\" class=\"game_area_description\">\r\n<h2>MATURE CONTENT DESCRIPTION</h2>\r\n<p>The developers describe the content like this:</p>\r\n<p><em>The Witcher 3: Wild Hunt contains strong language, intense violence, blood and gore, as well as nudity and sexual material.</em></p>\r\n</div>\r\n</div>\r\n</div>', '2024-07-09', 500000, 0, 1, 5),
(7, '2024-07-08 23:02:27', '2024-07-08 23:02:27', 'Elden Ring', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1720504924263?alt=media&token=dad6e088-b0eb-4fc5-b5bc-9227fc142649', 'THE NEW FANTASY ACTION RPG. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.', '<p>THE NEW FANTASY ACTION RPG.<br>Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.</p>\r\n<h2 class=\"bb_tag\">&bull; A Vast World Full of Excitement</h2>\r\n<p>A vast world where open fields with a variety of situations and huge dungeons with complex and three-dimensional designs are seamlessly connected. As you explore, the joy of discovering unknown and overwhelming threats await you, leading to a high sense of accomplishment.</p>\r\n<h2 class=\"bb_tag\">&bull; Create your Own Character</h2>\r\n<p>In addition to customizing the appearance of your character, you can freely combine the weapons, armor, and magic that you equip. You can develop your character according to your play style, such as increasing your muscle strength to become a strong warrior, or mastering magic.</p>\r\n<h2 class=\"bb_tag\">&bull; An Epic Drama Born from a Myth</h2>\r\n<p>A multilayered story told in fragments. An epic drama in which the various thoughts of the characters intersect in the Lands Between.</p>\r\n<h2 class=\"bb_tag\">&bull; Unique Online Play that Loosely Connects You to Others</h2>\r\n<p>In addition to multiplayer, where you can directly connect with other players and travel together, the game supports a unique asynchronous online element that allows you to feel the presence of others.</p>', '2024-01-15', 500000, 0, 1, 5),
(8, '2024-07-08 23:07:03', '2024-07-08 23:07:03', 'The Last of Us™ Part I', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1720505201317?alt=media&token=87475988-483e-4372-bae3-36da56b3f3c0', 'Experience the emotional storytelling and unforgettable characters in The Last of Us™, winner of over 200 Game of the Year awards.', '<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/extras/d20220516_TLOUX_Annouce_Stills_9_WM_STEAM.png?t=1717621627\"><br>Experience the emotional storytelling and unforgettable characters in The Last of Us&trade;, winner of over 200 Game of the Year awards.<br><br>In a ravaged civilization, where infected and hardened survivors run rampant, Joel, a weary protagonist, is hired to smuggle 14-year-old Ellie out of a military quarantine zone. However, what starts as a small job soon transforms into a brutal cross-country journey.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/extras/d20220516_TLOUPTI_LAUNCH_Stills_10_WM_STEAM.png?t=1717621627\"><br>Includes the complete The Last of Us single-player story and celebrated prequel chapter, Left Behind, which explores the events that changed the lives of Ellie and her best friend Riley forever.</p>\r\n<h2 class=\"bb_tag\">Built for PC</h2>\r\n<p><br>The Last of Us Part I PC release brings with it plenty of PC features to bring Joel and Ellie&rsquo;s tense and unforgettable journey to life. This version of The Last of Us Part I is optimized for PC with PC-centric quality-of-life enhancements. Part I will feature AMD FSR 2.2 support*, Nvidia DLSS Super Resolution support*, VSync and frame rate cap options, and a host of features designed specifically for PC, including adjustable Texture Quality, Shadows, Reflections, Ambient Occlusion, and more.<br><br>Through the experiences of Joel and Ellie, PC players can fully immerse themselves in beautiful yet haunting environments in stunning detail with true 4K resolutions**. From the harsh, oppressive streets of the Boston QZ to the overgrown and abandoned homes of Bill&rsquo;s Town to so much more, embark on a beautiful journey across the United States of America with Ultra-Wide Monitor Support for both 21:9 Ultrawide and 32:9 Super Ultrawide aspect ratios.<br><br>Experience all these locations, stealthily sneaking through abandoned homes and cities (and picking their drawers and cabinets clean looking for supplies) or engage in tense, captivating action with 3D audio support to better hear the rustle of leaves, the crack of glass, or the footfalls of enemies trying to ambush you***.</p>\r\n<h2 class=\"bb_tag\">AMD Fidelity FX Super Resolution 2</h2>\r\n<p><br>Supercharge your framerates and fight for survival as Joel and Ellie with next-level temporal upscaling technology from AMD. FSR 2 uses cutting-edge algorithms to boost your framerates and deliver high-quality, high-resolution game experiences in The Last of Us Part I across a wide range of compatible graphics cards.</p>\r\n<h2 class=\"bb_tag\">Peripheral Support</h2>\r\n<p><br>The Last of Us Part I on PC features DualSense support through a wired connection so players can feel the impact of battle, the rumble of a tank rolling by, and so much more through haptic feedback and dynamic triggers. With support for the DualShock 4 controller, a wide range of other gamepads, and keyboard and mouse, players can adjust their playstyle to suit their preferences. The PC release includes a number of new control customization options including full control remapping, primary and secondary bindings for keyboard and mouse control, an adaptive mode that allows players to combine keyboard and controller inputs, and more. Part I&rsquo;s PC launch will also include The Last of Us Part I&rsquo;s suite of accessibility features so that players can adjust the experience to suit their needs and preferences.<br><br>* Compatible PC and graphics card required for enhanced graphics.<br>** Compatible PC, graphics card, and 4K display device required.<br>*** 3D Audio requires stereo headphones or compatible speakers.</p>', '2021-06-25', 800000, 0, 3, 4),
(9, '2024-07-09 00:08:42', '2024-07-09 00:08:42', 'Tom Clancy\'s Ghost Recon® Wildlands', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1720508859387?alt=media&token=46ce8acf-2eda-4976-9d3a-bf9bbf730e56', 'Create a team with up to 3 friends in Tom Clancy’s Ghost Recon® Wildlands and enjoy the ultimate military shooter experience set in a massive, dangerous, and responsive open world.', '<p>Create a team with up to 3 friends in Tom Clancy&rsquo;s Ghost Recon&reg; Wildlands and enjoy the ultimate military shooter experience set in a massive, dangerous, and responsive open world. You can also play PVP in 4v4 class-based, tactical fights: Ghost War.<br><br><strong>TAKE DOWN THE CARTEL</strong><br>In a near future, Bolivia has fallen into the hands of Santa Blanca, a merciless drug cartel who spread injustice and violence. Their objective: to create the biggest Narco-State in history.<br><br><strong>BECOME A GHOST</strong><br>Create and fully customize your Ghost, weapons, and gear. Enjoy a total freedom of playstyle. Lead your team and take down the cartel, either solo or with up to three friends.<br><br><strong>EXPLORE BOLIVIA</strong><br>Journey through Ubisoft\'s largest action-adventure open world. Discover the stunning diverse landscapes of the Wildlands both on and off road, in the air, on land, and at sea with over 60 different vehicles.<br><br><strong>TRUST YOUR EYES</strong><br>Taking out the Santa Blanca Cartel becomes an even richer experience with Tobii Eye Tracking. Features like Extended View, Aim at Gaze and Communications Wheel let you use your natural eye movement to interact with the environment &ndash; without interrupting or modifying your traditional controls. Now armed with an extensive eye tracking feature set, team communication becomes more seamless, firefights become more intense and exploring your new surroundings becomes an even more immersive adventure.<br><br>Compatible with all Tobii Eye Tracking gaming devices.<br>----<br>Additional notes:<br>Eye tracking features available with Tobii Eye Tracking.</p>', '2024-07-09', 51000, 30, 2, 4),
(10, '2024-07-09 00:27:17', '2024-07-09 00:27:17', 'Palworld', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1720509981959?alt=media&token=48d0a4a1-44d6-437c-a771-6151c16c4f33', 'Fight, farm, build and work alongside mysterious creatures called \"Pals\" in this completely new multiplayer, open world survival and crafting game!', '<p>Q. What kind of game is this?<br><br>A. In this game, you can peacefully live alongside mysterious creatures known as Pals or risk your life to drive off a ruthless poaching syndicate.<br><br>Pals can be used to fight, or they can be made to work on farms or factories.<br>You can even sell them or eat them!<br><br><br><strong><u>Survival</u></strong><br>In a harsh environment where food is scarce and vicious poachers roam, danger waits around every corner. To survive, you must tread carefully and make difficult choices...even if that means eating your own Pals when the time comes.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif01_survival.gif?t=1719480904\"><br><br><strong><u>Mounts &amp; Exploration</u></strong><br>Pals can be mounted to traverse the land, sea and sky&mdash;allowing you to traverse all kinds of environment as you explore the world.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif02_riding.gif?t=1719480904\"><br><br><strong><u>Building Structures</u></strong><br>Want to build a pyramid? Put an army of Pals on the job. Don\'t worry; there are no labor laws for Pals.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif03_building.gif?t=1719480904\"><br><br><strong><u>Production</u></strong><br>Make use of Pals and their skills to make fire, generate electricity, or mine ore so that you can live a life of comfort.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif04_life.gif?t=1719480904\"><br><br><strong><u>Farming</u></strong><br>Some Pals are good at planting seeds, while others are skilled at watering or harvesting crops. Work together with your Pals to create an idyllic farmstead.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif05_farming.gif?t=1719480904\"><br><br><strong><u>Factories &amp; Automation</u></strong><br>Letting Pals do the work is the key to automation. Build a factory, place a Pal in it, and they\'ll keep working as long as they\'re fed&mdash;until they\'re dead, that is.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif06_factory.gif?t=1719480904\"><br><br><strong><u>Dungeon Exploration</u></strong><br>With Pals on your side you can tackle even the most dangerous areas. When the time comes, you might have to sacrifice one to save your skin. They\'ll protect your life&mdash;even if it costs their own.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif07_dungeon.gif?t=1719480904\"><br><br><strong><u>Breeding &amp; Genetics</u></strong><br>Breed a Pal and it will inherit the characteristics of its parents. Combine rare pals to create the strongest Pal of them all!<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif08_breeding.gif?t=1719480904\"><br><br><strong><u>Poaching &amp; Crime</u></strong><br>Endangered Pals live in wildlife sanctuaries. Sneak in and capture rare Pals to get rich quick! It\'s not a crime if you don\'t get caught, after all.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif09_poaching.gif?t=1719480904\"><br><br><strong><u>Multiplayer</u></strong><br>Multiplayer is supported, so invite a friend and go on an adventure together! And of course you can battle your friends and trade Pals, too.<br><br>In online co-op play mode, up to 4 players can play together.<br>Additionally, a dedicated server can allow up to 32 players to play together.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1623730/extras/gif10_multiplay.gif?t=1719480904\"></p>', '2024-07-10', 200000, 20, 1, 1),
(11, '2024-07-22 21:16:04', '2024-07-26 04:41:02', 'The Quarry', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721708148267?alt=media&token=a89cd21f-f0dd-4951-9266-2fee48825451', 'When the sun goes down on the last night of summer camp, nine teenage counselors are plunged into an unpredictable night of horror. The only thing worse than the blood-drenched locals and creatures hunting them are the unimaginable choices you must make to help them survive.', '<p>As the sun sets on the last day of summer camp, the teenage counselors of Hackett&rsquo;s Quarry throw a party to celebrate. No kids. No adults. No rules.<br><br>Things quickly take a turn for the worse.<br><br>Hunted by blood-drenched locals and something far more sinister, the teens\' party plans unravel into an unpredictable night of horror. Friendly banter and flirtations give way to life-or-death decisions, as relationships build or break under the strain of unimaginable choices.<br><br>Play as each of the nine camp counselors in a thrilling cinematic tale, where every decision shapes your unique story from a tangled web of possibilities. Any character can be the star of the show&mdash;or die before daylight comes.<br><br>How will your story unfold?<br><br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1577120/extras/forest_zoom.gif?t=1675190448\"></p>\r\n<h2 class=\"bb_tag\">YOUR STORY, THEIR FATE</h2>\r\n<p>Will you dare to check what\'s behind that trap door? Will you investigate the screams echoing from within the forest? Will you save your friends or desperately run for your life? Every choice, big or small, shapes your story and determines who lives to tell the tale.<br><br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1577120/extras/max_attack.gif?t=1675190448\"></p>\r\n<h2 class=\"bb_tag\">A STUNNING CINEMATIC EXPERIENCE</h2>\r\n<p>Cutting edge facial capture and filmic lighting techniques, combined with incredible performances from an iconic ensemble cast of Hollywood talent, bring the horrors of Hackett&rsquo;s Quarry to life in a pulse-pounding, cinematic thrill ride.<br><br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1577120/extras/abi_scream.gif?t=1675190448\"></p>\r\n<h2 class=\"bb_tag\">ENJOY THE FRIGHT WITH FRIENDS</h2>\r\n<p>Place your faith in up to 7 friends in online play*, where invited players watch along and vote on key decisions, creating a story shaped by the whole group! Or, play together in a party horror couch co-op experience where each player picks a counselor and controls their actions.<br><br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1577120/extras/ryan_hey.gif?t=1675190448\"></p>\r\n<h2 class=\"bb_tag\">CUSTOMIZE YOUR EXPERIENCE</h2>\r\n<p>Adjustable difficulty for all gameplay elements let players of any skill level enjoy the horror. And if you prefer to watch rather than play, Movie Mode lets you enjoy The Quarry as a binge-worthy cinematic thriller. Select how you want the story to unfold, kick back, and munch on some popcorn in between all the screams!</p>', '2022-06-10', 659000, 24, 1, 5),
(12, '2024-07-22 21:20:08', '2024-07-22 21:20:08', 'Baldur\'s Gate 3', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721708393646?alt=media&token=b1a2bc92-7a6b-48a2-b086-e26711566a7d', 'Baldur’s Gate 3 is a story-rich, party-based RPG set in the universe of Dungeons & Dragons, where your choices shape a tale of fellowship and betrayal, survival and sacrifice, and the lure of absolute power.', '<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/Final_Keyart_BG3.gif?t=1721123311\"><br><br>Gather your party and return to the Forgotten Realms in a tale of fellowship and betrayal, sacrifice and survival, and the lure of absolute power.<br><br>Mysterious abilities are awakening inside you, drawn from a mind flayer parasite planted in your brain. Resist, and turn darkness against itself. Or embrace corruption, and become ultimate evil.<br><br>From the creators of Divinity: Original Sin 2 comes a next-generation RPG, set in the world of Dungeons &amp; Dragons.<br><br><br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/Gather_new.gif?t=1721123311\"><br><br>Choose from 12 classes and 11 races from the D&amp;D Player\'s Handbook and create your own identity, or play as an Origin hero with a hand-crafted background. Or tangle with your inner corruption as the Dark Urge, a fully customisable Origin hero with its own unique mechanics and story. Whoever you choose to be, adventure, loot, battle and romance your way across the Forgotten Realms and beyond. Gather your party. Take the adventure online as a party of up to four.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/An_expansive_original_story.png?t=1721123311\"><br><br>Abducted, infected, lost. You are turning into a monster, but as the corruption inside you grows, so does your power. That power may help you to survive, but there will be a price to pay, and more than any ability, the bonds of trust that you build within your party could be your greatest strength. Caught in a conflict between devils, deities, and sinister otherworldly forces, you will determine the fate of the Forgotten Realms together.<br><br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/Next_Gen_new.gif?t=1721123311\"><br><br>Forged with the new Divinity 4.0 engine, Baldur&rsquo;s Gate 3 gives you unprecedented freedom to explore, experiment, and interact with a thriving world filled with characters, dangers, and deceit. A grand, cinematic narrative brings you closer to your characters than ever before. From shadow-cursed forests, to the magical caverns of the Underdark, to the sprawling city of Baldur&rsquo;s Gate itself, your actions define the adventure, but your choices define your legacy. You will be remembered.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/Experience_Depth.png?t=1721123311\"><br><br>The Forgotten Realms are a vast, detailed, and diverse world, and there are secrets to be discovered all around you &ndash; verticality is a vital part of exploration. Sneak, dip, shove, climb, and jump as you journey from the depths of the Underdark to the glittering rooftops of Baldur&rsquo;s Gate. Every choice you make drives your story forward, each decision leaving your mark on the world. Define your legacy, nurture relationships and create enemies, and solve problems your way. No two playthroughs will ever be the same.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/01_Bullets_points.png?t=1721123311\"></p>\r\n<ul class=\"bb_ul\">\r\n<li>allows you to combine your forces in combat and simultaneously attack enemies, or split your party to each follow your own quests and agendas. Concoct the perfect plan together&hellip; or introduce an element of chaos when your friends least expect it. Relationships are complicated. Especially when you&rsquo;ve got a parasite in your brain.</li>\r\n</ul>\r\n<p><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/02_Bullets_points.png?t=1721123311\"></p>\r\n<ul class=\"bb_ul\">\r\n<li>7 unique Origin heroes offer a hand-crafted experience, each with their own unique traits, agenda, and outlook on the world. Their stories intersect with the overarching narrative, and your choices will determine whether those stories end in redemption, salvation, domination, or one of many other outcomes. Play as an Origin and enjoy their stories, or recruit them to fight alongside you.</li>\r\n</ul>\r\n<p><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/03_Bullets_points.png?t=1721123311\"></p>\r\n<ul class=\"bb_ul\">\r\n<li>based on the D&amp;D 5e ruleset. Team-based initiative, advantage and disadvantage, and roll modifiers join an advanced AI, expanded environmental interactions, and a new fluidity in combat that rewards strategy and foresight. Three difficulty settings allow you to customise the challenge of combat. Enable weighted dice to help sway the battle, or play on Tactician mode for a hardcore experience.</li>\r\n</ul>\r\n<p><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/04_Bullets_points_Unprecedented.png?t=1721123311\"></p>\r\n<ul class=\"bb_ul\">\r\n<li>featuring 31 subraces on top of the 11 races (Human, Githyanki, Half-Orc, Dwarf, Elf, Drow, Tiefling, Halfling, Half Elf, Gnome, Dragonborn), with 46 subclasses branching out of the 12 classes. Over 600 spells and actions offer near-limitless freedom of interactivity in a hand-crafted world where exploration is rewarded, and player agency defines the journey. Our unique Character Creator features unprecedented depth of character, with reactivity that ensures whomever you are, you will leave a unique legacy behind you, all the way up to Level 12. Over 174 hours of cinematics ensure that no matter the choices you make, the cinematic experience follows your journey &ndash; every playthrough, a new cinematic journey.</li>\r\n</ul>\r\n<p><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/05_Bullets_points_Romances.png?t=1721123311\"></p>\r\n<ul class=\"bb_ul\">\r\n<li>With the looming threat of war heading to Baldur&rsquo;s Gate, and a mind flayer invasion on the horizon, friendships &ndash; though not necessary &ndash; are bound to be forged on your journey. What becomes of them is up to you, as you enter real, vibrant relationships with those you meet along the way. Each companion has their own moral compass and will react to the choices you make throughout your journey. At what cost will you stick to your ideals? Will you allow love to shape your actions? The relationships made on the road to Baldur&rsquo;s Gate act as moments of respite at camp as much as they add weight to the many decisions you make on your adventure.</li>\r\n</ul>\r\n<p><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/extras/06_Bullets_points_Customise.png?t=1721123311\"></p>\r\n<ul class=\"bb_ul\">\r\n<li>so that when you hit &lsquo;go live&rsquo;, your stream isn&rsquo;t interrupted by a bear, swear, or lack of underwear. Baldur&rsquo;s Gate 3 has 3 different levels of streamer-friendly customisation. You can disable nudity and explicit content separately (or together), and you can enable Twitch integration to interact directly with your audience, just as we do at our Panel From Hell showcases! You&rsquo;ll be able to stream Baldur&rsquo;s Gate 3 without any problems, regardless of how you play, thanks to these options.</li>\r\n</ul>\r\n<p>&nbsp;</p>', '2023-08-03', 699999, 0, 1, 5),
(13, '2024-07-22 21:23:57', '2024-07-22 21:23:57', 'Ghost of Tsushima DIRECTOR\'S CUT', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721708618745?alt=media&token=f391fda1-06ed-42bd-8d2b-16f5a5210039', 'A storm is coming. Venture into the complete Ghost of Tsushima DIRECTOR’S CUT on PC; forge your own path through this open-world action adventure and uncover its hidden wonders. Brought to you by Sucker Punch Productions, Nixxes Software and PlayStation Studios.', '<p><em>For the very first time on PC, play through Jin Sakai&rsquo;s journey and discover the complete Ghost of Tsushima experience in this Director&rsquo;s Cut.</em><br><br>In the late 13th century, the Mongol empire has laid waste to entire nations along their campaign to conquer the East. Tsushima Island is all that stands between mainland Japan and a massive Mongol invasion fleet led by the ruthless and cunning general, Khotun Khan.<br><br>As the island burns in the wake of the first wave of the Mongol assault, courageous samurai warrior Jin Sakai stands resolute. As one of the last surviving members of his clan, Jin is resolved to do whatever it takes, at any cost, to protect his people and reclaim his home. He must set aside the traditions that have shaped him as a warrior to forge a new path, the path of the Ghost, and wage an unconventional war for the freedom of Tsushima.<br><br></p>\r\n<ul class=\"bb_ul\">\r\n<li>Experience Ghost of Tsushima with unlocked framerates and a variety of graphics options tailored to a wide range of hardware, ranging&nbsp;from high-end PCs to portable PC gaming devices.*</li>\r\n<li>Get a view of even more of the action with support for Ultrawide (21:9), Super Ultrawide (32:9) and even 48:9 Triple Monitor support.*</li>\r\n<li>Boost performance with upscaling and frame generation technologies like NVIDIA DLSS 3, AMD FSR 3 and Intel XeSS. NVIDIA Reflex and image quality-enhancing NVIDIA DLAA are also supported.**</li>\r\n<li>Japanese lip sync &ndash; enjoy a more authentic experience with lip sync for Japanese voiceover, made possible by cinematics being rendered in real time by your PC.</li>\r\n<li>Choose how you control the action: experience haptic feedback and adaptive triggers through a wired DualSense&trade; controller&hellip;***</li>\r\n<li>&hellip;or go with mouse and keyboard, with fully customizable controls.</li>\r\n<li>Haptic feedback &ndash; master your blade through the DualSense&trade; controller&rsquo;s immersive haptic feedback.***</li>\r\n<li>Adaptive triggers &ndash; enhance your accuracy with a bow using adaptive trigger resistance.***</li>\r\n</ul>\r\n<p><br><em>* Compatible PC and display device required.<br>** Compatible PC and graphics card required.<br>*** Wired connection required to experience the full range of in-game controller features.</em></p>', '2024-05-16', 879000, 0, 1, 4),
(14, '2024-07-22 22:24:51', '2024-07-22 22:24:51', 'Persona 3 Reload', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721712249168?alt=media&token=c38c1808-808c-4c65-9611-36edfe9df3f1', 'Dive into the Dark Hour and awaken the depths of your heart. Persona 3 Reload is a captivating reimagining of the genre-defining RPG, reborn for the modern era with cutting-edge graphics and gameplay.', '<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2161700/extras/01.gif?t=1721234613\"><br>Step into the shoes of a transfer student thrust into an unexpected fate when entering the hour \"hidden\" between one day and the next. Awaken an incredible power and chase the mysteries of the Dark Hour, fight for your friends, and leave a mark on their memories forever.<br><br>Persona 3 Reload is a captivating reimagining of the genre-defining RPG, reborn for the modern era.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2161700/extras/02.gif?t=1721234613\"><br>Key Features:<br>- Experience the pivotal game of the Persona series faithfully remade with cutting-edge graphics, modernized quality-of-life features, and signature stylish UI.<br><br>-Fully immerse yourself in an emotional, gripping journey with new scenes, character interactions, and additional voiceover.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2161700/extras/03.gif?t=1721234613\"><br>- Choose how to meaningfully spend each day through various activities, from exploring the Port Island to forging genuine bonds with beloved characters.<br><br>- Build and command your optimal team to take down otherworldly Shadows and climb closer to the truth.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2161700/extras/04.gif?t=1721234613\"><br>---</p>\r\n<h2 class=\"bb_tag\"><strong>Persona 3 Reload Digital Deluxe Edition includes:</strong></h2>\r\n<ul class=\"bb_ul\">\r\n<li>Base Game</li>\r\n<li>Digital Artbook: Filled with 64 pages of character art, concept art, backgrounds and other illustrations from the game!</li>\r\n<li>Digital Soundtrack: Listen to newly arranged tracks from the original Persona 3 plus all-new tracks from Persona 3 Reload, presented by the Atlus sound team for a total of 60 new songs.</li>\r\n</ul>\r\n<p><br>---</p>\r\n<h2 class=\"bb_tag\"><strong>Persona 3 Reload Digital Premium Edition includes:</strong></h2>\r\n<ul class=\"bb_ul\">\r\n<li>Base Game</li>\r\n<li>Digital Artbook</li>\r\n<li>Digital Soundtrack</li>\r\n<li>Persona 3 Reload DLC Pack: P5R Phantom Thieves Costume Set, P5R Shujin Academy Costume Set, P5R Persona Set 1, P5R Persona Set 2 , P5R BGM Set, P4G Yasogami High Costume Set, P4G Persona Set</li>\r\n</ul>', '2024-02-02', 779000, 0, 1, 4),
(15, '2024-07-22 22:28:24', '2024-07-22 22:28:24', 'Dota 2', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721712484311?alt=media&token=26c5c6f1-eab4-44fa-98ab-0f4c1d6d9bb0', 'Every day, millions of players worldwide enter battle as one of over a hundred Dota heroes. And no matter if it\'s their 10th hour of play or 1,000th, there\'s always something new to discover. With regular updates that ensure a constant evolution of gameplay, features, and heroes, Dota 2 has taken on a life of its own.', '<p><strong>The most-played game on Steam.</strong><br>Every day, millions of players worldwide enter battle as one of over a hundred Dota heroes. And no matter if it\'s their 10th hour of play or 1,000th, there\'s always something new to discover. With regular updates that ensure a constant evolution of gameplay, features, and heroes, Dota 2 has truly taken on a life of its own.<br><br><strong>One Battlefield. Infinite Possibilities.</strong><br>When it comes to diversity of heroes, abilities, and powerful items, Dota boasts an endless array&mdash;no two games are the same. Any hero can fill multiple roles, and there\'s an abundance of items to help meet the needs of each game. Dota doesn\'t provide limitations on how to play, it empowers you to express your own style.<br><br><strong>All heroes are free.</strong><br>Competitive balance is Dota\'s crown jewel, and to ensure everyone is playing on an even field, the core content of the game&mdash;like the vast pool of heroes&mdash;is available to all players. Fans can collect cosmetics for heroes and fun add-ons for the world they inhabit, but everything you need to play is already included before you join your first match.<br><br><strong>Bring your friends and party up.</strong><br>Dota is deep, and constantly evolving, but it\'s never too late to join.<br>Learn the ropes playing co-op vs. bots. Sharpen your skills in the hero demo mode. Jump into the behavior- and skill-based matchmaking system that ensures you\'ll<br>be matched with the right players each game.</p>', '2013-07-10', 0, 0, 1, 3),
(16, '2024-07-22 22:32:39', '2024-07-22 22:32:39', 'Destiny 2', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721712735256?alt=media&token=13809d57-c30a-42c9-b5b1-8a2cd9e86f43', 'Destiny 2 is an action MMO with a single evolving world that you and your friends can join anytime, anywhere, absolutely free.', '<p>Dive into the world of Destiny 2 to explore the mysteries of the solar system and experience responsive first-person shooter combat. Unlock powerful elemental abilities and collect unique gear to customize your Guardian\'s look and playstyle. Enjoy Destiny 2&rsquo;s cinematic story, challenging co-op missions, and a variety of PvP modes alone or with friends. Download for free today and write your legend in the stars.</p>\r\n<h2 class=\"bb_tag\">An Immersive Story</h2>\r\n<p>You are a Guardian, defender of the Last City of humanity in a solar system under siege by infamous villains. Look to the stars and stand against the darkness. Your legend begins now.</p>\r\n<h2 class=\"bb_tag\">Guardian Classes</h2>\r\n<p>Choose from the armored Titan, mystic Warlock, or swift Hunter.<br><br><br><strong><u>Titan</u></strong><br>Disciplined and proud, Titans are capable of both aggressive assaults and stalwart defenses. Set your hammer ablaze, crack the sky with lightning, and go toe-to-toe with any opponent. Your team will stand tall behind the strength of your shield.<br><br><strong><u>Warlock</u></strong><br>Warlocks weaponize the mysteries of the universe to sustain themselves and destroy their foes. Rain devastation on the battlefield and clear hordes of enemies in the blink of an eye. Those who stand with you will know the true power of the Light.<br><br><strong><u>Hunter</u></strong><br>Agile and daring, Hunters are quick on their feet and quicker on the draw. Fan the hammer of your golden gun, flow through enemies like the wind, or strike from the darkness. Find the enemy, take aim, and end the fight before it starts.</p>\r\n<h2 class=\"bb_tag\">Cooperative and Competitive Multiplayer</h2>\r\n<p>Play with or against your friends and other Guardians in various PvE and PvP game modes.<br><br><br><strong><u>Cooperative Multiplayer</u></strong><br>Exciting co-op adventures teeming await with rare and powerful rewards. Dive into the story with missions, quests, and patrols. Put together a small fireteam and secure the chest at the end of a quick Strike. Or test your team\'s skill with countless hours of raid progression &ndash; the ultimate challenge for any fireteam. You decide where your legend begins.<br><br><strong><u>Competitive Multiplayer</u></strong><br>Face off against other players in fast-paced free-for-all skirmishes, team arenas, and PvE/PvP hybrid competitions. Mark special competitions like Iron Banner on your calendar and collect limited-time rewards before they\'re gone.</p>\r\n<h2 class=\"bb_tag\">Exotic Weapons and Armor</h2>\r\n<p>Thousands of weapons, millions of options. Discover new gear combinations and define your own personal style. The hunt for the perfect arsenal begins.</p>', '2019-07-01', 0, 0, 1, 3),
(17, '2024-07-22 22:37:30', '2024-07-22 22:37:30', 'OMORI', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721713005324?alt=media&token=2896cc0a-37aa-4dbc-b50c-505dda5f84d6', 'Explore a strange world full of colorful friends and foes. When the time comes, the path you’ve chosen will determine your fate... and perhaps the fate of others as well.', '<p>Explore a strange world full of colorful friends and foes. Navigate through the vibrant and the mundane in order to uncover a forgotten past. When the time comes, the path you&rsquo;ve chosen will determine your fate... and perhaps the fate of others as well.</p>', '2020-12-25', 108999, 0, 1, 2),
(18, '2024-07-22 22:46:26', '2024-07-22 22:46:26', 'Doki Doki Literature Club Plus!', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721713530167?alt=media&token=bfec7fd4-1b3f-4db7-ab7b-837cf8067cbc', 'Welcome to the club! Write poems for your crush and experience the terror of school romance in this critically-acclaimed psychological horror story.', '<h2 class=\"bb_tag\"><strong>Enter the #1 Psychological Horror Experience!</strong></h2>\r\n<p><br>Welcome to a terrifying world of poetry and romance! Write poems for your crush and erase any mistakes along the way to ensure your perfect ending. Now&rsquo;s your chance to discover why&nbsp;<em>DDLC</em>&nbsp;is one of the most beloved psychological horror games of the decade!<br><br>You play as the main character, who reluctantly joins the Literature Club in search of a romantic interest. With every poem you write and every choice you make, you&rsquo;ll charm your crush and begin to unfold the horrors of school romance. Do you have what it takes to crack the code of dating sims and get the perfect ending?<br><br>Now, the original mind-shattering DDLC experience is packed with tons of new features and content exclusive to&nbsp;<em>Doki Doki Literature Club Plus!</em></p>\r\n<h2 class=\"bb_tag\"><em>Doki Doki Literature Club Plus</em>&nbsp;Features:</h2>\r\n<p>&nbsp;</p>\r\n<ul class=\"bb_ul\">\r\n<li>6 new Side Stories about friendship and literature, totaling hours of new content</li>\r\n<li>100+ unlockable images including new game art, wallpapers, never-before-seen concept sketches, and more</li>\r\n<li>26 total music tracks, including 13 all-new unlockable songs by Nikki Kaelar, plus special guests Jason Hayes and Azuria Sky</li>\r\n<li>A built-in DDLC music player to unwind with your favorite songs in a custom playlist, or loop a single track forever</li>\r\n<li>A high-fidelity visual upgrade with all artwork now in Full HD (1080p)</li>\r\n</ul>\r\n<h2 class=\"bb_tag\">Meet the Literature Club!</h2>\r\n<p><br><strong>Sayori</strong>&nbsp;&ndash; Sayori, your childhood friend, begins your story by recruiting you to the Literature Club! As a daydreamer full of positive energy, Sayori&rsquo;s greatest passion is to deliver happiness to others.<br><strong>Natsuki</strong>&nbsp;&ndash; Natsuki tries to act tough, but her cuteness can make it hard to take her too seriously! She might be willing to warm up to good listeners who can respect her love for cute things.<br><strong>Yuri</strong>&nbsp;&ndash; Yuri, the quiet bookworm, reserves her passionate side for those who can more deeply understand her enigmatic mind.<br><strong>Monika</strong>&nbsp;&ndash; Monika, the superstar President of the Literature Club, will keep you on track for a perfect ending. Monika is always there to give you a guiding hand, both in literature and in love!<br><br><strong>This game is not suitable for children or those who are easily disturbed.</strong></p>', '2021-06-30', 153640, 0, 1, 4);
INSERT INTO `games` (`id`, `created_at`, `updated_at`, `title`, `trailer_url`, `brief_description`, `full_description`, `released_date`, `price`, `discount_percentage`, `publisher_id`, `age_rating_id`) VALUES
(19, '2024-07-22 22:51:26', '2024-07-22 22:51:26', 'RimWorld', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721713810963?alt=media&token=82e8ee72-bd56-47a3-97e3-1a17508f1860', 'A sci-fi colony sim driven by an intelligent AI storyteller. Generates stories by simulating psychology, ecology, gunplay, melee combat, climate, biomes, diplomacy, interpersonal relationships, art, medicine, trade, and more.', '<p><strong>RimWorld is a sci-fi colony sim driven by an intelligent AI storyteller.</strong>&nbsp;Inspired by Dwarf Fortress, Firefly, and Dune.<br><br><strong>You begin with three survivors of a shipwreck on a distant world.</strong></p>\r\n<ul class=\"bb_ul\">\r\n<li>Manage colonists\' moods, needs, wounds, illnesses and addictions.</li>\r\n<li>Build in the forest, desert, jungle, tundra, and more.</li>\r\n<li>Watch colonists develop and break relationships with family members, lovers, and spouses.</li>\r\n<li>Replace wounded limbs and organs with prosthetics, bionics, or biological parts harvested from others.</li>\r\n<li>Fight pirates, tribes, mad animals, giant insects and ancient killing machines.</li>\r\n<li>Craft structures, weapons, and apparel from metal, wood, stone, cloth, and futuristic materials.</li>\r\n<li>Tame and train cute pets, productive farm animals, and deadly attack beasts.</li>\r\n<li>Trade with passing ships and caravans.</li>\r\n<li>Form caravans to complete quests, trade, attack other factions, or migrate your whole colony.</li>\r\n<li>Dig through snow, weather storms, and fight fires.</li>\r\n<li>Capture refugees or prisoners and turn them to your side or sell them into slavery.</li>\r\n<li>Discover a new generated world each time you play.</li>\r\n<li>Explore hundreds of wild and interesting mods on the Steam Workshop.</li>\r\n<li>Learn to play easily with the help of an intelligent and unobtrusive AI tutor.</li>\r\n</ul>\r\n<p><br><strong>RimWorld is a story generator.</strong>&nbsp;It&rsquo;s designed to co-author tragic, twisted, and triumphant stories about imprisoned pirates, desperate colonists, starvation and survival. It works by controlling the &ldquo;random&rdquo; events that the world throws at you. Every thunderstorm, pirate raid, and traveling salesman is a card dealt into your story by the&nbsp;<strong>AI Storyteller</strong>. There are several storytellers to choose from. Randy Random does crazy stuff, Cassandra Classic goes for rising tension, and Phoebe Chillax likes to relax.<br><br><strong>Your colonists are not professional settlers</strong>&nbsp;&ndash; they&rsquo;re crash-landed survivors from a passenger liner destroyed in orbit. You can end up with a nobleman, an accountant, and a housewife. You&rsquo;ll acquire more colonists by capturing them in combat and turning them to your side, buying them from slave traders, or taking in refugees. So your colony will always be a motley crew.<br><br><strong>Each person&rsquo;s background is tracked and affects how they play.</strong>&nbsp;A nobleman will be great at social skills (recruiting prisoners, negotiating trade prices), but refuse to do physical work. A farm oaf knows how to grow food by long experience, but cannot do research. A nerdy scientist is great at research, but cannot do social tasks at all. A genetically engineered assassin can do nothing but kill &ndash; but he does that very well.<br><br><strong>Colonists develop - and destroy - relationships.</strong>&nbsp;Each has an opinion of the others, which determines whether they\'ll become lovers, marry, cheat, or fight. Perhaps your two best colonists are happily married - until one of them falls for the dashing surgeon who saved her from a gunshot wound.<br><br><strong>The game generates a whole planet from pole to equator.</strong>&nbsp;You choose whether to land your crash pods in a cold northern tundra, a parched desert flat, a temperate forest, or a steaming equatorial jungle. Different areas have different animals, plants, diseases, temperatures, rainfall, mineral resources, and terrain. These challenges of surviving in a disease-infested, choking jungle are very different from those in a parched desert wasteland or a frozen tundra with a two-month growing season.<br><br><strong>Travel across the planet.</strong>&nbsp;You\'re not stuck in one place. You can form a caravan of people, animals, and prisoners. Rescue kidnapped former allies from pirate outposts, attend peace talks, trade with other factions, attack enemy colonies, and complete other quests. You can even pack up your entire colony and move to a new place. You can use rocket-powered transport pods to travel faster.<br><br><strong>You can tame and train animals.</strong>&nbsp;Lovable pets will cheer up sad colonists. Farm animals can be worked, milked, and sheared. Attack beasts can be released upon your enemies. There are many animals - cats, labrador retrievers, grizzly bears, camels, cougars, chinchillas, chickens, and exotic alien-like lifeforms.<br><br><strong>People in RimWorld constantly observe their situation and surroundings in order to decide how to feel at any given moment.</strong>&nbsp;They respond to hunger and fatigue, witnessing death, disrespectfully unburied corpses, being wounded, being left in darkness, getting packed into cramped environments, sleeping outside or in the same room as others, and many other situations. If they\'re too stressed, they might lash out or break down.<br><br><strong>Wounds, infections, prosthetics, and chronic conditions are tracked on each body part and affect characters\' capacities.</strong>&nbsp;Eye injuries make it hard to shoot or do surgery. Wounded legs slow people down. Hands, brain, mouth, heart, liver, kidneys, stomach, feet, fingers, toes, and more can all be wounded, diseased, or missing, and all have logical in-game effects. And other species have their own body layouts - take off a deer\'s leg, and it can still hobble on the other three. Take off a rhino\'s horn, and it\'s much less dangerous.<br><br><strong>You can repair body parts with prosthetics ranging from primitive to transcendent.</strong>&nbsp;A peg leg will get Joe Colonist walking after an unfortunate incident with a rhinoceros, but he\'ll still be quite slow. Buy an expensive bionic leg from a trader the next year, and Joe becomes a superhuman runner. You can even extract, sell, buy, and transplant internal organs.<br><br>And there\'s much more than that! The game is easy to mod and has an&nbsp;<a href=\"https://steamcommunity.com/linkfilter/?u=http%3A%2F%2Fludeon.com%2Fforums%2Findex.php%3Fboard%3D15.0\" target=\"_blank\" rel=\"noopener\">active mod community</a>. Read more at&nbsp;<a href=\"https://steamcommunity.com/linkfilter/?u=http%3A%2F%2Frimworldgame.com\" target=\"_blank\" rel=\"noopener\">http://rimworldgame.com</a>.<br><br>(All non-English translations are made by fans.)</p>', '2018-10-17', 219999, 50, 1, 2),
(20, '2024-07-22 22:58:56', '2024-07-22 22:58:56', 'DreadOut', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721714291534?alt=media&token=e4e6b1e0-5447-4743-939f-51516eede583', 'DreadOut is a third person supernatural horror game where you play as Linda, a high school student trapped in an old abandoned town. Equipped with her trusty smart-phone, she will battle against terrifying encounters and solve mysterious puzzles which will ultimately determine her fate.', '<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/269790/extras/header_about.jpg?t=1661346820\"><br><br><strong><em>When twilight fades. Where darkness reigns.</em></strong><br><br>DreadOut is a third person supernatural horror game where you play as Linda, a high school student trapped in an old abandoned town. Equipped with her trusty smart-phone and an SLR camera, she will battle against terrifying encounters and solve mysterious puzzles which will ultimately determine her fate.<br>Help her overcome the challenges that will stand before her. Survive the Dread!<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/269790/extras/header_synopsis.jpg?t=1661346820\"><br><br>When a group of high school students went astray from a field trip, they came across something totally unexpected. A town long forgotten trapped in a peaceful state of slumber. What they did not realize was what lurks within. And what seemed like an innocent stroll turns into disaster as the secluded town reveals its dark and terrible secrets. The presence of sinister forces from beyond their realm of existence.<br><br>It all comes down to Linda. She will experience stirrings of unfamiliar powers, emerging from within her. These new found abilities might just be the only way she can save her own life and those of her friends.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/269790/extras/header_feature.jpg?t=1661346820\"></p>\r\n<ul class=\"bb_ul\">\r\n<li>Explore a haunted environment in an Asian - Indonesian setting.</li>\r\n<li>Battle against terrifying beings from a supernatural realm.</li>\r\n<li>Solve mysterious puzzles that block your path.</li>\r\n<li>Switch between first person and third person view.</li>\r\n<li>Engage in a thrilling storyline.</li>\r\n<li>Play Act 1 and 2 of Linda\'s terrifying journey along with Act 0 (previously released as DreadOut Demo).</li>\r\n<li>Get access to Linda\'s unlockable wardrobe</li>\r\n</ul>\r\n<p><br><strong>Rated 17+ for the following</strong>&nbsp;:</p>\r\n<ul class=\"bb_ul\">\r\n<li>Frequent / Intense horror / fear themes</li>\r\n<li>Infrequent / Mild Realistic Violence</li>\r\n<li>Infrequent / Mild Sexual Content or Nudity</li>\r\n<li>Infrequent Mature / Mild Suggestive Themes</li>\r\n</ul>', '2014-05-16', 95999, 0, 1, 4),
(21, '2024-07-22 23:02:14', '2024-07-22 23:02:14', 'Dead by Daylight', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721714517006?alt=media&token=75b30dcc-cc57-4914-b298-7ea155a04cd6', 'Dead by Daylight is a multiplayer (4vs1) horror game where one player takes on the role of the savage Killer, and the other four players play as Survivors, trying to escape the Killer and avoid being caught and killed.', '<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/381210/extras/DeadbyDaylight_anime_Intro_Steam.jpg?t=1721231452\"></p>\r\n<h2 class=\"bb_tag\">Death Is Not an Escape.</h2>\r\n<p><br>Dead by Daylight is a multiplayer (4vs1) horror game where one player takes on the role of the savage Killer, and the other four players play as Survivors, trying to escape the Killer and avoid being caught, tortured and killed.<br><br>Survivors play in third-person and have the advantage of better situational awareness. The Killer plays in first-person and is more focused on their prey.<br><br>The Survivors\' goal in each encounter is to escape the Killing Ground without getting caught by the Killer - something that sounds easier than it is, especially when the environment changes every time you play.<br><br>More information about the game is available at&nbsp;<a href=\"https://steamcommunity.com/linkfilter/?u=http%3A%2F%2Fwww.deadbydaylight.com\" target=\"_blank\" rel=\"noopener\">http://www.deadbydaylight.com</a></p>\r\n<h2 class=\"bb_tag\">Key Features</h2>\r\n<p>&bull;&nbsp;<strong>Survive Together&hellip; Or Not</strong>&nbsp;- Survivors can either cooperate with the others or be selfish. Your chance of survival will vary depending on whether you work together as a team or if you go at it alone. Will you be able to outwit the Killer and escape their Killing Ground?<br><br>&bull;&nbsp;<strong>Where Am I?</strong>&nbsp;- Each level is procedurally generated, so you&rsquo;ll never know what to expect. Random spawn points mean you will never feel safe as the world and its danger change every time you play.<br><br>&bull;&nbsp;<strong>A Feast for Killers</strong>&nbsp;- Dead by Daylight draws from all corners of the horror world. As a Killer you can play as anything from a powerful Slasher to terrifying paranormal entities. Familiarize yourself with your Killing Grounds and master each Killer&rsquo;s unique power to be able to hunt, catch and sacrifice your victims.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/381210/extras/DBD_HillB_Trapper_Wraith_anime_Steam.jpg?t=1721231452\"><br><br>&bull;&nbsp;<strong>Deeper and Deeper</strong>&nbsp;- Each Killer and Survivor has their own deep progression system and plenty of unlockables that can be customized to fit your own personal strategy. Experience, skills and understanding of the environment are key to being able to hunt or outwit the Killer.<br><br>&bull;&nbsp;<strong>Real People, Real Fear</strong>&nbsp;- The procedural levels and real human reactions to pure horror makes each game session an unexpected scenario. You will never be able to tell how it&rsquo;s going to turn out. Ambience, music, and chilling environments combine into a terrifying experience. With enough time, you might even discover what&rsquo;s hiding in the fog.<br><br><br><strong>WARNING: PHOTOSENSITIVITY/EPILEPSY SEIZURES - READ THIS NOTICE BEFORE PLAYING</strong><br><br><em>A very small percentage of people may experience epileptic seizures or blackouts when exposed to certain kinds of flashing lights or light patterns. These persons, or even people who have no history of seizures or epilepsy, may experience epileptic symptoms or seizures while playing video games. If you or any of your relatives has an epileptic condition or has had seizures of any kind, consult your physician before playing any video game.<br><br>IMMEDIATELY DISCONTINUE use and consult a physician if you or your child experience any of the following symptoms: dizziness, altered vision, eye or muscle twitching, involuntary movements, loss of awareness, disorientation, or convulsions. Parents should watch for or ask their children about the above symptoms.<br><br>You may reduce risk of photosensitive epileptic seizures by taking the following precautions: sit farther from the screen, use a smaller screen, play in a well-lit room, do not play when you are drowsy or fatigued.</em></p>', '2016-06-14', 549000, 0, 1, 5),
(22, '2024-07-22 23:05:27', '2024-07-22 23:05:27', 'Resident Evil 4', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721714694963?alt=media&token=c033187a-5035-4e53-95d3-0c0e5a171098', 'Survival is just the beginning. Six years have passed since the biological disaster in Raccoon City. Leon S. Kennedy, one of the survivors, tracks the president\'s kidnapped daughter to a secluded European village, where there is something terribly wrong with the locals.', '<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/extras/EN_RE4_GE.png?t=1707455805\"><br><br>Notes:<br>- Items contained in this set can be purchased individually. Please take care to avoid duplicate purchases.<br>- Please update Resident Evil 4 to the latest patch before playing Separate Ways or using the Extra DLC Pack.<br><br>Resident Evil 4 Gold Edition includes Resident Evil 4 and two additional items of content: Separate Ways, where you experience the story through Ada Wong\'s perspective, and the Extra DLC Pack, which contains additional character outfits as well as useful weapons and items.<br><br>Resident Evil 4:<br>6 years have passed since the biological disaster in Raccoon City. Leon S. Kennedy tracks the president\'s missing daughter to a secluded European village, where there is something terribly wrong with the villagers.<br><br>Featuring modernized gameplay, a reimagined storyline, and vividly detailed graphics, Resident Evil 4 marks the rebirth of an industry juggernaut. Relive the nightmare that revolutionized survival horror.<br><br>Separate Ways:<br>Play as Ada Wong in this additional scenario, filling in unanswered questions posed in the main story. With her mission to retrieve the Amber looming over her, which path will she choose?<br><br>Extra DLC Pack:<br>- Leon &amp; Ashley Costumes: \'Casual\'<br>- Leon &amp; Ashley Costumes: \'Romantic\'<br>- Leon Costume &amp; Filter: \'Hero\'<br>- Leon Costume &amp; Filter: \'Villain\'<br>- Leon Accessory: \'Sunglasses (Sporty)\'<br>- Deluxe Weapon: \'Sentinel Nine\'<br>- Deluxe Weapon: \'Skull Shaker\'<br>- \'Original Ver.\' Soundtrack Swap<br>- Treasure Map: Expansion</p>\r\n<p>Survival is just the beginning.<br><br>Six years have passed since the biological disaster in Raccoon City.<br>Agent Leon S. Kennedy, one of the survivors of the incident, has been sent to rescue the president\'s kidnapped daughter.<br>He tracks her to a secluded European village, where there is something terribly wrong with the locals.<br>And the curtain rises on this story of daring rescue and grueling horror where life and death, terror and catharsis intersect.<br><br>Featuring modernized gameplay, a reimagined storyline, and vividly detailed graphics,<br>Resident Evil 4 marks the rebirth of an industry juggernaut.<br><br>Relive the nightmare that revolutionized survival horror.</p>', '2023-03-24', 595999, 0, 1, 4),
(23, '2024-07-22 23:13:20', '2024-07-22 23:13:20', 'Monster Hunter: World', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721715162763?alt=media&token=86a51b37-6180-4193-ac2e-69babee65500', 'Welcome to a new world! In Monster Hunter: World, the latest installment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.', '<p>Welcome to a new world! Take on the role of a hunter and slay ferocious monsters in a living, breathing ecosystem where you can use the landscape and its diverse inhabitants to get the upper hand. Hunt alone or in co-op with up to three other players, and use materials collected from fallen foes to craft new gear and take on even bigger, badder beasts!</p>\r\n<h2 class=\"bb_tag\"><strong>INTRODUCTION</strong></h2>\r\n<p><strong>Overview</strong><br><strong>Battle gigantic monsters in epic locales.</strong><br><br>As a hunter, you\'ll take on quests to hunt monsters in a variety of habitats.<br>Take down these monsters and receive materials that you can use to create stronger weapons and armor in order to hunt even more dangerous monsters.<br><br>In Monster Hunter: World, the latest installment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/extras/MHW_introduction.jpg?t=1711328912\"><br><br><strong>Setting</strong><br>Once every decade, elder dragons trek across the sea to travel to the land known as the New World in a migration referred to as the Elder Crossing.<br><br>To get to the bottom of this mysterious phenomenon, the Guild has formed the Research Commission, dispatching them in large fleets to the New World.<br><br>As the Commission sends its Fifth Fleet in pursuit of the colossal elder dragon, Zorah Magdaros, one hunter is about to embark on a journey grander than anything they could have ever imagined.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/extras/MHW_story.jpg?t=1711328912\"></p>\r\n<h2 class=\"bb_tag\"><strong>ECOSYSTEM</strong></h2>\r\n<p><strong>A World That Breathes Life</strong><br>There are various locations teeming with wildlife. Expeditions into these locales are bound to turn up interesting discoveries.</p>\r\n<h2 class=\"bb_tag\"><strong>HUNTING</strong></h2>\r\n<p><strong>A Diverse Arsenal, and an Indispensable Partner</strong><br>Your equipment will give you the power to need to carve out a place for yourself in the New World.<br><br><strong>The Hunter\'s Arsenal</strong><br>There are fourteen different weapons at the hunter\'s disposal, each with its own unique characteristics and attacks. Many hunters acquire proficiency in multiple types, while others prefer to attain mastery of one.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/extras/MHW_hunters.jpg?t=1711328912\"><br><br><strong>Scoutflies</strong><br>Monster tracks, such as footprints and gashes, dot each locale. Your Scoutflies will remember the scent of a monster and guide you to other nearby tracks. And as you gather more tracks, the Scoutflies will give you even more information.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/extras/MHW_shirubemushi_s.jpg?t=1711328912\"><br><br><strong>Slinger</strong><br>The Slinger is an indispensable tool for a hunter, allowing you to arm yourself with stones and nuts that can be gathered from each locale.<br>From diversion tactics to creating shortcuts, the Slinger has a variety of uses, and allows you to hunt in new and interesting ways.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/extras/MHW_slinger_s.jpg?t=1711328912\"><br><br><strong>Specialized Tools</strong><br>Specialized tools activate powerful effects for a limited amount of time, and up to two can be equipped at a time. Simple to use, they can be selected and activated just like any other item you take out on a hunt.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/extras/MHW_specialTool_s.jpg?t=1711328912\"><br><br><strong>Palicoes</strong><br>Palicoes are hunters\' reliable comrades out in the field, specialized in a variety of offensive, defensive, and restorative support abilities.<br>The hunter\'s Palico joins the Fifth Fleet with pride, as much a bona fide member of the Commission as any other hunter.<br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/extras/MHW_otomo.jpg?t=1711328912\"></p>', '2018-08-12', 334999, 0, 1, 2),
(24, '2024-07-22 23:22:17', '2024-07-26 04:40:38', 'It Takes Two', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721715681787?alt=media&token=7438cdd6-4733-4fe5-b32f-f4a29249add4', 'Embark on the craziest journey of your life in It Takes Two. Invite a friend to join for free with Friend’s Pass and work together across a huge variety of gleefully disruptive gameplay challenges. Winner of GAME OF THE YEAR at the Game Awards 2021.', '<p>Embark on the craziest journey of your life in It Takes Two, a genre-bending platform adventure created purely for co-op. Invite a friend to join for free with Friend&rsquo;s Pass and work together across a huge variety of gleefully disruptive gameplay challenges. Play as the clashing couple Cody and May, two humans turned into dolls by a magic spell. Together, trapped in a fantastical world where the unpredictable hides around every corner, they are reluctantly challenged with saving their fractured relationship.<br><br>Master unique and connected character abilities in every new level. Help each other across an abundance of unexpected obstacles and laugh-out-loud moments. Kick gangster squirrels&rsquo; furry tails, pilot a pair of underpants, DJ a buzzing night club, and bobsleigh through a magical snow globe. Embrace a heartfelt and hilarious story where narrative and gameplay weave into a uniquely metaphorical experience.<br><br>It Takes Two is developed by the award-winning studio Hazelight, the industry leader of cooperative play. They&rsquo;re about to take you on a wild and wondrous ride where only one thing is for certain: we&rsquo;re better together.</p>\r\n<h2 class=\"bb_tag\"><strong>KEY FEATURES</strong></h2>\r\n<p>&nbsp;</p>\r\n<ul class=\"bb_ul\">\r\n<li><strong>Pure co-op perfection</strong>&nbsp;&mdash; Invite a friend to join for free with Remote Play Together**, and experience a thrilling adventure built purely for two. Choose from couch or online co-op with split-screen play, and face ever-changing challenges where working together is the only way forward.<br><br></li>\r\n<li><strong>Gleefully disruptive gameplay</strong>&nbsp;&mdash; From rampaging vacuum cleaners to suave love gurus, you never know what you&rsquo;ll be up against next. Filled with genre-bending challenges and new character abilities to master in every level, experience a metaphorical merging of gameplay and narrative that pushes the boundaries of interactive storytelling.<br><br></li>\r\n<li><strong>A universal tale of relationships</strong>&nbsp;&mdash; Discover a touching and heartfelt story of the challenges in getting along. Help Cody and May learn how to overcome their differences. Meet a diverse cast of strange and endearing characters. Join forces and go on an adventure you&rsquo;ll treasure &mdash; together!</li>\r\n</ul>\r\n<p><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1426210/extras/610px-ITT_AnimatedKeyArt_16x9.gif?t=1718278619\"></p>\r\n<h2 class=\"bb_tag\"><strong>ABOUT HAZELIGHT</strong></h2>\r\n<p>Hazelight is an award-winning independent game development studio based in Stockholm, Sweden. Founded in 2014 by Josef Fares (film director and creator of the award-winning game Brothers: A Tale of Two Sons), Hazelight is committed to pushing the creative boundaries of what is possible in games. In 2018, Hazelight released the BAFTA award-winning A Way Out &mdash; the first-ever co-op only, third-person action-adventure &mdash; as part of the EA Originals program.</p>\r\n<h2 class=\"bb_tag\"><strong>ABOUT EA ORIGINALS</strong></h2>\r\n<p>EA Originals helps shine a light on some of the most passionate, independent, and talented game studios across the globe. Discover innovative and unforgettable gaming experiences from highly creative game makers who love to enchant and inspire.</p>', '2021-03-26', 479000, 12, 6, 2),
(25, '2024-07-22 23:25:34', '2024-07-26 04:39:00', 'Marvel’s Spider-Man Remastered', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721715902235?alt=media&token=445c770c-bd0a-48d9-af39-f5a016bbfbcb', 'In Marvel’s Spider-Man Remastered, the worlds of Peter Parker and Spider-Man collide in an original action-packed story. Play as an experienced Peter Parker, fighting big crime and iconic villains in Marvel’s New York.', '<p>Developed by Insomniac Games in collaboration with Marvel, and optimized for PC by Nixxes Software, Marvel\'s Spider-Man Remastered on PC introduces an experienced Peter Parker who&rsquo;s fighting big crime and iconic villains in Marvel&rsquo;s New York. At the same time, he&rsquo;s struggling to balance his chaotic personal life and career while the fate of Marvel&rsquo;s New York rests upon his shoulders.</p>\r\n<h2 class=\"bb_tag\">Key Features</h2>\r\n<p><br><strong>Be Greater</strong><br>When iconic Marvel villains threaten Marvel&rsquo;s New York, Peter Parker and Spider-Man&rsquo;s worlds collide. To save the city and those he loves, he must rise up and be greater.<br><br><strong>Feel like Spider-Man</strong><br>After eight years behind the mask, Peter Parker is a crime-fighting master. Feel the full power of a more experienced Spider-Man with improvisational combat, dynamic acrobatics, fluid urban traversal and environmental interactions.<br><br><strong>Worlds collide</strong><br>The worlds of Peter Parker and Spider-Man collide in an original action-packed story. In this new Spider-Man universe, iconic characters from Peter and Spider-Man&rsquo;s lives have been reimagined, placing familiar characters in unique roles.<br><br><strong>Marvel&rsquo;s New York is your playground</strong><br>The Big Apple comes to life in Marvel&rsquo;s Spider-Man. Swing through vibrant neighborhoods and catch breathtaking views of iconic Marvel and Manhattan landmarks. Use the environment to defeat villains with epic takedowns in true blockbuster action.<br><br><strong>Enjoy The City That Never Sleeps complete content</strong><br>Following the events of the main story of Marvel&rsquo;s Spider-Man Remastered, experience the continuation of Peter Parker&rsquo;s journey in Marvel&rsquo;s Spider-Man: The City That Never Sleeps, three story chapters with additional missions and challenges to discover.</p>\r\n<h2 class=\"bb_tag\">PC Features</h2>\r\n<p><br><strong>PC Optimized Graphics</strong><br>Enjoy a variety of graphics quality options to tailor to a wide range of devices, unlocked framerates, and support for other technologies including performance boosting NVIDIA DLSS and image quality enhancing NVIDIA DLAA. Upscaling technology AMD FSR 2.0 is also supported.<br><br><strong>Ray-traced reflections and improved shadows*</strong><br>See the city come to life with improved shadows and stunning ray-traced reflection options with a variety of quality modes to choose from.<br><br><strong>Ultra-wide Monitor support**</strong><br>Take in the cinematic sights of Marvel&rsquo;s New York with support for a range of screen setups, including 16:9, 16:10, 21:9, 32:9, and 48:9 resolutions with triple monitor setups using NVIDIA Surround or AMD Eyefinity.<br><br><strong>Controls and Customization</strong><br>Feel what it&rsquo;s like to play as Spider-Man through immersive haptic feedback and dynamic trigger effects using a PlayStation DualSense&trade; controller on a wired USB connection. Enjoy full mouse and keyboard support with various customizable control options.<br><br><em>*Compatible PC required<br>**Compatible PC and display device required.</em></p>', '2022-07-16', 879000, 0, 3, 4),
(26, '2024-07-25 20:34:57', '2024-07-26 01:54:46', 'Red Dead Redemption 2', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1721984075998?alt=media&token=3f672cb1-eb6b-401d-b34b-457832692fb4', 'Winner of over 175 Game of the Year Awards and recipient of over 250 perfect scores, RDR2 is the epic tale of outlaw Arthur Morgan and the infamous Van der Linde gang, on the run across America at the dawn of the modern age. Also includes access to the shared living world of Red Dead Online.', '<h2>ABOUT THIS GAME</h2>\r\n<p>America, 1899.<br><br>Arthur Morgan and the Van der Linde gang are outlaws on the run. With federal agents and the best bounty hunters in the nation massing on their heels, the gang must rob, steal and fight their way across the rugged heartland of America in order to survive. As deepening internal divisions threaten to tear the gang apart, Arthur must make a choice between his own ideals and loyalty to the gang who raised him.<br><br>Now featuring additional Story Mode content and a fully-featured Photo Mode, Red Dead Redemption 2 also includes free access to the shared living world of Red Dead Online, where players take on an array of roles to carve their own unique path on the frontier as they track wanted criminals as a Bounty Hunter, create a business as a Trader, unearth exotic treasures as a Collector or run an underground distillery as a Moonshiner and much more.<br><br>With all new graphical and technical enhancements for deeper immersion, Red Dead Redemption 2 for PC takes full advantage of the power of the PC to bring every corner of this massive, rich and detailed world to life including increased draw distances; higher quality global illumination and ambient occlusion for improved day and night lighting; improved reflections and deeper, higher resolution shadows at all distances; tessellated tree textures and improved grass and fur textures for added realism in every plant and animal.<br><br>Red Dead Redemption 2 for PC also offers HDR support, the ability to run high-end display setups with 4K resolution and beyond, multi-monitor configurations, widescreen configurations, faster frame rates and more.</p>', '2019-12-06', 640000, 67, 1, 5),
(27, '2024-07-27 01:42:44', '2024-07-27 01:42:44', 'Watch_Dogs® 2', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722069726214?alt=media&token=94de7669-3217-4eb2-831c-2b2e96826363', 'Welcome to San Francisco. Play as Marcus, a brilliant young hacker, and join the most notorious hacker group, DedSec. Your objective: execute the biggest hack of history.', '<p>Play as Marcus Holloway, a brilliant young hacker living in the birthplace of the tech revolution, the San Francisco Bay Area.<br>Team up with Dedsec, a notorious group of hackers, to execute the biggest hack in history; take down ctOS 2.0, an invasive operating system being used by criminal masterminds to monitor and manipulate citizens on a massive scale.<br><br></p>\r\n<ul class=\"bb_ul\">\r\n<li>Explore the dynamic open-world, full of gameplay possibilities</li>\r\n<li>Hack into every connected device and take control of the city infrastructure.</li>\r\n<li>Develop different skills to suit your playstyle, and upgrade your hacker tools &ndash; RC cars, Quadcopter drone, 3D printed weapons and much more.</li>\r\n<li>Stay seamlessly connected to your friends with a brand new co-op and adversarial multiplayer Watch Dogs experience.</li>\r\n</ul>\r\n<p><br>PUT YOUR EYES IN CTRL<br>Get the upper hand with Tobii Eye Tracking. Let your gaze aid you in weaponizing the &ldquo;internet of things&rdquo;, aim at enemies and take cover while you naturally explore the environment. Combine the extensive eye tracking feature set to pinpoint enemies, interact with your surroundings, locate shelter points, and rapidly select hackable targets. Let your vision lead the hacking of the city&rsquo;s digital brain.<br><br>Compatible with all Tobii Eye Tracking gaming devices.<br>----<br>Additional notes:<br>Eye tracking features available with Tobii Eye Tracking.</p>', '2016-11-28', 619000, 0, 2, 5),
(28, '2024-07-27 01:48:03', '2024-07-27 01:48:03', 'The Crew Motorfest', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722070049180?alt=media&token=1cc1fc61-bdb2-4416-abf9-059712f3cb59', 'The Crew Motorfest is an open world online racing game set on the island of O‘ahu, Hawaii. Experience the best that car culture has to offer as you compete in intense races, experience themed events, and collect hundreds of iconic cars. Enjoy the game free for five hours!', '<p>Enjoy the game free for five hours!<br><br>Grab your ticket to Motorfest, show off your skills, and live the most thrilling driving experiences car culture has to offer!</p>\r\n<h2 class=\"bb_tag\">CELEBRATE ALL THE FACETS OF CAR CULTURE</h2>\r\n<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2698940/extras/TCM_Steam_KSP_1.gif?t=1721340054\"><br>Discover the playlists and dive into thematic campaigns that will immerse you in the most exciting car culture universes, including American muscle, Japanese-style street racing, and legendary machines of the past!</p>\r\n<h2 class=\"bb_tag\">COLLECT THE MOST LEGENDARY CARS</h2>\r\n<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2698940/extras/TCM_Steam_KSP_2.gif?t=1721340054\"><br>Master every driving challenge and fill your collection with the most legendary vehicles ever created. Customize your cars and show off your own style with the custom contest mode.</p>\r\n<h2 class=\"bb_tag\">EXPLORE A VIBRANT HAWAIIAN OPEN WORLD</h2>\r\n<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2698940/extras/TCM_Steam_KSP_3.gif?t=1721340054\"><br>The Crew Motorfest has settled down in one of the most breathtaking places on Earth: the island of O&lsquo;ahu, Hawaii. Join high-speed street races through the bustling city of Honolulu, test your off-road skills on the ashy slopes of a volcano, and master the perfect curve on the tracks.</p>', '2024-04-19', 919000, 60, 2, 4),
(29, '2024-07-27 01:53:41', '2024-07-27 01:53:41', 'Assassin\'s Creed® Odyssey', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722070393794?alt=media&token=0d4b9c6f-542b-4782-9ca4-a246fb1e98fa', 'Choose your fate in Assassin\'s Creed® Odyssey. From outcast to living legend, embark on an odyssey to uncover the secrets of your past and change the fate of Ancient Greece.', '<p>Choose your fate in Assassin\'s Creed&reg; Odyssey.<br>From outcast to living legend, embark on an odyssey to uncover the secrets of your past and change the fate of Ancient Greece.<br><br>TRAVEL TO ANCIENT GREECE<br>From lush vibrant forests to volcanic islands and bustling cities, start a journey of exploration and encounters in a war torn world shaped by gods and men.<br><br>FORGE YOUR LEGEND<br>Your decisions will impact how your odyssey unfolds. Play through multiple endings thanks to the new dialogue system and the choices you make.&nbsp;Customize your gear, ship, and special abilities to become a legend.<br><br>FIGHT ON A NEW SCALE<br>Demonstrate your warrior\'s abilities in large scale epic battles between Athens and Sparta featuring hundreds of soldiers, or ram and cleave your way through entire fleets in naval battles across the Aegean Sea.<br><br>GAZE IN WONDER<br>Experience the action in a whole new light with Tobii Eye Tracking. The Extended View feature gives you a broader perspective of the environment, and the Dynamic Light and Sun Effects immerse you in the sandy dunes according to where you set your sights. Tagging, aiming and locking on your targets becomes a lot more natural when you can do it by looking at them. Let your vision lead the way and enhance your gameplay.<br>Visit the Tobii website to check the list of compatible devices.<br>-----<br>Additional notes:<br>Eye tracking features available with Tobii Eye Tracking.</p>', '2018-10-06', 619000, 80, 2, 4),
(30, '2024-07-27 01:53:52', '2024-07-27 01:53:52', 'Growtopia', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722070168592?alt=media&token=0261c96d-de89-4d5a-ae75-c4e205fad6cb', 'Growtopia is a 2D sandbox game, that brings together millions of players in an expansive pixel world. Collaborate in building anything you can imagine, become anyone you want to be, and delve into numerous mini-games. Unleash your creativity and join the massive universe in Growtopia today!', '<p><em>Please note that accessing Growtopia requires a Ubisoft Account.</em><br><br><strong>It\'s Your Sandbox, For Free</strong><br>Discover a 2D playground where your imagination runs wild, Be anyone, create anything, and the best part? It\'s totally free!<br><br><strong>A Global Community of Adventurers</strong><br>Join a community of millions, where everyone\'s a creator and an adventurer just like you.<br><br><strong>Create Wonders, Pixel by Pixel</strong><br>Build your dream castle, or maybe a secret hideaway? The only limit is your imagination!<br><br><strong>Unleash Your Inner Hero or Villain</strong><br>Ever wanted to be a space knight or a noble queen? Here, you can be whoever you want to be!<br><br><strong>Games Within the Game</strong><br>Enjoy mini-games crafted by fellow players. From high-energy races to daring battles, there\'s always a new challenge waiting.<br><br><strong>Trade and Craft Your Way</strong><br>Whip up cool items and trade with others. The bustling marketplace is your oyster!<br><br><strong>Always Fresh, Always Exciting</strong><br>We keep things exciting with frequent updates. New items, events, and features make every day an adventure.<br><br>A Universe of Pixels, Waiting for You<br>A vibrant world that\'s yours to shape, one pixel at a time. Dive in and make it your own!</p>', '2024-03-07', 0, 0, 2, 4),
(31, '2024-07-27 02:08:44', '2024-07-27 02:08:44', 'Horizon Forbidden West™ Complete Edition', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722071299207?alt=media&token=f7ba0b93-7f77-4e69-a3fd-a42dafc98334', 'Experience the epic Horizon Forbidden West™ in its entirety with bonus content and the Burning Shores expansion included. The Burning Shores add-on contains additional content for Aloy’s adventure, including new storylines, characters, and experiences in a stunning yet hazardous new area.', '<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2420110/extras/horizon_forbidden_west_cinemagraph_610x610.gif?t=1717622622\"><br><br>Join Aloy as she braves a majestic but dangerous new frontier that holds mysterious new threats. This Complete Edition allows you to enjoy the critically acclaimed Horizon Forbidden West on PC in its entirety with bonus content, including the Burning Shores story expansion that picks up after the main game.<br><br>Explore distant lands, fight bigger and more awe-inspiring machines, and encounter astonishing new tribes as you return to the far-future, post-apocalyptic world of Horizon.<br><br>The land is dying. Vicious storms and an unstoppable blight ravage the scattered remnants of humanity while fearsome new machines prowl their borders, and life on Earth is hurtling toward another extinction.<br><br>It\'s up to Aloy to uncover the secrets behind these threats and restore order and balance to the world. Along the way, she must reunite with old friends, forge alliances with warring new factions and unravel the legacy of the ancient past.<br><br></p>\r\n<ul class=\"bb_ul\">\r\n<li>See every gameplay detail with Ultrawide 21:9 and Super Ultrawide 32:9 resolutions, as well as 48:9 triple monitor support.*</li>\r\n<li>Witness the Forbidden West coming to life, with NVIDIA DLSS 3 upscaling and frame generation, image enhancing NVIDIA DLAA and latency reducing NVIDIA Reflex. AMD FSR and Intel XeSS are also supported.**</li>\r\n<li>Customize graphic settings to your preference, with the potential for unlocked frame rates.**</li>\r\n<li>Take control with full support for the DualSense&trade; controller, including haptic feedback and adaptive trigger functionality.***</li>\r\n</ul>\r\n<p><br>* Compatible PC and 4K display device required.<br>** Compatible PC required.<br>*** Wired connection required to experience the full range of in-game controller features.</p>', '2024-03-21', 879000, 0, 3, 4),
(32, '2024-07-27 02:11:47', '2024-07-27 02:11:47', 'HELLDIVERS™ 2', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722071476178?alt=media&token=e38e30bf-084f-4c3f-ac3c-8c96a1523dc1', 'The Galaxy’s Last Line of Offence. Enlist in the Helldivers and join the fight for freedom across a hostile galaxy in a fast, frantic, and ferocious third-person shooter.', '<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/extras/SuperEarthSTEAM.gif?t=1717621025\"><br>The Galaxy&rsquo;s Last Line of Offence.<br><br>Enlist in the Helldivers and join the fight for freedom across a hostile galaxy in a fast, frantic, and ferocious third-person shooter.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/extras/BugAssaultSTEAM.gif?t=1717621025\"></p>\r\n<h2 class=\"bb_tag\">URGENT BROADCAST &ndash; SUPER EARTH ARMED FORCES</h2>\r\n<p>Freedom. Peace. Democracy.<br>Your Super Earth-born rights. The key pillars of our civilization.<br>Of our very existence.<br>But the war rages on. And everything is once again under threat.<br>Join the greatest military force the galaxy has ever seen and make this a safe and free place to live.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/extras/StratagemSTEAM.gif?t=1717621025\"></p>\r\n<h2 class=\"bb_tag\">BECOME A LEGEND</h2>\r\n<p>You will be assembled into squads of up to four Helldivers and assigned strategic missions.<br>Watch each other&rsquo;s back &ndash; friendly fire is an unfortunate certainty of war, but victory without teamwork is impossible.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/extras/EagleExplosionsSTEAM.gif?t=1717621025\"></p>\r\n<h2 class=\"bb_tag\">LOADOUTS</h2>\r\n<p>Rain down freedom from above, sneak through enemy territory, or grit your teeth and charge head-first into the jaws of combat.<br>How you deliver liberty is your choice; you&rsquo;ll have access to a wide array of explosive firepower, life-saving armor and battle-changing stratagems&hellip; the jewel in every Helldiver&rsquo;s arsenal.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/extras/ChargerChargeSTEAM.gif?t=1717621025\"></p>\r\n<h2 class=\"bb_tag\">REQUISITION</h2>\r\n<p>Super Earth recognises your hard work with valuable Requisition. Use it to access different rewards that benefit you, your squad, your destroyer ship and our overall war effort.<br><br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/extras/StriderSTEAM.gif?t=1717621025\"></p>\r\n<h2 class=\"bb_tag\">THREATS</h2>\r\n<p>Everything on every planet wants you dead. That&rsquo;s what we&rsquo;re dealing with.<br>Each enemy has distinct and unpredictable characteristics, tactics, and behavior &ndash; but they all fight ferociously and without fear or morality.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/553850/extras/SquadRunningSTEAM.gif?t=1717621025\"></p>\r\n<h2 class=\"bb_tag\">THE GALACTIC WAR</h2>\r\n<p>Capturing enemy planets, defending against invasions, and completing missions will contribute to our overall effort.<br><br><br>This war will be won or lost depending on the actions of everyone involved.<br><br>We stand together, or we fall apart.</p>', '2024-02-08', 579000, 0, 3, 3);
INSERT INTO `games` (`id`, `created_at`, `updated_at`, `title`, `trailer_url`, `brief_description`, `full_description`, `released_date`, `price`, `discount_percentage`, `publisher_id`, `age_rating_id`) VALUES
(33, '2024-07-27 02:13:21', '2024-07-27 02:13:21', 'Ratchet & Clank: Rift Apart', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722071576678?alt=media&token=8401c980-c124-49b5-8ec2-6a6a546e2399', 'Blast your way through an interdimensional adventure with Ratchet and Clank – now on PC! Help them take on an evil emperor from another reality as you jump between action-packed worlds and beyond at hyper-speed!', '<p>The intergalactic adventurers are back with a bang in Ratchet &amp; Clank: Rift Apart!<br><br>Go dimension-hopping with Ratchet and Clank as they venture onto a PC near you for the very first time. Help them take on an evil emperor from another reality as you jump between action-packed worlds and beyond.<br><br>With their own universe next in the firing line,&nbsp;dust off the dynamic pair&rsquo;s outrageous weaponry and stop a dimensional collapse in its tracks!<br><br>Unite the double team supreme with a cast of familiar allies and new faces, including newcomer Rivet. She&rsquo;s a Lombax resistance fighter from another dimension, who is just as determined to take out the robotic scourge.</p>\r\n<h2 class=\"bb_tag\">DualSense&trade; wireless controller integration</h2>\r\n<p>Enjoy a dazzling interdimensional adventure. Developed by acclaimed studio Insomniac Games and brought to PC by Nixxes Software, you&rsquo;ll go beyond what you see with in-game actions coming to life in your hands via the DualSense&trade; wireless controller.*<br><br>Haptic feedback and adaptive trigger technology create lifelike sensations: feel the hum of a spacecraft vibrate across the surface of the controller, or the kick of pulling your trusty Enforcer&rsquo;s trigger.</p>\r\n<h2 class=\"bb_tag\">PC features</h2>\r\n<ul class=\"bb_ul\">\r\n<li>Blast your way through an interdimensional adventure as Ratchet and Clank make their way to PC for the very first time!</li>\r\n<li>Wrap your eyes around delightful, diverse dimensions, with ultra-wide support for 21:9, 32:9, and 48:9 (triple monitor support) resolutions!*</li>\r\n<li>See the omniverse brought to life with the option of unlocked frame rates! You can also enjoy ray-traced reflections, as well as newly added, ray-traced shadows for exteriors.**</li>\r\n<li>Witness the latest upscaling technologies, including NVIDIA DLSS 3, AMD FSR 2, Intel XeSS and Insomniac Games&rsquo; Temporal Injection. NVIDIA Reflex and image quality-enhancing NVIDIA DLAA are also supported. Tailor a variety of graphics quality options to a range of devices, from high-end PCs to portable PC gaming devices.</li>\r\n<li>Play with the DualSense&trade; controller to experience haptic feedback and dynamic trigger effects.*** Or choose mouse and keyboard &ndash; with a wide range of control customization options.</li>\r\n<li>Includes support for achievements and cloud saves on PC game launchers.</li>\r\n</ul>\r\n<h2 class=\"bb_tag\">Join the heroes</h2>\r\n<ul class=\"bb_ul\">\r\n<li>Employ an epic arsenal of explosive weapons, including the Burst Pistol, Topiary Sprinkler and the Shatterbomb.</li>\r\n<li>Zip above cityscapes, boost into combat and slip through dimensions with physics-defying new gadgets.</li>\r\n<li>Connect with the sounds of combat and explore in wonder as worlds come to life, enveloping you with high fidelity sound.</li>\r\n<li>Sense the impact of in-game rumbles and explosions through the DualSense&trade; wireless controller&rsquo;s haptic feedback.</li>\r\n</ul>\r\n<h2 class=\"bb_tag\">Travel in style</h2>\r\n<ul class=\"bb_ul\">\r\n<li>Planet-hop with abandon as this adventure sends you hurtling across the galaxy at hyper-speed.</li>\r\n<li>Experience the intergalactic shuffle of dimensional rifts as they combine new worlds and gameplay.</li>\r\n<li>Warp across battlefields to rapidly gain your combat advantage and repair planetary rifts with dimension-spanning puzzles.</li>\r\n<li>Explore never-before-seen planets and see alternate dimension versions of old favorites, now more alive than ever with exotic flora and fauna.</li>\r\n</ul>\r\n<h2 class=\"bb_tag\">An epic journey awaits</h2>\r\n<ul class=\"bb_ul\">\r\n<li>Play as Ratchet and as newcomer Rivet &ndash; a Lombax resistance fighter from another dimension.</li>\r\n<li>Discover Clank&rsquo;s all-new interdimensional mechanics.</li>\r\n</ul>\r\n<p><br><em>* Compatible PC and display device required.&nbsp;<br>** Compatible PC and graphics card required for enhanced graphics.<br>*** Wired connection required to experience the full range of in-game controller features.</em></p>', '2023-07-26', 879000, 0, 3, 2),
(34, '2024-07-27 02:14:58', '2024-07-27 02:14:58', 'Returnal™', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722071677706?alt=media&token=fa07c6ef-8ee2-4ce1-90d1-c1c11947292a', 'BREAK THE CYCLE Fight to survive as this award-winning third-person shooter brings Selene’s story to PC. Take on roguelike challenges. Engage enemies in bullet hell-fuelled clashes. Share your journey through Returnal™ with another player.', '<p>Break the cycle as this award-winning third-person shooter brings bullet hell action to PC. Selene&rsquo;s roguelike odyssey arrives with a suite of arresting graphical and performance-based enhancements to ensure an unforgettable journey. This includes the full Returnal&trade; experience, complete with Suspend Cycle, Photo and Co-op Modes, as well as the Tower of Sisyphus included from day one.</p>\r\n<h2 class=\"bb_tag\">BACKGROUND:</h2>\r\n<p><br>After crash-landing on this shape-shifting world, Selene must search through the barren landscape of an ancient civilization for her escape. Isolated and alone, she finds herself fighting tooth and nail for survival. Again and again, she&rsquo;s defeated &ndash; forced to restart her journey every time she dies. Through fast, relentless gameplay, you&rsquo;ll discover that just as the planet changes with every cycle, so do the items at your disposal. Every loop offers new combinations, empowering you to push your boundaries and approach combat with a different strategy each time.<br><br>Brought to life by stunning visual effects, the dark beauty of the decaying world around you is packed with explosive surprises. From high stakes, bullet hell-fuelled combat, to jaw-dropping twists and turns set across stark and contrasting environments. You&rsquo;ll explore, discover and fight your way through an unforgiving journey, where mystery stalks your every move. Designed for extreme replayability, the procedural world of Returnal invites you to dust yourself off in the face of defeat and take on new, evolving challenges with every rebirth.</p>\r\n<h2 class=\"bb_tag\">The complete PC experience</h2>\r\n<p><br>Includes support for achievements, complete with an in-game progress tracker. Five graphical pre-sets have also been included, alongside in-game performance metrics, including an FPS counter, a gauge for GPU and CPU usage and a latency tracker.</p>\r\n<h2 class=\"bb_tag\">Savour a dazzling visual experience</h2>\r\n<p><br><strong>16:10, Ultrawide (21:9) and Super Ultrawide (32:9) aspect ratios offer an expanded field of view throughout Atropos &ndash; with wider aspects adding additional options for cinematics and the user interface. All this in stunning 4K.<em>(1)</em>&nbsp;On high-specification PCs, experience deeper immersion with ray-traced reflections and shadows, adding a whole new layer of lighting options &ndash; all customizable through various sliders. Performance enhancing technologies such as NVIDIA&rsquo;s DLSS and NVIDIA NIS, as well as AMD&rsquo;s FSR<em>(2)</em>, are also available.</strong><br><br><strong><em>1</em>&nbsp;Compatible PC and display device required.<br><em>2</em>&nbsp;Compatible PC and graphics card required for enhanced graphics.&nbsp;</strong></p>\r\n<h2 class=\"bb_tag\">Feel sensory overload, first hand</h2>\r\n<p><br><strong>Play with the DualSense&trade; controller to experience haptic feedback and dynamic trigger effects.<em>(3)</em>&nbsp;Alternatively, choose mouse and keyboard or other controller inputs &ndash; all with fully customizable button prompts. Expanded accessibility options have also been added, including an alt-fire crosshair charging notification, alongside a Co-op ping system. Added support for Dolby Atmos, as well as the option to select type of 3D Audio support.<em>(4)</em>&nbsp;Hear sound all around you with pinpoint accuracy, bringing environments to life and helping improve your reactions.</strong><br><br><strong><em>3</em>&nbsp;Wired connection required to experience the full range of in-game controller features.<br><em>4</em>&nbsp;3D Audio modes require stereo headphones or compatible speaker</strong></p>\r\n<h2 class=\"bb_tag\">Co-op Mode:</h2>\r\n<p><br>In Co-op Mode, share your journey through the shifting labyrinth of Atropos with another PC player.<em>(5)</em>&nbsp;The hostile nature of Atropos will remain unwavering, but the possibility of teamwork adds a whole new dimension and means of survival. Each player controls a different version of Selene, from different cycles. Using the Chronosis device located in each biome, the host player summons a friend or is matched with another random online player. The progress of the host determines the available item pool for the duration of the multiplayer session.</p>\r\n<h2 class=\"bb_tag\">Tower of Sisyphus:</h2>\r\n<p><br>Next time you wake at the crash site, look up. You should be able to see a gate towards the Tower of Sisyphus, accessible as long as you&rsquo;ve unlocked the Icarian Grapnel.<em>(5)</em>&nbsp;In this Tower, prepare for a new kind of challenge. It&rsquo;s a nearly endless ascending gauntlet with a pure focus on combat, how high you build up your score and progress, exclusive items, Scout logs and as-yet unseen fragments from Selene&rsquo;s story.<br><br><strong><em>5</em>&nbsp;The Tower of Sisyphus, House sequences and Challenge Mode are not available in Co-op Mode. Cross-play with players on PlayStation&reg;5 consoles is not supported.</strong><br><br><em><strong>INTENSE COMBAT</strong>&nbsp;- Fight to survive in this third-person roguelike shooter.<br>- Take on ruthless enemies in explosive, bullet hell-fuelled combat.</em><br><br><em><strong>THRILLING EXPLORATION</strong>&nbsp;- Manage equipment and resources carefully &ndash; every time you die, you restart from the beginning.<br>- Scavenge alien tech for upgrades to enhance your abilities in future cycles.</em><br><br><em><strong>HAUNTING NARRATIVE</strong>&nbsp;- Piece together fragments of Selene&rsquo;s memories as she seeks out answers.<br>- Forge a personal connection with the planet as you explore its constantly evolving and decaying terrain.</em></p>', '2023-02-15', 879000, 0, 3, 4),
(35, '2024-07-27 02:24:59', '2024-07-27 02:24:59', 'Genshin Impact', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722072257280?alt=media&token=103657ef-31e2-42dd-abc6-38aadd6adfa4', 'Step into Teyvat, a vast world teeming with life and flowing with elemental energy. You and your sibling arrived here from another world. Separated by an unknown god, stripped of your powers, and cast into a deep slumber, you now awake to a world very different from when you first arrived.', '<p>Step into Teyvat, a vast world teeming with life and flowing with elemental energy.<br><br>You and your sibling arrived here from another world. Separated by an unknown god, stripped of your powers, and cast into a deep slumber, you now awake to a world very different from when you first arrived.<br><br>Thus begins your journey across Teyvat to seek answers from The Seven &mdash; the gods of each element. Along the way, prepare to explore every inch of this wondrous world, join forces with a diverse range of characters, and unravel the countless mysteries that Teyvat holds...<br><br>MASSIVE OPEN WORLD<br><br>Climb any mountain, swim across any river, and glide over the world below, taking in the jaw-dropping scenery each step of the way. And if you stop to investigate a wandering Seelie or strange mechanism, who knows what you might discover?<br><br>ELEMENTAL COMBAT SYSTEM<br><br>Harness the seven elements to unleash elemental reactions. Anemo, Electro, Hydro, Pyro, Cryo, Dendro, and Geo interact in all sorts of ways, and Vision wielders have the power to turn this to their advantage.<br><br>Will you vaporize Hydro with Pyro, electro-charge it with Electro, or freeze it with Cryo? Your mastery of the elements will give you the upper hand in battle and exploration.<br><br>BEAUTIFUL VISUALS<br><br>Feast your eyes on the world around you, with a stunning art style, real-time rendering, and finely tuned character animations delivering you a truly immersive visual experience. Lighting and weather all change naturally over time, bringing every detail of this world to life.<br><br>SOOTHING SOUNDTRACK<br><br>Let the beautiful sounds of Teyvat draw you in as you explore the expansive world around you. Performed by the world\'s top orchestras such as London Philharmonic Orchestra and Shanghai Symphony Orchestra, the soundtrack changes seamlessly with the time and gameplay to match the mood.<br><br>BUILD YOUR DREAM TEAM<br><br>Team up with a diverse cast of characters in Teyvat, each with their own unique personalities, stories, and abilities. Discover your favorite party combinations and level up your characters to help you conquer even the most daunting of enemies and domains.<br><br>JOURNEY WITH FRIENDS<br><br>Team up with friends across various platforms to trigger more elemental action, tackle tricky boss fights, and conquer challenging domains together to reap rich rewards.<br><br>As you stand atop the peaks of Jueyun Karst and take in the rolling clouds and vast terrain stretching out before you, you may wish to stay in Teyvat a little longer... But until you are reunited with your lost sibling, how can you rest? Go forth, Traveler, and begin your adventure!</p>', '2020-09-28', 0, 0, 4, 2),
(36, '2024-07-27 02:30:17', '2024-07-27 02:30:17', 'Honkai: Star Rail', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722072578425?alt=media&token=7f02fef5-d300-41a9-a521-e72df2a0f15b', 'Honkai: Star Rail is a new HoYoverse space fantasy RPG. Hop aboard the Astral Express and experience the galaxy\'s infinite wonders filled with adventure and thrills.', '<p>Honkai: Star Rail is a new HoYoverse space fantasy RPG.<br>Hop aboard the Astral Express and experience the galaxy\'s infinite wonders filled with adventure and thrills.<br>Players will meet new companions across various worlds and maybe even run into some familiar faces. Overcome the struggles together caused by Stellaron and unravel the hidden truths behind it! May this journey lead us starward!<br><br>□ Explore Distinct Worlds &mdash; Discover the boundless universe filled with wonder<br>3, 2, 1, initiating warp! A space station with Curios sealed away, a foreign planet with an eternal winter, a starship hunting down abominations... Every stop of the Astral Express is a never-before-seen view of the galaxy! Explore fantastical worlds and civilizations, uncover mysteries beyond imagination, and set out on a journey of wonder!<br><br>□ Riveting RPG Experience &mdash; A best-in-class immersive adventure beyond the stars<br>Embark on a galactic adventure where you shape the story. Our cutting-edge engine renders high-quality cinematics in real-time, our innovative facial expression system concocts genuine sentiments, and HOYO-MiX\'s original score sets the stage. Join us now and journey through a universe of conflict and collaboration, where your choices define the outcome!<br><br>□ Compelling Allies &mdash; Go on a trailblazing venture with new friends<br>In the ocean of stars, there are endless encounters that come along with endless adventures. Prepare tickets for your companions and embark on this wondrous journey together! A spunky and eccentric amnesiac girl, a noble and upright Silvermane Guard, an indolent Cloud Knight general, and even a mysterious and secretive professional beauty... Confront the Stellaron crisis together and weave your past, present, and future with laughter and tears.<br><br>□ Reimagining Tactical Combat &mdash; Exploit weaknesses, battle to your heart\'s desire<br>Get ready for exciting battles with a satisfying rhythm! Use a brand-new command combat system that enables simple yet strategic controls, employ Techniques and suppress enemies with different Types\' Weakness Breaks, then finish the fight with style via a stunning Ultimate. In the randomly-generated mazes of the Simulated Universe, surprising random events and nearly 100 different Blessings and Curios will grant you an incredible boost in abilities, allowing you to challenge a more unpredictable combat environment.<br><br>□ Top-Tier Voice Actors for an Immersive Experience &mdash; A dream team of multiple language dubs assembled for the entire story<br>When words come alive, when stories give you a choice, when characters possess a soul... We present to you dozens of emotions, hundreds of facial expressions, thousands of lore pieces, and a million words that make up this universe\'s beating heart. With full voice-over in four languages, the characters will transcend their virtual existences and become your tangible companions, creating a new chapter in this tale together with you.</p>', '2023-04-26', 0, 0, 4, 2),
(37, '2024-07-28 02:34:51', '2024-07-28 02:35:46', 'Need for Speed™ Unbound', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722159270479?alt=media&token=3dd04fc5-2e09-421f-aae4-01aa05fc7c64', 'Race to the top, definitely don’t flop. Outsmart the cops, and enter weekly qualifiers for The Grand: the ultimate street race. Pack your garage with precision-tuned, custom rides, and light up the streets with your style.', '<p><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1846380/extras/EXC_Beautyshot_Volume7_en-US_Steam_610x940.jpg?t=1717488164\"><br>Race against time, outsmart the cops and take on weekly qualifiers to reach The Grand, Lakeshore\'s ultimate street racing challenge. Pack your garage with precision-tuned, custom rides; and light up the streets with your style, exclusive fits, and a vibrant global soundtrack that bumps in every corner of the world.<br><br>Content updates to the game come in the form of Volumes as the game builds towards becoming the Ultimate NFS Experience, in one place for the first time.<br><br><strong>VOL. 7: DRIFT &amp; DRAG</strong><br>Discover new feels for classic skills in Vol. 7: Drift &amp; Drag, featuring the reintroduction of Drift and Drag modes and League progression, and the arrival of the fully customizable Ford Mustang Dark Horse \'24 and BMW M3 Competition Touring \'23.<br><br><strong>VOL. 6: HEAD TO HEAD</strong><br>Jump straight into the competition in Vol. 6 with a new dedicated PVP mode featuring weekly playlists. Crush your rivals with the introduction of 3 fully customizable Audi cars with unique modifications.<br><br><strong>VOL. 5</strong><br>Show that you&rsquo;ve reached the top of the scene, earned the right to be notorious, and that you&rsquo;re not going anywhere.<br><br><strong>VOL. 4</strong><br>Celebrate 75 years of Porsche with special events and a wild Legendary Custom Porsche in Vol. 4, and feel the rush as cops join the chase in new Gauntlet Playlists.<br><br><strong>VOL. 3</strong><br>Work together to crush intense stunt-based challenges against the clock as Vol. 3 brings new ways to earn XP and Bank.<br><br><strong>VOL. 2</strong><br>Head back into the city as Lakeshore evolves to bring more events and activities for you to enjoy with friends in Vol. 2.<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1846380/extras/NFS_Steam_USP1_Banner.png?t=1717488164\"><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1846380/extras/NFS_Steam_USP2_Banner.png?t=1717488164\"><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1846380/extras/NFS_Steam_USP3_Banner.png?t=1717488164\"><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1846380/extras/NFS_Steam_USP4_Banner.png?t=1717488164\"><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1846380/extras/NFS_Steam_USP5_Banner.png?t=1717488164\"><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1846380/extras/NFS_Steam_PC_UX_Banner_V2.png?t=1717488164\"></p>', '2022-12-02', 759000, 0, 6, 4),
(38, '2024-07-28 02:39:49', '2024-07-28 02:39:49', 'Need for Speed™ Heat', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/videos%2F1722159541353?alt=media&token=0027b1b3-c87e-4d9e-8da3-f872d9e20db5', 'Hustle by day and risk it all at night in Need for Speed™ Heat Deluxe Edition, a white-knuckle street racer, where the lines of the law fade as the sun starts to set.', '<p>A thrilling race experience pits you against a city&rsquo;s rogue police force as you battle your way into street racing&rsquo;s elite.<br><br>Hustle by day and risk it all at night in Need for Speed&trade; Heat, a white-knuckle street racer, where the lines of the law fade as the sun starts to set. By day, Palm City hosts the Speedhunter Showdown, a sanctioned competition where you earn Bank to customize and upgrade your high-performance cars. At night, ramp up the intensity in illicit street races that build your reputation, getting you access to bigger races and better parts. But stay ready &ndash; cops are waiting and not all of them play fair.</p>\r\n<h2 class=\"bb_tag\">The Deluxe Edition comes with:</h2>\r\n<ul class=\"bb_ul\">\r\n<li>K.S Edition Mitsubishi Lancer Evolution X Starter Car, available at start in player garage</li>\r\n<li>3 additional K.S Edition cars unlocked through progression</li>\r\n<li>4 exclusive character outfits &mdash; swappable and fit both male and female avatars</li>\r\n<li>REP rewards increased by 5%</li>\r\n<li>BANK rewards increased by 5%<br><br><img src=\"https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1222680/extras/deluxe-edition-2.png?t=1716831270\"></li>\r\n</ul>', '2019-11-08', 759000, 0, 6, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `game_carts`
--

DROP TABLE IF EXISTS `game_carts`;
CREATE TABLE IF NOT EXISTS `game_carts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_gift` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_carts_game_id_foreign` (`game_id`),
  KEY `game_carts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `game_carts`
--

INSERT INTO `game_carts` (`id`, `created_at`, `updated_at`, `game_id`, `user_id`, `is_gift`) VALUES
(269, '2024-07-30 20:10:46', '2024-07-30 20:10:46', 10, 5, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `game_genres`
--

DROP TABLE IF EXISTS `game_genres`;
CREATE TABLE IF NOT EXISTS `game_genres` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_genres_game_id_foreign` (`game_id`),
  KEY `game_genres_genre_id_foreign` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `game_genres`
--

INSERT INTO `game_genres` (`id`, `created_at`, `updated_at`, `game_id`, `genre_id`) VALUES
(7, NULL, NULL, 5, 1),
(8, NULL, NULL, 5, 2),
(9, NULL, NULL, 6, 1),
(10, NULL, NULL, 6, 2),
(11, NULL, NULL, 7, 1),
(12, NULL, NULL, 7, 2),
(13, NULL, NULL, 8, 1),
(14, NULL, NULL, 8, 2),
(15, NULL, NULL, 8, 3),
(16, NULL, NULL, 9, 2),
(17, NULL, NULL, 9, 3),
(18, NULL, NULL, 10, 1),
(19, NULL, NULL, 10, 2),
(20, NULL, NULL, 11, 2),
(21, NULL, NULL, 12, 1),
(22, NULL, NULL, 12, 2),
(23, NULL, NULL, 13, 1),
(24, NULL, NULL, 13, 2),
(25, NULL, NULL, 14, 1),
(26, NULL, NULL, 14, 2),
(27, NULL, NULL, 15, 1),
(28, NULL, NULL, 15, 2),
(29, NULL, NULL, 16, 2),
(30, NULL, NULL, 16, 3),
(31, NULL, NULL, 17, 2),
(32, NULL, NULL, 18, 2),
(33, NULL, NULL, 19, 3),
(34, NULL, NULL, 20, 2),
(35, NULL, NULL, 21, 2),
(36, NULL, NULL, 22, 2),
(37, NULL, NULL, 22, 3),
(38, NULL, NULL, 23, 1),
(39, NULL, NULL, 23, 2),
(40, NULL, NULL, 24, 2),
(41, NULL, NULL, 25, 2),
(42, NULL, NULL, 26, 4),
(43, NULL, NULL, 26, 5),
(44, NULL, NULL, 26, 11),
(45, NULL, NULL, 27, 3),
(46, NULL, NULL, 27, 5),
(47, NULL, NULL, 27, 10),
(48, NULL, NULL, 28, 6),
(49, NULL, NULL, 28, 10),
(50, NULL, NULL, 29, 2),
(51, NULL, NULL, 29, 11),
(52, NULL, NULL, 30, 5),
(53, NULL, NULL, 30, 12),
(54, NULL, NULL, 31, 1),
(55, NULL, NULL, 31, 2),
(56, NULL, NULL, 32, 4),
(57, NULL, NULL, 32, 5),
(58, NULL, NULL, 32, 11),
(59, NULL, NULL, 33, 4),
(60, NULL, NULL, 33, 5),
(61, NULL, NULL, 34, 4),
(62, NULL, NULL, 34, 11),
(63, NULL, NULL, 35, 1),
(64, NULL, NULL, 35, 5),
(65, NULL, NULL, 35, 8),
(66, NULL, NULL, 36, 1),
(67, NULL, NULL, 36, 4),
(68, NULL, NULL, 36, 5),
(69, NULL, NULL, 37, 6),
(70, NULL, NULL, 37, 10),
(71, NULL, NULL, 38, 6),
(72, NULL, NULL, 38, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `game_gifts`
--

DROP TABLE IF EXISTS `game_gifts`;
CREATE TABLE IF NOT EXISTS `game_gifts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `game_gifts`
--

INSERT INTO `game_gifts` (`id`, `created_at`, `updated_at`, `game_id`, `sender_id`, `receiver_id`, `message`, `status`, `discount_percentage`) VALUES
(1, '2024-07-23 18:44:53', '2024-07-24 02:11:19', 23, 158, 5, 'This is a gift', '1', 0),
(2, '2024-07-23 18:45:48', '2024-07-24 02:18:33', 20, 146, 5, 'dread out', '1', 0),
(3, '2024-07-24 02:08:11', '2024-07-24 02:08:11', 9, 5, 133, 'new gift', '1', 30),
(4, '2024-07-24 02:23:03', '2024-07-24 02:24:05', 20, 133, 5, 'dsadsasdasad', '1', 0),
(5, '2024-07-24 03:53:20', '2024-07-24 03:53:20', 9, 5, 142, NULL, '1', 30),
(6, '2024-07-24 04:14:37', '2024-07-24 04:14:37', 25, 5, 134, NULL, '0', 0),
(7, '2024-07-24 04:17:16', '2024-07-24 04:17:16', 10, 5, 137, NULL, '0', 20),
(8, '2024-07-24 04:22:04', '2024-07-24 04:22:04', 20, 151, 5, NULL, '0', 0),
(9, '2024-07-24 04:22:46', '2024-07-24 04:22:46', 20, 5, 151, NULL, '0', 0),
(10, '2024-07-24 04:23:16', '2024-07-24 04:23:16', 10, 5, 149, NULL, '0', 20),
(11, '2024-07-25 02:34:17', '2024-07-25 02:34:17', 21, 5, 133, NULL, '0', 0),
(12, '2024-07-25 02:34:17', '2024-07-25 02:34:17', 24, 5, 136, NULL, '0', 0),
(13, '2024-07-25 08:26:57', '2024-07-25 08:26:57', 10, 5, 135, 'ds', '0', 20),
(14, '2024-07-25 08:28:51', '2024-07-25 08:28:51', 10, 5, 141, NULL, '0', 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `game_images`
--

DROP TABLE IF EXISTS `game_images`;
CREATE TABLE IF NOT EXISTS `game_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_images_game_id_foreign` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `game_images`
--

INSERT INTO `game_images` (`id`, `created_at`, `updated_at`, `image_url`, `game_id`) VALUES
(16, '2024-07-08 22:56:35', '2024-07-08 22:56:35', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/208650/capsule_616x353.jpg?t=1702934528', 5),
(17, '2024-07-08 22:56:35', '2024-07-08 22:56:35', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504584165?alt=media&token=c7fcad74-9108-481e-89f8-b4eff0a5bc36', 5),
(18, '2024-07-08 22:56:35', '2024-07-08 22:56:35', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504586626?alt=media&token=1aa1e17e-7cea-4673-8cd2-f224ac33d1d7', 5),
(19, '2024-07-08 22:56:35', '2024-07-08 22:56:35', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504588735?alt=media&token=bdc20ee2-1c55-414a-8c02-77f39ea0d199', 5),
(20, '2024-07-08 22:56:35', '2024-07-08 22:56:35', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504592062?alt=media&token=0ebd17dd-dd05-41ca-a4a5-210f3d2c8a57', 5),
(21, '2024-07-08 22:56:35', '2024-07-08 22:56:35', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504593890?alt=media&token=aa845972-71da-4d8d-923f-7914e2fa2f8e', 5),
(22, '2024-07-08 23:00:11', '2024-07-08 23:00:11', 'https://external-preview.redd.it/n3HFGGo1IbkQDqC3TncreXVtplyHbyoTJxt1eKsvSVU.jpg?auto=webp&s=10d12c9fc03582fc01177ee7c12f51f6d6203b36', 6),
(23, '2024-07-08 23:00:11', '2024-07-08 23:00:11', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504801089?alt=media&token=66b65ab8-2749-4036-acc5-fa01be037a61', 6),
(24, '2024-07-08 23:00:11', '2024-07-08 23:00:11', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504803586?alt=media&token=bd25a6ec-a741-42d7-82a2-e6b07bd19799', 6),
(25, '2024-07-08 23:00:11', '2024-07-08 23:00:11', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504805319?alt=media&token=325196c0-ec6a-4a5e-a28d-a8adaafbb786', 6),
(26, '2024-07-08 23:00:11', '2024-07-08 23:00:11', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504807576?alt=media&token=310c32a2-e879-469d-b4b9-d3fb58b92e38', 6),
(27, '2024-07-08 23:00:11', '2024-07-08 23:00:11', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504809376?alt=media&token=6cc0a6a9-4185-49e4-84cc-3d6df32b2c94', 6),
(28, '2024-07-08 23:02:27', '2024-07-08 23:02:27', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/capsule_616x353_alt_assets_2.jpg?t=1720627962', 7),
(29, '2024-07-08 23:02:27', '2024-07-08 23:02:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504937055?alt=media&token=2cb1b118-2320-4891-b3dd-46807292a848', 7),
(30, '2024-07-08 23:02:27', '2024-07-08 23:02:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504939907?alt=media&token=68ccf88e-cb04-4e31-b6e0-ee1099884b68', 7),
(31, '2024-07-08 23:02:27', '2024-07-08 23:02:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504942483?alt=media&token=a38cd72a-b4e1-4022-8060-5943c646d721', 7),
(32, '2024-07-08 23:02:27', '2024-07-08 23:02:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504944782?alt=media&token=29458f7f-bfa1-4481-b126-ca336ffe2d46', 7),
(33, '2024-07-08 23:02:27', '2024-07-08 23:02:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720504945559?alt=media&token=35a5f6ac-6734-4208-9b2c-eb086dab7518', 7),
(34, '2024-07-08 23:07:03', '2024-07-08 23:07:03', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/capsule_616x353.jpg?t=1717621627', 8),
(35, '2024-07-08 23:07:03', '2024-07-08 23:07:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720505218636?alt=media&token=8a728d26-2d86-4ea7-9c99-3e3ba57effda', 8),
(36, '2024-07-08 23:07:03', '2024-07-08 23:07:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720505219541?alt=media&token=108bac0e-f13d-43d1-ab56-1071d6de8cdb', 8),
(37, '2024-07-08 23:07:03', '2024-07-08 23:07:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720505220531?alt=media&token=6e721f58-0319-49c6-9de0-69d59848f5c4', 8),
(38, '2024-07-08 23:07:03', '2024-07-08 23:07:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720505221468?alt=media&token=afa61738-bed5-451c-9713-dc0a6519329f', 8),
(39, '2024-07-08 23:07:03', '2024-07-08 23:07:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720505222247?alt=media&token=35f5982d-42bd-45c6-bfe0-190f2edab433', 8),
(40, '2024-07-09 00:08:42', '2024-07-09 00:08:42', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/460930/capsule_616x353.jpg?t=1695136171', 9),
(41, '2024-07-09 00:08:42', '2024-07-09 00:08:42', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720508914440?alt=media&token=37a78abe-468e-4065-a343-9913091a83f2', 9),
(42, '2024-07-09 00:08:42', '2024-07-09 00:08:42', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720508916316?alt=media&token=def7c977-a8f8-49c4-af5d-0dee52bf49b6', 9),
(43, '2024-07-09 00:08:42', '2024-07-09 00:08:42', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720508918122?alt=media&token=ba568a0c-fd32-4150-a921-4d7d67be730a', 9),
(44, '2024-07-09 00:08:42', '2024-07-09 00:08:42', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720508919920?alt=media&token=757ed423-100b-48d0-ac49-c09d3f7c7823', 9),
(45, '2024-07-09 00:27:17', '2024-07-09 00:27:17', 'https://www.internetmatters.org/wp-content/uploads/2024/02/what-is-palworld-safe-guide-feature.webp', 10),
(46, '2024-07-09 00:27:17', '2024-07-09 00:27:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720510025370?alt=media&token=ab768d6a-6d2c-4973-8399-804337cc271e', 10),
(47, '2024-07-09 00:27:17', '2024-07-09 00:27:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720510027174?alt=media&token=a4b9a37a-c36c-44b0-8a94-f9a922ab59bd', 10),
(48, '2024-07-09 00:27:17', '2024-07-09 00:27:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720510029220?alt=media&token=be02f9fb-756d-4ef6-b7ef-5daec56733c9', 10),
(49, '2024-07-09 00:27:17', '2024-07-09 00:27:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720510031471?alt=media&token=ce6f4488-8207-45fd-9282-16646ac3b661', 10),
(50, '2024-07-09 00:27:17', '2024-07-09 00:27:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720510033270?alt=media&token=23bf345c-f16f-4f07-8ff2-f1d9a471fde1', 10),
(51, '2024-07-09 00:27:17', '2024-07-09 00:27:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720510035131?alt=media&token=39d48eb3-3d26-41fa-b613-b60b94305395', 10),
(58, '2024-07-22 21:20:08', '2024-07-22 21:20:08', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/capsule_616x353.jpg?t=1721123311', 12),
(59, '2024-07-22 21:20:08', '2024-07-22 21:20:08', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708401938?alt=media&token=98ed0020-5269-4069-b9b1-712a10e5e39d', 12),
(60, '2024-07-22 21:20:08', '2024-07-22 21:20:08', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708402684?alt=media&token=735b0ef0-08fc-41de-91a6-4ab8271c1ef9', 12),
(61, '2024-07-22 21:20:08', '2024-07-22 21:20:08', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708403454?alt=media&token=53481bd9-96f9-48e4-bade-11e1e2816e08', 12),
(62, '2024-07-22 21:20:08', '2024-07-22 21:20:08', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708405411?alt=media&token=abfcf2f3-ffb6-4cc0-bba5-271241687669', 12),
(63, '2024-07-22 21:20:08', '2024-07-22 21:20:08', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708406158?alt=media&token=4ed387b6-9abe-4913-b68b-38791c2e9ffb', 12),
(64, '2024-07-22 21:23:57', '2024-07-22 21:23:57', 'https://image.api.playstation.com/vulcan/ap/rnd/202106/2322/ZSrFeb6XkqKiq2PZKWg20yfe.jpg', 13),
(65, '2024-07-22 21:23:57', '2024-07-22 21:23:57', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708630426?alt=media&token=b4acb3f1-84ed-4736-bd65-4f2de7c8c9d6', 13),
(66, '2024-07-22 21:23:57', '2024-07-22 21:23:57', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708631455?alt=media&token=3ffb112b-3e86-4db4-ad65-183081091676', 13),
(67, '2024-07-22 21:23:57', '2024-07-22 21:23:57', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708633398?alt=media&token=3c225195-3493-4647-b622-e7e9a64c8e29', 13),
(68, '2024-07-22 21:23:57', '2024-07-22 21:23:57', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708634129?alt=media&token=6a8210ee-0d29-4d55-b32a-1e0e2fbd88b2', 13),
(69, '2024-07-22 21:23:57', '2024-07-22 21:23:57', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708636080?alt=media&token=69b5dbf6-3da2-4b05-8cf1-65f19f46f6cd', 13),
(70, '2024-07-22 22:24:51', '2024-07-22 22:24:51', 'https://image.api.playstation.com/vulcan/ap/rnd/202307/2605/7b70e463bf05b20fbf99f8bf81956aa805969da98d9dcde8.jpg', 14),
(71, '2024-07-22 22:24:51', '2024-07-22 22:24:51', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712268452?alt=media&token=eaf7b203-8eda-4fc7-a2b4-e57fc73c7f2e', 14),
(72, '2024-07-22 22:24:51', '2024-07-22 22:24:51', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712269952?alt=media&token=59cc383a-4f77-4a17-988b-1a810d82f276', 14),
(73, '2024-07-22 22:24:51', '2024-07-22 22:24:51', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712273796?alt=media&token=cf9c7288-9b96-4612-bcb9-67a7028d959a', 14),
(74, '2024-07-22 22:24:51', '2024-07-22 22:24:51', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712277108?alt=media&token=341a38fe-3b98-49b0-99fe-7f60d3749e6b', 14),
(75, '2024-07-22 22:24:51', '2024-07-22 22:24:51', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712281186?alt=media&token=dcec31a7-68f4-417a-b139-6e55e070ca9d', 14),
(76, '2024-07-22 22:28:24', '2024-07-22 22:28:24', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/01/dota-2.jpg', 15),
(77, '2024-07-22 22:28:24', '2024-07-22 22:28:24', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712494778?alt=media&token=715f8ff7-b9eb-468e-9cb4-e947c242f3b6', 15),
(78, '2024-07-22 22:28:24', '2024-07-22 22:28:24', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712496659?alt=media&token=d0a2c774-01d0-4cf8-8165-da08abc38550', 15),
(79, '2024-07-22 22:28:24', '2024-07-22 22:28:24', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712498478?alt=media&token=f5edc497-9485-418a-894a-8f83bfa737cc', 15),
(80, '2024-07-22 22:28:24', '2024-07-22 22:28:24', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712500341?alt=media&token=d60be27e-35f9-4293-987d-c85082812a36', 15),
(81, '2024-07-22 22:28:24', '2024-07-22 22:28:24', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712502186?alt=media&token=8a9158b5-16dd-42f9-a816-55647e201cd4', 15),
(82, '2024-07-22 22:32:39', '2024-07-22 22:32:39', 'https://cdn1.epicgames.com/offer/428115def4ca4deea9d69c99c5a5a99e/EN_Bungie_S23_Landscape_Offer_2560x1440_2560x1440-c45db1ff7ff051053f4b44338f88f438', 16),
(83, '2024-07-22 22:32:39', '2024-07-22 22:32:39', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712752477?alt=media&token=83666ac5-4ea8-4a07-a715-56060c9cefc6', 16),
(84, '2024-07-22 22:32:39', '2024-07-22 22:32:39', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712753341?alt=media&token=0eea0108-c857-4a6f-87b0-70b3c1b79c51', 16),
(85, '2024-07-22 22:32:39', '2024-07-22 22:32:39', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712755166?alt=media&token=851927f6-529c-4a43-baff-7860d20fb035', 16),
(86, '2024-07-22 22:32:39', '2024-07-22 22:32:39', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712757031?alt=media&token=1150347a-23d8-446f-a703-139026a64bc6', 16),
(87, '2024-07-22 22:32:39', '2024-07-22 22:32:39', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721712757801?alt=media&token=95ad3f93-5012-4f17-b188-424641bfb834', 16),
(88, '2024-07-22 22:37:30', '2024-07-22 22:37:30', 'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/en_US/games/switch/o/omori-switch/hero', 17),
(89, '2024-07-22 22:37:30', '2024-07-22 22:37:30', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713043464?alt=media&token=39d96f1e-4924-45d0-b2b8-b2733c800288', 17),
(90, '2024-07-22 22:37:30', '2024-07-22 22:37:30', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713044438?alt=media&token=aa94d9d3-fd74-4945-abfc-8f7249730b58', 17),
(91, '2024-07-22 22:37:30', '2024-07-22 22:37:30', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713046907?alt=media&token=ca52e02a-4f68-4ff2-aa7f-656e479c03a8', 17),
(92, '2024-07-22 22:37:30', '2024-07-22 22:37:30', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713048991?alt=media&token=c2dd572b-4798-464f-85d6-fcc5db6708a3', 17),
(93, '2024-07-22 22:37:30', '2024-07-22 22:37:30', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713049774?alt=media&token=e3a6d945-be79-4aba-882c-d49c56ef7423', 17),
(94, '2024-07-22 22:46:26', '2024-07-22 22:46:26', 'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/software/switch/70010000042151/cfef7634adfd013fc6429f00e0284ddef85c0f857ed5da8d319710cbc249cac3', 18),
(95, '2024-07-22 22:46:26', '2024-07-22 22:46:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713573253?alt=media&token=d6dbe48c-5132-45e9-aece-8ae088a39c82', 18),
(96, '2024-07-22 22:46:26', '2024-07-22 22:46:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713576996?alt=media&token=e642b1e0-4cc4-43e0-b66b-3614acf2ad54', 18),
(97, '2024-07-22 22:46:26', '2024-07-22 22:46:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713580292?alt=media&token=5a772fdf-b8ba-4f61-a29e-d5a778b2ea4f', 18),
(98, '2024-07-22 22:46:26', '2024-07-22 22:46:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713582399?alt=media&token=f014b41b-5136-44f1-80c6-db8a7f9d2e1c', 18),
(99, '2024-07-22 22:46:26', '2024-07-22 22:46:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713584340?alt=media&token=d0cd2b65-694d-4c7d-b740-9f4111d730e5', 18),
(100, '2024-07-22 22:51:26', '2024-07-22 22:51:26', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/294100/capsule_616x353.jpg?t=1712954312', 19),
(101, '2024-07-22 22:51:26', '2024-07-22 22:51:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713869387?alt=media&token=4622e6b3-cc14-4625-a6e8-37244576c7f8', 19),
(102, '2024-07-22 22:51:26', '2024-07-22 22:51:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713872133?alt=media&token=69b46b5a-05a0-4057-8943-ebb739b13cc0', 19),
(103, '2024-07-22 22:51:26', '2024-07-22 22:51:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713876306?alt=media&token=588a592b-c8ab-40b3-b471-e465fe6a09ba', 19),
(104, '2024-07-22 22:51:26', '2024-07-22 22:51:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713879362?alt=media&token=776c245d-39dc-4120-9fcb-176b98511e96', 19),
(105, '2024-07-22 22:51:26', '2024-07-22 22:51:26', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721713882878?alt=media&token=a790a0de-5094-4d46-a7c0-a83bcb96b593', 19),
(106, '2024-07-22 22:58:56', '2024-07-22 22:58:56', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/269790/capsule_616x353.jpg?t=1661346820', 20),
(107, '2024-07-22 22:58:56', '2024-07-22 22:58:56', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714329852?alt=media&token=e14bb7e9-f476-49e9-a4be-988cb93a0165', 20),
(108, '2024-07-22 22:58:56', '2024-07-22 22:58:56', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714331579?alt=media&token=bde88d7e-47cd-4a79-94a9-03355c7fd098', 20),
(109, '2024-07-22 22:58:56', '2024-07-22 22:58:56', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714333881?alt=media&token=28436349-9b34-42d6-90a9-e56a37930b9b', 20),
(110, '2024-07-22 22:58:56', '2024-07-22 22:58:56', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714335087?alt=media&token=7319cc14-aa80-462c-863b-3f6b98c1df41', 20),
(111, '2024-07-22 22:58:56', '2024-07-22 22:58:56', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714335838?alt=media&token=6f884f84-7084-4258-9a53-9823e3809cf7', 20),
(112, '2024-07-22 23:02:14', '2024-07-22 23:02:14', 'https://cdn1.epicgames.com/offer/611482b8586142cda48a0786eb8a127c/EGS_DeadbyDaylight_BehaviourInteractive_S1_2560x1440-a32581cf9948a9a2e24b2ff15c1577c7', 21),
(113, '2024-07-22 23:02:14', '2024-07-22 23:02:14', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714529288?alt=media&token=f27b6c3f-be98-468d-b29f-88c989c2fd51', 21),
(114, '2024-07-22 23:02:14', '2024-07-22 23:02:14', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714530290?alt=media&token=4afb9bf5-83e1-476f-9385-73edfb485b68', 21),
(115, '2024-07-22 23:02:14', '2024-07-22 23:02:14', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714531294?alt=media&token=a57c76a0-cbf9-4b16-a6bc-db4651ceade3', 21),
(116, '2024-07-22 23:02:14', '2024-07-22 23:02:14', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714532716?alt=media&token=b4b88139-1805-4e84-8b1c-b5d9e8598de1', 21),
(117, '2024-07-22 23:02:14', '2024-07-22 23:02:14', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714533702?alt=media&token=5d774555-23b3-4142-b05b-15e95b327334', 21),
(118, '2024-07-22 23:05:27', '2024-07-22 23:05:27', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2109307/capsule_616x353.jpg?t=1695259721', 22),
(119, '2024-07-22 23:05:27', '2024-07-22 23:05:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714721361?alt=media&token=93745ec2-d842-4cf2-93b0-6369297476ce', 22),
(120, '2024-07-22 23:05:27', '2024-07-22 23:05:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714722177?alt=media&token=9e65bbcc-eefc-4eb2-9a04-3b1495423a30', 22),
(121, '2024-07-22 23:05:27', '2024-07-22 23:05:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714722981?alt=media&token=3f5ed5fd-9f64-4c19-8fc5-04fa22ab674c', 22),
(122, '2024-07-22 23:05:27', '2024-07-22 23:05:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714725286?alt=media&token=438077f2-6d17-4c88-98a3-80a925b88be5', 22),
(123, '2024-07-22 23:05:27', '2024-07-22 23:05:27', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721714726147?alt=media&token=6fd7a197-a9d3-488f-aba6-0a47fbf34f67', 22),
(124, '2024-07-22 23:13:20', '2024-07-22 23:13:20', 'https://gaming-cdn.com/images/products/2155/orig/monster-hunter-world-pc-game-steam-europe-cover.jpg?v=1710330176', 23),
(125, '2024-07-22 23:13:20', '2024-07-22 23:13:20', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715190360?alt=media&token=67516502-cc38-48f2-9445-a2390d1a5696', 23),
(126, '2024-07-22 23:13:20', '2024-07-22 23:13:20', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715192663?alt=media&token=b1311bc9-293a-48e2-8ded-0d8b7da7fc63', 23),
(127, '2024-07-22 23:13:20', '2024-07-22 23:13:20', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715194486?alt=media&token=92cd3ba6-6381-4588-ae61-9bc885d3e1a9', 23),
(128, '2024-07-22 23:13:20', '2024-07-22 23:13:20', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715196579?alt=media&token=bbd2ba95-f3f8-415d-ac66-6b9065678b47', 23),
(129, '2024-07-22 23:13:20', '2024-07-22 23:13:20', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715198397?alt=media&token=0ca8496e-2220-4ea2-9ae8-0f173115c510', 23),
(215, '2024-07-26 01:54:46', '2024-07-26 01:54:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721964880637?alt=media&token=c284d8a4-83da-4723-af41-1ef9e4883331', 26),
(216, '2024-07-26 01:54:46', '2024-07-26 01:54:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721964885314?alt=media&token=73b525d6-66f4-4f74-a826-c5c851729934', 26),
(217, '2024-07-26 01:54:46', '2024-07-26 01:54:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721964888320?alt=media&token=3a36f1cf-b64b-4fe3-adc4-db0678e1b1ff', 26),
(218, '2024-07-26 01:54:46', '2024-07-26 01:54:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721964889692?alt=media&token=575204b3-20b2-4976-aafc-a0d5330937f0', 26),
(219, '2024-07-26 01:54:46', '2024-07-26 01:54:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721964891988?alt=media&token=f05a6fb5-c1bd-448b-8376-d078c2941537', 26),
(220, '2024-07-26 01:54:46', '2024-07-26 01:54:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721964894668?alt=media&token=50f48493-04b2-46f3-ba91-fc7e55be3b35', 26),
(227, '2024-07-26 04:39:00', '2024-07-26 04:39:00', 'https://image.api.playstation.com/vulcan/ap/rnd/202009/3021/QeJWAaLcYNOpCv7yCVZZEOY5.jpg', 25),
(228, '2024-07-26 04:39:00', '2024-07-26 04:39:00', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715925848?alt=media&token=9108e0f9-4fff-4a15-8b0d-bda6aaa7f6fc', 25),
(229, '2024-07-26 04:39:00', '2024-07-26 04:39:00', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715927721?alt=media&token=17b8f2aa-fee5-4a4d-87c4-e2f6b8ea1315', 25),
(230, '2024-07-26 04:39:00', '2024-07-26 04:39:00', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715928729?alt=media&token=9dc9e2f1-d670-4e41-acd3-e6e32186be55', 25),
(231, '2024-07-26 04:39:00', '2024-07-26 04:39:00', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715930534?alt=media&token=c7bdf64d-b37d-4937-bf78-d240b5900092', 25),
(232, '2024-07-26 04:39:00', '2024-07-26 04:39:00', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715932347?alt=media&token=916be9de-2339-4a1a-ac75-c68c63c31c9a', 25),
(233, '2024-07-26 04:40:38', '2024-07-26 04:40:38', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715726189?alt=media&token=41ef660f-33ae-467d-9cc3-87eb13bedf62', 24),
(234, '2024-07-26 04:40:38', '2024-07-26 04:40:38', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715727755?alt=media&token=0fdc0f50-d87c-41a7-9eb6-0e832ab8f4d3', 24),
(235, '2024-07-26 04:40:38', '2024-07-26 04:40:38', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715730516?alt=media&token=6f52ce25-3edb-47c8-83b3-cd8771fdf668', 24),
(236, '2024-07-26 04:40:38', '2024-07-26 04:40:38', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715732615?alt=media&token=c7931a8d-58d4-41e7-b43a-816651b1e5ba', 24),
(237, '2024-07-26 04:40:38', '2024-07-26 04:40:38', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715734627?alt=media&token=b0f3395f-c4ea-4706-b393-45ccab2f8277', 24),
(238, '2024-07-26 04:40:38', '2024-07-26 04:40:38', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721715735399?alt=media&token=1e990f36-8e20-49b3-9f3d-3e35c0345189', 24),
(239, '2024-07-26 04:41:02', '2024-07-26 04:41:02', 'https://image.api.playstation.com/vulcan/ap/rnd/202203/0903/BRSykxZAAT0OuPrG5nJz19fg.jpg', 11),
(240, '2024-07-26 04:41:02', '2024-07-26 04:41:02', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708159598?alt=media&token=47d75966-2f45-4edf-bafa-b251cf3e1504', 11),
(241, '2024-07-26 04:41:02', '2024-07-26 04:41:02', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708160835?alt=media&token=f6e304f7-9436-49ef-882b-3d24e732c085', 11),
(242, '2024-07-26 04:41:02', '2024-07-26 04:41:02', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708162055?alt=media&token=8ba59596-2607-4256-ae8c-a02b5684b9da', 11),
(243, '2024-07-26 04:41:02', '2024-07-26 04:41:02', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708163076?alt=media&token=5eff0bc6-a2e9-4e11-bde7-c7c32744fc01', 11),
(244, '2024-07-26 04:41:02', '2024-07-26 04:41:02', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721708163777?alt=media&token=8ebc3586-b8a2-439b-b2a7-61cee255bc19', 11),
(245, '2024-07-27 01:42:44', '2024-07-27 01:42:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722069751138?alt=media&token=076b4ab1-d367-4fa3-8aea-f912596e9df0', 27),
(246, '2024-07-27 01:42:44', '2024-07-27 01:42:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722069755626?alt=media&token=e12b66be-be29-4c54-bd4a-fd7570d088c6', 27),
(247, '2024-07-27 01:42:44', '2024-07-27 01:42:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722069757577?alt=media&token=716e4d3f-cb93-423e-97ae-dfe9bebdc139', 27),
(248, '2024-07-27 01:42:44', '2024-07-27 01:42:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722069759785?alt=media&token=8f687a18-8822-4e47-b3df-d8d14de1ea12', 27),
(249, '2024-07-27 01:42:44', '2024-07-27 01:42:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722069762125?alt=media&token=82244631-2da2-4b3b-810a-8732179ca3d9', 27),
(250, '2024-07-27 01:48:03', '2024-07-27 01:48:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070066274?alt=media&token=c9f39bcf-e6fc-499e-ac43-3b92f4671947', 28),
(251, '2024-07-27 01:48:03', '2024-07-27 01:48:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070073066?alt=media&token=0c006d53-5bd6-45cf-b529-428fe67503a0', 28),
(252, '2024-07-27 01:48:03', '2024-07-27 01:48:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070075409?alt=media&token=ed2ef24f-6a92-4357-b8bb-438bacebbb54', 28),
(253, '2024-07-27 01:48:03', '2024-07-27 01:48:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070077209?alt=media&token=71f140a9-0a6c-40fc-930f-05f13d9a9b58', 28),
(254, '2024-07-27 01:48:03', '2024-07-27 01:48:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070078986?alt=media&token=57c2ab91-183f-4a9c-9de3-002bc19fab58', 28),
(255, '2024-07-27 01:48:03', '2024-07-27 01:48:03', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070080745?alt=media&token=ded5139c-84d3-4ac7-9ab4-751006b537ff', 28),
(256, '2024-07-27 01:53:41', '2024-07-27 01:53:41', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070411153?alt=media&token=78506cf3-e11f-4b13-b6b8-c085db90623a', 29),
(257, '2024-07-27 01:53:41', '2024-07-27 01:53:41', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070413217?alt=media&token=a1af23a4-ae1e-487d-b4ec-e61dc53a9626', 29),
(258, '2024-07-27 01:53:41', '2024-07-27 01:53:41', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070415577?alt=media&token=53b603c6-e1ac-4586-a5a2-2343d2c8efda', 29),
(259, '2024-07-27 01:53:41', '2024-07-27 01:53:41', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070417577?alt=media&token=00ad25f5-f3d2-4d9f-afda-6c5f8178bc9e', 29),
(260, '2024-07-27 01:53:41', '2024-07-27 01:53:41', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070419388?alt=media&token=721e106c-f791-45db-a003-0c0b97e65744', 29),
(261, '2024-07-27 01:53:52', '2024-07-27 01:53:52', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070175571?alt=media&token=0a4ceb60-c86a-4125-9e74-3ab3320bf016', 30),
(262, '2024-07-27 01:53:52', '2024-07-27 01:53:52', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070176595?alt=media&token=8ed1954f-337c-495e-aa23-8ce7cf7813e6', 30),
(263, '2024-07-27 01:53:52', '2024-07-27 01:53:52', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070178993?alt=media&token=51178fc8-45ef-4ceb-a918-05061009e440', 30),
(264, '2024-07-27 01:53:52', '2024-07-27 01:53:52', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070181301?alt=media&token=94f9b314-9879-4536-a9c9-3db0ab280c2c', 30),
(265, '2024-07-27 01:53:52', '2024-07-27 01:53:52', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070183337?alt=media&token=e9367af2-46cb-4001-839e-0db5d86458e2', 30),
(266, '2024-07-27 02:08:44', '2024-07-27 02:08:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071312534?alt=media&token=917b2715-1758-4e9c-afd7-b357260a6327', 31),
(267, '2024-07-27 02:08:44', '2024-07-27 02:08:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071317151?alt=media&token=85a3bcb5-cc6d-4729-864d-e7d37f91fad2', 31),
(268, '2024-07-27 02:08:44', '2024-07-27 02:08:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071319182?alt=media&token=5262d2f5-eb9e-46f8-8a9c-e786778e6d9d', 31),
(269, '2024-07-27 02:08:44', '2024-07-27 02:08:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071320180?alt=media&token=febd6859-c672-4487-9253-2b29f7e58f2f', 31),
(270, '2024-07-27 02:08:44', '2024-07-27 02:08:44', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071322198?alt=media&token=24e3d1cd-74d3-492e-a21b-d2ab60ba8e79', 31),
(271, '2024-07-27 02:11:47', '2024-07-27 02:11:47', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071492936?alt=media&token=f6368df8-9f58-4c56-aece-76f2a28a7106', 32),
(272, '2024-07-27 02:11:47', '2024-07-27 02:11:47', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071503191?alt=media&token=bded7907-eb51-45f0-9f8f-7c017b93e561', 32),
(273, '2024-07-27 02:11:47', '2024-07-27 02:11:47', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071504205?alt=media&token=82302c2a-b344-4d84-83cc-4675d470beaa', 32),
(274, '2024-07-27 02:11:47', '2024-07-27 02:11:47', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071505166?alt=media&token=35712c46-9d64-45dc-8c1c-2addbc2aa26a', 32),
(275, '2024-07-27 02:11:47', '2024-07-27 02:11:47', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071505892?alt=media&token=5addc29d-cdee-4eda-84b4-76fba8a35227', 32),
(276, '2024-07-27 02:13:21', '2024-07-27 02:13:21', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071590465?alt=media&token=acdf7be0-6225-407c-af5f-06f0a542e5e9', 33),
(277, '2024-07-27 02:13:21', '2024-07-27 02:13:21', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071595197?alt=media&token=148107bf-3533-47ca-a6d6-235f1cd22fe7', 33),
(278, '2024-07-27 02:13:21', '2024-07-27 02:13:21', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071597036?alt=media&token=2eb242cc-78da-4d88-bdc9-c12fb354fb53', 33),
(279, '2024-07-27 02:13:21', '2024-07-27 02:13:21', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071598915?alt=media&token=c585cb1b-b7a4-4e2f-af07-46b4ef99afd1', 33),
(280, '2024-07-27 02:13:21', '2024-07-27 02:13:21', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071599696?alt=media&token=abc003be-3908-4629-a8d9-dd848b68f36c', 33),
(281, '2024-07-27 02:14:58', '2024-07-27 02:14:58', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071688617?alt=media&token=6023f7ac-6d6c-486c-b0c9-f85f158ac2ef', 34),
(282, '2024-07-27 02:14:58', '2024-07-27 02:14:58', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071692726?alt=media&token=10502b57-5069-43d9-a033-bb80e6806ee5', 34),
(283, '2024-07-27 02:14:58', '2024-07-27 02:14:58', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071693522?alt=media&token=30febcdc-8168-4db9-ac76-c345ece4bb22', 34),
(284, '2024-07-27 02:14:58', '2024-07-27 02:14:58', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071695346?alt=media&token=5abec2cb-f3dc-4d27-836b-dba9aca2cb4e', 34),
(285, '2024-07-27 02:14:58', '2024-07-27 02:14:58', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071697147?alt=media&token=8b51fea0-9c61-49ea-a02e-1593f72f53b2', 34),
(286, '2024-07-27 02:24:59', '2024-07-27 02:24:59', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072274867?alt=media&token=65bf97da-efff-48ef-aec3-97e568605b62', 35),
(287, '2024-07-27 02:24:59', '2024-07-27 02:24:59', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072280486?alt=media&token=76321702-1d17-4015-8fbe-75f311bfcdda', 35),
(288, '2024-07-27 02:24:59', '2024-07-27 02:24:59', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072285783?alt=media&token=d1a3c914-da53-430f-b954-3571725b89aa', 35),
(289, '2024-07-27 02:24:59', '2024-07-27 02:24:59', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072288333?alt=media&token=f57e4814-82b2-408e-ac7d-164f02a652f8', 35),
(290, '2024-07-27 02:24:59', '2024-07-27 02:24:59', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072292505?alt=media&token=3ffd9534-c555-48eb-96a9-9144fd0e38cf', 35),
(291, '2024-07-27 02:24:59', '2024-07-27 02:24:59', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072294310?alt=media&token=22179374-9a09-4638-ad17-522f891bc5bd', 35),
(292, '2024-07-27 02:30:17', '2024-07-27 02:30:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072592759?alt=media&token=488b7f8b-9cd3-475f-9444-0dd5071b9e71', 36),
(293, '2024-07-27 02:30:17', '2024-07-27 02:30:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072597627?alt=media&token=639e8710-0e66-4cae-8d72-6ee1643e486d', 36),
(294, '2024-07-27 02:30:17', '2024-07-27 02:30:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072600081?alt=media&token=bb299650-d992-4928-93b8-4125d8969303', 36),
(295, '2024-07-27 02:30:17', '2024-07-27 02:30:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072604691?alt=media&token=8662ae46-e6af-4de1-bb0e-2dc586007580', 36),
(296, '2024-07-27 02:30:17', '2024-07-27 02:30:17', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722072615979?alt=media&token=2008fff8-1ade-4e20-8441-da52f5c2e6fe', 36),
(302, '2024-07-28 02:35:46', '2024-07-28 02:35:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159282469?alt=media&token=6e6848fc-1e0e-4705-be8b-009f19329ddd', 37),
(303, '2024-07-28 02:35:46', '2024-07-28 02:35:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159284384?alt=media&token=78fee8a1-1183-4016-bea7-900d7a81166b', 37),
(304, '2024-07-28 02:35:46', '2024-07-28 02:35:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159285574?alt=media&token=f34fd3e0-0fa3-4857-998f-8bddc2aa1f26', 37),
(305, '2024-07-28 02:35:46', '2024-07-28 02:35:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159288023?alt=media&token=72ab4977-7f7a-4a41-a22a-c2d991732812', 37),
(306, '2024-07-28 02:35:46', '2024-07-28 02:35:46', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159290009?alt=media&token=04816af4-44b4-4f2f-88f9-7ec4c0a3ec5c', 37),
(307, '2024-07-28 02:39:49', '2024-07-28 02:39:49', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159576917?alt=media&token=ccaafbaa-b8f3-4fc8-8b30-1d1c8b742bab', 38),
(308, '2024-07-28 02:39:49', '2024-07-28 02:39:49', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159578871?alt=media&token=c80410fc-e6f2-49a4-8bbe-1aa6e1a8a3ea', 38),
(309, '2024-07-28 02:39:49', '2024-07-28 02:39:49', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159581023?alt=media&token=df7a66ea-cc60-4087-97ff-46657b674429', 38),
(310, '2024-07-28 02:39:49', '2024-07-28 02:39:49', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159582853?alt=media&token=af2a1014-f250-4c48-837a-b7eda3782775', 38),
(311, '2024-07-28 02:39:49', '2024-07-28 02:39:49', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159584737?alt=media&token=1c55b166-0948-4ab2-ad72-5075627f69ae', 38),
(312, '2024-07-28 02:39:49', '2024-07-28 02:39:49', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722159586604?alt=media&token=0287954c-d3b9-4fd2-97b5-dc5d280fc2fd', 38);

-- --------------------------------------------------------

--
-- Struktur dari tabel `game_libraries`
--

DROP TABLE IF EXISTS `game_libraries`;
CREATE TABLE IF NOT EXISTS `game_libraries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `discount_percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_libraries_game_id_foreign` (`game_id`),
  KEY `game_libraries_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `game_libraries`
--

INSERT INTO `game_libraries` (`id`, `created_at`, `updated_at`, `game_id`, `user_id`, `discount_percentage`) VALUES
(15, '2024-07-22 01:34:07', '2024-07-22 01:34:07', 5, 5, 0),
(16, '2024-07-23 18:42:04', NULL, 6, 139, 0),
(17, '2024-07-23 18:42:04', NULL, 6, 146, 0),
(18, '2024-07-23 18:42:04', '2024-07-23 18:42:04', 10, 5, 20),
(19, '2024-07-24 02:11:19', '2024-07-24 02:11:19', 23, 5, 0),
(34, '2024-07-24 02:24:05', '2024-07-24 02:24:05', 20, 5, 0),
(35, '2024-07-24 03:38:55', '2024-07-24 03:38:55', 9, 5, 30),
(36, '2024-07-24 04:11:59', '2024-07-24 04:11:59', 25, 5, 0),
(37, '2024-07-24 04:11:59', '2024-07-24 04:11:59', 22, 5, 0),
(38, '2024-07-24 04:11:59', '2024-07-24 04:11:59', 21, 5, 0),
(39, '2024-07-24 04:11:59', '2024-07-24 04:11:59', 11, 5, 0),
(40, '2024-07-24 04:11:59', '2024-07-24 04:11:59', 7, 5, 0),
(41, '2024-07-25 02:34:17', '2024-07-25 02:34:17', 19, 5, 50),
(42, '2024-07-30 20:04:11', '2024-07-30 20:04:11', 8, 5, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `game_reviews`
--

DROP TABLE IF EXISTS `game_reviews`;
CREATE TABLE IF NOT EXISTS `game_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating_type_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_reviews_game_id_foreign` (`game_id`),
  KEY `game_reviews_user_id_foreign` (`user_id`),
  KEY `game_reviews_rating_type_id_foreign` (`rating_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `game_reviews`
--

INSERT INTO `game_reviews` (`id`, `created_at`, `updated_at`, `game_id`, `user_id`, `rating_type_id`, `content`) VALUES
(1, '2024-07-09 23:30:09', '2024-07-09 23:30:09', 7, 5, 1, 'Just finished \'Elden Ring\' and it’s amazing! The open world is huge and stunning, the combat is intense and satisfying, and the lore is fascinating. It\'s tough but incredibly rewarding. Definitely one of my favorite games!'),
(2, '2024-07-09 23:50:53', '2024-07-09 23:50:53', 10, 5, 2, 'Palworld seemed promising, but it’s pretty underwhelming. The graphics are mediocre, and the gameplay gets repetitive fast. I’ve also encountered several bugs and performance issues. It’s not what I hoped for and feels like it needs a lot more polish.'),
(6, '2024-07-30 20:09:49', '2024-07-30 20:09:49', 8, 5, 1, 'The Last of Us is a masterpiece. The story is gripping and emotional, the characters are well-developed, and the gameplay is both intense and rewarding. It\'s a must-play for any gamer.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `game_wishlists`
--

DROP TABLE IF EXISTS `game_wishlists`;
CREATE TABLE IF NOT EXISTS `game_wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `game_wishlists_game_id_foreign` (`game_id`),
  KEY `game_wishlists_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `game_wishlists`
--

INSERT INTO `game_wishlists` (`id`, `created_at`, `updated_at`, `game_id`, `user_id`) VALUES
(26, NULL, NULL, 6, 134),
(27, NULL, NULL, 6, 136),
(30, '2024-07-22 02:53:07', '2024-07-22 02:53:07', 5, 5),
(32, '2024-07-25 22:31:00', '2024-07-25 22:31:00', 26, 5),
(35, '2024-07-26 03:25:00', '2024-07-26 03:25:00', 22, 5),
(37, '2024-07-26 03:42:50', '2024-07-26 03:42:50', 24, 5),
(38, '2024-07-26 03:56:00', '2024-07-26 03:56:00', 10, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `genres`
--

INSERT INTO `genres` (`id`, `created_at`, `updated_at`, `name`, `is_active`) VALUES
(1, '2024-07-08 21:57:54', '2024-07-08 21:57:54', 'Fantasy', 1),
(2, '2024-07-08 21:57:58', '2024-07-08 21:57:58', 'RPG', 1),
(3, '2024-07-08 21:58:02', '2024-07-08 21:58:02', 'FPS', 1),
(4, '2024-07-24 22:45:24', '2024-07-24 22:45:24', 'Action', 1),
(5, '2024-07-24 22:45:28', '2024-07-24 22:45:28', 'Adventure', 1),
(6, '2024-07-24 22:45:35', '2024-07-24 22:45:35', 'Simulation', 1),
(7, '2024-07-24 22:45:39', '2024-07-24 22:45:39', 'Sports', 1),
(8, '2024-07-24 22:45:44', '2024-07-24 22:45:44', 'Puzzle', 1),
(9, '2024-07-24 22:45:48', '2024-07-24 22:45:48', 'Horror', 1),
(10, '2024-07-24 22:45:52', '2024-07-24 22:45:52', 'Racing', 1),
(11, '2024-07-24 22:45:58', '2024-07-24 22:45:58', 'Fighting', 1),
(12, '2024-07-24 23:17:43', '2024-07-24 23:17:43', 'Sandbox', 1),
(13, '2024-07-28 01:58:25', '2024-07-28 01:58:25', 'Farming', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `created_at`, `updated_at`, `name`, `image_url`, `type`, `price`) VALUES
(309, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Cat Courier', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2855140/18201b6931880d3bcb863fc3f5f5d0f3889f5c68.gif', 'avatar', 1000),
(310, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Cicini', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/400910/8d405acf455855d778515064e91880c67fffff50.gif', 'avatar', 1000),
(311, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Rambus Play', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1944060/3c6e22e1856a08f4f1d7ee8dec21d7a28bb56eb2.gif', 'avatar', 1000),
(312, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Neener', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1097150/2fb8fd91cbdc6f8a3f630579a0ee479d5c22505f.gif', 'avatar', 1000),
(313, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Wave', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1097150/c33beb91c02f1a2c9b2d3e8d820d3f5be0b08b06.gif', 'avatar', 1000),
(314, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Gained Knowledge', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2055050/03e6938ae269d5fb3c83f6c56e1469b36171ad44.gif', 'avatar', 1000),
(315, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Broadened Horizons', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2055050/c59f1f3beafa934af92b51dcd0521298600239fb.gif', 'avatar', 1000),
(316, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Pollo', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2055500/9fa2a22c70382fcc6658728d23759d1fa36bd61f.gif', 'avatar', 100000),
(317, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Cat Face', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1529220/a8ba0e6ab807cd1f9dbe24f3958242e2d989e8c6.gif', 'avatar', 1000),
(318, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Ghost', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1658150/10280a18601f222faad9f1ff6ef0922e1fb446a5.gif', 'avatar', 1000),
(319, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Supply Depletion Koishi', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1684100/6ca57220d4dbb1fc7a6e620221f78328ed409db0.gif', 'avatar', 1000),
(320, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Neon Face', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/788100/8454554bc0a8bb82ac3991002fb71801b17596ff.gif', 'avatar', 1000),
(321, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Hellebore', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1574580/02a88fe40be3642793b1b574f378ef24e0372b8e.gif', 'avatar', 1000),
(322, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'The Red Crown', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1313140/b5a0bd8b9bea4e1bd4773c9c3c0c8c1465b7340d.gif', 'avatar', 1000),
(323, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Doggie', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1476970/0f353f8171916feebeb7f2bc44acba6310b73ef0.gif', 'avatar', 1000),
(324, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Cat', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1332010/e7a8496874fe44a3c773c46ab1e8b886f71035e8.jpg', 'background', 2000),
(325, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'SHHHHH!', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/945360/380202f367adc87ef2900f1d96d7dfa4cbc413ab.jpg', 'background', 2000),
(326, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Hero', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2161700/05ed1962c04f5fbbca0788664b81725a92e9273c.jpg', 'background', 2000),
(327, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Mute', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/359550/8115fa76fc2e5759f041e9490aabfb636d1e6fad.jpg', 'background', 2000),
(328, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'The World', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fthe_world.gif?alt=media&token=a1dfc4e7-fbd6-44bd-a12e-7f754bbb09f1', 'background', 2000),
(329, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Oko Background', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Foko_background.gif?alt=media&token=13dcf4d2-4d83-4f78-9805-aee9dae59e1c', 'background', 2000),
(330, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Glitch Sansui-Zu', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/1465680/ee46cc3b6988057d435be7e391472d46f278d87a.jpg', 'background', 2000),
(331, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Hartman', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fhartman.gif?alt=media&token=165e01f7-3fc8-440a-918d-7e23fce4e38f', 'background', 2000),
(332, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Original Box Art', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/275850/f9fd22144df3cffec574b31f14d44151551980c8.png', 'background', 2000),
(333, '2024-07-27 00:34:52', '2024-07-27 00:34:52', 'Rainy Day Greenhouse', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Frainy_day_greenhouse.gif?alt=media&token=01f892e9-b6e0-440a-98cd-76d1c227d686', 'background', 2000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_libraries`
--

DROP TABLE IF EXISTS `item_libraries`;
CREATE TABLE IF NOT EXISTS `item_libraries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_libraries_item_id_foreign` (`item_id`),
  KEY `item_libraries_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `item_libraries`
--

INSERT INTO `item_libraries` (`id`, `created_at`, `updated_at`, `item_id`, `user_id`) VALUES
(19, '2024-07-27 00:35:23', '2024-07-27 00:35:23', 328, 5),
(20, '2024-07-27 00:35:39', '2024-07-27 00:35:39', 323, 5),
(21, '2024-07-27 00:35:45', '2024-07-27 00:35:45', 315, 5),
(22, '2024-07-27 00:36:05', '2024-07-27 00:36:05', 317, 5),
(23, '2024-07-27 00:36:11', '2024-07-27 00:36:11', 319, 5),
(24, '2024-07-27 00:36:20', '2024-07-27 00:36:20', 312, 5),
(25, '2024-07-27 00:36:51', '2024-07-27 00:36:51', 321, 5),
(26, '2024-07-27 00:36:55', '2024-07-27 00:36:55', 320, 5),
(27, '2024-07-27 00:37:17', '2024-07-27 00:37:17', 333, 5),
(28, '2024-07-27 00:37:21', '2024-07-27 00:37:21', 327, 5),
(29, '2024-07-27 00:37:25', '2024-07-27 00:37:25', 325, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_05_16_063657_create_countries_table', 1),
(3, '2024_05_16_063703_create_age_ratings_table', 1),
(4, '2024_05_16_063709_create_rating_types_table', 1),
(5, '2024_05_16_063715_create_genres_table', 1),
(6, '2024_05_16_063728_create_items_table', 1),
(7, '2024_05_16_063734_create_users_table', 1),
(8, '2024_05_16_063735_create_publishers_table', 1),
(9, '2024_05_16_063740_create_friendlists_table', 1),
(10, '2024_05_16_063746_create_friend_requests_table', 1),
(11, '2024_05_16_063753_create_games_table', 1),
(12, '2024_05_16_063759_create_game_reviews_table', 1),
(13, '2024_05_16_063805_create_game_images_table', 1),
(14, '2024_05_16_063811_create_game_genres_table', 1),
(15, '2024_05_16_063817_create_item_libraries_table', 1),
(16, '2024_05_16_063823_create_game_gifts_table', 1),
(17, '2024_05_16_063829_create_game_wishlists_table', 1),
(18, '2024_05_16_063835_create_game_carts_table', 1),
(19, '2024_05_16_063842_create_game_libraries_table', 1),
(20, '2024_05_22_052242_create_wallet_codes_table', 1),
(22, '2024_07_11_085617_alter_item', 2),
(23, '2024_07_13_085646_alter_user', 3),
(24, '2024_07_20_092505_add_gift', 4),
(25, '2024_07_20_093849_dropp', 5),
(26, '2024_07_20_094120_addd', 6),
(27, '2024_07_24_090516_abc', 7),
(28, '2024_07_26_090553_abc', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `publishers`
--

DROP TABLE IF EXISTS `publishers`;
CREATE TABLE IF NOT EXISTS `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publishers_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `publishers`
--

INSERT INTO `publishers` (`id`, `created_at`, `updated_at`, `name`, `image_url`, `website`, `user_id`) VALUES
(1, '2024-07-08 22:00:07', '2024-07-28 02:44:45', 'Rockstar', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1720501319650?alt=media&token=f19c2e5c-2e7e-4951-8ac1-d8539ca0abe7', 'https://www.rockstargames.com/', 2),
(2, '2024-07-26 03:40:53', '2024-07-26 03:40:53', 'Ubisoft', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1721990451631?alt=media&token=14b0d69b-0f61-4fcd-94d3-151a466868f6', 'https://www.ubisoft.com/en-us', 209),
(3, '2024-07-27 02:00:06', '2024-07-27 02:00:28', 'Playstation Studio', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722070827576?alt=media&token=79d896a2-2ab4-44d2-8b60-ae8d545a7574', 'https://www.playstation.com/en-us/corporate/playstation-studios/', 210),
(4, '2024-07-27 02:18:58', '2024-07-27 02:18:58', 'Hoyoverse', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722071935934?alt=media&token=aecf60eb-72be-42a2-9aae-36410a3c50fe', 'https://account.hoyoverse.com/', 211),
(6, '2024-07-28 02:07:51', '2024-07-28 02:07:51', 'Electronic Arts', 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/images%2F1722157670549?alt=media&token=e4f376e8-82e4-428f-97f9-2df32109330c', 'https://www.ea.com/', 217);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rating_types`
--

DROP TABLE IF EXISTS `rating_types`;
CREATE TABLE IF NOT EXISTS `rating_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rating_types`
--

INSERT INTO `rating_types` (`id`, `created_at`, `updated_at`, `title`, `image_url`) VALUES
(1, '2024-07-08 22:14:54', '2024-07-08 22:14:54', 'Recommended', 'https://store.akamai.steamstatic.com/public/shared/images/userreviews/icon_thumbsUp_v6.png'),
(2, '2024-07-08 22:14:54', '2024-07-08 22:14:54', 'Not Recommended', 'https://store.akamai.steamstatic.com/public/shared/images/userreviews/icon_thumbsDown.png?v=1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nickname` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `real_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet` bigint(20) NOT NULL DEFAULT 0,
  `point` bigint(20) DEFAULT NULL,
  `background_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_country_id_foreign` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `nickname`, `real_name`, `profile_picture_url`, `email`, `password`, `role`, `bio`, `unique_code`, `country_id`, `wallet`, `point`, `background_url`, `remember_token`) VALUES
(1, '2024-07-08 21:56:46', '2024-07-08 21:56:46', NULL, NULL, 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'admin@gmail.com', '$2y$10$CRfp2QrkX2ZlToeRnLFcmuNREBkWtlhU6z55sYU8kV67xZ5wLBsSe', 'admin', NULL, '5678901234', NULL, 0, 1000, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(2, '2024-07-08 21:58:16', '2024-07-26 02:49:39', NULL, NULL, 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'tanuartadjason@gmail.com', '$2y$10$e/X8WB114szUx2QuXmPwIuYIT5lm36p8HvnVQO6r2bVE7h396y7rW', 'publisher', NULL, '4567890123', NULL, 0, 1000, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', 'PJMr4X5CD1qMV6rA7aBmBJOLHZC7YNZLRYU4FR7TkWpfrkkRyy2VjXjwpMB7'),
(3, '2024-07-08 22:14:54', '2024-07-08 22:14:54', 'jasondt', NULL, 'https://avatars.akamai.steamstatic.com/af1cf9cf15be50bc6eda5a5c35bb1698bbf77ecd_full.jpg', 'tanuartadjason@gmail.com', '$2y$10$DCtA6PbAvdhU2whKAlQF0OQvOgQXHY8yRdOOOqigJRwHHE1H562k6', 'publisher', NULL, '3456789012', NULL, 0, 1000, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(4, '2024-07-08 22:14:54', '2024-07-08 22:14:54', NULL, NULL, 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'jason@gmail.com', '$2y$10$0nHWP2l0JyY09a1i6t3B3eEEk6w0ZQ.wVIN9RaKEFgntY8hURAqwm', 'admin', NULL, '2345678901', NULL, 0, 1000, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(5, '2024-07-08 23:07:47', '2024-07-30 20:04:11', 'jasondt', 'Jason Daniel', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2055050/c59f1f3beafa934af92b51dcd0521298600239fb.gif', 'dteamslc@gmail.com', '$2y$10$95DAtIuHgcJrU2BNp.yKdOQK9tNDtFXJNFnDnVgJ1C/Ach.C.yEbS', 'user', NULL, '1234567890', 17, 15888034, 62840, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fashen_hush.gif?alt=media&token=a877b90b-c8f8-4c19-b91a-c4e7b6311bb1', NULL),
(6, '2024-07-14 23:21:00', '2024-07-15 03:16:48', 'user2', 'useruser', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'zukar2i151@gmail.com', '$2y$10$tlREhPhFtJCeeuHO0EmKuOvajg5pLv2KH4mkie7w9APlxChllh0BC', 'user', 'ds', '0227658205', 18, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(7, '2024-07-16 00:46:57', '2024-07-16 00:46:57', NULL, NULL, NULL, 'rickywijayaplay@gmail.com', '$2y$10$YNKoilmgjbQh9YmbNjTlLeWeQPylzGvh8nyog9ulyhizvYh..94u2', 'publisher', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(8, '2024-07-16 03:17:45', '2024-07-16 03:18:09', 'user3', 'useruser', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'miyukdisaber@gmail.com', '$2y$10$BZb6NDuMYx7F0/n3esfJOua5olPeTVVPOIN5cU8aNnYzhduTdvSIe', 'user', NULL, '4012941475', 29, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(109, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user0', 'User user0', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user0@example.com', '$2y$10$4ueEqW4CwitnJWPIwDz5hejOoZDUMIqswsgAQBE9NKn0TRqsGIc3e', 'user', NULL, '0590137111', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(110, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user1', 'User user1', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user1@example.com', '$2y$10$43VBic0Exo2Y5WsriMdsfegLY58fNdITHv0grLCGoS9A8u5yGcpre', 'user', NULL, '9587723696', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(111, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user2', 'User user2', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user2@example.com', '$2y$10$gZ7VyGmwaZ8W.vtmFYXlIeGLvRiH7ji/M6uBNGFUuR4AIoWJ26Oyq', 'user', NULL, '3609411568', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(112, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user3', 'User user3', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user3@example.com', '$2y$10$Bt6yms.fFg3gJ0fmC26wmul7Nh9o6v8Sw/KQZBF94Mum04NWgZ142', 'user', NULL, '7778728679', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(113, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user4', 'User user4', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user4@example.com', '$2y$10$iu.S1SJZpuqjKs9QryNtwOzar6lkHrkLBuhtOqhYSjQOl4VGSgim2', 'user', NULL, '9165883865', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(114, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user5', 'User user5', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user5@example.com', '$2y$10$y3U342ih5HUIFyYPT4QtMO1RNu0LR28He0CWPFDTveZiJsilo.wcS', 'user', NULL, '6873970659', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(115, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user6', 'User user6', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user6@example.com', '$2y$10$h7g12vzxfOgyiCLqHXG9muAnpLvfzfnbAdOcbfbOzjXWT7EFFW4c6', 'user', NULL, '4497651481', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(116, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user7', 'User user7', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user7@example.com', '$2y$10$E6wB4gBX1jvimFKUxieqpOBoNPeWcHUMhHUUpTAXONFuA7QwBpLZK', 'user', NULL, '5176351516', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(117, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user8', 'User user8', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user8@example.com', '$2y$10$9ZmQuzhTqOtgOnsSCK7a6O60kc2y6QOWD03v970ieIuEP2Jso7caO', 'user', NULL, '8673321869', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(118, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user9', 'User user9', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user9@example.com', '$2y$10$kM6QwKamD0HlnraS5m2IuO2bHbLsXRhrC3VrVcd5urNj6m4RrnVum', 'user', NULL, '7668325323', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(119, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user10', 'User user10', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user10@example.com', '$2y$10$mElJY4/Q//xMPxSSoEifoe.GkIwjdmLwqAd1xsuefXt2sN7D.HxhG', 'user', NULL, '0148705055', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(120, '2024-07-16 18:29:55', '2024-07-16 18:29:55', 'user11', 'User user11', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user11@example.com', '$2y$10$lGUcrM9Jqb9g7CqpVTPk4..SVS6pxRkkTStLEkhmS0KkUgKDWyBqC', 'user', NULL, '4501113954', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(121, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user12', 'User user12', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user12@example.com', '$2y$10$dUwqOTnL4Ekg1eoJXvLLsedTD4RcMPE8tr11wnFEFBs3INi4VlFlW', 'user', NULL, '2599592945', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(122, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user13', 'User user13', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user13@example.com', '$2y$10$edPV6rYWglXrkVLwRFANbeSybqZxsbqtpUP1gxjuxkFGXLP.Xog2W', 'user', NULL, '5053390121', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(123, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user14', 'User user14', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user14@example.com', '$2y$10$5M4qY64fTu7Bu/dliFAKXeI0Kbbf657y6aX9QP8K2VB/xk.sngGFa', 'user', NULL, '5766295716', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(124, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user15', 'User user15', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user15@example.com', '$2y$10$1c87HWYP.Ce6ufTVB18UneE0ewgAWCnF5UXRY5wqYSoRNtqWZDpfW', 'user', NULL, '1249570280', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(125, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user16', 'User user16', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user16@example.com', '$2y$10$ex/Akj4iBE3KjspFmtvXF.v/CD.0aJns/MI84TihX9DGdvHIZCBoy', 'user', NULL, '5136444028', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(126, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user17', 'User user17', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user17@example.com', '$2y$10$xs6boeTtXHY53xoWTtvc8uUXPDu4axfkPWWsEQqu2UzH1iLmoWw.u', 'user', NULL, '9264869495', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(127, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user18', 'User user18', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user18@example.com', '$2y$10$XG313jvaIeeBazlu99YMpOGzPd1NwNRR5tyyMQSXTT0nCYE7BLmse', 'user', NULL, '6889625520', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(128, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user19', 'User user19', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user19@example.com', '$2y$10$ryDWuuqcQOEqk2TnZbT0p.CZX4dlFptxCWSWGpOiLXXiOtw8rt2DC', 'user', NULL, '6779710876', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(129, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user20', 'User user20', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user20@example.com', '$2y$10$Vicmu1wig.qG9hQPQrmwou0cAJNBByPK/GA9.BF3zzZfYlGEAGfhG', 'user', NULL, '8259044569', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(130, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user21', 'User user21', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user21@example.com', '$2y$10$WoG4XF8Wg7plrDdBeLr.EeJvtKIH0A/MX2fkC4FKaOVTCKTGO7zw6', 'user', NULL, '8796840615', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(131, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user22', 'User user22', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user22@example.com', '$2y$10$G19aL5DOIcz4cCWdJiyDfef20fO5gMUtqhuaY8TB5PzX7i8dq39j6', 'user', NULL, '1560993531', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(132, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user23', 'User user23', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user23@example.com', '$2y$10$WBPULHT9immR0YXvS7fGx.hZV3eRG9a36DwI/GRU2Pp/l5qkfbCy6', 'user', NULL, '6959143008', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(133, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user24', 'User user24', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user24@example.com', '$2y$10$B3.1M8nnkzzxYW1r.n9tGeOWkotPzTUAcaKyyIwl80OwPQS5oPdaW', 'user', NULL, '4902522717', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(134, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user25', 'User user25', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user25@example.com', '$2y$10$cOkeuMxwf2z4qsiitVGKJ.Ni0eDEnkl3.FFa7zwRb4/PQiF8Kt4gm', 'user', NULL, '8334415576', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(135, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user26', 'User user26', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user26@example.com', '$2y$10$X.Um7wJGTt1/kUNEKxg.iO1xmhZRHtxnjRagxywjBaUFyGwzGHToe', 'user', NULL, '1471234231', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(136, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user27', 'User user27', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user27@example.com', '$2y$10$LNqcKrrEOCY5Upi9.YThcu1O26OyWmgqMtRt6TbuZnY62O4Wat2Oq', 'user', NULL, '0509667743', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(137, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user28', 'User user28', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user28@example.com', '$2y$10$FTQz51MQOeXTLZNjMf2VFOLaAdrLemGBGmWeMmX6epJ46Dl8u8juy', 'user', NULL, '4254692962', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(138, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user29', 'User user29', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user29@example.com', '$2y$10$zhAcWDZEBYrJDKDG.XijHOaSizGT7A7sYDDnOBZ7fwpCy7hiiDWeW', 'user', NULL, '7198659867', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(139, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user30', 'User user30', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user30@example.com', '$2y$10$ORYdxGzthE9TB.DZ.eVMhO1xpPub7xhuPrncSPFUTaNi5XyCF/g0O', 'user', NULL, '6645294794', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(140, '2024-07-16 18:29:56', '2024-07-16 18:29:56', 'user31', 'User user31', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user31@example.com', '$2y$10$A6YNiMdgXO8gczsrIFSP1ekbReaDUbkdR/B9pav1PvllIC/joVMEW', 'user', NULL, '3094608602', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(141, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user32', 'User user32', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user32@example.com', '$2y$10$9fSvO1MGyn16SsxFteRYRO6128HLLbFle9g46gWNbzu8/K.I77wFy', 'user', NULL, '8100812342', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(142, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user33', 'User user33', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user33@example.com', '$2y$10$yOCWL1aA8dxo5u0zfHrqf.SCMUFbVIuOhIc9Eiof06PNKoIiO2iBK', 'user', NULL, '5466069441', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(143, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user34', 'User user34', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user34@example.com', '$2y$10$04rcklh9hBolW1rmDAR5ZOjgdBPqT3thblVtSKrBbGR8n1pyJjE5W', 'user', NULL, '9866375480', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(144, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user35', 'User user35', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user35@example.com', '$2y$10$lbqg.ILz3ok6wd7.NwJsXOxlFcdv/4GSjdH8ZwfoZRN/s4kx/j6u6', 'user', NULL, '9936955909', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(145, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user36', 'User user36', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user36@example.com', '$2y$10$tu2l.KrLe22BaqydaRA1xeV6lcBxpp44sEgJL71Fb0Ie.WTmWuOf.', 'user', NULL, '1666239362', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(146, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user37', 'User user37', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user37@example.com', '$2y$10$aK2RL3UFySp88OPryPNKxurxVuXj2bvAWcGi2E7sfXhPMzgeREPC.', 'user', NULL, '4559824984', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(147, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user38', 'User user38', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user38@example.com', '$2y$10$h2zZggDK5QEAu7.TUnsI1.kaEpvw0iHRT1GpKD2i2zqZqNq8xksWu', 'user', NULL, '2836416796', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(148, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user39', 'User user39', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user39@example.com', '$2y$10$w2hFtsr2Oj1RuL4WryPFV.rsnKWEp80K1iTIf.0kojYOYBv23JPyG', 'user', NULL, '5552907038', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(149, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user40', 'User user40', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user40@example.com', '$2y$10$/P9i/y12iBww8FNlQPE0wOiqh253hTPBE5avdtcszPd6NA7r2dg6G', 'user', NULL, '7132740934', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(150, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user41', 'User user41', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user41@example.com', '$2y$10$hL88fuQhBzFLj8/.5uyfz.CXffUZNjBlXNKuls/gPN86J7S.GsgDC', 'user', NULL, '5664442801', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(151, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user42', 'User user42', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user42@example.com', '$2y$10$iZkPqrH6UZB2w1xaka1PMulMo6oQc.KQHsj8H4PyrTeRkGAy9BTbu', 'user', NULL, '8032442602', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(152, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user43', 'User user43', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user43@example.com', '$2y$10$6KZifuCpHgz.1OcaIqV5W.ap3z77Wz9WJX9SQNYyq2XZo17RLKuza', 'user', NULL, '3063697851', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(153, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user44', 'User user44', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user44@example.com', '$2y$10$PlKt6PRDehJkVKY6pyX5MeUWoFlR6F7ZpRSAl7kKy3vYNwyRoZAsW', 'user', NULL, '5797448456', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(154, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user45', 'User user45', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user45@example.com', '$2y$10$2P1iBi3Ao.LbNzGqwe1cK.tuUv6jP8eqHzmN0ODHrLdU4GCUjTLjO', 'user', NULL, '5367974280', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(155, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user46', 'User user46', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user46@example.com', '$2y$10$DU8asFYqqDyWPhpfZIKsKOsL5RtntwZhi/t1ov8LaJvtC8FZffK3m', 'user', NULL, '5775967149', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(156, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user47', 'User user47', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user47@example.com', '$2y$10$iR.0fbSKHK/Dp3vd2HQev.fBzBSOOjD6snmHNHgT.YNkgeDY937aO', 'user', NULL, '0335346897', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(157, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user48', 'User user48', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user48@example.com', '$2y$10$qhr9ajI/W4QBzfR5oYTIfuupiDsgvd570zeLrco1lY0TwGGAq0T0u', 'user', NULL, '7686027566', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(158, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user49', 'User user49', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user49@example.com', '$2y$10$mP1006wmQSzQgUcm6LAf1uV8jfbubiV4Vkt7etCrtSMkmfYDOsmUa', 'user', NULL, '9066257696', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(159, '2024-07-16 18:29:57', '2024-07-16 18:29:57', 'user50', 'User user50', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user50@example.com', '$2y$10$xi5gV5LW5qljk.MjFU2.EOVtLsLYc5Wi7CnAd4wIh1FaluDUlMlOi', 'user', NULL, '5875914845', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(160, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user51', 'User user51', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user51@example.com', '$2y$10$E4z2eICd217NhsvYfj.32.JlZLH8IJWK9aeezcvnnAxI6KUH2ahRu', 'user', NULL, '5607395048', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(161, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user52', 'User user52', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user52@example.com', '$2y$10$ea38LieJG4.YaTYIAMkBqux.thnFHBKst4Opy3ZFYS3iDw.szsCRG', 'user', NULL, '5643547375', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(162, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user53', 'User user53', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user53@example.com', '$2y$10$z5oUhznuDmubnNyeIMsaTOou.kqN6Kh2lYif/7HsZNse6EuK3/q8y', 'user', NULL, '3202565353', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(163, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user54', 'User user54', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user54@example.com', '$2y$10$eC.bVKyquCCqSbsZbgab7eUQkxmC5Nv2dFQkz86CeIr5HKR.IlZoy', 'user', NULL, '8281790396', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(164, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user55', 'User user55', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user55@example.com', '$2y$10$mNjQrTiaGPQXZ9Q0iHb0Y.9R.ADhtyZHJl4IYDWNrgxmpkUTKHTr2', 'user', NULL, '3927123076', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(165, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user56', 'User user56', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user56@example.com', '$2y$10$90L4ZPlkEc.VnVZ0REDY1eZcbGYRD57TRSh0xL4TECigioZpVpj.a', 'user', NULL, '7372762457', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(166, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user57', 'User user57', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user57@example.com', '$2y$10$.JWa4nniqsKXBpAiGP2YX.jbDOpwqFpHTgU7JvsyTRpvCRH5UmYz.', 'user', NULL, '5788198550', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(167, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user58', 'User user58', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user58@example.com', '$2y$10$L6tcVbyG9PAFEc40fzbnzu.QQJt3Pb0oo6kLzt44m34G8cjZ.Yus.', 'user', NULL, '8285989291', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(168, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user59', 'User user59', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user59@example.com', '$2y$10$L.q9jMtGjFrTryqb4OdKoOhTx6M2ZFh7fP3ag0rzS/BLvQeEfkxGq', 'user', NULL, '7798369889', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(169, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user60', 'User user60', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user60@example.com', '$2y$10$5GhWo3PDqO4ldUFEyUBe/erFbJCM5HnbEvr82z6hXI7QY4Q3PPfFC', 'user', NULL, '0492691167', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(170, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user61', 'User user61', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user61@example.com', '$2y$10$XaIl3EmgeAmaFy2LWnXqDuUzhk690Si5QI06P8sPsZx8zG9oiUEwu', 'user', NULL, '5145515023', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(171, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user62', 'User user62', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user62@example.com', '$2y$10$cXLPR2SLt/cLRisPXTjW/utZw9rTJZBo1AFrjFjj2Ki2wib7KgXhe', 'user', NULL, '4665857700', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(172, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user63', 'User user63', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user63@example.com', '$2y$10$JctKWg4XPfhcBSPWnRBvFeS5r/QEt7ITJgWKkdutjyzHJrNSmti3G', 'user', NULL, '0685382063', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(173, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user64', 'User user64', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user64@example.com', '$2y$10$JJUpEO9kMln42dbPT01rXeTwC9ZX//WF/x9BzlBQZL.9PYftFKB6a', 'user', NULL, '6354291128', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(174, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user65', 'User user65', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user65@example.com', '$2y$10$ZmMo7nRE6Iq8v/L7FA.XOu0uT1NKC4BBFYn6dkNGFx156H.tNA2am', 'user', NULL, '1859282379', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(175, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user66', 'User user66', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user66@example.com', '$2y$10$LYMxVlwm9/Ys2opPl8n0Q.MSB.TxGTUfftojOrhzi2qPjcinIGAjq', 'user', NULL, '4350106299', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(176, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user67', 'User user67', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user67@example.com', '$2y$10$CN53.ngb2g68r4037YmfJOc8YRUJTtcguy8/c8rCVLUarGnaexQwq', 'user', NULL, '8495822219', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(177, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user68', 'User user68', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user68@example.com', '$2y$10$2Na5aStvegoJZpW/sq809OIFIIRdvyQafyQULyQK0Z9b0sTJwkdQq', 'user', NULL, '1988498406', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(178, '2024-07-16 18:29:58', '2024-07-16 18:29:58', 'user69', 'User user69', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user69@example.com', '$2y$10$Cz.dBGyr3Kaieabw7KzbFe79o8093CVTPo.KfRfGGTcUEJVhvzGO2', 'user', NULL, '6122448519', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(179, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user70', 'User user70', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user70@example.com', '$2y$10$DrROu/p1YMHX66F6758z4.rc1ntKt2pSGCEIcDYQuJge7Y97o5hgy', 'user', NULL, '0896519754', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(180, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user71', 'User user71', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user71@example.com', '$2y$10$PoDEUpzC7ChNiXz3/uXk7edyub0dYmHjpetO62NDqsvFxchjxNmp.', 'user', NULL, '6124394199', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(181, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user72', 'User user72', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user72@example.com', '$2y$10$DLvZCa9T5FesR/a6U7o4KeDoWxwwNexy7PC.ZrwWQJy6fyEaLMwp6', 'user', NULL, '5800853071', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(182, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user73', 'User user73', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user73@example.com', '$2y$10$EzapxyY6xFYCTIlsqC7Nx.qdZU7F1H4dSucES1KMF.O4.k9IXi5R.', 'user', NULL, '6914134028', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(183, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user74', 'User user74', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user74@example.com', '$2y$10$cEeM7mGs/79LOyTMqypGB.5Q96cQn5MdvpS/U2xZ3v/yVSGUMbm2S', 'user', NULL, '1562083136', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(184, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user75', 'User user75', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user75@example.com', '$2y$10$zYSr1gkApF4eW2Zbl9mVvOuSn7dIy.0yfN6wCsjZe53E3g6FhZHIq', 'user', NULL, '4491858083', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(185, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user76', 'User user76', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user76@example.com', '$2y$10$fzYmUs6i74U9YtKGvqGIIeUYUM9hPh.IBIEdtCLIDUur2V14aO9fO', 'user', NULL, '8214534947', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(186, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user77', 'User user77', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user77@example.com', '$2y$10$q33MdlyvddV/IWZG0lVffOoigzHN6Sf3kmaP7cZOZNCkH1kAJLeUW', 'user', NULL, '8064376031', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(187, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user78', 'User user78', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user78@example.com', '$2y$10$yps6UQNuw/FNqfNV.CUvOeRFYfQg.eDD/BrcfHNWRukD9nVCTEOgm', 'user', NULL, '9981972251', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(188, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user79', 'User user79', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user79@example.com', '$2y$10$p5t1piIw9LbYIAr4irbm.OkGz46XRsII5yo2ijibYwy8ZsvyTkX7G', 'user', NULL, '5348502475', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(189, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user80', 'User user80', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user80@example.com', '$2y$10$OedngwQw0H0JJOwsOyvMW.vpZZUcM86Ja96WA53f.lC2xLqKyTT2.', 'user', NULL, '0194422237', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(190, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user81', 'User user81', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user81@example.com', '$2y$10$cZbOi9IVHhD308.CEL4RNeir2YZa1YqUkzrCju1Evo3gyvAk93vZ6', 'user', NULL, '9106415488', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(191, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user82', 'User user82', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user82@example.com', '$2y$10$wGE5ZwLrQWMf4cmS7JkoYuDJIcdb1RNjfnlpJAX12b3rE3D/T/6Bm', 'user', NULL, '3621821489', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(192, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user83', 'User user83', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user83@example.com', '$2y$10$7bvcV9uzUkoIpoG4Snrb3e2JdIOtG/WMbpoWbhYbCXN26HgTh3lIm', 'user', NULL, '0610279075', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(193, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user84', 'User user84', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user84@example.com', '$2y$10$h7bC9yCrWetn.WDuaJF2WeTm2BDnLdsLaWUB8kdGGIX/fBEu1a3mS', 'user', NULL, '5258560156', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(194, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user85', 'User user85', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user85@example.com', '$2y$10$ydDbI//tD/scNjuoecIlNec1iiDaWJbJu86bgsjH.bfVt4I6LzW7G', 'user', NULL, '3845027722', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(195, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user86', 'User user86', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user86@example.com', '$2y$10$E6mK7oo.jMjQfSpA36ykWOYGh6yxhJ0vdEVYHHLqa2uCGWq4C7mta', 'user', NULL, '3135260880', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(196, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user87', 'User user87', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user87@example.com', '$2y$10$bgZLf7rRC3b3l9Oqt/Os.uCmKHU3ksIiOM3UzmelOATOQBOHI/1Ue', 'user', NULL, '2656222324', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(197, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user88', 'User user88', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user88@example.com', '$2y$10$/FPD1QWWagt.v9gV8b2GVeZzMxOzyH8qZ0/Pgjy9PO1J9sehR7jWS', 'user', NULL, '3990191007', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(198, '2024-07-16 18:29:59', '2024-07-16 18:29:59', 'user89', 'User user89', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user89@example.com', '$2y$10$ny8guWcE0vrI12W9MycSNON7mhIXJ5019mVNOhwM3CleGNoLuFwDa', 'user', NULL, '9991059432', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(199, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user90', 'User user90', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user90@example.com', '$2y$10$DjcS.aRyaXJhHfSDvDxtq.b8zyqVPwZRy5eTGX/I2MAMVGw4rlAsO', 'user', NULL, '9182243242', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(200, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user91', 'User user91', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user91@example.com', '$2y$10$5yHsOH7pQGK5je6.79bKg.9UReYbkshr39p.pj2O3Hu6dN6uubba.', 'user', NULL, '1988195294', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(201, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user92', 'User user92', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user92@example.com', '$2y$10$A29PwOYm6w.50nkEB/PS1ee6sHBRr7u8kzHZUKfNTOj0K3PaNZMNm', 'user', NULL, '9594029701', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(202, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user93', 'User user93', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user93@example.com', '$2y$10$rerUdKPI0X6T9Cu9ETPDSuMpfrtMS.5M.jR3ZZOn74vpYfXGu0W7W', 'user', NULL, '6811137161', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(203, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user94', 'User user94', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user94@example.com', '$2y$10$1ez94bS9Jo4GHWVJOVlIkuE0GfB5QwyYyExs72fV4rvsoqpBkKuVW', 'user', NULL, '0276174515', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL);
INSERT INTO `users` (`id`, `created_at`, `updated_at`, `nickname`, `real_name`, `profile_picture_url`, `email`, `password`, `role`, `bio`, `unique_code`, `country_id`, `wallet`, `point`, `background_url`, `remember_token`) VALUES
(204, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user95', 'User user95', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user95@example.com', '$2y$10$.XvDkQ5vrisJ7i71IBbIF.MCca5irf6asx8TdntpDhEse3HJaVQSu', 'user', NULL, '5399407999', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(205, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user96', 'User user96', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user96@example.com', '$2y$10$TN00kTfnp.PyZGiFiJqPt.A86rgtnpkD3RsvKsqnwCX1BsmDpOS0W', 'user', NULL, '2766770118', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(206, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user97', 'User user97', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user97@example.com', '$2y$10$zDLhxEOmk.8lGk8DmPYXhudtp9YANq7xr6gnm7IZp37styuKDzJc2', 'user', NULL, '4397526437', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(207, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user98', 'User user98', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user98@example.com', '$2y$10$lzbPuF8.Zk.9zJchczRv0e2H6W2vrWviPuaX4lvQaJWMp69djFM6y', 'user', NULL, '7622264866', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(208, '2024-07-16 18:30:00', '2024-07-16 18:30:00', 'user99', 'User user99', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'user99@example.com', '$2y$10$2S/ZBhxtD9vpP2B8iOD.BOlM7MQsf3aZDueBSW2p/g.WVRPtCdIdO', 'user', NULL, '1525522306', 1, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(209, '2024-07-26 03:29:53', '2024-07-26 03:29:53', NULL, NULL, NULL, 'jason.tanuarta@binus.ac.id', '$2y$10$tqRGOQrS8BGpMyyJjO2g1eZbNiY4Cfpbyj00XkM/.0FWBB7fFUs26', 'publisher', NULL, NULL, NULL, 0, NULL, NULL, 'jsxZDCGGCMznlu4CW932RigqvnWViX6iVc3zoRK2KaMDlxxwNz5vdKS44Fsq'),
(210, '2024-07-27 01:58:46', '2024-07-27 01:58:46', NULL, NULL, NULL, 'miyusdsakisaber@gmail.com', '$2y$10$p.aypH9PWeKTw8JSqSzyderZoQYJRO7W5zvpyzY7X9oWHXJ51Q3oe', 'publisher', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(211, '2024-07-27 02:17:00', '2024-07-27 02:17:00', NULL, NULL, NULL, 'zukari151@gmail.com', '$2y$10$qvxUx0vZ0MjBygIZPYCql.ahNebnhiqhvBuVV4CMllIMwF2Y0eFo.', 'publisher', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(212, '2024-07-27 21:41:14', '2024-07-27 22:02:19', 'Jason', 'jason dt', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'tes@gmail.com', '$2y$10$yRD6KxRzf0IPcyEMYmmyv.rCaw7gPmheNCXkhIw5dCmY7d.xCICBe', 'user', 'Abc', '8722169495', 41, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(213, '2024-07-27 22:04:44', '2024-07-27 22:05:08', 'Jason D', 'jasondtt', 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'abc@gmail.com', '$2y$10$DXgDtoU1aNgCJQOd1JFHHutQZhQR9Oplb0p1T.oorOdkDV62CwqnO', 'user', 'f', '5852146196', 10, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/bf7539d121e6733f868ecafb4b2f21626af9de9a.gif?alt=media&token=9abdf96d-e7f5-4ead-9daf-fd01760baaac', NULL),
(217, '2024-07-28 02:06:32', '2024-07-28 02:06:32', NULL, NULL, NULL, 'jason.tanuarta@binus.edu', '$2y$10$4EtIz6xCMxra0RnNnRvzt.SekmPgXzuMFeDHC9eIfJPy75scmWJCu', 'publisher', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(218, '2024-07-28 04:38:38', '2024-07-28 04:38:38', NULL, NULL, NULL, 'jason230603@gmail.com', '$2y$10$d09q0zmbLv.XQoUonPut2OoUsbEG04YitrRm40Io2rlLMe67bhhWi', 'publisher', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(219, '2024-07-28 04:41:02', '2024-07-28 04:41:02', NULL, NULL, NULL, 'jason.151@outlook.com', '$2y$10$1OyhNH9DCMC3k5MQqwxRVuCBEkaGDDIL6U.RWvCOYbqmNXs7HBTi6', 'publisher', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(223, '2024-07-28 04:47:09', '2024-07-28 08:16:33', NULL, NULL, NULL, 'miyukisaber@gmail.com', '$2y$10$fpGk.IklzJXBgIyLKl7b3eCV8JSoVLj/mHCw8zYYhX4/Sb5r/qCQe', 'publisher', NULL, NULL, NULL, 0, NULL, NULL, '7tktPlNJMZ6k0krpRaI0PiQ7AJnY5ZybWzRjbhHUsG0tuoong3JvUm5tIpLU'),
(225, '2024-07-30 20:17:53', '2024-07-30 20:17:53', NULL, NULL, 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'dteam_admin@gmail.com', '$2y$10$ZIsMBumhXTLWTv/DgSRyre8xByYM/S819IVphFFPYA3qScmTlHGn.', 'admin', NULL, '0014933854', NULL, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fashen_hush.gif?alt=media&token=a877b90b-c8f8-4c19-b91a-c4e7b6311bb1', NULL),
(226, '2024-07-30 20:18:40', '2024-07-30 20:18:40', NULL, NULL, 'https://steamuserimages-a.akamaihd.net/ugc/868480752636433334/1D2881C5C9B3AD28A1D8852903A8F9E1FF45C2C8/', 'dteam_publisher@gmail.com', '$2y$10$ZIsMBumhXTLWTv/DgSRyre8xByYM/S819IVphFFPYA3qScmTlHGn.', 'publisher', NULL, '8596278629', NULL, 0, 0, 'https://firebasestorage.googleapis.com/v0/b/dteam-29297.appspot.com/o/items%2Fashen_hush.gif?alt=media&token=a877b90b-c8f8-4c19-b91a-c4e7b6311bb1', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wallet_codes`
--

DROP TABLE IF EXISTS `wallet_codes`;
CREATE TABLE IF NOT EXISTS `wallet_codes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` bigint(20) NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `used_at` datetime DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wallet_codes_code_unique` (`code`) USING HASH,
  KEY `wallet_codes_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `wallet_codes`
--

INSERT INTO `wallet_codes` (`id`, `created_at`, `updated_at`, `code`, `amount`, `is_used`, `used_at`, `user_id`) VALUES
(1, '2024-07-08 21:58:07', '2024-07-09 03:16:29', 'YlrPKFNGGsaY', 90000, 1, NULL, NULL),
(2, '2024-07-08 21:58:07', '2024-07-09 03:17:51', 'a6uBsacgmiXY', 90000, 1, NULL, NULL),
(3, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'oOcTUVuuSEfZ', 90000, 0, NULL, NULL),
(4, '2024-07-08 21:58:07', '2024-07-09 03:19:38', '9SvtxuEvTRnl', 90000, 1, NULL, NULL),
(5, '2024-07-08 21:58:07', '2024-07-09 03:20:00', 'NvcsHRD2lZhR', 90000, 1, NULL, NULL),
(6, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'PBbm3WG7gDwx', 90000, 0, NULL, NULL),
(7, '2024-07-08 21:58:07', '2024-07-09 03:20:58', 'vrB7Y4h7Kjtb', 90000, 1, NULL, NULL),
(8, '2024-07-08 21:58:07', '2024-07-09 03:21:25', 'eLnleMt4ig6c', 90000, 1, NULL, NULL),
(9, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'RhESlVe269vd', 90000, 0, NULL, NULL),
(10, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'ODMMdapsSGBD', 90000, 0, NULL, NULL),
(11, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'ykVgBo5RoDms', 90000, 0, NULL, NULL),
(12, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'T7QG1NVzqBhI', 90000, 0, NULL, NULL),
(13, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'WRH9X4Ih1nPT', 90000, 0, NULL, NULL),
(14, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'D63HkO2rxQbV', 90000, 0, NULL, NULL),
(15, '2024-07-08 21:58:07', '2024-07-24 04:10:08', 'KxK7rXLDDFvw', 90000, 1, '2024-07-24 11:10:08', 5),
(16, '2024-07-08 21:58:07', '2024-07-24 04:10:04', 'ayYGrOApWaT5', 90000, 1, '2024-07-24 11:10:04', 5),
(17, '2024-07-08 21:58:07', '2024-07-24 04:10:00', 'hckSAKvOTp0e', 90000, 1, '2024-07-24 11:10:00', 5),
(18, '2024-07-08 21:58:07', '2024-07-24 04:09:56', 'x8kBgzhLsRjO', 90000, 1, '2024-07-24 11:09:56', 5),
(19, '2024-07-08 21:58:07', '2024-07-24 04:09:50', 'tCboflrY5JpK', 90000, 1, '2024-07-24 11:09:50', 5),
(20, '2024-07-08 21:58:07', '2024-07-24 04:09:44', 'U5tXd9sRuKcY', 90000, 1, '2024-07-24 11:09:44', 5),
(21, '2024-07-08 21:58:07', '2024-07-24 04:09:37', 'UOvWgj684cFF', 90000, 1, '2024-07-24 11:09:37', 5),
(22, '2024-07-08 21:58:07', '2024-07-24 03:25:17', 'mxm2qJmwCLrF', 90000, 1, '2024-07-24 10:25:17', 5),
(23, '2024-07-08 21:58:07', '2024-07-24 03:25:12', 'oGwraOQ3EETP', 90000, 1, '2024-07-24 10:25:12', 5),
(24, '2024-07-08 21:58:07', '2024-07-24 03:25:06', 'aqobWdO32KjW', 90000, 1, '2024-07-24 10:25:06', 5),
(25, '2024-07-08 21:58:07', '2024-07-24 03:24:56', 'F1ftY3v3W0Db', 90000, 1, '2024-07-24 10:24:56', 5),
(26, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'ieTZiwOkkWQv', 90000, 0, NULL, NULL),
(27, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'd94ZsnVBYmNT', 90000, 0, NULL, NULL),
(28, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'VjDAjtpd5lyp', 90000, 0, NULL, NULL),
(29, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'N8nZaB0DtVyt', 90000, 0, NULL, NULL),
(30, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'vuB9mBmlQzkk', 90000, 0, NULL, NULL),
(31, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'JSbV0jaq8aYA', 90000, 0, NULL, NULL),
(32, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'Pet9bFkXgeaA', 90000, 0, NULL, NULL),
(33, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '12lh7oHN7QgO', 90000, 0, NULL, NULL),
(34, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'bLXU53FhnsYd', 90000, 0, NULL, NULL),
(35, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '9GR3y6H7TzCt', 90000, 0, NULL, NULL),
(36, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'Br9xgEbXQOt1', 90000, 0, NULL, NULL),
(37, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'seRkS0YDMY0p', 90000, 0, NULL, NULL),
(38, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'G48PnN8Y0hxE', 90000, 0, NULL, NULL),
(39, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'Hl7pOmzQUif0', 90000, 0, NULL, NULL),
(40, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'kQUPw5qsAHuc', 90000, 0, NULL, NULL),
(41, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '0hFwzcsskhAC', 90000, 0, NULL, NULL),
(42, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'XZlQTj0TXAS4', 90000, 0, NULL, NULL),
(43, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'YViuHdE1vOEC', 90000, 0, NULL, NULL),
(44, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'BcJxYEzkYBGq', 90000, 0, NULL, NULL),
(45, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'l430XUZF6vPu', 90000, 0, NULL, NULL),
(46, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'EGOpEor2kBFg', 90000, 0, NULL, NULL),
(47, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'me4BvdR67Su0', 90000, 0, NULL, NULL),
(48, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'iLDwYKSfKiXX', 90000, 0, NULL, NULL),
(49, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '4mtr3XccFaHg', 90000, 0, NULL, NULL),
(50, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'LjVrYqdyT3lR', 90000, 0, NULL, NULL),
(51, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'NT6nmMycWtVr', 90000, 0, NULL, NULL),
(52, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'BeO3ciKwdvlB', 90000, 0, NULL, NULL),
(53, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'idVZng3olq14', 90000, 0, NULL, NULL),
(54, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'l1W5ryQWfyNJ', 90000, 0, NULL, NULL),
(55, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'FKgARibg4Hes', 90000, 0, NULL, NULL),
(56, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'YCKfFs3qAbTa', 90000, 0, NULL, NULL),
(57, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'hBFdw6qtFI4B', 90000, 0, NULL, NULL),
(58, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '6zxie2OYEa2A', 90000, 0, NULL, NULL),
(59, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '1iZ4ugKKC6fC', 90000, 0, NULL, NULL),
(60, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'wnqred9bEmC9', 90000, 0, NULL, NULL),
(61, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'd0cutxMSBOYq', 90000, 0, NULL, NULL),
(62, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'U1KPjkVhSYM0', 90000, 0, NULL, NULL),
(63, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '1YRdIS2L4TW5', 90000, 0, NULL, NULL),
(64, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'uuhEwnzNMkwv', 90000, 0, NULL, NULL),
(65, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'D4cD44KjybIH', 90000, 0, NULL, NULL),
(66, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'HNt4Rmjlp0TG', 90000, 0, NULL, NULL),
(67, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'aTuWAnbr5v2O', 90000, 0, NULL, NULL),
(68, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'Ww29qxZrDvTi', 90000, 0, NULL, NULL),
(69, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '1y7JNsbCOwuo', 90000, 0, NULL, NULL),
(70, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'TpRXh01RVWhe', 90000, 0, NULL, NULL),
(71, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'WmR0M9GBBi0c', 90000, 0, NULL, NULL),
(72, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'zoF9C2Acha8U', 90000, 0, NULL, NULL),
(73, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'YB2qLoplGGrL', 90000, 0, NULL, NULL),
(74, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'hnwxnXunjFwP', 90000, 0, NULL, NULL),
(75, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '1Md9O0KOgFhB', 90000, 0, NULL, NULL),
(76, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '79xUygDIEVhw', 90000, 0, NULL, NULL),
(77, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'Jq7anemCDEV4', 90000, 0, NULL, NULL),
(78, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'GkPZ1fJF92NF', 90000, 0, NULL, NULL),
(79, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'ITjsf4Wl7SX6', 90000, 0, NULL, NULL),
(80, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'SmCF3NIA5wHI', 90000, 0, NULL, NULL),
(81, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'Pp7ULOmbOuFs', 90000, 0, NULL, NULL),
(82, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'GIyItHJTC03O', 90000, 0, NULL, NULL),
(83, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'D0jXZFrjxafB', 90000, 0, NULL, NULL),
(84, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '05eer0tgQTkf', 90000, 0, NULL, NULL),
(85, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'HWIrSn4ioLQU', 90000, 0, NULL, NULL),
(86, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'e5jqotZ9BwjJ', 90000, 0, NULL, NULL),
(87, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'D2XaC0GHQcF2', 90000, 0, NULL, NULL),
(88, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '8ZbLThBVgK2w', 90000, 0, NULL, NULL),
(89, '2024-07-08 21:58:07', '2024-07-08 21:58:07', '7eah2wMwtiTl', 90000, 0, NULL, NULL),
(90, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'CTBq8mKwBFAu', 90000, 0, NULL, NULL),
(91, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'Xe7qlM4R4GSJ', 90000, 0, NULL, NULL),
(92, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'v5jHSAPbAGdV', 90000, 0, NULL, NULL),
(93, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'JxVV4ODJlLN6', 90000, 0, NULL, NULL),
(94, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'OsJMo10pH5RK', 90000, 0, NULL, NULL),
(95, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'gW5XZPKWeRzL', 90000, 0, NULL, NULL),
(96, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'Ca8Vv18052Mw', 90000, 0, NULL, NULL),
(97, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'C0j21vVdjxvT', 90000, 0, NULL, NULL),
(98, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'QKVenPtmiCFq', 90000, 0, NULL, NULL),
(99, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'TXkXZcofxBo0', 90000, 0, NULL, NULL),
(100, '2024-07-08 21:58:07', '2024-07-08 21:58:07', 'bF9PZFTqSdRi', 90000, 0, NULL, NULL),
(101, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'KkC7cw5KAWKp', 150000, 0, NULL, NULL),
(102, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'Csfe91mJ9rUO', 150000, 0, NULL, NULL),
(103, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'AwC9qT92ZJ0s', 150000, 0, NULL, NULL),
(104, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '5AseNMhilm1u', 150000, 0, NULL, NULL),
(105, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'XzmUwoJLOnYg', 150000, 0, NULL, NULL),
(106, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'zydkXel5FO10', 150000, 0, NULL, NULL),
(107, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'iTM1mUY2biTS', 150000, 0, NULL, NULL),
(108, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'dxmkUVtZaDJt', 150000, 0, NULL, NULL),
(109, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'Qdlk0YogOU1w', 150000, 0, NULL, NULL),
(110, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'vWvWOSpbNGwG', 150000, 0, NULL, NULL),
(111, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'M8hPgYgjOX0k', 150000, 0, NULL, NULL),
(112, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'zRwDHQ2jKTKD', 150000, 0, NULL, NULL),
(113, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'XcLaffnJ7Hxj', 150000, 0, NULL, NULL),
(114, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'tDPifomf7ush', 150000, 0, NULL, NULL),
(115, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'NUl295KERqPH', 150000, 0, NULL, NULL),
(116, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'wqNjfpqO0QCW', 150000, 0, NULL, NULL),
(117, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'VR079SrkeCZh', 150000, 0, NULL, NULL),
(118, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'odofMhLtYuR1', 150000, 0, NULL, NULL),
(119, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'ym6jfMkEnPpC', 150000, 0, NULL, NULL),
(120, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'B9BIs2hwjVf2', 150000, 0, NULL, NULL),
(121, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'Y4Ek1XBBrKiB', 150000, 0, NULL, NULL),
(122, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'qkWdb6pHDY69', 150000, 0, NULL, NULL),
(123, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'ihuI4zF7zoqw', 150000, 0, NULL, NULL),
(124, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'AXqVKo4nqWbe', 150000, 0, NULL, NULL),
(125, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'bG9SGUHYQAED', 150000, 0, NULL, NULL),
(126, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'IKNh7zgcKOPN', 150000, 0, NULL, NULL),
(127, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'yuAuLJJoVpRM', 150000, 0, NULL, NULL),
(128, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '3yA7xZJqI9Av', 150000, 0, NULL, NULL),
(129, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'DI78u3rjVlfl', 150000, 0, NULL, NULL),
(130, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'HX6bUyGHQn5F', 150000, 0, NULL, NULL),
(131, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '4pnz4zp3n0IP', 150000, 0, NULL, NULL),
(132, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'hkuC0n12NMGc', 150000, 0, NULL, NULL),
(133, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'jjKKXBvb62yM', 150000, 0, NULL, NULL),
(134, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '8v5bKWQavnNl', 150000, 0, NULL, NULL),
(135, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '5E4sNcuBJP11', 150000, 0, NULL, NULL),
(136, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '15MvekLD8HYk', 150000, 0, NULL, NULL),
(137, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'EFGo9wLdFKDG', 150000, 0, NULL, NULL),
(138, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'ucbkrFkIFMad', 150000, 0, NULL, NULL),
(139, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'EZHKXdyS7gdL', 150000, 0, NULL, NULL),
(140, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'bFAZ5a0fdudG', 150000, 0, NULL, NULL),
(141, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'yRt2T0HtK4nm', 150000, 0, NULL, NULL),
(142, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'fSogm888ReV6', 150000, 0, NULL, NULL),
(143, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'JN939GoxvFFT', 150000, 0, NULL, NULL),
(144, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'eUhNdKNjvjnP', 150000, 0, NULL, NULL),
(145, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'f43vD1P5rByN', 150000, 0, NULL, NULL),
(146, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'WjVCkqpIjusi', 150000, 0, NULL, NULL),
(147, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'qbJlzJFYkJhP', 150000, 0, NULL, NULL),
(148, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'uVzrwPATYEWN', 150000, 0, NULL, NULL),
(149, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'AbllTtBwxgjI', 150000, 0, NULL, NULL),
(150, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'F4qARKkta2vP', 150000, 0, NULL, NULL),
(151, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'B8JQlYMphuFZ', 150000, 0, NULL, NULL),
(152, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'U19gUajeBh6z', 150000, 0, NULL, NULL),
(153, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '7rkCk72zoeoY', 150000, 0, NULL, NULL),
(154, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'vAgxy6tZqzQM', 150000, 0, NULL, NULL),
(155, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'APrLyKwBAwCm', 150000, 0, NULL, NULL),
(156, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'HoYrDtIO8ogT', 150000, 0, NULL, NULL),
(157, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'BAkWPCmvVjd2', 150000, 0, NULL, NULL),
(158, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '8CAVEoxMOudp', 150000, 0, NULL, NULL),
(159, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '95t9LkNmmeNE', 150000, 0, NULL, NULL),
(160, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'SmKV6WQ38yuz', 150000, 0, NULL, NULL),
(161, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'T4sj2ZRlNdik', 150000, 0, NULL, NULL),
(162, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'zpCxS6IifuWi', 150000, 0, NULL, NULL),
(163, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'cNrh85IlxQfA', 150000, 0, NULL, NULL),
(164, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'x0Q1sBeeGFTW', 150000, 0, NULL, NULL),
(165, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '4G1gIIiLPmGw', 150000, 0, NULL, NULL),
(166, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'R7K1mIdGqhYR', 150000, 0, NULL, NULL),
(167, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'mSTHA7LZtRGE', 150000, 0, NULL, NULL),
(168, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'odoknqT0jvdt', 150000, 0, NULL, NULL),
(169, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'OI3weWLlc2kY', 150000, 0, NULL, NULL),
(170, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 's4KXCQXUvNzF', 150000, 0, NULL, NULL),
(171, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 's8BoXbYQNll1', 150000, 0, NULL, NULL),
(172, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'vilAnry09SvV', 150000, 0, NULL, NULL),
(173, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'mhqgXv7MhkDr', 150000, 0, NULL, NULL),
(174, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '477L9ZqjEgoc', 150000, 0, NULL, NULL),
(175, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'ItIigVLQb97l', 150000, 0, NULL, NULL),
(176, '2024-07-16 00:46:15', '2024-07-16 00:46:15', '9w6SAPlJwcYR', 150000, 0, NULL, NULL),
(177, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'bHAX2X5deeXo', 150000, 0, NULL, NULL),
(178, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'L1e5i5tBzh01', 150000, 0, NULL, NULL),
(179, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'iyeNC6rbilFR', 150000, 0, NULL, NULL),
(180, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'neZ9vv7QCYB5', 150000, 0, NULL, NULL),
(181, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'rK1TwKBzb22t', 150000, 0, NULL, NULL),
(182, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'h4f1nBFpfLx3', 150000, 0, NULL, NULL),
(183, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'm0vwAklPYrkd', 150000, 0, NULL, NULL),
(184, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'gIR0ubVTpO0k', 150000, 0, NULL, NULL),
(185, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'RdO7OsClbKy5', 150000, 0, NULL, NULL),
(186, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'GZhkAR9TVTAf', 150000, 0, NULL, NULL),
(187, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'qbjOPLhneuuV', 150000, 0, NULL, NULL),
(188, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'Gi0RHP0cNsN2', 150000, 0, NULL, NULL),
(189, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'WB5F6aNCzf3a', 150000, 0, NULL, NULL),
(190, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'kYZdXKroiRJU', 150000, 0, NULL, NULL),
(191, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'oANPqWsuRGzb', 150000, 0, NULL, NULL),
(192, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'FUXf0h908GKt', 150000, 0, NULL, NULL),
(193, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'lUIpsKjjgjjD', 150000, 0, NULL, NULL),
(194, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'Cu7QcTmNXhm9', 150000, 0, NULL, NULL),
(195, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'TIYgLYSX9niR', 150000, 0, NULL, NULL),
(196, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'ZeSxBx9uxd12', 150000, 0, NULL, NULL),
(197, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'eVod5yosTTKH', 150000, 0, NULL, NULL),
(198, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'pqIdVIbzKnzC', 150000, 0, NULL, NULL),
(199, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'iaYQ7fKs5uRS', 150000, 0, NULL, NULL),
(200, '2024-07-16 00:46:15', '2024-07-16 00:46:15', 'w9so96mJVela', 150000, 0, NULL, NULL),
(201, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'uLXOwoLwhbCx', 150000, 0, NULL, NULL),
(202, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '0k27R6oR1svg', 150000, 0, NULL, NULL),
(203, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'NS8bnmEN1JNb', 150000, 0, NULL, NULL),
(204, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'WdBLfaqVR9Kt', 150000, 0, NULL, NULL),
(205, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '3h7aJsXP30NL', 150000, 0, NULL, NULL),
(206, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'bIwT4zxcd0yN', 150000, 0, NULL, NULL),
(207, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'BGr5p7EvKxfa', 150000, 0, NULL, NULL),
(208, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'eRmt52jPHIMS', 150000, 0, NULL, NULL),
(209, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'MAm5aPFDMITe', 150000, 0, NULL, NULL),
(210, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'PDVd895hLa3L', 150000, 0, NULL, NULL),
(211, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'O2IDZlh5CNz0', 150000, 0, NULL, NULL),
(212, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'nOey6jEYL3i4', 150000, 0, NULL, NULL),
(213, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'FC216AKsyGU6', 150000, 0, NULL, NULL),
(214, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'Ovj7xJCC2vCU', 150000, 0, NULL, NULL),
(215, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'N2ZNUBGx8mrA', 150000, 0, NULL, NULL),
(216, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'GSeRCEbzP0BK', 150000, 0, NULL, NULL),
(217, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'oBa9u0L8OfN0', 150000, 0, NULL, NULL),
(218, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'H6FU6PWv4jbc', 150000, 0, NULL, NULL),
(219, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '5dIKWb53WjMm', 150000, 0, NULL, NULL),
(220, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'RjFjbX0ppdZc', 150000, 0, NULL, NULL),
(221, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'ITLcZFVJMIh1', 150000, 0, NULL, NULL),
(222, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'ovvogNwPsoUG', 150000, 0, NULL, NULL),
(223, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '0LvinjDVIRmE', 150000, 0, NULL, NULL),
(224, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'd1s1NrzDZUQ4', 150000, 0, NULL, NULL),
(225, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'UbSd7cisEHvi', 150000, 0, NULL, NULL),
(226, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'VKKPzzDKOUXH', 150000, 0, NULL, NULL),
(227, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'Qw02kbZtI7mH', 150000, 0, NULL, NULL),
(228, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'KtvqK1Vxp40o', 150000, 0, NULL, NULL),
(229, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'yVFJW5hDpdFe', 150000, 0, NULL, NULL),
(230, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'DIECs3j4Uk2z', 150000, 0, NULL, NULL),
(231, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '0Qa9oaXpUwpC', 150000, 0, NULL, NULL),
(232, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '7CBuTaT5Jci8', 150000, 0, NULL, NULL),
(233, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '7uWLN3TfSaQl', 150000, 0, NULL, NULL),
(234, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'FqTnC43qRsJq', 150000, 0, NULL, NULL),
(235, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'ptmfOi8pryzZ', 150000, 0, NULL, NULL),
(236, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '3YXvYbcEtkyW', 150000, 0, NULL, NULL),
(237, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'equ44YvrjuKM', 150000, 0, NULL, NULL),
(238, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'll16f3U7ut9x', 150000, 0, NULL, NULL),
(239, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'dVPvWUTooXnq', 150000, 0, NULL, NULL),
(240, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'ISObldSXpOjg', 150000, 0, NULL, NULL),
(241, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 't9Xdo9caKBvp', 150000, 0, NULL, NULL),
(242, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'lTQB1clhZu7y', 150000, 0, NULL, NULL),
(243, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '3jshlTGF2hqN', 150000, 0, NULL, NULL),
(244, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'U0tleBONi4CW', 150000, 0, NULL, NULL),
(245, '2024-07-16 21:56:24', '2024-07-16 21:56:24', '5ML8yAtAML1e', 150000, 0, NULL, NULL),
(246, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'XhEVQZQo92TE', 150000, 0, NULL, NULL),
(247, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'wBitlMWmX3OS', 150000, 0, NULL, NULL),
(248, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'ttb9dDcwnsfX', 150000, 0, NULL, NULL),
(249, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'BVeqrxSW2a82', 150000, 0, NULL, NULL),
(250, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'eVB2rprepZMK', 150000, 0, NULL, NULL),
(251, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'H4h3KMRe7ZwL', 150000, 0, NULL, NULL),
(252, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'VnADRVy3wgOz', 150000, 0, NULL, NULL),
(253, '2024-07-16 21:56:24', '2024-07-16 21:56:24', 'RbiFiQa0wrqr', 150000, 0, NULL, NULL),
(254, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'VFIHGdqPHdxY', 150000, 0, NULL, NULL),
(255, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'n32mv0HJsTF4', 150000, 0, NULL, NULL),
(256, '2024-07-16 21:56:25', '2024-07-19 21:22:44', 'HG0M4nUZ4C0I', 150000, 1, '2024-07-20 04:22:44', NULL),
(257, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'omeCGx5AWCjN', 150000, 0, NULL, NULL),
(258, '2024-07-16 21:56:25', '2024-07-19 21:22:34', 'WH5pMZLGy9eb', 150000, 1, '2024-07-20 04:22:34', NULL),
(259, '2024-07-16 21:56:25', '2024-07-19 21:22:39', 'OhA3sF2bwnns', 150000, 1, '2024-07-20 04:22:39', NULL),
(260, '2024-07-16 21:56:25', '2024-07-16 21:56:25', '7E78tLfn3XeP', 150000, 0, NULL, NULL),
(261, '2024-07-16 21:56:25', '2024-07-16 22:07:54', 'r497YDdF5NBD', 150000, 1, '2024-07-17 05:07:54', NULL),
(262, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'NNy4lJmySEic', 150000, 0, NULL, NULL),
(263, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'lF7R8mDIMWDS', 150000, 0, NULL, NULL),
(264, '2024-07-16 21:56:25', '2024-07-19 21:22:49', 'xe2Xf58OUut6', 150000, 1, '2024-07-20 04:22:49', NULL),
(265, '2024-07-16 21:56:25', '2024-07-19 21:37:05', 'cGQhrBFXt5DF', 150000, 1, '2024-07-20 04:37:05', NULL),
(266, '2024-07-16 21:56:25', '2024-07-16 21:56:25', '0lk0rWhMA1QQ', 150000, 0, NULL, NULL),
(267, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'ljMVFrktUgPU', 150000, 0, NULL, NULL),
(268, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'j68T0Y72RDpw', 150000, 0, NULL, NULL),
(269, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'Jy5vzGyaN98b', 150000, 0, NULL, NULL),
(270, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'AukTZVN2saNt', 150000, 0, NULL, NULL),
(271, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'bYvT7o5rvZ5Z', 150000, 0, NULL, NULL),
(272, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'N85EVSZgVioZ', 150000, 0, NULL, NULL),
(273, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'VaRJdd9bPuiX', 150000, 0, NULL, NULL),
(274, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'I1MURPePO1Bn', 150000, 0, NULL, NULL),
(275, '2024-07-16 21:56:25', '2024-07-16 21:56:25', '0a8OE8mkVyZB', 150000, 0, NULL, NULL),
(276, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'oGetpyp4ZIQD', 150000, 0, NULL, NULL),
(277, '2024-07-16 21:56:25', '2024-07-16 21:56:25', '1kB8QSjAyM5z', 150000, 0, NULL, NULL),
(278, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'HycN3xnwRzEE', 150000, 0, NULL, NULL),
(279, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'VaQZ5M9vQCIR', 150000, 0, NULL, NULL),
(280, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'Jh8diuUwiFzP', 150000, 0, NULL, NULL),
(281, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'fGCa5E6VQfNn', 150000, 0, NULL, NULL),
(282, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'FLJcAQ5oHucM', 150000, 0, NULL, NULL),
(283, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'AniVMvuJydDl', 150000, 0, NULL, NULL),
(284, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'v9SWTCCgE4HB', 150000, 0, NULL, NULL),
(285, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'm4EN4qOHKTsn', 150000, 0, NULL, NULL),
(286, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'r0DzMLwzwUwE', 150000, 0, NULL, NULL),
(287, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'FfeoP3YPFKgY', 150000, 0, NULL, NULL),
(288, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'ndLKtTJLUNuh', 150000, 0, NULL, NULL),
(289, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'NyDMGvo8CSxf', 150000, 0, NULL, NULL),
(290, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'FNI1pSjy2zCt', 150000, 0, NULL, NULL),
(291, '2024-07-16 21:56:25', '2024-07-16 21:56:25', 'U7gHE1UcwoPG', 150000, 0, NULL, NULL),
(292, '2024-07-16 21:56:25', '2024-07-24 04:10:52', 'pAluGShd0Ynd', 150000, 1, '2024-07-24 11:10:52', 5),
(293, '2024-07-16 21:56:25', '2024-07-24 04:10:48', 'XwsfXV0Nl4RB', 150000, 1, '2024-07-24 11:10:48', 5),
(294, '2024-07-16 21:56:25', '2024-07-24 04:10:44', '9ZuhOXzsr0Oj', 150000, 1, '2024-07-24 11:10:44', 5),
(295, '2024-07-16 21:56:25', '2024-07-24 04:10:39', 'A7UxwtClh1Un', 150000, 1, '2024-07-24 11:10:39', 5),
(296, '2024-07-16 21:56:25', '2024-07-24 04:10:34', 'tXdUGs9XmDMy', 150000, 1, '2024-07-24 11:10:34', 5),
(297, '2024-07-16 21:56:25', '2024-07-24 04:10:30', 'K13RyW3K6LNr', 150000, 1, '2024-07-24 11:10:30', 5),
(298, '2024-07-16 21:56:25', '2024-07-24 04:10:25', 'gGsC67ljYwy4', 150000, 1, '2024-07-24 11:10:25', 5),
(299, '2024-07-16 21:56:25', '2024-07-24 04:10:22', 'nLO4BTyX7lEy', 150000, 1, '2024-07-24 11:10:22', 5),
(300, '2024-07-16 21:56:25', '2024-07-24 04:10:16', 'egcMh6kThhgL', 150000, 1, '2024-07-24 11:10:16', 5),
(301, '2024-07-26 02:50:14', '2024-07-26 02:50:14', 'RluwGwK2LbGv', 150000, 0, NULL, NULL),
(302, '2024-07-26 02:50:14', '2024-07-26 02:50:14', 'MMD9qe4lt7lb', 150000, 0, NULL, NULL),
(303, '2024-07-26 02:50:14', '2024-07-26 02:50:14', 'dFhQK8596wtB', 150000, 0, NULL, NULL),
(304, '2024-07-26 02:50:14', '2024-07-26 02:50:14', 'UNhUDFVn0nwn', 150000, 0, NULL, NULL);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `friendlists`
--
ALTER TABLE `friendlists`
  ADD CONSTRAINT `friendlists_user_id_1_foreign` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friendlists_user_id_2_foreign` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `friend_requests_user_id_1_foreign` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_requests_user_id_2_foreign` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_age_rating_id_foreign` FOREIGN KEY (`age_rating_id`) REFERENCES `age_ratings` (`id`),
  ADD CONSTRAINT `games_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`);

--
-- Ketidakleluasaan untuk tabel `game_carts`
--
ALTER TABLE `game_carts`
  ADD CONSTRAINT `game_carts_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `game_genres`
--
ALTER TABLE `game_genres`
  ADD CONSTRAINT `game_genres_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_genres_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `game_images`
--
ALTER TABLE `game_images`
  ADD CONSTRAINT `game_images_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `game_libraries`
--
ALTER TABLE `game_libraries`
  ADD CONSTRAINT `game_libraries_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_libraries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `game_reviews`
--
ALTER TABLE `game_reviews`
  ADD CONSTRAINT `game_reviews_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `game_reviews_rating_type_id_foreign` FOREIGN KEY (`rating_type_id`) REFERENCES `rating_types` (`id`),
  ADD CONSTRAINT `game_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `game_wishlists`
--
ALTER TABLE `game_wishlists`
  ADD CONSTRAINT `game_wishlists_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_libraries`
--
ALTER TABLE `item_libraries`
  ADD CONSTRAINT `item_libraries_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_libraries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `publishers`
--
ALTER TABLE `publishers`
  ADD CONSTRAINT `publishers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Ketidakleluasaan untuk tabel `wallet_codes`
--
ALTER TABLE `wallet_codes`
  ADD CONSTRAINT `wallet_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
