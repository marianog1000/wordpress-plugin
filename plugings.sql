-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-09-2018 a las 23:03:37
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `plugings`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_commentmeta`
--

DROP TABLE IF EXISTS `pl_commentmeta`;
CREATE TABLE IF NOT EXISTS `pl_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_comments`
--

DROP TABLE IF EXISTS `pl_comments`;
CREATE TABLE IF NOT EXISTS `pl_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `pl_comments`
--

INSERT INTO `pl_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un comentarista de WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-08-31 19:00:41', '2018-08-31 22:00:41', 'Hola, esto es un comentario.\nPara empezar a moderar, editar y borrar comentarios, por favor, visitá la pantalla de comentarios en el escritorio.\nLos avatares de los comentaristas provienen de <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_links`
--

DROP TABLE IF EXISTS `pl_links`;
CREATE TABLE IF NOT EXISTS `pl_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_options`
--

DROP TABLE IF EXISTS `pl_options`;
CREATE TABLE IF NOT EXISTS `pl_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `pl_options`
--

INSERT INTO `pl_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/curso.pluging1', 'yes'),
(2, 'home', 'http://localhost/curso.pluging1', 'yes'),
(3, 'blogname', 'Plugings', 'yes'),
(4, 'blogdescription', 'Otro sitio realizado con WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'marianogauna1@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'j F, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:129:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:11:\"examenes/?$\";s:28:\"index.php?post_type=examenes\";s:41:\"examenes/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=examenes&feed=$matches[1]\";s:36:\"examenes/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=examenes&feed=$matches[1]\";s:28:\"examenes/page/([0-9]{1,})/?$\";s:46:\"index.php?post_type=examenes&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:34:\"quizes/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"quizes/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"quizes/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"quizes/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"quizes/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"quizes/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"quizes/([^/]+)/embed/?$\";s:39:\"index.php?quizes=$matches[1]&embed=true\";s:27:\"quizes/([^/]+)/trackback/?$\";s:33:\"index.php?quizes=$matches[1]&tb=1\";s:35:\"quizes/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?quizes=$matches[1]&paged=$matches[2]\";s:42:\"quizes/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?quizes=$matches[1]&cpage=$matches[2]\";s:31:\"quizes/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?quizes=$matches[1]&page=$matches[2]\";s:23:\"quizes/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"quizes/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"quizes/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"quizes/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"quizes/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"quizes/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:36:\"examenes/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"examenes/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"examenes/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"examenes/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"examenes/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"examenes/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"examenes/([^/]+)/embed/?$\";s:41:\"index.php?examenes=$matches[1]&embed=true\";s:29:\"examenes/([^/]+)/trackback/?$\";s:35:\"index.php?examenes=$matches[1]&tb=1\";s:49:\"examenes/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?examenes=$matches[1]&feed=$matches[2]\";s:44:\"examenes/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?examenes=$matches[1]&feed=$matches[2]\";s:37:\"examenes/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?examenes=$matches[1]&paged=$matches[2]\";s:44:\"examenes/([^/]+)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?examenes=$matches[1]&cpage=$matches[2]\";s:33:\"examenes/([^/]+)(?:/([0-9]+))?/?$\";s:47:\"index.php?examenes=$matches[1]&page=$matches[2]\";s:25:\"examenes/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"examenes/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"examenes/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"examenes/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"examenes/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"examenes/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:21:\"quizbook/quizbook.php\";i:1;s:35:\"quizbook_examen/quizbook_examen.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '-3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentyseventeen', 'yes'),
(41, 'stylesheet', 'twentyseventeen', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'pl_user_roles', 'a:6:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:83:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:21:\"read_published_quizes\";b:1;s:17:\"edit_other_quizes\";b:1;s:11:\"edit_quizes\";b:1;s:14:\"publish_quizes\";b:1;s:21:\"edit_published_quizes\";b:1;s:18:\"edit_others_quizes\";b:1;s:20:\"delete_others_quizes\";b:1;s:19:\"read_private_quizes\";b:1;s:19:\"edit_private_quizes\";b:1;s:13:\"delete_quizes\";b:1;s:23:\"delete_published_quizes\";b:1;s:21:\"delete_private_quizes\";b:1;s:4:\"read\";b:1;s:13:\"edit_examenes\";b:1;s:16:\"publish_examenes\";b:1;s:23:\"edit_published_examenes\";b:1;s:20:\"edit_others_examenes\";b:1;s:21:\"read_private_examenes\";b:1;s:21:\"edit_private_examenes\";b:1;s:15:\"delete_examenes\";b:1;s:25:\"delete_published_examenes\";b:1;s:23:\"delete_private_examenes\";b:1;s:22:\"delete_others_examenes\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:56:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:21:\"read_published_quizes\";b:1;s:17:\"edit_other_quizes\";b:1;s:11:\"edit_quizes\";b:1;s:14:\"publish_quizes\";b:1;s:21:\"edit_published_quizes\";b:1;s:18:\"edit_others_quizes\";b:1;s:20:\"delete_others_quizes\";b:1;s:19:\"read_private_quizes\";b:1;s:19:\"edit_private_quizes\";b:1;s:13:\"delete_quizes\";b:1;s:23:\"delete_published_quizes\";b:1;s:21:\"delete_private_quizes\";b:1;s:4:\"read\";b:1;s:13:\"edit_examenes\";b:1;s:16:\"publish_examenes\";b:1;s:23:\"edit_published_examenes\";b:1;s:20:\"edit_others_examenes\";b:1;s:21:\"read_private_examenes\";b:1;s:21:\"edit_private_examenes\";b:1;s:15:\"delete_examenes\";b:1;s:25:\"delete_published_examenes\";b:1;s:23:\"delete_private_examenes\";b:1;s:22:\"delete_others_examenes\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"quizbook\";a:2:{s:4:\"name\";s:4:\"Quiz\";s:12:\"capabilities\";a:10:{s:4:\"read\";b:1;s:11:\"edit_quizes\";b:1;s:14:\"publish_quizes\";b:1;s:21:\"edit_published_quizes\";b:1;s:18:\"edit_others_quizes\";b:1;s:20:\"delete_others_quizes\";b:1;s:13:\"edit_examenes\";b:1;s:16:\"publish_examenes\";b:1;s:23:\"edit_published_examenes\";b:1;s:20:\"edit_others_examenes\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'es_AR', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'cron', 'a:5:{i:1536811242;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1536832842;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1536876061;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1536883146;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(113, 'theme_mods_twentyseventeen', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(117, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/es_AR/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"es_AR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/es_AR/wordpress-4.9.8.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1536793823;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}', 'no'),
(119, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1536793826;s:7:\"checked\";a:2:{s:21:\"quizbook/quizbook.php\";s:3:\"1.0\";s:35:\"quizbook_examen/quizbook_examen.php\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}', 'no'),
(314, '_site_transient_timeout_theme_roots', '1536798943', 'no'),
(315, '_site_transient_theme_roots', 'a:3:{s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(122, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1536793826;s:7:\"checked\";a:3:{s:13:\"twentyfifteen\";s:3:\"2.0\";s:15:\"twentyseventeen\";s:3:\"1.7\";s:13:\"twentysixteen\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(132, 'can_compress_scripts', '1', 'no'),
(255, '_site_transient_timeout_browser_01fe6d96f512df15cc1b10345d6b37d9', '1537223412', 'no'),
(256, '_site_transient_browser_01fe6d96f512df15cc1b10345d6b37d9', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"68.0.3440.106\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(307, '_site_transient_timeout_community-events-d41d8cd98f00b204e9800998ecf8427e', '1536839899', 'no'),
(308, '_site_transient_community-events-d41d8cd98f00b204e9800998ecf8427e', 'a:2:{s:8:\"location\";a:1:{s:2:\"ip\";b:0;}s:6:\"events\";a:0:{}}', 'no'),
(142, 'recently_activated', 'a:0:{}', 'yes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_postmeta`
--

DROP TABLE IF EXISTS `pl_postmeta`;
CREATE TABLE IF NOT EXISTS `pl_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `pl_postmeta`
--

INSERT INTO `pl_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 13, '_edit_last', '1'),
(4, 13, '_edit_lock', '1536263517:1'),
(25, 13, 'qb_respuesta_b', 'css3'),
(24, 13, 'qb_respuesta_a', 'html5'),
(11, 15, 'qb_respuesta_a', 'R'),
(12, 15, 'qb_respuesta_b', 'word'),
(13, 15, 'qb_respuesta_c', 'c++'),
(14, 15, 'qb_respuesta_d', 'pascal'),
(15, 15, 'qb_respuesta_e', 'cobol'),
(23, 13, '_wp_old_date', '2018-08-31'),
(17, 15, '_edit_last', '1'),
(18, 15, '_edit_lock', '1536269066:1'),
(22, 15, 'quizbook_correcta', 'qb_correcta:c'),
(26, 13, 'qb_respuesta_c', 'php'),
(27, 13, 'qb_respuesta_d', 'python'),
(28, 13, 'qb_respuesta_e', 'excel'),
(29, 13, 'quizbook_correcta', 'qb_correcta:e'),
(30, 16, '_edit_lock', '1536263135:1'),
(31, 16, '_edit_last', '1'),
(32, 19, '_edit_lock', '1536263506:1'),
(33, 19, '_edit_last', '1'),
(34, 19, 'qb_respuesta_a', 'isset'),
(35, 19, 'qb_respuesta_b', 'get_post_meta'),
(36, 19, 'qb_respuesta_c', 'foreach'),
(37, 19, 'qb_respuesta_d', 'add_shortcode'),
(38, 19, 'qb_respuesta_e', 'explode'),
(39, 19, 'quizbook_correcta', 'qb_correcta:b'),
(40, 21, '_edit_lock', '1536263493:1'),
(41, 21, '_edit_last', '1'),
(42, 21, 'qb_respuesta_a', 'explode'),
(43, 21, 'qb_respuesta_b', 'get_post_meta'),
(44, 21, 'qb_respuesta_c', 'get_the_id'),
(45, 21, 'qb_respuesta_d', 'wp_query'),
(46, 21, 'qb_respuesta_e', 'add_meta_box'),
(47, 21, 'quizbook_correcta', 'qb_correcta:b'),
(48, 22, '_edit_lock', '1536263481:1'),
(49, 22, '_edit_last', '1'),
(50, 22, 'qb_respuesta_a', 'add_shortcode'),
(51, 22, 'qb_respuesta_b', 'WP_Query'),
(52, 22, 'qb_respuesta_c', 'foreach'),
(53, 22, 'qb_respuesta_d', 'quizbook_filtrar_preguntas'),
(54, 22, 'qb_respuesta_e', 'wp_reset_postdata'),
(55, 22, 'quizbook_correcta', 'qb_correcta:a'),
(56, 29, '_edit_lock', '1536356153:1'),
(57, 30, '_edit_lock', '1536356180:1'),
(58, 31, '_edit_lock', '1536356239:1'),
(59, 32, '_edit_lock', '1536356302:1'),
(60, 33, '_edit_lock', '1536356673:1'),
(61, 34, '_edit_lock', '1536356691:1'),
(62, 35, '_edit_lock', '1536356717:1'),
(63, 36, '_edit_lock', '1536357806:1'),
(64, 37, '_edit_lock', '1536357832:1'),
(65, 38, '_edit_lock', '1536357904:1'),
(66, 39, '_edit_lock', '1536358484:1'),
(67, 40, '_edit_lock', '1536358764:1'),
(68, 41, '_edit_lock', '1536358834:1'),
(69, 42, '_edit_lock', '1536358850:1'),
(70, 43, '_edit_lock', '1536358898:1'),
(71, 44, '_edit_lock', '1536359036:1'),
(72, 46, '_edit_lock', '1536359284:1'),
(73, 47, '_edit_lock', '1536414448:1'),
(74, 49, '_edit_last', '1'),
(89, 52, '_edit_last', '1'),
(76, 49, '_edit_lock', '1536619171:1'),
(77, 50, '_edit_last', '1'),
(78, 50, '_edit_lock', '1536619296:1'),
(79, 50, '_wp_trash_meta_status', 'publish'),
(80, 50, '_wp_trash_meta_time', '1536619452'),
(81, 50, '_wp_desired_post_slug', 'borrador-automatico-2'),
(82, 49, '_wp_trash_meta_status', 'publish'),
(83, 49, '_wp_trash_meta_time', '1536619452'),
(84, 49, '_wp_desired_post_slug', 'borrador-automatico'),
(85, 51, '_edit_last', '1'),
(166, 80, '_edit_lock', '1536798175:1'),
(87, 51, '_edit_lock', '1536619462:1'),
(165, 77, '_edit_last', '1'),
(91, 52, '_edit_lock', '1536619606:1'),
(92, 53, '_edit_last', '1'),
(93, 53, '_edit_lock', '1536704073:1'),
(94, 54, '_edit_last', '1'),
(95, 54, '_edit_lock', '1536704095:1'),
(96, 54, '_wp_trash_meta_status', 'publish'),
(97, 54, '_wp_trash_meta_time', '1536704254'),
(98, 54, '_wp_desired_post_slug', 'borrador-automatico-4'),
(99, 53, '_wp_trash_meta_status', 'publish'),
(100, 53, '_wp_trash_meta_time', '1536704254'),
(101, 53, '_wp_desired_post_slug', 'borrador-automatico-3'),
(102, 52, '_wp_trash_meta_status', 'publish'),
(103, 52, '_wp_trash_meta_time', '1536704254'),
(104, 52, '_wp_desired_post_slug', 'borrador-automatico-2'),
(105, 51, '_wp_trash_meta_status', 'publish'),
(106, 51, '_wp_trash_meta_time', '1536704254'),
(107, 51, '_wp_desired_post_slug', 'borrador-automatico'),
(108, 55, '_edit_lock', '1536704170:1'),
(109, 55, '_edit_last', '1'),
(110, 55, '_wp_trash_meta_status', 'publish'),
(111, 55, '_wp_trash_meta_time', '1536704324'),
(112, 55, '_wp_desired_post_slug', 'borrador-automatico'),
(113, 56, '_edit_lock', '1536704819:1'),
(114, 57, '_edit_lock', '1536707686:1'),
(115, 57, '_edit_last', '1'),
(116, 58, '_edit_lock', '1536706111:1'),
(117, 59, '_edit_lock', '1536706157:1'),
(118, 61, '_edit_lock', '1536706184:1'),
(119, 62, '_edit_lock', '1536706212:1'),
(120, 63, '_edit_lock', '1536706234:1'),
(121, 64, '_edit_lock', '1536706275:1'),
(122, 64, '_edit_last', '1'),
(123, 65, '_edit_lock', '1536707584:1'),
(124, 65, '_edit_last', '1'),
(125, 66, '_edit_lock', '1536707921:1'),
(126, 66, '_edit_last', '1'),
(127, 67, '_edit_lock', '1536708191:1'),
(128, 67, '_edit_last', '1'),
(129, 68, '_edit_lock', '1536708295:1'),
(130, 70, '_edit_last', '1'),
(131, 70, '_edit_lock', '1536708588:1'),
(132, 71, '_edit_last', '1'),
(133, 71, '_edit_lock', '1536709484:1'),
(134, 72, '_edit_lock', '1536709517:1'),
(135, 72, '_edit_last', '1'),
(136, 72, '_wp_trash_meta_status', 'publish'),
(137, 72, '_wp_trash_meta_time', '1536709705'),
(138, 72, '_wp_desired_post_slug', 'dsfdasf'),
(139, 71, '_wp_trash_meta_status', 'publish'),
(140, 71, '_wp_trash_meta_time', '1536709705'),
(141, 71, '_wp_desired_post_slug', 'kkj'),
(142, 70, '_wp_trash_meta_status', 'publish'),
(143, 70, '_wp_trash_meta_time', '1536709705'),
(144, 70, '_wp_desired_post_slug', 'aa'),
(145, 67, '_wp_trash_meta_status', 'publish'),
(146, 67, '_wp_trash_meta_time', '1536709705'),
(147, 67, '_wp_desired_post_slug', 'sdaf'),
(148, 66, '_wp_trash_meta_status', 'draft'),
(149, 66, '_wp_trash_meta_time', '1536709705'),
(150, 66, '_wp_desired_post_slug', ''),
(151, 65, '_wp_trash_meta_status', 'publish'),
(152, 65, '_wp_trash_meta_time', '1536709705'),
(153, 65, '_wp_desired_post_slug', 'dd'),
(154, 64, '_wp_trash_meta_status', 'publish'),
(155, 64, '_wp_trash_meta_time', '1536709705'),
(156, 64, '_wp_desired_post_slug', '64'),
(157, 57, '_wp_trash_meta_status', 'publish'),
(158, 57, '_wp_trash_meta_time', '1536709705'),
(159, 57, '_wp_desired_post_slug', 'examen-1'),
(160, 74, '_edit_lock', '1536798053:1'),
(161, 74, '_edit_last', '1'),
(164, 77, '_edit_lock', '1536807812:1'),
(163, 74, 'quizbook_examen', 's:58:\"a:4:{i:0;s:2:\"22\";i:1;s:2:\"21\";i:2;s:2:\"19\";i:3;s:2:\"15\";}\";');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_posts`
--

DROP TABLE IF EXISTS `pl_posts`;
CREATE TABLE IF NOT EXISTS `pl_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `pl_posts`
--

INSERT INTO `pl_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-08-31 19:00:41', '2018-08-31 22:00:41', 'Bienvenido a WordPress. Esta es tu primera entrada. Editala o borrala, ¡y comenzá a escribir!', '¡Hola mundo!', '', 'publish', 'open', 'open', '', 'hola-mundo', '', '', '2018-08-31 19:00:41', '2018-08-31 22:00:41', '', 0, 'http://localhost/curso.pluging1/?p=1', 0, 'post', '', 1),
(2, 1, '2018-08-31 19:00:41', '2018-08-31 22:00:41', 'Esta es una página de ejemplo, Es diferente a una entrada de un blog porque se mantiene estática y se mostrará en la barra de navegación (en la mayoría de temas). Casi todo el mundo comienza con una página Sobre mí para presentarse a los potenciales visitantes. Podría ser algo así:\n\n<blockquote>¡Hola!: Soy mensajero por el día, aspirante a actor por la noche y esta es mi web. Vivo en Buenos Aires, tengo un gato llamado Piquico y me encantan tomar mate (amargo)</blockquote>\n\n… o algo así:\n\n<blockquote>La empresa Medias XYZ se fundó en 1971, y ha estado produciendo medias de calidad para sus clientes desde entonces. Ubicada en Gothan, la empresa XYZ tiene más de 2.000 empleados e intenta ayudar en lo que puede para mejorar la vida en Gothan</blockquote>\n\nSi sos nuevo en WordPress deberías ir a <a href=\"http://localhost/curso.pluging1/wp-admin/\">tu escritorio</a> para borrar esta página y crear algunas nuevas con tu contenido. ¡Divertite!', 'Página de ejemplo', '', 'publish', 'closed', 'open', '', 'pagina-ejemplo', '', '', '2018-08-31 19:00:41', '2018-08-31 22:00:41', '', 0, 'http://localhost/curso.pluging1/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-08-31 19:00:41', '2018-08-31 22:00:41', '<h2>Quiénes somos</h2><p>La dirección de nuestra web es: http://localhost/curso.pluging1.</p><h2>Qué datos personales recogemos y por qué</h2><h3>Comentarios</h3><p>Cuando los visitantes dejan comentarios en la web, recopilamos los datos que se muestran en el formulario de comentarios, así como la dirección IP del visitante y la cadena de agentes de usuario del navegador, para ayudar a la detección de spam.</p><p>Una cadena anónima creada a partir de tu dirección de correo electrónico (también llamada hash) puede ser proporcionada al servicio de Gravatar para ver si la estás usando. La política de privacidad del servicio Gravatar está disponible en https://automattic.com/privacy/. Después de la aprobación de tu comentario, la imagen de tu perfil será visible para el público en el contexto de su comentario.</p><h3>Multimedia</h3><p>Si subís imágenes a la web deberías evitar subir imágenes con datos de ubicación (GPS EXIF) incluidos. Los visitantes de la web pueden descargar y extraer cualquier dato de localización de las imágenes de la web.</p><h3>Formularios de contacto</h3><h3>Cookies</h3><p>Si dejás un comentario en nuestro sitio, podés optar por guardar tu nombre, dirección de correo electrónico y sitio web en las cookies. Estos son para tu conveniencia para que no tengas que volver a ingresar tus datos cuando dejés otro comentario. Estas cookies durarán un año.</p><p>Si tenés una cuenta e iniciás sesión en este sitio, configuraremos una cookie temporal para determinar si tu navegador acepta cookies. Esta cookie no contiene datos personales y se descarta al cerrar el navegador.</p><p>Cuando iniciás sesión, también configuraremos varias cookies para guardar tu información de inicio de sesión y tus opciones de visualización en pantalla. Las cookies de inicio de sesión duran dos días y las cookies de opciones de pantalla duran un año. Si seleccionás &quot;Recordarme&quot;, tu inicio de sesión se mantendrá durante dos semanas. Si cerrás la sesión, se eliminarán las cookies de inicio de sesión.</p><p>Si editás o publicás un artículo, se guardará una cookie adicional en tu navegador. Esta cookie no incluye datos personales y simplemente indica el ID de publicación del artículo que acabás de editar. Caduca después de 1 día.</p><h3>Contenido embebido desde otros sitios web</h3><p>Los artículos en este sitio pueden incluir contenido incrustado (por ejemplo, videos, imágenes, artículos, etc.). El contenido incrustado de otros sitios web se comporta de la misma manera que si el visitante hubiera visitado el otro sitio web.</p><p>Estos sitios web pueden recopilar tus datos, utilizar cookies, incrustar un sistema de seguimiento de terceros y supervisar su interacción con ese contenido incrustado, incluyendo el rastreo de tu interacción con el contenido incrustado si tenés una cuenta y estás conectado a ese sitio web.</p><h3>Estadísticas</h3><h2>Con quién compartimos datos</h2><h2>Cuánto tiempo guardamos tus datos</h2><p>Si dejás un comentario, el comentario y sus metadatos se conservan indefinidamente. Esto es para que podamos reconocer y aprobar cualquier comentario de seguimiento de forma automática en lugar de mantenerlos en una cola de moderación.</p><p>Para los usuarios que se registran en nuestro sitio web (si corresponde), también almacenamos la información personal que proporcionan en su perfil de usuario. Todos los usuarios pueden ver, editar o eliminar su información personal en cualquier momento (excepto que no pueden cambiar su nombre de usuario). Los administradores del sitio web también pueden ver y editar esa información.</p><h2>Qué derechos tenés sobre tus datos</h2><p>Si tenés una cuenta en este sitio o has dejado comentarios, podés solicitar un archivo exportado de los datos personales tuyos que tenemos, incluidos los datos que nos hayas proporcionado. También podés solicitar que borremos cualquier dato personal tuyo que tengamos. Esto no incluye datos que estamos obligados a mantener para fines administrativos, legales o de seguridad.</p><h2>Adónde enviamos tus datos</h2><p>Los comentarios de los visitantes se pueden verificar a través de un servicio automático de detección de spam.</p><h2>Tu información de contacto</h2><h2>Información adicional</h2><h3>Cómo protegemos tus datos</h3><h3>¿Qué procedimientos de violación de datos tenemos en marcha?</h3><h3>De quiénes (terceros) recibimos datos</h3><h3>Qué toma de decisiones y/o perfiles automatizados se realizan con los datos del usuario</h3><h3>Requisitos de divulgación regulatoria de la industria</h3>', 'Política de privacidad', '', 'draft', 'closed', 'open', '', 'politica-privacidad', '', '', '2018-08-31 19:00:41', '2018-08-31 22:00:41', '', 0, 'http://localhost/curso.pluging1/?page_id=3', 0, 'page', '', 0),
(55, 1, '2018-09-11 19:18:15', '2018-09-11 22:18:15', '', 'Borrador automático', '', 'trash', 'closed', 'closed', '', 'borrador-automatico__trashed-3', '', '', '2018-09-11 19:18:44', '2018-09-11 22:18:44', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=55', 0, 'examenes', '', 0),
(54, 1, '2018-09-11 19:17:05', '2018-09-11 22:17:05', '', 'Borrador automático', '', 'trash', 'closed', 'closed', '', 'borrador-automatico-4__trashed', '', '', '2018-09-11 19:17:34', '2018-09-11 22:17:34', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=54', 0, 'examenes', '', 0),
(53, 1, '2018-09-10 19:49:19', '2018-09-10 22:49:19', '', 'Borrador automático', '', 'trash', 'closed', 'closed', '', 'borrador-automatico-3__trashed', '', '', '2018-09-11 19:17:34', '2018-09-11 22:17:34', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=53', 0, 'examenes', '', 0),
(52, 1, '2018-09-10 19:46:53', '2018-09-10 22:46:53', '', 'Borrador automático', '', 'trash', 'closed', 'closed', '', 'borrador-automatico-2__trashed-2', '', '', '2018-09-11 19:17:34', '2018-09-11 22:17:34', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=52', 0, 'examenes', '', 0),
(51, 1, '2018-09-10 19:44:26', '2018-09-10 22:44:26', '', 'Borrador automático', '', 'trash', 'closed', 'closed', '', 'borrador-automatico__trashed-2', '', '', '2018-09-11 19:17:34', '2018-09-11 22:17:34', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=51', 0, 'examenes', '', 0),
(50, 1, '2018-09-10 19:42:06', '2018-09-10 22:42:06', '', 'Borrador automático', '', 'trash', 'closed', 'closed', '', 'borrador-automatico-2__trashed', '', '', '2018-09-10 19:44:12', '2018-09-10 22:44:12', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=50', 0, 'examenes', '', 0),
(49, 1, '2018-09-10 19:31:37', '2018-09-10 22:31:37', '', 'Borrador automático', '', 'trash', 'closed', 'closed', '', 'borrador-automatico__trashed', '', '', '2018-09-10 19:44:12', '2018-09-10 22:44:12', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=49', 0, 'examenes', '', 0),
(13, 1, '2018-09-03 15:41:57', '2018-09-03 18:41:57', 'Wordpress utiliza distintos lenguajes. ¿Cuál es el utilizado para el Backend?', '¿Lenguaje Backend utilizado en wordpress?', '', 'publish', 'closed', 'closed', '', 'lenguaje-backend-utilizado-en-wordpress', '', '', '2018-09-03 15:41:57', '2018-09-03 18:41:57', '', 0, 'http://localhost/curso.pluging1/?post_type=quizes&#038;p=13', 0, 'quizes', '', 0),
(48, 1, '2018-09-10 19:30:13', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-09-10 19:30:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?p=48', 0, 'post', '', 0),
(15, 1, '2018-09-03 15:12:39', '2018-09-03 18:12:39', 'Cuál es el lenguaje que quieres aprender?', 'Otro Ejemplo de Preguntas', '', 'publish', 'closed', 'closed', '', '15', '', '', '2018-09-05 13:35:13', '2018-09-05 16:35:13', '', 0, 'http://localhost/curso.pluging1/?post_type=quizes&#038;p=15', 0, 'quizes', '', 0),
(16, 1, '2018-09-05 12:40:36', '2018-09-05 15:40:36', '[quizbook preguntas=\"3\" orden=\"rand\"]', 'Examen', '', 'publish', 'closed', 'closed', '', 'examen', '', '', '2018-09-06 16:06:45', '2018-09-06 19:06:45', '', 0, 'http://localhost/curso.pluging1/?page_id=16', 0, 'page', '', 0),
(17, 1, '2018-09-05 12:40:36', '2018-09-05 15:40:36', '[quizbook]', 'Examen', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2018-09-05 12:40:36', '2018-09-05 15:40:36', '', 16, 'http://localhost/curso.pluging1/2018/09/05/16-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2018-09-05 13:34:48', '2018-09-05 16:34:48', 'Cuál es el lenguaje que quieres aprender?', 'Otro Ejemplo de Preguntas', '', 'inherit', 'closed', 'closed', '', '15-autosave-v1', '', '', '2018-09-05 13:34:48', '2018-09-05 16:34:48', '', 15, 'http://localhost/curso.pluging1/2018/09/05/15-autosave-v1/', 0, 'revision', '', 0),
(19, 1, '2018-09-05 14:28:32', '2018-09-05 17:28:32', 'Si tienes un arreglo que función utilizarías para imprimir sus valores individualmente?', 'Función de php que recorre un arrego', '', 'publish', 'closed', 'closed', '', 'funcion-de-php-que-recorre-un-arrego', '', '', '2018-09-05 14:29:41', '2018-09-05 17:29:41', '', 0, 'http://localhost/curso.pluging1/?post_type=quizes&#038;p=19', 0, 'quizes', '', 0),
(20, 1, '2018-09-05 14:29:34', '2018-09-05 17:29:34', 'Si tienes un arreglo que función utilizarías para imprimir sus valores indivi', 'Función de php que recorre un arrego', '', 'inherit', 'closed', 'closed', '', '19-autosave-v1', '', '', '2018-09-05 14:29:34', '2018-09-05 17:29:34', '', 19, 'http://localhost/curso.pluging1/2018/09/05/19-autosave-v1/', 0, 'revision', '', 0),
(21, 1, '2018-09-05 14:31:26', '2018-09-05 17:31:26', '', 'función para obtener los campos personalizados en wordpress', '', 'publish', 'closed', 'closed', '', 'funcion-para-obtener-los-campos-personalizados-en-wordpress', '', '', '2018-09-05 14:31:26', '2018-09-05 17:31:26', '', 0, 'http://localhost/curso.pluging1/?post_type=quizes&#038;p=21', 0, 'quizes', '', 0),
(22, 1, '2018-09-05 14:32:44', '2018-09-05 17:32:44', '', 'Función para crear shortcode en wordpress', '', 'publish', 'closed', 'closed', '', 'funcion-para-crear-shortcode-en-wordpress', '', '', '2018-09-05 14:33:32', '2018-09-05 17:33:32', '', 0, 'http://localhost/curso.pluging1/?post_type=quizes&#038;p=22', 0, 'quizes', '', 0),
(23, 1, '2018-09-05 14:40:05', '2018-09-05 17:40:05', '[quizbook preguntas=\"3\" orden=\"ran\"]', 'Examen', '', 'inherit', 'closed', 'closed', '', '16-autosave-v1', '', '', '2018-09-05 14:40:05', '2018-09-05 17:40:05', '', 16, 'http://localhost/curso.pluging1/2018/09/05/16-autosave-v1/', 0, 'revision', '', 0),
(24, 1, '2018-09-05 14:38:00', '2018-09-05 17:38:00', '[quizbook preguntas=\"3\" orden=\"rand\"]', 'Examen', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2018-09-05 14:38:00', '2018-09-05 17:38:00', '', 16, 'http://localhost/curso.pluging1/2018/09/05/16-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2018-09-05 14:40:11', '2018-09-05 17:40:11', '[quizbook preguntas=\"3\" orden=\"ran\"]', 'Examen', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2018-09-05 14:40:11', '2018-09-05 17:40:11', '', 16, 'http://localhost/curso.pluging1/2018/09/05/16-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2018-09-05 14:41:29', '2018-09-05 17:41:29', '[quizbook preguntas=\"3\" orden=\"rand\"]', 'Examen', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2018-09-05 14:41:29', '2018-09-05 17:41:29', '', 16, 'http://localhost/curso.pluging1/2018/09/05/16-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2018-09-05 14:44:53', '2018-09-05 17:44:53', '[quizbook preguntas=\"2\" orden=\"rand\"]', 'Examen', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2018-09-05 14:44:53', '2018-09-05 17:44:53', '', 16, 'http://localhost/curso.pluging1/2018/09/05/16-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2018-09-06 16:06:45', '2018-09-06 19:06:45', '[quizbook preguntas=\"3\" orden=\"rand\"]', 'Examen', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2018-09-06 16:06:45', '2018-09-06 19:06:45', '', 16, 'http://localhost/curso.pluging1/2018/09/06/16-revision-v1/', 0, 'revision', '', 0),
(29, 1, '2018-09-07 18:35:35', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 18:35:35', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=29', 0, 'examenes', '', 0),
(30, 1, '2018-09-07 18:36:02', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 18:36:02', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=30', 0, 'examenes', '', 0),
(31, 1, '2018-09-07 18:36:35', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 18:36:35', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=31', 0, 'examenes', '', 0),
(32, 1, '2018-09-07 18:37:34', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 18:37:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examen&p=32', 0, 'examen', '', 0),
(33, 1, '2018-09-07 18:38:34', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 18:38:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=33', 0, 'examenes', '', 0),
(34, 1, '2018-09-07 18:44:34', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 18:44:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=34', 0, 'examenes', '', 0),
(35, 1, '2018-09-07 18:45:00', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 18:45:00', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=35', 0, 'examenes', '', 0),
(36, 1, '2018-09-07 19:00:31', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:00:31', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=36', 0, 'examenes', '', 0),
(37, 1, '2018-09-07 19:03:34', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:03:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=37', 0, 'examenes', '', 0),
(38, 1, '2018-09-07 19:04:17', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:04:17', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=38', 0, 'examenes', '', 0),
(39, 1, '2018-09-07 19:05:04', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:05:04', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=39', 0, 'examenes', '', 0),
(40, 1, '2018-09-07 19:14:45', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:14:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=40', 0, 'examenes', '', 0),
(41, 1, '2018-09-07 19:19:24', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:19:24', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=41', 0, 'examenes', '', 0),
(42, 1, '2018-09-07 19:20:34', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:20:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=42', 0, 'examenes', '', 0),
(43, 1, '2018-09-07 19:20:58', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:20:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=43', 0, 'examenes', '', 0),
(44, 1, '2018-09-07 19:21:39', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:21:39', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=44', 0, 'examenes', '', 0),
(45, 1, '2018-09-07 19:24:05', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:24:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=45', 0, 'examenes', '', 0),
(46, 1, '2018-09-07 19:24:15', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:24:15', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=46', 0, 'examenes', '', 0),
(47, 1, '2018-09-07 19:29:54', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-07 19:29:54', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=47', 0, 'examenes', '', 0),
(56, 1, '2018-09-11 19:24:36', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 19:24:36', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=56', 0, 'examenes', '', 0),
(57, 1, '2018-09-11 19:27:18', '2018-09-11 22:27:18', '', 'examen 1', '', 'trash', 'closed', 'closed', '', 'examen-1__trashed', '', '', '2018-09-11 20:48:25', '2018-09-11 23:48:25', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=57', 0, 'examenes', '', 0),
(58, 1, '2018-09-11 19:47:40', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 19:47:40', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=58', 0, 'examenes', '', 0),
(59, 1, '2018-09-11 19:48:31', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 19:48:31', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=59', 0, 'examenes', '', 0),
(60, 1, '2018-09-11 19:49:20', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 19:49:20', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=60', 0, 'examenes', '', 0),
(61, 1, '2018-09-11 19:49:26', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 19:49:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=61', 0, 'examenes', '', 0),
(62, 1, '2018-09-11 19:49:54', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 19:49:54', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=62', 0, 'examenes', '', 0),
(63, 1, '2018-09-11 19:50:16', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 19:50:16', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=63', 0, 'examenes', '', 0),
(64, 1, '2018-09-11 19:52:59', '2018-09-11 22:52:59', '', '', '', 'trash', 'closed', 'closed', '', '64__trashed', '', '', '2018-09-11 20:48:25', '2018-09-11 23:48:25', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=64', 0, 'examenes', '', 0),
(65, 1, '2018-09-11 20:03:07', '2018-09-11 23:03:07', '', 'dd', '', 'trash', 'closed', 'closed', '', 'dd__trashed', '', '', '2018-09-11 20:48:25', '2018-09-11 23:48:25', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=65', 0, 'examenes', '', 0),
(66, 1, '2018-09-11 20:48:25', '2018-09-11 23:48:25', '', 'sdf', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2018-09-11 20:48:25', '2018-09-11 23:48:25', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=66', 0, 'examenes', '', 0),
(67, 1, '2018-09-11 20:19:16', '2018-09-11 23:19:16', '', 'sdaf', '', 'trash', 'closed', 'closed', '', 'sdaf__trashed', '', '', '2018-09-11 20:48:25', '2018-09-11 23:48:25', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=67', 0, 'examenes', '', 0),
(68, 1, '2018-09-11 20:19:32', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 20:19:32', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=68', 0, 'examenes', '', 0),
(69, 1, '2018-09-11 20:24:56', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 20:24:56', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=69', 0, 'examenes', '', 0),
(70, 1, '2018-09-11 20:25:45', '2018-09-11 23:25:45', '', 'aa', '', 'trash', 'closed', 'closed', '', 'aa__trashed', '', '', '2018-09-11 20:48:25', '2018-09-11 23:48:25', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=70', 0, 'examenes', '', 0),
(71, 1, '2018-09-11 20:32:26', '2018-09-11 23:32:26', '', 'kkj', '', 'trash', 'closed', 'closed', '', 'kkj__trashed', '', '', '2018-09-11 20:48:25', '2018-09-11 23:48:25', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=71', 0, 'examenes', '', 0),
(72, 1, '2018-09-11 20:47:33', '2018-09-11 23:47:33', '', 'dsfdasf', '', 'trash', 'closed', 'closed', '', 'dsfdasf__trashed', '', '', '2018-09-11 20:48:25', '2018-09-11 23:48:25', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=72', 0, 'examenes', '', 0),
(73, 1, '2018-09-11 20:47:59', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 20:47:59', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=quizes&p=73', 0, 'quizes', '', 0),
(74, 1, '2018-09-11 20:48:55', '2018-09-11 23:48:55', '', 'A', '', 'publish', 'closed', 'closed', '', 'a', '', '', '2018-09-12 20:39:48', '2018-09-12 23:39:48', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&#038;p=74', 0, 'examenes', '', 0),
(75, 1, '2018-09-12 20:12:06', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 20:12:06', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=75', 0, 'examenes', '', 0),
(76, 1, '2018-09-12 20:12:14', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 20:12:14', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=76', 0, 'examenes', '', 0),
(77, 1, '2018-09-12 20:57:56', '2018-09-12 23:57:56', '[quizbook_examen preguntas=\'\' orden=\'\' id=\'74\']', 'nuevo shortcode', '', 'publish', 'closed', 'closed', '', 'nuevo-shortcode', '', '', '2018-09-12 21:23:37', '2018-09-13 00:23:37', '', 0, 'http://localhost/curso.pluging1/?page_id=77', 0, 'page', '', 0),
(78, 1, '2018-09-12 20:57:56', '2018-09-12 23:57:56', '[quizbook_examen preguntas=\"\" orden=\"\" id=\"\"]', 'nuevo shortcode', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2018-09-12 20:57:56', '2018-09-12 23:57:56', '', 77, 'http://localhost/curso.pluging1/2018/09/12/77-revision-v1/', 0, 'revision', '', 0),
(79, 1, '2018-09-12 20:59:35', '2018-09-12 23:59:35', '[quizbook_examen preguntas=\"\" orden=\"\" id=\"74\"]', 'nuevo shortcode', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2018-09-12 20:59:35', '2018-09-12 23:59:35', '', 77, 'http://localhost/curso.pluging1/2018/09/12/77-revision-v1/', 0, 'revision', '', 0),
(80, 1, '2018-09-12 21:19:28', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 21:19:28', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=80', 0, 'examenes', '', 0),
(81, 1, '2018-09-12 21:22:56', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 21:22:56', '0000-00-00 00:00:00', '', 0, 'http://localhost/curso.pluging1/?post_type=examenes&p=81', 0, 'examenes', '', 0),
(82, 1, '2018-09-12 21:23:37', '2018-09-13 00:23:37', '[quizbook_examen preguntas=\'\' orden=\'\' id=\'74\']', 'nuevo shortcode', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2018-09-12 21:23:37', '2018-09-13 00:23:37', '', 77, 'http://localhost/curso.pluging1/2018/09/12/77-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_termmeta`
--

DROP TABLE IF EXISTS `pl_termmeta`;
CREATE TABLE IF NOT EXISTS `pl_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_terms`
--

DROP TABLE IF EXISTS `pl_terms`;
CREATE TABLE IF NOT EXISTS `pl_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `pl_terms`
--

INSERT INTO `pl_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sin categoría', 'sin-categoria', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_term_relationships`
--

DROP TABLE IF EXISTS `pl_term_relationships`;
CREATE TABLE IF NOT EXISTS `pl_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `pl_term_relationships`
--

INSERT INTO `pl_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_term_taxonomy`
--

DROP TABLE IF EXISTS `pl_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `pl_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `pl_term_taxonomy`
--

INSERT INTO `pl_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_usermeta`
--

DROP TABLE IF EXISTS `pl_usermeta`;
CREATE TABLE IF NOT EXISTS `pl_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `pl_usermeta`
--

INSERT INTO `pl_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'pl_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'pl_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '0'),
(35, 1, 'session_tokens', 'a:1:{s:64:\"60fcc0d8775206729cc92efdbf2b6a0856bc07027f954f73532103b0dcc3b8e9\";a:4:{s:10:\"expiration\";i:1536966634;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\";s:5:\"login\";i:1536793834;}}'),
(17, 1, 'pl_dashboard_quick_press_last_post_id', '48'),
(18, 1, 'show_try_gutenberg_panel', '0'),
(19, 1, 'plugins_per_page', '999'),
(20, 2, 'nickname', 'quiz'),
(21, 2, 'first_name', ''),
(22, 2, 'last_name', ''),
(23, 2, 'description', ''),
(24, 2, 'rich_editing', 'true'),
(25, 2, 'syntax_highlighting', 'true'),
(26, 2, 'comment_shortcuts', 'false'),
(27, 2, 'admin_color', 'fresh'),
(28, 2, 'use_ssl', '0'),
(29, 2, 'show_admin_bar_front', 'true'),
(30, 2, 'locale', ''),
(31, 2, 'pl_capabilities', 'a:1:{s:8:\"quizbook\";b:1;}'),
(32, 2, 'pl_user_level', '0'),
(33, 2, 'dismissed_wp_pointers', 'wp496_privacy'),
(38, 1, 'closedpostboxes_examenes', 'a:0:{}'),
(39, 1, 'metaboxhidden_examenes', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(36, 1, 'closedpostboxes_dashboard', 'a:4:{i:0;s:19:\"dashboard_right_now\";i:1;s:18:\"dashboard_activity\";i:2;s:21:\"dashboard_quick_press\";i:3;s:17:\"dashboard_primary\";}'),
(37, 1, 'metaboxhidden_dashboard', 'a:0:{}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_users`
--

DROP TABLE IF EXISTS `pl_users`;
CREATE TABLE IF NOT EXISTS `pl_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `pl_users`
--

INSERT INTO `pl_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BgFxpYUS/tJNXk.cGEYOPESHiMqUvR/', 'admin', 'marianogauna1@gmail.com', '', '2018-08-31 22:00:41', '', 0, 'admin'),
(2, 'quiz', '$P$BVGGoXMvZiFXyhX8OaiGR3NJp4snLG0', 'quiz', 'quiz@gmail.com', '', '2018-09-04 01:51:51', '1536025912:$P$Bff0HsnS1dsxVY4LE9u8139IGdDWvH1', 0, 'quiz');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
