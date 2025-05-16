-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 16, 2025 at 03:39 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_react_acl`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_06_033259_create_user_groups_table', 2),
(6, '2025_05_06_033424_add_user_group_id_to_users_table', 3),
(7, '2025_05_06_034212_create_permission_tables', 4),
(8, '2025_05_15_115913_add_status_to_users_table', 5),
(9, '2025_05_15_131752_add_photo_to_users_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 11),
(1, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(1, 'App\\Models\\User', 14),
(1, 'App\\Models\\User', 15),
(1, 'App\\Models\\User', 17),
(1, 'App\\Models\\User', 18),
(1, 'App\\Models\\User', 50),
(1, 'App\\Models\\User', 51),
(1, 'App\\Models\\User', 52),
(1, 'App\\Models\\User', 53),
(1, 'App\\Models\\User', 54),
(1, 'App\\Models\\User', 55),
(1, 'App\\Models\\User', 56);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('dedy.adhiewirawan@gmail.com', '$2y$12$2zTBTgTa8P2mUO8P5nvJxO2Aq6WOy7THEexbVydVpT4qY2yBGYleu', '2025-05-15 02:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'delete-role', 'web', '2025-05-14 23:20:01', '2025-05-14 23:20:01'),
(2, 'create-user', 'web', '2025-05-14 23:20:01', '2025-05-14 23:20:01'),
(3, 'read-user', 'web', '2025-05-14 23:20:01', '2025-05-14 23:20:01'),
(4, 'update-user', 'web', '2025-05-14 23:20:01', '2025-05-14 23:20:01'),
(5, 'delete-user', 'web', '2025-05-14 23:20:01', '2025-05-14 23:20:01'),
(6, 'create-role', 'web', '2025-05-14 23:20:02', '2025-05-14 23:20:02'),
(7, 'read-role', 'web', '2025-05-14 23:20:02', '2025-05-14 23:20:02'),
(8, 'update-role', 'web', '2025-05-14 23:20:02', '2025-05-14 23:20:02');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-05-05 20:57:27', '2025-05-05 20:57:27'),
(2, 'manager', 'web', '2025-05-05 20:57:27', '2025-05-05 20:57:27'),
(3, 'user', 'web', '2025-05-05 20:57:27', '2025-05-05 20:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(2, 2),
(3, 2),
(4, 2),
(6, 2),
(7, 2),
(8, 2),
(3, 3),
(7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_group_id` bigint UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `user_group_id`, `is_active`) VALUES
(3, 'admin', 'dedy.adhiewirawan@gmail.com', 'photos/PajG4QJRmtlHimctWJvw42FKGd53AGqG0XL6QRpf.jpg', NULL, '$2y$12$YPS1p.zNKmHffuPqJvXWm.r5J57emAzPj9QLqVaEuAH8tLVIvuuq2', '7nBy9lBoWvnYPQI9bLzSWGp7uPZdhqrIgbZwRV8XxBUjzSWpuOZTANlEdwc4', '2025-05-05 21:35:12', '2025-05-15 20:18:20', 1, 1),
(9, 'test123', 'dedy.adhiewirawan@geraiweb.com', NULL, NULL, '$2y$12$xGpC/VS4NcEDetZsHHlD1.nMn/yY1O5Ym84lgL8hz/rJB4K2/EKaS', NULL, '2025-05-14 21:33:51', '2025-05-15 06:03:25', 2, 0),
(11, 'Stanley Osinski', 'collins.brody@example.net', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'fKneEAe5an', '2025-05-15 04:08:26', '2025-05-15 05:54:36', 1, 0),
(12, 'Prof. Tamara Senger MD', 'leannon.joy@example.com', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'zAoYFaIYtN', '2025-05-15 04:08:26', '2025-05-15 05:59:58', 1, 0),
(13, 'Noemy Barton', 'lbreitenberg@example.org', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'sGzqnqies6', '2025-05-15 04:08:26', '2025-05-15 07:51:23', 1, 1),
(14, 'Prof. Liliana Kassulke', 'dejah.hoppe@example.net', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'FbSQ5z56SX', '2025-05-15 04:08:26', '2025-05-15 07:52:08', 1, 1),
(15, 'Russel Durgan IV', 'nader.paxton@example.net', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'sUC3aSAyeN', '2025-05-15 04:08:26', '2025-05-15 07:54:50', 1, 1),
(16, 'Nestor Graham', 'emmerich.duncan@example.net', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'KumKuGbg9f', '2025-05-15 04:08:26', '2025-05-15 04:08:26', NULL, 1),
(17, 'Bettye Mayert', 'caden26@example.com', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', '2o7y45qnDS', '2025-05-15 04:08:26', '2025-05-15 06:05:32', 1, 1),
(18, 'Prof. Ronny Farrell DDS', 'abernathy.caden@example.com', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'TZmJuiQZDE', '2025-05-15 04:08:26', '2025-05-15 07:56:53', 1, 0),
(19, 'Mrs. Jaunita Kilback', 'reilly.lottie@example.net', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'EomIVb6NQt', '2025-05-15 04:08:26', '2025-05-15 06:08:09', NULL, 0),
(20, 'Ms. Janet Kunze DVM', 'bettye.kuphal@example.net', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'vJeLD21ssU', '2025-05-15 04:08:26', '2025-05-15 05:29:08', NULL, 1),
(21, 'Arden Ankunding', 'name.collier@example.net', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'fS26reqKmW', '2025-05-15 04:08:26', '2025-05-15 04:08:26', NULL, 1),
(22, 'Michael Herzog DVM', 'mueller.crystal@example.com', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'M0jvveWISr', '2025-05-15 04:08:26', '2025-05-15 04:08:26', NULL, 1),
(23, 'Deontae Parisian II', 'witting.makenna@example.org', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', '878bBmnPam', '2025-05-15 04:08:26', '2025-05-15 04:08:26', NULL, 1),
(24, 'Aisha Weissnat', 'filomena.runolfsson@example.org', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', '5lTZZJyyp5', '2025-05-15 04:08:26', '2025-05-15 04:08:26', NULL, 1),
(25, 'Ettie Medhurst', 'swaniawski.sally@example.com', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'afrDTso2aE', '2025-05-15 04:08:26', '2025-05-15 04:08:26', NULL, 1),
(26, 'Louisa Williamson', 'jana54@example.org', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'RdvoerIA1y', '2025-05-15 04:08:26', '2025-05-15 04:08:26', NULL, 1),
(27, 'Ms. Maeve Schamberger', 'zbode@example.org', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'BmuIlbFjxW', '2025-05-15 04:08:26', '2025-05-15 05:29:22', NULL, 1),
(28, 'Mrs. Cathy Ziemann IV', 'schmeler.xavier@example.com', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', '8w9pBOawQc', '2025-05-15 04:08:26', '2025-05-15 05:33:42', NULL, 1),
(29, 'Friedrich Stokes', 'rshanahan@example.com', NULL, '2025-05-15 04:08:26', '$2y$12$1EiWkcI1fkC8oMvUlwNTPuKhHrnPW8hqxvdAXBOsKbDVTu74pMOna', 'UF9KcpA8ns', '2025-05-15 04:08:26', '2025-05-15 05:22:29', NULL, 1),
(30, 'Georgianna Muller Sr.', 'brekke.myles@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'acgkzeIJFB', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(31, 'Elza McCullough', 'erin61@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'olpOTSHUzN', '2025-05-15 04:15:30', '2025-05-15 05:44:29', NULL, 1),
(32, 'Gia Torp II', 'ruecker.shaina@example.org', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'JzyD2OzYUB', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(33, 'Edwina Braun', 'dayton.hintz@example.org', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'BJnhBiQu8Z', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(34, 'Mr. Jake Hodkiewicz', 'egibson@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'oBAZBZLlni', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(35, 'Lenny Kulas DDS', 'bauch.randi@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'D85dw3k6g0', '2025-05-15 04:15:30', '2025-05-15 05:47:20', NULL, 1),
(36, 'Benedict Metz', 'abbigail.kilback@example.com', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'kg61UvyaN0', '2025-05-15 04:15:30', '2025-05-15 05:44:49', NULL, 1),
(37, 'Jett Lehner', 'zkessler@example.org', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'l6MSeRGRCB', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(38, 'Dahlia Pacocha', 'kurtis07@example.com', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', '3497YfpSDV', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(39, 'Prof. Erica Halvorson', 'boyd.willms@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'Tei1u9POP6', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(40, 'Miss Ellen Kohler DVM', 'orpha29@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'ZOprl7c3Y0', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(41, 'Norma Fadel', 'brooks76@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'KtmgtScRsY', '2025-05-15 04:15:30', '2025-05-15 05:45:32', NULL, 0),
(42, 'Marilyne Macejkovic DVM', 'dare.taylor@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'YSuToxH8AA', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(43, 'Mrs. Lacey Considine', 'wcrona@example.org', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'XSoYnXGBDr', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(44, 'Jany Schamberger', 'rosalyn05@example.com', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'qjBTaw2IC4', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(45, 'Keshaun Jacobson', 'kunze.liza@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'MCoSf2hSty', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(46, 'Prof. Dillon Lynch DDS', 'jordyn43@example.org', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'pD4kAoRQWV', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(47, 'Norberto Reynolds', 'danyka.skiles@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'NilVwnKLav', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(48, 'Cade Littel', 'brant.torphy@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'yCREOBt9pt', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(49, 'Prof. Watson Powlowski DDS', 'lturner@example.net', NULL, '2025-05-15 04:15:30', '$2y$12$KkNJG.ssTwjRcqDg9SbXrOAsTF8Ku5zejwwx10XKfm065761jql8q', 'jJQvqEtpra', '2025-05-15 04:15:30', '2025-05-15 04:15:30', NULL, 1),
(50, 'sdfsdf', 'test@gmail123.com', 'photos/oyHzPnlbapxWz3Af2E2fLc1KUk0aBlucEiw4QOcN.jpg', NULL, '$2y$12$Keu8vwdjBYN8hZKKcQcvDO.VotdKu8O0jdX8XobjKRSrRRguf9qXC', NULL, '2025-05-15 06:29:49', '2025-05-15 06:31:44', 2, 1),
(51, 'aaa', 'aaa@ssss.com', NULL, NULL, '$2y$12$4PHSx387xDG731y8KQhU7O1JZc5PU5YpyLfzYShJp9ouAW3mp2hiq', NULL, '2025-05-15 06:49:56', '2025-05-15 06:49:56', 1, 1),
(52, 'bbb', 'sdfs@gmail.com', 'photos/yZNJxGfcyfyTodKRH6NevVE13XdVJScynNVPRziE.jpg', NULL, '$2y$12$4g6G6sEXu7ZkJlcA/AzohOB/HAnKeVKljz1q6TV5/PqvAXTV16SOq', NULL, '2025-05-15 06:50:27', '2025-05-15 06:50:27', 1, 1),
(53, 'aabb', 'ssfsdf@gasdfsdf.com', NULL, NULL, '$2y$12$no0pNFVR5ZKaNR/pXcSXbe9w3kyHlH0ihegfMuHgE7fPtHocRz1OG', NULL, '2025-05-15 07:00:39', '2025-05-15 07:00:39', 1, 1),
(54, 'sdfsdfsdf', 'dedy.asdfsdfsdf@gmsdfo.com', NULL, NULL, '$2y$12$6/fByLqFJZ.FlXoeX9wEuulUIFQUsP8lwbodC3xsEj4hEwcu..TFC', NULL, '2025-05-15 07:11:47', '2025-05-15 07:11:47', 1, 1),
(55, 'sdfsdf', 'sdfdfsdf@ssdf.com', 'photos/0C5ZHIFKHrexOiHyumcrB5VKlz9sgM7skdstwMJK.jpg', NULL, '$2y$12$XTVnuoObQl.tF/JTjr3I2.1Cx6uNhL80VswRAszkivPxAyCcWNwL.', NULL, '2025-05-15 07:21:10', '2025-05-15 07:21:10', 1, 1),
(56, 'sdfswerwerw', 'dedy.sdfsdf@geraiweb.com', NULL, NULL, '$2y$12$XMdvdkhoXZbG21QLXkgcAOawtt2v1n64trwH4c1kxmS5owM2rPOk6', NULL, '2025-05-15 07:32:01', '2025-05-15 07:32:01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'IT', '2025-05-05 21:33:10', '2025-05-05 21:33:10'),
(2, 'Marketing', '2025-05-05 21:33:10', '2025-05-05 21:33:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_group_id_foreign` (`user_group_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_groups_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
