-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 17, 2026 at 05:06 PM
-- Server version: 8.4.7
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portalfeed`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
CREATE TABLE IF NOT EXISTS `audit_log` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `actor_id` int UNSIGNED DEFAULT NULL,
  `action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_audit_log_actor` (`actor_id`),
  KEY `idx_audit_log_action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_comments_post_created` (`post_id`,`created_at`),
  KEY `idx_comments_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `body`, `created_at`) VALUES
(1, 1, 2, 'This is a great starter project for learning PHP communities.', '2026-05-13 23:58:50'),
(2, 1, 3, 'The structure is clean and easy to understand.', '2026-05-13 23:58:50'),
(3, 2, 4, 'Agree. White space is usually the biggest upgrade.', '2026-05-13 23:58:50'),
(4, 2, 6, 'This is exactly what I noticed on client websites too.', '2026-05-13 23:58:50'),
(5, 3, 1, 'Consistency makes everything feel more premium.', '2026-05-13 23:58:50'),
(6, 4, 2, 'This would be useful for small business owners.', '2026-05-13 23:58:50'),
(7, 5, 5, 'Showing a demo is definitely stronger than pitching with text only.', '2026-05-13 23:58:50'),
(8, 7, 6, 'Good point. I need to improve how I message clients.', '2026-05-13 23:58:50'),
(9, 8, 3, 'Decision-first dashboard is a nice way to explain it.', '2026-05-13 23:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user1_id` int UNSIGNED NOT NULL,
  `user2_id` int UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_conversations_pair` (`user1_id`,`user2_id`),
  KEY `idx_conversations_user2` (`user2_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `user1_id`, `user2_id`, `created_at`) VALUES
(1, 1, 2, '2026-05-13 23:58:50'),
(2, 3, 4, '2026-05-13 23:58:50'),
(3, 5, 6, '2026-05-13 23:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
CREATE TABLE IF NOT EXISTS `follows` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `follower_id` int UNSIGNED NOT NULL,
  `following_id` int UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_follows_pair` (`follower_id`,`following_id`),
  KEY `idx_follows_following` (`following_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `follower_id`, `following_id`, `created_at`) VALUES
(1, 2, 1, '2026-05-13 23:58:50'),
(2, 2, 3, '2026-05-13 23:58:50'),
(3, 2, 4, '2026-05-13 23:58:50'),
(4, 3, 1, '2026-05-13 23:58:50'),
(5, 3, 4, '2026-05-13 23:58:50'),
(6, 3, 5, '2026-05-13 23:58:50'),
(7, 4, 1, '2026-05-13 23:58:50'),
(8, 4, 3, '2026-05-13 23:58:50'),
(9, 4, 6, '2026-05-13 23:58:50'),
(10, 5, 1, '2026-05-13 23:58:50'),
(11, 5, 2, '2026-05-13 23:58:50'),
(12, 5, 3, '2026-05-13 23:58:50'),
(13, 6, 1, '2026-05-13 23:58:50'),
(14, 6, 4, '2026-05-13 23:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `gigs`
--

DROP TABLE IF EXISTS `gigs`;
CREATE TABLE IF NOT EXISTS `gigs` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_from` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_gigs_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gigs`
--

INSERT INTO `gigs` (`id`, `user_id`, `title`, `price_from`, `rating`, `created_at`) VALUES
(1, 3, 'Frontend landing page review', 120.00, 4.80, '2026-05-13 23:58:50'),
(2, 4, 'UI/UX homepage redesign', 180.00, 4.90, '2026-05-13 23:58:50'),
(3, 5, 'PHP dashboard setup help', 250.00, 4.70, '2026-05-13 23:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_code_only` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `price_month` decimal(10,2) DEFAULT NULL,
  `invite_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_groups_slug` (`slug`),
  UNIQUE KEY `uniq_groups_invite_token` (`invite_token`),
  KEY `idx_groups_created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `slug`, `description`, `cover_image`, `is_code_only`, `created_by`, `is_private`, `is_paid`, `price_month`, `invite_token`, `created_at`) VALUES
(1, 'Frontend Builders', 'frontend-builders', 'A group for frontend developers sharing UI, CSS, JavaScript and design feedback.', NULL, 0, 1, 0, 0, NULL, NULL, '2026-05-13 23:58:50'),
(2, 'Freelance & Clients', 'freelance-clients', 'A group for freelancers to discuss clients, offers, pricing and outreach.', NULL, 0, 5, 0, 0, NULL, NULL, '2026-05-13 23:58:50'),
(3, 'SaaS Makers', 'saas-makers', 'A group for people building SaaS dashboards, tools and business systems.', NULL, 1, 1, 0, 0, NULL, NULL, '2026-05-13 23:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

DROP TABLE IF EXISTS `group_members`;
CREATE TABLE IF NOT EXISTS `group_members` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `role` enum('owner','moderator','member') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_group_members` (`group_id`,`user_id`),
  KEY `idx_group_members_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`id`, `group_id`, `user_id`, `role`, `created_at`) VALUES
(1, 1, 1, 'owner', '2026-05-13 23:58:50'),
(2, 1, 3, 'member', '2026-05-13 23:58:50'),
(3, 1, 4, 'member', '2026-05-13 23:58:50'),
(4, 1, 6, 'member', '2026-05-13 23:58:50'),
(5, 2, 5, 'owner', '2026-05-13 23:58:50'),
(6, 2, 1, 'member', '2026-05-13 23:58:50'),
(7, 2, 2, 'member', '2026-05-13 23:58:50'),
(8, 2, 6, 'member', '2026-05-13 23:58:50'),
(9, 3, 1, 'owner', '2026-05-13 23:58:50'),
(10, 3, 5, 'moderator', '2026-05-13 23:58:50'),
(11, 3, 2, 'member', '2026-05-13 23:58:50'),
(12, 3, 3, 'member', '2026-05-13 23:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` int UNSIGNED NOT NULL,
  `sender_id` int UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_messages_conversation_created` (`conversation_id`,`created_at`),
  KEY `idx_messages_sender` (`sender_id`),
  KEY `idx_messages_read_at` (`read_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender_id`, `body`, `created_at`, `read_at`) VALUES
(1, 1, 1, 'Welcome to the demo account. You can test messages here.', '2026-05-13 23:58:50', NULL),
(2, 1, 2, 'Thanks, I will explore the platform.', '2026-05-13 23:58:50', NULL),
(3, 2, 3, 'Your design feedback on my post was helpful.', '2026-05-13 23:58:50', NULL),
(4, 2, 4, 'No problem, the layout already looked good.', '2026-05-13 23:58:50', NULL),
(5, 3, 5, 'Want to test the freelance group later?', '2026-05-13 23:58:50', NULL),
(6, 3, 6, 'Yes, I will post an outreach example.', '2026-05-13 23:58:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `to_user_id` int UNSIGNED NOT NULL,
  `from_user_id` int UNSIGNED DEFAULT NULL,
  `type` enum('like','comment','follow','message') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_id` int UNSIGNED NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_notifications_to_read_created` (`to_user_id`,`is_read`,`created_at`),
  KEY `idx_notifications_from` (`from_user_id`),
  KEY `idx_notifications_type_ref` (`type`,`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `to_user_id`, `from_user_id`, `type`, `ref_id`, `message`, `is_read`, `created_at`, `read_at`) VALUES
(1, 1, 2, 'comment', 1, 'Demo User commented on your post.', 0, '2026-05-13 23:58:50', NULL),
(2, 3, 4, 'like', 2, 'Sarah Design liked your post.', 0, '2026-05-13 23:58:50', NULL),
(3, 6, 5, 'message', 3, 'Mark Builder sent you a message.', 0, '2026-05-13 23:58:50', NULL),
(4, 2, 1, 'follow', 1, 'Demo Admin followed you.', 0, '2026-05-13 23:58:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` enum('post','highlight','project') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `is_pinned` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_posts_user` (`user_id`),
  KEY `idx_posts_group` (`group_id`),
  KEY `idx_posts_category` (`category`),
  KEY `idx_posts_pinned_created` (`is_pinned`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `group_id`, `title`, `body`, `category`, `is_pinned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Welcome to Portal', 'This is a clean demo social platform built with PHP and MySQL. You can post, comment, like, follow users, join groups and test the full community flow.', 'highlight', 1, '2026-05-13 23:58:50', '2026-05-13 23:58:50'),
(2, 3, NULL, 'Small UI improvement idea', 'I redesigned a dashboard card today and learned that spacing matters more than adding more colors. Simple layout wins. #ui #frontend', 'post', 0, '2026-05-13 23:58:50', '2026-05-13 23:58:50'),
(3, 4, NULL, 'Design systems save time', 'When buttons, cards and typography are consistent, the whole app feels more professional instantly. #design', 'post', 0, '2026-05-13 23:58:50', '2026-05-13 23:58:50'),
(4, 5, NULL, 'Building SaaS dashboards', 'A good SaaS dashboard should show what matters first: money, clients, tasks and alerts. Everything else is secondary. #saas', 'project', 0, '2026-05-13 23:58:50', '2026-05-13 23:58:50'),
(5, 6, NULL, 'Freelance lesson', 'Clients understand value faster when you show a demo instead of only explaining the idea. #freelance', 'post', 0, '2026-05-13 23:58:50', '2026-05-13 23:58:50'),
(6, 1, 1, 'Frontend group rules', 'Share work, give useful feedback, and keep posts practical. Screenshots and short explanations are welcome.', 'post', 1, '2026-05-13 23:58:50', '2026-05-13 23:58:50'),
(7, 5, 2, 'Client outreach tip', 'Do not start with price. Start with the problem you can solve and show a small visual example.', 'post', 1, '2026-05-13 23:58:50', '2026-05-13 23:58:50'),
(8, 1, 3, 'SaaS builder note', 'If your dashboard has too many widgets, it stops being useful. Build around decisions, not decoration.', 'post', 1, '2026-05-13 23:58:50', '2026-05-13 23:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
CREATE TABLE IF NOT EXISTS `post_likes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_post_likes` (`post_id`,`user_id`),
  KEY `idx_post_likes_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`, `created_at`) VALUES
(1, 1, 2, '2026-05-13 23:58:50'),
(2, 1, 3, '2026-05-13 23:58:50'),
(3, 1, 4, '2026-05-13 23:58:50'),
(4, 1, 5, '2026-05-13 23:58:50'),
(5, 1, 6, '2026-05-13 23:58:50'),
(6, 2, 1, '2026-05-13 23:58:50'),
(7, 2, 4, '2026-05-13 23:58:50'),
(8, 2, 6, '2026-05-13 23:58:50'),
(9, 3, 1, '2026-05-13 23:58:50'),
(10, 3, 3, '2026-05-13 23:58:50'),
(11, 3, 5, '2026-05-13 23:58:50'),
(12, 4, 1, '2026-05-13 23:58:50'),
(13, 4, 2, '2026-05-13 23:58:50'),
(14, 4, 6, '2026-05-13 23:58:50'),
(15, 5, 1, '2026-05-13 23:58:50'),
(16, 5, 3, '2026-05-13 23:58:50'),
(17, 5, 4, '2026-05-13 23:58:50'),
(18, 7, 1, '2026-05-13 23:58:50'),
(19, 7, 2, '2026-05-13 23:58:50'),
(20, 7, 6, '2026-05-13 23:58:50'),
(21, 8, 2, '2026-05-13 23:58:50'),
(22, 8, 3, '2026-05-13 23:58:50'),
(23, 8, 5, '2026-05-13 23:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `post_media`
--

DROP TABLE IF EXISTS `post_media`;
CREATE TABLE IF NOT EXISTS `post_media` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_post_media_post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `reporter_id` int UNSIGNED NOT NULL,
  `target_type` enum('post','comment','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int UNSIGNED NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('open','handled','dismissed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `handled_by` int UNSIGNED DEFAULT NULL,
  `handled_at` datetime DEFAULT NULL,
  `action_taken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_reports_status_created` (`status`,`created_at`),
  KEY `idx_reports_reporter` (`reporter_id`),
  KEY `idx_reports_target` (`target_type`,`target_id`),
  KEY `idx_reports_handled_by` (`handled_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('owner','admin','moderator','member') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `skills` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_tiktok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_x` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_portfolio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_premium` tinyint(1) NOT NULL DEFAULT '0',
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_users_username` (`username`),
  UNIQUE KEY `uniq_users_email` (`email`),
  KEY `idx_users_role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `full_name`, `role`, `avatar`, `bio`, `skills`, `country`, `timezone`, `link_tiktok`, `link_instagram`, `link_x`, `link_portfolio`, `is_premium`, `last_login_at`, `last_login_ip`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@demo.test', '$2y$10$NUcCq5NsQtPWUsq10mSUa.xN5sQv2C8u475tNkC7uBVDD2//M3vau', 'Demo admin', 'owner', NULL, 'Owner demo account for testing moderation and admin features.', 'PHP, MySQL, Admin Systems', 'Demo Country', 'Europe/Skopje', NULL, NULL, NULL, NULL, 1, '2026-05-14 02:14:42', NULL, '2026-05-13 23:58:50', '2026-05-14 00:18:09'),
(2, 'demo', 'demo@demo.test', '$2y$10$NUcCq5NsQtPWUsq10mSUa.xN5sQv2C8u475tNkC7uBVDD2//M3vau', 'Demo demo', 'member', NULL, 'Demo user account for testing the social feed.', 'HTML, CSS, JavaScript', 'Demo Country', 'Europe/Skopje', NULL, NULL, NULL, NULL, 0, NULL, NULL, '2026-05-13 23:58:50', '2026-05-14 00:18:09'),
(3, 'alexdev', 'alexdev@demo.test', '$2y$10$NUcCq5NsQtPWUsq10mSUa.xN5sQv2C8u475tNkC7uBVDD2//M3vau', 'Demo alexdev', 'member', NULL, 'Frontend developer sharing UI experiments and small web apps.', 'Frontend, UI, React', 'Germany', 'Europe/Berlin', NULL, NULL, NULL, NULL, 0, NULL, NULL, '2026-05-13 23:58:50', '2026-05-14 00:18:09'),
(4, 'sarahdesign', 'sarahdesign@demo.test', '$2y$10$NUcCq5NsQtPWUsq10mSUa.xN5sQv2C8u475tNkC7uBVDD2//M3vau', 'Demo sarahdesign', 'member', NULL, 'Designer focused on clean interfaces and brand systems.', 'UI/UX, Branding, Figma', 'Switzerland', 'Europe/Zurich', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2026-05-13 23:58:50', '2026-05-14 00:18:09'),
(5, 'markbuilder', 'markbuilder@demo.test', '$2y$10$NUcCq5NsQtPWUsq10mSUa.xN5sQv2C8u475tNkC7uBVDD2//M3vau', 'Demo markbuilder', 'moderator', NULL, 'Moderator and full-stack builder helping with feedback.', 'PHP, MySQL, SaaS', 'Austria', 'Europe/Vienna', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2026-05-13 23:58:50', '2026-05-14 00:18:09'),
(6, 'elenaweb', 'elenaweb@demo.test', '$2y$10$NUcCq5NsQtPWUsq10mSUa.xN5sQv2C8u475tNkC7uBVDD2//M3vau', 'Demo elenaweb', 'member', NULL, 'Freelancer building websites for small businesses.', 'Freelance, SEO, Websites', 'North Macedonia', 'Europe/Skopje', NULL, NULL, NULL, NULL, 0, NULL, NULL, '2026-05-13 23:58:50', '2026-05-14 00:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_bans`
--

DROP TABLE IF EXISTS `user_bans`;
CREATE TABLE IF NOT EXISTS `user_bans` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime DEFAULT NULL,
  `banned_by` int UNSIGNED DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_user_bans_user_active` (`user_id`,`active`),
  KEY `idx_user_bans_banned_by` (`banned_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `fk_audit_log_actor` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `fk_conversations_user1` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_conversations_user2` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `fk_follows_follower` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_follows_following` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gigs`
--
ALTER TABLE `gigs`
  ADD CONSTRAINT `fk_gigs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `fk_groups_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `fk_group_members_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_group_members_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_conversation` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_messages_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_from_user` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_notifications_to_user` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_posts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `fk_post_likes_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_post_likes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_media`
--
ALTER TABLE `post_media`
  ADD CONSTRAINT `fk_post_media_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_handled_by` FOREIGN KEY (`handled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_reports_reporter` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_bans`
--
ALTER TABLE `user_bans`
  ADD CONSTRAINT `fk_user_bans_admin` FOREIGN KEY (`banned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_user_bans_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
