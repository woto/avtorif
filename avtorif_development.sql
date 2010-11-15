-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Ноя 15 2010 г., 20:08
-- Версия сервера: 5.1.41
-- Версия PHP: 5.3.2-1ubuntu4.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `avtorif_development`
--

-- --------------------------------------------------------

--
-- Структура таблицы `analogues`
--

CREATE TABLE IF NOT EXISTS `analogues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_id` int(11) DEFAULT NULL,
  `analogue_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `analogues`
--


-- --------------------------------------------------------

--
-- Структура таблицы `autos`
--

CREATE TABLE IF NOT EXISTS `autos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `autos`
--

INSERT INTO `autos` (`id`, `manufacturer_id`, `title`, `created_at`, `updated_at`) VALUES
(298486374, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(980190962, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09');

-- --------------------------------------------------------

--
-- Структура таблицы `auto_options`
--

CREATE TABLE IF NOT EXISTS `auto_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `transmission_id` int(11) DEFAULT NULL,
  `gear_id` int(11) DEFAULT NULL,
  `fuel_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `auto_options`
--

INSERT INTO `auto_options` (`id`, `auto_id`, `period_id`, `transmission_id`, `gear_id`, `fuel_id`, `created_at`, `updated_at`) VALUES
(298486374, NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(980190962, NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09');

-- --------------------------------------------------------

--
-- Структура таблицы `column_relations`
--

CREATE TABLE IF NOT EXISTS `column_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_number` int(11) DEFAULT NULL,
  `manufacturer` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `title` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `column_relations`
--

INSERT INTO `column_relations` (`id`, `catalog_number`, `manufacturer`, `cost`, `title`, `weight`, `count`, `created_at`, `updated_at`) VALUES
(298486374, 1, 1, 1, 1, 1, 1, '2010-11-02 12:28:18', '2010-11-02 12:28:18'),
(980190962, 1, 1, 1, 1, 1, 1, '2010-11-02 12:28:18', '2010-11-02 12:28:18');

-- --------------------------------------------------------

--
-- Структура таблицы `convert_jobs`
--

CREATE TABLE IF NOT EXISTS `convert_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `convert_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encoding_in` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_sep` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encoding_out` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980191028 ;

--
-- Дамп данных таблицы `convert_jobs`
--

INSERT INTO `convert_jobs` (`id`, `created_at`, `updated_at`, `convert_method`, `encoding_in`, `col_sep`, `encoding_out`) VALUES
(298486374, '2010-11-02 12:28:18', '2010-11-02 12:28:18', NULL, NULL, NULL, NULL),
(980190962, '2010-11-02 12:28:18', '2010-11-02 12:28:18', NULL, NULL, NULL, NULL),
(980190963, '2010-11-02 12:55:05', '2010-11-13 11:52:59', 'Acceess - _mdb_console_ ', NULL, NULL, NULL),
(980190964, '2010-11-02 13:57:10', '2010-11-13 11:53:30', 'Acceess - _mdb_console_ ', NULL, NULL, NULL),
(980190965, '2010-11-02 14:09:23', '2010-11-08 13:22:17', 'Acceess - _mdb_console_ ', NULL, NULL, NULL),
(980190966, '2010-11-02 15:49:57', '2010-11-02 15:59:20', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190967, '2010-11-02 16:09:07', '2010-11-03 09:45:38', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190968, '2010-11-02 16:15:04', '2010-11-03 09:45:31', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190969, '2010-11-03 08:49:37', '2010-11-03 08:49:37', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190970, '2010-11-03 08:50:00', '2010-11-03 08:50:00', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190971, '2010-11-03 08:50:18', '2010-11-03 08:50:18', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190972, '2010-11-03 08:51:21', '2010-11-03 08:51:21', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190973, '2010-11-03 08:52:45', '2010-11-03 08:52:45', NULL, NULL, NULL, NULL),
(980190974, '2010-11-03 08:54:54', '2010-11-03 08:54:54', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190975, '2010-11-03 08:56:39', '2010-11-03 08:59:01', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190976, '2010-11-03 09:24:06', '2010-11-03 09:25:16', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190977, '2010-11-03 09:25:39', '2010-11-03 09:25:39', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190978, '2010-11-03 10:00:08', '2010-11-03 10:00:15', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190979, '2010-11-03 17:04:18', '2010-11-03 17:04:33', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190980, '2010-11-08 07:07:51', '2010-11-08 07:07:51', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190981, '2010-11-08 07:22:23', '2010-11-08 07:22:23', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190982, '2010-11-08 16:08:11', '2010-11-14 19:08:10', 'Excel - многостраничный (медленный) - _xls_roo_', 'AUTO', NULL, 'AUTO'),
(980190983, '2010-11-08 16:13:16', '2010-11-14 19:08:00', 'Excel - многостраничный (медленный) - _xls_roo_', 'AUTO', NULL, 'AUTO'),
(980190984, '2010-11-08 16:18:56', '2010-11-14 15:46:41', 'Excel - многостраничный (медленный) - _xls_roo_', 'AUTO', NULL, 'AUTO'),
(980190985, '2010-11-09 08:59:17', '2010-11-14 19:01:08', 'Excel - многостраничный (медленный) - _xls_roo_', 'AUTO', NULL, 'AUTO'),
(980190986, '2010-11-10 07:22:15', '2010-11-10 07:22:15', 'Acceess - _mdb_console_ ', NULL, NULL, NULL),
(980190987, '2010-11-10 08:52:19', '2010-11-10 08:52:19', 'Excel - одностраничный (быстрый) - _xls_console_', NULL, NULL, NULL),
(980190988, '2010-11-10 08:54:27', '2010-11-14 15:08:21', 'Excel - многостраничный (медленный) - _xls_roo_', 'UTF-8', NULL, 'UTF-8'),
(980190989, '2010-11-10 10:42:14', '2010-11-10 10:42:14', 'Acceess - _mdb_console_ ', NULL, NULL, NULL),
(980190990, '2010-11-10 10:43:44', '2010-11-10 10:43:44', 'Acceess - _mdb_console_ ', NULL, NULL, NULL),
(980190991, '2010-11-10 11:31:24', '2010-11-10 11:31:24', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190992, '2010-11-10 11:32:23', '2010-11-10 11:32:23', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190993, '2010-11-10 11:43:19', '2010-11-10 11:43:19', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190994, '2010-11-10 12:22:13', '2010-11-10 12:22:13', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190995, '2010-11-10 12:22:55', '2010-11-10 12:22:55', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190996, '2010-11-10 12:56:29', '2010-11-10 12:56:29', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190997, '2010-11-10 13:03:29', '2010-11-10 13:03:29', 'Acceess - _mdb_console_ ', NULL, NULL, NULL),
(980190998, '2010-11-10 13:06:07', '2010-11-10 13:06:15', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980190999, '2010-11-10 14:20:37', '2010-11-14 15:02:29', 'Excel - многостраничный (медленный) - _xls_roo_', 'UTF-8', NULL, 'UTF-8'),
(980191000, '2010-11-10 15:53:51', '2010-11-10 15:53:51', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980191001, '2010-11-10 17:24:17', '2010-11-14 15:04:14', 'Excel - многостраничный (медленный) - _xls_roo_', 'UTF-8', NULL, 'UTF-8'),
(980191002, '2010-11-10 17:25:31', '2010-11-14 15:05:28', 'Excel - многостраничный (медленный) - _xls_roo_', 'UTF-8', NULL, 'UTF-8'),
(980191003, '2010-11-11 12:17:00', '2010-11-15 15:12:42', 'Просто перекодировка _csv_encode_', 'CP1251', '\\t', 'UTF-8'),
(980191004, '2010-11-11 16:46:34', '2010-11-11 16:46:34', 'Acceess - _mdb_console_ ', NULL, NULL, NULL),
(980191005, '2010-11-12 12:24:25', '2010-11-15 14:55:55', 'Замена одиночного \\n на \\r\\n - _csv_normalize_new_line_', 'CP1251', ' ', 'UTF-8'),
(980191006, '2010-11-12 15:38:25', '2010-11-15 15:48:23', 'Замена одиночного \\n на \\r\\n - _csv_normalize_new_line_', 'CP1251', ' ', 'UTF-8'),
(980191007, '2010-11-12 16:21:37', '2010-11-12 16:21:37', 'Excel - многостраничный (медленный) - _xls_roo_', NULL, NULL, NULL),
(980191008, '2010-11-13 12:45:04', '2010-11-13 12:45:04', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, NULL),
(980191009, '2010-11-13 14:17:23', '2010-11-13 14:17:23', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, NULL),
(980191010, '2010-11-13 14:31:20', '2010-11-14 15:00:46', 'Excel - многостраничный (медленный) - _xls_roo_', 'CP1251', NULL, 'CP1251'),
(980191011, '2010-11-13 15:03:30', '2010-11-14 15:00:55', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, 'UTF-8'),
(980191012, '2010-11-13 16:04:21', '2010-11-13 16:04:21', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, 'UTF-8'),
(980191013, '2010-11-14 15:27:20', '2010-11-14 16:01:29', 'Замена одиночного \\n на \\r\\n - _csv_normalize_new_line_', 'CP1251', '\\t', 'UTF-8'),
(980191014, '2010-11-14 15:31:06', '2010-11-14 17:43:38', 'Замена одиночного \\n на \\r\\n - _csv_normalize_new_line_', 'CP1251', '\\t', 'UTF-8'),
(980191015, '2010-11-14 16:01:17', '2010-11-14 16:01:17', 'Замена одиночного \\n на \\r\\n - _csv_normalize_new_line_', 'CP1251', '\\t', 'UTF-8'),
(980191016, '2010-11-14 16:57:09', '2010-11-14 16:57:09', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, 'UTF-8'),
(980191017, '2010-11-14 18:36:36', '2010-11-14 18:36:36', 'Excel - многостраничный (медленный) - _xls_roo_', 'AUTO', NULL, 'AUTO'),
(980191018, '2010-11-14 18:43:13', '2010-11-14 18:43:13', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, 'UTF-8'),
(980191019, '2010-11-14 18:51:42', '2010-11-14 18:51:42', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, 'UTF-8'),
(980191020, '2010-11-14 18:54:27', '2010-11-14 18:54:27', 'Excel - многостраничный (медленный) - _xls_roo_', 'AUTO', NULL, 'AUTO'),
(980191021, '2010-11-14 19:03:54', '2010-11-14 19:03:54', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, 'UTF-8'),
(980191022, '2010-11-14 19:13:13', '2010-11-14 19:13:13', 'Excel - многостраничный (медленный) - _xls_roo_', 'AUTO', NULL, 'AUTO'),
(980191023, '2010-11-14 19:18:39', '2010-11-14 19:18:39', 'Excel - многостраничный (медленный) - _xls_roo_', 'AUTO', NULL, 'AUTO'),
(980191024, '2010-11-15 08:13:51', '2010-11-15 08:24:21', 'Просто перекодировка _csv_encode_', 'UCS-2LE', NULL, 'UTF-8'),
(980191025, '2010-11-15 08:25:16', '2010-11-15 08:25:16', 'Замена одиночного \\n на \\r\\n - _csv_normalize_new_line_', 'UTF-8', NULL, 'UTF-8'),
(980191026, '2010-11-15 09:18:07', '2010-11-15 09:18:07', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, 'UTF-8'),
(980191027, '2010-11-15 15:50:13', '2010-11-15 15:50:13', 'Просто перекодировка _csv_encode_', 'CP1251', NULL, 'UTF-8');

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foreign_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `currencies`
--

INSERT INTO `currencies` (`id`, `title`, `foreign_id`, `value`, `created_at`, `updated_at`) VALUES
(298486374, 'MyString', 'MyString', 1.5, '2010-11-02 12:28:18', '2010-11-02 12:28:18'),
(980190962, 'MyString', 'MyString', 1.5, '2010-11-02 12:28:18', '2010-11-02 12:28:18');

-- --------------------------------------------------------

--
-- Структура таблицы `delayed_jobs`
--

CREATE TABLE IF NOT EXISTS `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` text COLLATE utf8_unicode_ci,
  `last_error` text COLLATE utf8_unicode_ci,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `delayed_jobs`
--


-- --------------------------------------------------------

--
-- Структура таблицы `delivery_types`
--

CREATE TABLE IF NOT EXISTS `delivery_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `delivery_types`
--

INSERT INTO `delivery_types` (`id`, `title`, `created_at`, `updated_at`) VALUES
(298486374, 'MyString', '2010-11-02 12:28:18', '2010-11-02 12:28:18'),
(980190962, 'MyString', '2010-11-02 12:28:18', '2010-11-02 12:28:18');

-- --------------------------------------------------------

--
-- Структура таблицы `email_receives`
--

CREATE TABLE IF NOT EXISTS `email_receives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssl` tinyint(1) DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protocol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=855325040 ;

--
-- Дамп данных таблицы `email_receives`
--

INSERT INTO `email_receives` (`id`, `server`, `port`, `ssl`, `login`, `password`, `protocol`, `created_at`, `updated_at`) VALUES
(302439171, 'mail.avtorif.ru', '110', 0, 'webtest@avtorif.ru', 'Kc8dk6sd8', 'pop3', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(684181486, 'pop.mail.ru', '110', 0, 'woto@mail.ru', 'matrixreloaded', 'pop3', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(752622840, 'pop.gmail.com', '995', 1, 'ruslan.kornev@gmail.com', 'vjqgfhjkm', 'pop3', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(855325037, 'pop.yandex.ru', '995', 1, 'woto77@yandex.ru', 'qwer332', 'pop3', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(855325038, 'ii', '', 0, '', '', '', '2010-11-03 12:25:40', '2010-11-03 12:25:40'),
(855325039, 'eeee', '', NULL, '', '', '', '2010-11-03 15:42:35', '2010-11-03 15:42:35');

-- --------------------------------------------------------

--
-- Структура таблицы `email_settings`
--

CREATE TABLE IF NOT EXISTS `email_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `topic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `email_settings`
--

INSERT INTO `email_settings` (`id`, `sender`, `topic`, `created_at`, `updated_at`) VALUES
(1, 'MyString', 'MyString', NULL, NULL),
(2, 'MyString', 'MyString', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `filter_jobs`
--

CREATE TABLE IF NOT EXISTS `filter_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `second` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `third` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fourth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fifth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sixth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seventh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eighth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ninth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `col_sep` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row_sep` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quote_char` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `converters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encoding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_size_limit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unconverted_fields` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `return_headers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `write_headers` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_converters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skip_blanks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `force_quotes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Дамп данных таблицы `filter_jobs`
--

INSERT INTO `filter_jobs` (`id`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `eighth`, `ninth`, `tenth`, `created_at`, `updated_at`, `col_sep`, `row_sep`, `quote_char`, `converters`, `encoding`, `field_size_limit`, `unconverted_fields`, `headers`, `return_headers`, `write_headers`, `header_converters`, `skip_blanks`, `force_quotes`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', '2010-11-03 09:58:12', '2010-11-03 09:58:12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '', '', '', '', '', '', '', '', '', '', '2010-11-03 09:58:45', '2010-11-03 09:58:45', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '', '', '', '', '', '', '', '', '', '', '2010-11-03 09:59:49', '2010-11-03 09:59:49', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '', '', '', '', '', '', '', '', '', '', '2010-11-03 09:59:58', '2010-11-03 09:59:58', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2', '', '4', '', '', '', '', '', '', '', '2010-11-03 10:00:29', '2010-11-03 10:02:22', ',', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '.*', '.*', '.*', '.*', '.*', '', '', '', '', '', '2010-11-08 07:09:00', '2010-11-08 07:09:00', ',', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '.*', '.*', '.*', '.*', '\\d+', '', '', '', '', '', '2010-11-08 07:10:28', '2010-11-08 07:10:51', ',', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '.*', '.*', '.*', '.*', '\\d+', '', '', '', '', '', '2010-11-08 07:26:18', '2010-11-08 07:26:18', ',', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'SB.*', '', '', '', '', '', '', '', '', '', '2010-11-08 16:20:42', '2010-11-08 16:20:42', ',', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'SE.*', '', '', '', '', '', '', '', '', '', '2010-11-08 16:21:15', '2010-11-08 16:21:15', ',', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '1', '', '', '', '', '', '', '', '', '', '2010-11-08 17:02:57', '2010-11-08 17:02:57', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '', '', '', '', '', '', '', '', '', '', '2010-11-10 13:03:35', '2010-11-10 13:03:35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '4', 'н', '', '', '', '', '', '', '', '', '2010-11-10 13:06:20', '2010-11-10 13:06:24', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '\\d', '', '', '', '', '', '', '', '', '', '2010-11-10 16:21:59', '2010-11-11 10:28:24', '3', '', '2', '', '', '', '', '', '', '', '', '', ''),
(15, '', '', '', '\\d', '', '', '', '', '', '', '2010-11-10 16:25:15', '2010-11-11 10:18:13', '1', '', '1', '', '', '', '', '', '', '', '', '', ''),
(16, '', '', '', '\\d', '', '', '', '', '', '', '2010-11-10 17:32:38', '2010-11-12 15:40:33', '3', '', '2', '', '', '', '', '', '', '', '', '', ''),
(18, '', '', '', '', '', '', '', '', '', '', '2010-11-11 11:04:25', '2010-11-15 15:44:58', '3', '', '2', '', '', '', '', '', '', '', '', '', ''),
(17, '.*', '', '', '', '', '', '', '', '', '', '2010-11-11 08:49:49', '2010-11-11 08:49:49', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, '', '\\d', '', '', '', '', '', '', '', '', '2010-11-12 14:29:38', '2010-11-12 14:29:38', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(20, '', '', '', '\\d', '', '', '', '', '', '', '2010-11-12 15:40:13', '2010-11-15 15:40:01', '2', '', '2', '', '', '', '', '', '', '', '', '', ''),
(21, '', '', '', '', '\\d', '', '', '', '', '', '2010-11-13 12:47:57', '2010-11-13 12:47:57', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(22, '', '', '\\d', '', '', '', '', '', '', '', '2010-11-13 12:56:12', '2010-11-13 12:56:12', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(23, '', '', '', '', '', '', '', '\\d', '', '', '2010-11-13 14:20:03', '2010-11-13 14:21:47', '2', '', '', '', '', '', '', '', '', '', '', '', ''),
(24, '.*', '', '', '', '', '', '', '', '', '', '2010-11-13 14:27:05', '2010-11-13 14:27:05', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, '', '', '', '', '', '', '', '', '', '', '2010-11-13 14:27:30', '2010-11-13 14:27:30', '2', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, '.*', '', '', '', '', '', '', '', '', '', '2010-11-13 16:24:32', '2010-11-13 16:24:32', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, '.*', '', '', '', '', '', '', '', '', '', '2010-11-14 15:29:11', '2010-11-14 17:54:30', '2', '', '2', '', '', '', '', '', '', '', '', '', ''),
(28, '', '', '', '\\d', '', '', '', '', '', '', '2010-11-14 15:32:39', '2010-11-15 11:08:30', '2', '', '1', '', '', '', '', '', '', '', '', '', ''),
(29, '.*', '', '', '', '', '', '', '', '', '', '2010-11-14 16:02:19', '2010-11-14 16:02:19', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(30, '.*', '', '', '', '', '', '', '', '', '', '2010-11-14 18:41:39', '2010-11-14 18:41:39', '1', '', '1', '', '', '', '', '', '', '', '', '', ''),
(31, '.*', '', '', '', '', '', '', '', '', '', '2010-11-14 18:50:14', '2010-11-14 18:50:14', '2', '2', '', '', '', '', '', '', '', '', '', '', ''),
(32, '.*', '', '', '', '', '', '', '', '', '', '2010-11-14 18:55:02', '2010-11-14 18:56:04', '3', '2', '', '', '', '', '', '', '', '', '', '', ''),
(33, '.*', '', '', '', '', '', '', '', '', '', '2010-11-14 19:05:04', '2010-11-14 19:05:04', '2', '', '1', '', '', '', '', '', '', '', '', '', ''),
(34, '.*', '', '', '', '', '', '', '', '', '', '2010-11-14 19:24:15', '2010-11-14 19:24:15', '1', '', '1', '', '', '', '', '', '', '', '', '', ''),
(35, '.*', '', '', '', '', '', '', '', '', '', '2010-11-14 19:24:59', '2010-11-14 19:24:59', '1', '', '1', '', '', '', '', '', '', '', '', '', ''),
(36, '.*', '', '', '', '', '', '', '', '', '', '2010-11-15 08:15:39', '2010-11-15 08:16:36', '2', '', '1', '', '', '', '', '', '', '', '', '', ''),
(37, '.*', '', '', '', '', '', '', '', '', '', '2010-11-15 09:18:47', '2010-11-15 10:30:33', '1', '', '1', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `folder_receives`
--

CREATE TABLE IF NOT EXISTS `folder_receives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=319468211 ;

--
-- Дамп данных таблицы `folder_receives`
--

INSERT INTO `folder_receives` (`id`, `path`, `created_at`, `updated_at`) VALUES
(319468209, '/home/woto/Рабочий стол/for_test', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(319468210, 'sdf', '2010-11-03 15:42:47', '2010-11-03 15:42:47');

-- --------------------------------------------------------

--
-- Структура таблицы `ftp_receives`
--

CREATE TABLE IF NOT EXISTS `ftp_receives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ftp.avtorif.ru',
  `port` int(11) DEFAULT '21',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT '/',
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'anonymous',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1058689965 ;

--
-- Дамп данных таблицы `ftp_receives`
--

INSERT INTO `ftp_receives` (`id`, `server`, `port`, `path`, `login`, `password`, `created_at`, `updated_at`) VALUES
(59105197, 'ftp.avtorif.ru', 21, '/', 'radiator', 'vc0hOPfv9', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(95376939, 'ftp.avtorif.ru', 21, '/', 'avtoteka', 'avtoteka', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(221035715, 'ftp.avtorif.ru', 21, '/', 'autospar', 'wx9sa23', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(365213618, 'ftp.avtorif.ru', 21, '/', 'pelikan', 'lcaz6Ksf8', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(459424539, 'ftp.avtorif.ru', 21, '/', 'nipp', 'TeRdb8HXh', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(729717474, 'ftp.avtorif.ru', 21, '/', 'ankar', 'kqvpimf', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(774517123, 'ftp.avrs.ru', 21, '/', 'rif', 'RiFftpPrice', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(889787413, 'ftp.avtorif.ru', 21, '/', 'febest', '821xaTxV', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(928202641, 'ftp.avtorif.ru', 21, '/', 'lucid', 'Kl32r5x0', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(1058689885, 'ftp.avtorif.ru', 21, '/', 'jeepshop', '9k1xJa29s', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(1058689886, 'avtorif.ru', 21, '/', 'uservice', 'gfch9Kfdh5', '2010-10-20 11:32:20', '2010-10-20 11:32:20'),
(1058689887, 'avtorif.ru', 21, '/', 'aspi', 'f6uGUpYab', '2010-10-20 12:05:44', '2010-10-20 12:05:44'),
(1058689888, 'avtorif.ru', 21, '/', 'aspi', 'f6uGUpYab', '2010-10-20 13:08:29', '2010-10-20 13:08:29'),
(1058689889, 'avtorif.ru', 21, '/', 'lucid', 'Kl32r5x0', '2010-10-20 13:13:56', '2010-10-20 13:13:56'),
(1058689890, 'avtorif.ru', 21, '/', 'anonymous', 'ууу', '2010-10-20 13:23:49', '2010-10-20 13:23:49'),
(1058689891, 'avtorif.ru', 21, '/', 'anonymous', 'ааа', '2010-10-20 13:24:01', '2010-10-20 13:24:01'),
(1058689892, 'avtorif.ru', 21, '/', 'autonissan', 'Jc823ao42', '2010-10-20 14:33:11', '2010-10-20 14:33:11'),
(1058689893, 'avtorif.ru', 21, '/', 'aspi', 'f6uGUpYab', '2010-10-20 14:38:03', '2010-10-20 14:38:03'),
(1058689894, 'ra.aamajor.ru', 21, '/', 'opt4', 'goWGdKnhun', '2010-10-20 15:47:14', '2010-10-20 15:47:14'),
(1058689895, 'avtorif.ru', 21, '/', 'genser', 'H32a9aw45', '2010-10-21 09:46:31', '2010-10-21 09:46:31'),
(1058689896, 'avtorif.ru', 21, '/', 'pelikan', 'lcaz6Ksf8', '2010-10-21 11:34:22', '2010-10-21 11:34:22'),
(1058689897, 'avtorif.ru', 21, '/', 'ttm', 'Nw3pasf4', '2010-10-21 12:07:52', '2010-10-21 12:07:52'),
(1058689898, 'avtorif.ru', 21, '/', 'avtoteka', 'UsYsa812', '2010-10-21 12:10:54', '2010-10-21 12:10:54'),
(1058689899, 'avtorif.ru', 21, '/', 'avtoteka', 'UsYsa812', '2010-10-21 12:12:47', '2010-10-21 12:12:47'),
(1058689900, 'avtorif.ru', 21, '/', 'ankar', 'kqvpimf', '2010-10-21 12:14:26', '2010-10-21 12:14:26'),
(1058689901, 'ftp.avrs.ru', 21, '/', 'rif', 'RiFftpPrice', '2010-10-21 12:18:19', '2010-10-21 12:18:19'),
(1058689902, 'avtorif.ru', 21, '/', 'ashika', 'd5Vs8w4jh', '2010-10-21 12:20:48', '2010-10-21 12:20:48'),
(1058689903, 'avtorif.ru', 21, '/', 'ashika', 'd5Vs8w4jh', '2010-10-21 12:38:18', '2010-10-21 12:38:18'),
(1058689904, 'avtorif.ru', 21, '/', 'asmotors', 'Jd0vY4ts', '2010-10-21 12:41:48', '2010-10-21 12:41:48'),
(1058689905, 'avtorif.ru', 21, '/', 'asva', 'UL2d0734xq', '2010-10-21 12:42:42', '2010-10-21 12:42:42'),
(1058689906, 'avtorif.ru', 21, '/', 'asva', 'UL2d0734xq', '2010-10-21 12:56:34', '2010-10-21 12:56:34'),
(1058689907, 'avtorif.ru', 21, '/', 'nipp', 'TeRdb8HXh', '2010-10-21 12:59:06', '2010-10-21 12:59:06'),
(1058689908, 'ftp.partnet.ru', 21, '/', 'anonymous', 'anonymous', '2010-10-21 13:03:39', '2010-10-21 13:03:39'),
(1058689909, 'ftp.partnet.ru', 21, '/', 'anonymous', 'anonymous', '2010-10-21 13:07:56', '2010-11-13 11:30:36'),
(1058689910, 'avtorif.ru', 21, '/', 'pricesql', 'Hx0aws0', '2010-10-21 13:12:58', '2010-10-21 13:12:58'),
(1058689911, 'avtorif.ru', 21, '/', 'ty', 'Kldm4aqs', '2010-10-21 13:13:55', '2010-10-21 13:13:55'),
(1058689912, 'avtorif.ru', 21, '/', 'anonymous', '123', '2010-10-21 13:19:18', '2010-10-21 13:19:18'),
(1058689913, 'avtorif.ru', 21, '/', 'aspi', 'f6uGUpYab', '2010-10-21 13:20:14', '2010-10-21 13:20:14'),
(1058689914, 'avtorif.ru', 21, '/', 'ashika', 'd5Vs8w4jh', '2010-10-21 13:44:09', '2010-10-21 13:44:09'),
(1058689915, 'avtorif.ru', 21, '/', 'rolf_n', 'Ych48ds2', '2010-10-21 13:47:19', '2010-10-21 13:47:19'),
(1058689916, 'ra.aamajor.ru', 21, '/', 'opt4', 'goWGdKnhun', '2010-10-22 08:02:59', '2010-10-22 08:02:59'),
(1058689917, 'ftp.avtorif.ru', 21, '/', 'leks', 'Udj6sK310s', '2010-11-02 15:24:43', '2010-11-02 15:24:43'),
(1058689918, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 10:28:10', '2010-11-03 10:28:10'),
(1058689919, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 11:37:19', '2010-11-03 11:37:19'),
(1058689920, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 12:22:31', '2010-11-03 12:22:31'),
(1058689921, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 12:26:06', '2010-11-03 12:26:06'),
(1058689922, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 12:26:49', '2010-11-03 12:26:49'),
(1058689923, 'ftp.avtorif.ru', 21, '/', 'bbbbbbbb', '', '2010-11-03 12:26:57', '2010-11-03 12:26:57'),
(1058689924, 'ftp.avtorif.ru', 21, '/', 'ggggggggg', '', '2010-11-03 12:27:06', '2010-11-03 12:27:06'),
(1058689925, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 12:28:48', '2010-11-03 12:28:48'),
(1058689926, 'ftp.avtorif.ru', 21, '/', 'anonymousr', '', '2010-11-03 12:30:20', '2010-11-03 12:30:20'),
(1058689927, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:05:42', '2010-11-03 13:05:42'),
(1058689928, '2ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:06:53', '2010-11-03 13:06:53'),
(1058689929, '2ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:15:32', '2010-11-03 13:15:32'),
(1058689930, '3ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:16:44', '2010-11-03 13:16:44'),
(1058689931, '4ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:17:41', '2010-11-03 13:17:41'),
(1058689932, '5ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:17:58', '2010-11-03 13:17:58'),
(1058689933, '666ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:19:03', '2010-11-03 13:19:03'),
(1058689934, '777ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:33:26', '2010-11-03 13:33:26'),
(1058689935, '666ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:33:35', '2010-11-03 13:33:35'),
(1058689936, 'нннftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:33:42', '2010-11-03 13:33:42'),
(1058689937, 'тттftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:34:39', '2010-11-03 13:34:39'),
(1058689938, 'иииftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:34:49', '2010-11-03 13:34:49'),
(1058689939, 'йййftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:35:15', '2010-11-03 13:35:15'),
(1058689940, 'еееftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:35:46', '2010-11-03 13:35:46'),
(1058689941, 'бббftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:36:00', '2010-11-03 13:36:00'),
(1058689942, 'мммftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:36:28', '2010-11-03 13:36:28'),
(1058689943, 'чччftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:36:38', '2010-11-03 13:36:38'),
(1058689944, '111ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:37:00', '2010-11-03 13:37:00'),
(1058689945, '222ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:37:13', '2010-11-03 13:37:13'),
(1058689946, '333ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:37:26', '2010-11-03 13:37:26'),
(1058689947, '444ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:37:33', '2010-11-03 13:37:33'),
(1058689948, '555ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:38:25', '2010-11-03 13:38:25'),
(1058689949, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:40:02', '2010-11-03 13:40:02'),
(1058689950, '2 ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 13:40:21', '2010-11-03 13:40:21'),
(1058689951, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 15:27:31', '2010-11-03 15:27:31'),
(1058689952, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 15:28:02', '2010-11-03 15:28:02'),
(1058689953, 'ftp.avtorif.ruvvv', 21, '/', 'anonymous', '', '2010-11-03 15:42:19', '2010-11-03 15:42:30'),
(1058689954, '2232ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 16:29:45', '2010-11-03 16:54:34'),
(1058689955, '76jjj666 ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-03 16:55:23', '2010-11-03 16:55:45'),
(1058689956, 'ftp.avtorif.ru', 21, '/', 'leks', 'Udj6sK310s', '2010-11-03 16:56:03', '2010-11-03 16:56:55'),
(1058689957, 'ftp.avtorif.ru', 21, '/', 'aspi', 'f6uGUpYab', '2010-11-09 08:05:59', '2010-11-09 08:05:59'),
(1058689958, 'ftp.avtorif.ru', 21, '/', 'avtoteka', 'UsYsa812', '2010-11-09 10:26:48', '2010-11-09 10:26:48'),
(1058689959, 'ftp.avtorif.ru', 21, '/', 'ashika', 'd5Vs8w4jh', '2010-11-09 11:33:50', '2010-11-09 11:33:50'),
(1058689960, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-10 10:41:31', '2010-11-10 10:41:31'),
(1058689961, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-10 10:43:19', '2010-11-10 10:43:19'),
(1058689962, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-10 11:31:53', '2010-11-10 11:31:53'),
(1058689963, 'ftp.avtorif.ru', 21, '/', 'leks', 'Udj6sK310s', '2010-11-10 11:41:33', '2010-11-10 11:41:33'),
(1058689964, 'ftp.avtorif.ru', 21, '/', 'anonymous', '', '2010-11-10 13:00:44', '2010-11-10 13:00:44');

-- --------------------------------------------------------

--
-- Структура таблицы `fuels`
--

CREATE TABLE IF NOT EXISTS `fuels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `fuels`
--

INSERT INTO `fuels` (`id`, `title`, `created_at`, `updated_at`) VALUES
(298486374, 'MyString', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(980190962, 'MyString', '2010-10-20 11:31:09', '2010-10-20 11:31:09');

-- --------------------------------------------------------

--
-- Структура таблицы `gears`
--

CREATE TABLE IF NOT EXISTS `gears` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `gears`
--

INSERT INTO `gears` (`id`, `title`, `created_at`, `updated_at`) VALUES
(298486374, 'MyString', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(980190962, 'MyString', '2010-10-20 11:31:09', '2010-10-20 11:31:09');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `original` tinyint(1) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `goods`
--


-- --------------------------------------------------------

--
-- Структура таблицы `goods_auto_options`
--

CREATE TABLE IF NOT EXISTS `goods_auto_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `auto_option_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `goods_auto_options`
--

INSERT INTO `goods_auto_options` (`id`, `goods_id`, `auto_option_id`, `created_at`, `updated_at`) VALUES
(298486374, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(980190962, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09');

-- --------------------------------------------------------

--
-- Структура таблицы `http_receives`
--

CREATE TABLE IF NOT EXISTS `http_receives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci DEFAULT '80',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssl` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Дамп данных таблицы `http_receives`
--

INSERT INTO `http_receives` (`id`, `server`, `port`, `path`, `login`, `password`, `ssl`, `created_at`, `updated_at`) VALUES
(1, 'mb-auto.ru', '80', '/Prices/', '', '', 0, '2010-10-22 09:59:19', '2010-10-22 09:59:19'),
(2, 'mb-auto.ru', '80', '/Prices/', '', '', 0, '2010-10-22 10:00:35', '2010-10-22 10:00:35'),
(3, 'mb-auto.ru', '80', '/Prices/', '', '', 0, '2010-10-22 10:03:26', '2010-10-22 10:03:26'),
(4, 'www.mb-auto.ru', '80', '/Prices/', '', '', 0, '2010-11-02 14:06:00', '2010-11-02 14:06:00'),
(5, 'rrr', '80', '', '', '', 0, '2010-11-03 10:19:51', '2010-11-03 10:19:51'),
(6, 'fgjh', '80', '', '', '', 0, '2010-11-03 11:24:12', '2010-11-03 11:24:12'),
(7, 'hhh', '80', '', '', '', 0, '2010-11-03 12:22:06', '2010-11-03 12:22:06'),
(8, 'hhh', '80', '', '', '', 0, '2010-11-03 12:22:38', '2010-11-03 12:22:38'),
(9, 'fff', '80', '', '', '', 0, '2010-11-03 12:27:59', '2010-11-03 12:27:59'),
(10, 'eee', '80', '', '', '', 0, '2010-11-03 12:32:29', '2010-11-03 12:32:29'),
(11, 'hhh', '80', '', '', '', NULL, '2010-11-03 15:30:37', '2010-11-03 15:30:37'),
(12, 'dfff', '80', '', '', '', NULL, '2010-11-03 15:42:06', '2010-11-03 15:42:14'),
(13, 'jjj', '80', '', '', '', NULL, '2010-11-03 16:55:52', '2010-11-03 16:55:52'),
(14, '', '80', '', '', '', NULL, '2010-11-10 13:03:24', '2010-11-10 13:03:24'),
(15, 'sklad.pelican.ru', '80', '/getprice.php?r=101110042642&uid=232', '', '', NULL, '2010-11-10 14:11:45', '2010-11-10 14:14:58'),
(16, 'sklad.pelican.ru', '80', '/getprice.php?r=101110042642&uid=232&id=1', '', '', NULL, '2010-11-10 14:33:48', '2010-11-10 14:33:48'),
(17, 'sklad.pelican.ru', '80', '/getpricecsv.php?r=101110042642&uid=232&id=', '', '', NULL, '2010-11-10 15:26:21', '2010-11-13 12:33:28');

-- --------------------------------------------------------

--
-- Структура таблицы `import_jobs`
--

CREATE TABLE IF NOT EXISTS `import_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `importable_id` int(11) DEFAULT NULL,
  `importable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `import_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encoding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presence` tinyint(1) DEFAULT NULL,
  `currency_buy_id` int(11) DEFAULT NULL,
  `currency_sell_id` int(11) DEFAULT NULL,
  `currency_weight_id` int(11) DEFAULT NULL,
  `delivery_type_id` int(11) DEFAULT NULL,
  `visible_for_site` tinyint(1) DEFAULT NULL,
  `visible_for_stock` tinyint(1) DEFAULT NULL,
  `visible_for_shops` tinyint(1) DEFAULT NULL,
  `estimate_days` int(11) DEFAULT NULL,
  `retail_rate` float DEFAULT NULL,
  `income_rate` float DEFAULT NULL,
  `kilo_price` float DEFAULT NULL,
  `weight_unavaliable_rate` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=744951699 ;

--
-- Дамп данных таблицы `import_jobs`
--

INSERT INTO `import_jobs` (`id`, `importable_id`, `importable_type`, `import_method`, `encoding`, `presence`, `currency_buy_id`, `currency_sell_id`, `currency_weight_id`, `delivery_type_id`, `visible_for_site`, `visible_for_stock`, `visible_for_shops`, `estimate_days`, `retail_rate`, `income_rate`, `kilo_price`, `weight_unavaliable_rate`, `created_at`, `updated_at`) VALUES
(139544383, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(198188851, 548536844, 'CsvImport', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(290985607, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(744951698, 90866766, 'CsvImport', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `next_start` datetime DEFAULT NULL,
  `last_start` datetime DEFAULT NULL,
  `last_finish` datetime DEFAULT NULL,
  `seconds_between_jobs` int(11) DEFAULT '4000',
  `seconds_working` int(11) DEFAULT '20',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `jobable_id` int(11) DEFAULT NULL,
  `jobable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `file_mask` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `locked` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `job_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1066346273 ;

--
-- Дамп данных таблицы `jobs`
--

INSERT INTO `jobs` (`id`, `next_start`, `last_start`, `last_finish`, `seconds_between_jobs`, `seconds_working`, `title`, `job_id`, `jobable_id`, `jobable_type`, `supplier_id`, `file_mask`, `locked`, `active`, `created_at`, `updated_at`, `job_code`, `description`) VALUES
(205865397, NULL, NULL, NULL, NULL, NULL, 'job_for_local_test_3', 994210086, 139544383, 'ImportJob', 610276578, NULL, 0, 1, '2010-10-20 11:31:09', '2010-10-20 11:31:09', NULL, NULL),
(427111281, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:23', 14400, 60, 'Прием avtorif.xls от Радиатор сервис', NULL, 584111877, 'ReceiveJob', 769483063, '"^avtorif.xls$"', 0, 1, '2010-10-20 11:31:09', '2010-11-15 17:06:23', '', NULL),
(1066346217, NULL, '2010-11-15 16:28:01', '2010-11-15 16:28:35', 172800, 20, 'Приводим к csv', 1066346052, 980191001, 'ConvertJob', 1072056314, '".*"', 0, 1, '2010-11-10 17:24:08', '2010-11-15 16:28:35', '', ''),
(1066346218, NULL, '2010-11-15 16:08:04', '2010-11-15 16:09:02', 4000, 20, 'Конвертируем в csv', 1066346160, 980191002, 'ConvertJob', 1072056303, '".*"', 0, 1, '2010-11-10 17:25:22', '2010-11-15 16:09:02', '', ''),
(540680328, NULL, '2010-11-13 11:55:41', NULL, NULL, 60, 'job_for_webtest_avtorif', NULL, 338983884, 'ReceiveJob', 244397494, '".*"', 1, 0, '2010-10-20 11:31:09', '2010-11-13 11:55:41', '', ''),
(552234132, '2010-11-13 13:00:00', '2010-11-13 12:03:08', '2010-11-13 12:03:10', 14400, 20, 'job_for_autospar_1', NULL, 746173547, 'ReceiveJob', 594805345, '"^" + Time.zone.now.strftime(''%d%m%y'') + ".*$"', 0, 0, '2010-10-20 11:31:09', '2010-11-13 12:03:10', '', NULL),
(575348894, NULL, '2010-11-13 11:55:41', NULL, NULL, 60, 'job_for_local_test_1', NULL, 609423326, 'ReceiveJob', 610276578, '1', 1, 1, '2010-10-20 11:31:09', '2010-11-13 11:55:41', NULL, NULL),
(646346657, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:24', 14400, 60, '095_Загрузить прайс ДЖИПШОП ', NULL, 508517365, 'ReceiveJob', 289598915, '"^AVTORIF.txt$"', 0, 1, '2010-10-20 11:31:09', '2010-11-15 17:06:24', '', NULL),
(1066346222, NULL, '2010-11-15 16:09:40', '2010-11-15 16:10:38', 4000, 20, 'Нормализация ASVARIF.TXT', 1066346272, 18, 'FilterJob', 1072056318, '"^ASVARIF.TXT$"', 0, 1, '2010-11-11 11:00:42', '2010-11-15 16:10:38', 'z', ''),
(1066346223, NULL, '2010-11-15 16:08:09', '2010-11-15 16:09:07', 4000, 20, 'Преобразование *?:% формата для asvarif-1.txt и febestrif.txt', 1066346172, 980191003, 'ConvertJob', 1072056318, '"asvarif-1|febestrif"', 0, 1, '2010-11-11 12:15:34', '2010-11-15 16:09:07', '', ''),
(1066346224, '2010-11-11 16:43:00', '2010-11-11 16:57:31', '2010-11-11 16:57:31', 4000, 20, 'Мазда Германия', NULL, NULL, NULL, 1072056305, '".*"', 0, 1, '2010-11-11 16:44:50', '2010-11-11 16:57:31', '', 'volkov@avtorif.ru\r\n\r\nЗдравствуйте, IT отдел.\r\n\r\n\r\nвот полный прайс  - у нас это Дженсер Мазда Германия. Полная замена старого! Прайс в долларах США, курс 32\r\n\r\n\r\n---------- Пересылаемое письмо ----------\r\n\r\nОт:                  Сергей Лапутин <sergey.laputin@vw.genser.ru>\r\n\r\nК:                   Волков Владимир Владиславович <volkov@avtorif.ru>\r\n\r\nА также к:           \r\n\r\nВремя создания:      Thu, 11 Nov 2010 15:43:22 +0300\r\n\r\nТема:                Прайс ЦС. Дженсер Мазда\r\n\r\nПрикрепленные файлы: Письмо.html, PriceList.rar\r\n\r\n\r\n \r\n\r\nДа, Вы правы.\r\n\r\nЭксель урезал полный объем.\r\n\r\nТам примерно 213 тыс. позиций\r\n\r\nВысылаю в архиве.\r\n\r\n\r\n\r\nС уважением, \r\n\r\nЛапутин Сергей \r\n\r\nМенеджер по оптовым продажам запасных частей \r\n\r\n____________________________________________ \r\n\r\nКомпания Genser \r\n\r\nАвтоцентр Mazda 3-ий км МКАД \r\n\r\nтел.: +7 495 780-9393, доб. 1549 \r\n\r\nicq: 617211283 \r\n\r\ne-mail: \r\n\r\ns.laputin@genser.ru  \r\n\r\nwww.genser.ru \r\n\r\nwww.mazda.genser.ru \r\n\r\n\r\n\r\n\r\n\r\n \r\n\r\n\r\n\r\nFrom: Волков Владимир [mailto:volkov@avtorif.ru] \r\n\r\nSent: Thursday, November 11, 2010 2:50 PM\r\n\r\nTo: Сергей Лапутин\r\n\r\nSubject: Re: Прайс ЦС. Дженсер Мазда\r\n\r\n\r\nЗдравствуйте, Сергей.\r\n\r\n\r\nПрошу проверить корректность нового прайс-листа Бельгия - в старом было существенно больше позиций!\r\n\r\n\r\n-- \r\n\r\nС уважением,\r\n\r\n Волков Владимир    \r\n\r\n\r\n mailto:volkov@avtorif.ru\r\n\r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5610 (20101111) __________\r\n\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n\r\n\r\n\r\n\r\n---------- Конец пересылаемого письма ----------\r\n\r\n-- \r\n\r\nС уважением,\r\n\r\n Волков                          mailto:volkov@avtorif.ru\r\n\r\nПисьмо.html\r\n\r\n \r\nДа, Вы правы.\r\nЭксель урезал полный объем.\r\nТам примерно 213 тыс. позиций\r\nВысылаю в архиве.\r\n\r\nС уважением,\r\nЛапутин Сергей\r\nМенеджер по оптовым продажам запасных частей\r\n____________________________________________\r\n\r\nКомпания Genser\r\nАвтоцентр Mazda 3-ий км МКАД\r\nтел.: +7 495 780-9393, доб. 1549\r\nicq: 617211283\r\ne-mail:\r\ns.laputin@genser.ru \r\nwww.genser.ru\r\nwww.mazda.genser.ru\r\n\r\n\r\n\r\n \r\n\r\nFrom: Волков Владимир [mailto:volkov@avtorif.ru]\r\nSent: Thursday, November 11, 2010 2:50 PM\r\nTo: Сергей Лапутин\r\nSubject: Re: Прайс ЦС. Дженсер Мазда\r\n\r\nЗдравствуйте, Сергей.\r\n\r\n\r\nПрошу проверить корректность нового прайс-листа Бельгия - в старом было существенно больше позиций!\r\n\r\n\r\n-- \r\n\r\nС уважением,\r\n\r\n Волков Владимир    \r\n\r\n\r\n mailto:volkov@avtorif.ru\r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5610 (20101111) __________\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n'),
(852046107, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:25', 14400, 60, '100_Загрузить прайс FEBEST SQL', NULL, 738464244, 'ReceiveJob', 854858892, '"^febestrif.txt$"', 0, 1, '2010-10-20 11:31:09', '2010-11-15 17:06:25', '', NULL),
(994210086, NULL, NULL, NULL, NULL, NULL, 'job_for_local_test_2', 575348894, 290985607, 'ImportJob', 610276578, NULL, 0, 1, '2010-10-20 11:31:09', '2010-10-20 11:31:09', NULL, NULL),
(1066346022, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:26', 14400, 20, '002_Загрузить прайс У-СЕРВИС НИССАН НАЛИЧИЕ ', NULL, 1027824376, 'ReceiveJob', 1072056296, '"^U_SERV_COL.xls$"', 0, 1, '2010-10-20 11:32:07', '2010-11-15 17:06:26', '', NULL),
(1066346023, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:27', 14400, 20, '003_Загрузить прайс У-СЕРВИС НИССАН ЦС  (Открывается word :)) )', NULL, 1027824376, 'ReceiveJob', 1072056296, '"^U_SERV_NMR.xls$"', 0, 1, '2010-10-20 11:38:45', '2010-11-15 17:06:27', 'НИССАН ЦС', ''),
(1066346024, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:27', 14400, 20, '004_Загрузить прайс ФОРУМ-АВТО SQL', NULL, 1027824377, 'ReceiveJob', 1072056297, '"^FORUM-AUTO.xls$"', 0, 1, '2010-10-20 12:03:27', '2010-11-15 17:06:27', 'ФОРУМ-АВТО SQL', NULL),
(1066346025, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:27', 14400, 20, '005_Загрузить прайс БОРСПЛИНТЕКС SQL ', NULL, 1027824378, 'ReceiveJob', 1072056298, '"^splintex_stock.xls$"', 0, 1, '2010-10-20 13:07:57', '2010-11-15 17:06:27', 'as', NULL),
(1066346026, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:28', 14400, 20, '006_Загрузить прайс ФОРВАРД SQL ', NULL, 1027824393, 'ReceiveJob', 1072056299, '"^Forward.xls$"', 0, 1, '2010-10-20 13:09:20', '2010-11-15 17:06:28', '', NULL),
(1066346027, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:30', 14400, 20, '007_Загрузить прайс JAPANCARS НАЛИЧИЕ ОРИГИНАЛ SQL И 009_Загрузить прайс JAPANCARS НАЛИЧИЕ НЕОРИГИН SQL ', NULL, 1027824379, 'ReceiveJob', 239384643, '"^LucJC.xls$"', 0, 1, '2010-10-20 13:13:34', '2010-11-15 17:06:30', '', NULL),
(1066346035, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:30', 14400, 20, '010_Загрузить прайс ACSCOM SQL ', NULL, 1027824391, 'ReceiveJob', 1072056300, '"^ACSCOM.xls$"', 0, 1, '2010-10-20 14:11:54', '2010-11-15 17:06:30', '', NULL),
(1066346036, '2010-11-13 13:00:00', '2010-11-13 12:03:00', NULL, 14400, 20, '011_Загрузить прайс АВТОСПЕЦЦЕНТР (Неверный пароль)', NULL, 1027824392, 'ReceiveJob', 1072056302, '"^Sklad Himki.xls$"', 0, 0, '2010-10-20 14:32:41', '2010-11-13 12:18:46', '', ''),
(1066346037, '2010-11-13 17:00:00', '2010-11-13 13:50:00', NULL, 14400, 60, '012_Загрузить прайс ASPI Group СТЕКЛА SQL  (нет такого файла там)', NULL, 1027824394, 'ReceiveJob', 1072056303, '"^skl.xls$"', 0, 0, '2010-10-20 15:42:31', '2010-11-14 15:23:04', '', ''),
(1066346038, '2010-11-14 21:00:00', '2010-11-14 17:50:14', '2010-11-14 17:50:23', 14400, 20, '013_Загрузить прайс MAJOR MAZDA ', NULL, 1027824426, 'ReceiveJob', 1072056304, '"^Mazda.txt$"', 0, 0, '2010-10-20 15:46:57', '2010-11-14 17:50:23', '', NULL),
(1066346039, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:06:31', 14400, 20, '016_Загрузить прайс ДЖЕНСЕР УЦЕНКА SQL ', NULL, 1027824496, 'ReceiveJob', 1072056305, '".*"', 0, 1, '2010-10-21 09:46:07', '2010-11-15 17:06:31', '', NULL),
(1066346040, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:00:23', 14400, 20, '017_Загрузить прайс КАПОТ ', NULL, 1027824397, 'ReceiveJob', 1072056306, '"^kapot-price.xls$"', 1, 1, '2010-10-21 09:47:11', '2010-11-15 17:06:19', '', NULL),
(1066346041, '2010-11-15 21:00:00', '2010-11-15 17:06:19', '2010-11-15 17:00:24', 14400, 20, '020_Загрузить прайс SEVEN-AUTO SQL', NULL, 1027824398, 'ReceiveJob', 1072056307, '"^stock.csv$"', 1, 1, '2010-10-21 09:48:32', '2010-11-15 17:06:19', '', NULL),
(1066346045, '2010-11-13 13:00:00', '2010-11-13 12:03:00', NULL, 14400, 20, '025_Загрузить прайс НЕЗАВИСИМОСТЬ (папку переименовали в откл.)', NULL, 1027824401, 'ReceiveJob', 1072056308, '"^ОПТ 090610.xls$"', 0, 0, '2010-10-21 12:03:58', '2010-11-13 12:19:26', '', ''),
(1066346046, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:24', 14400, 20, '026_Загрузить прайс TTM ', NULL, 1027824402, 'ReceiveJob', 1072056309, '"^Price_TTM-4.xls$"', 1, 1, '2010-10-21 12:07:38', '2010-11-15 17:06:20', '', NULL),
(1066346047, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:25', 14400, 20, '027_Загрузить остатки БУХГАЛТЕРИИ', NULL, 1027824498, 'ReceiveJob', 1072056310, '"^BUHLOG.txt$"', 1, 1, '2010-10-21 12:09:31', '2010-11-15 17:06:20', '', NULL),
(1066346048, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:26', 14400, 20, '028_Загрузить прайс АВТОТЕКА SQL', NULL, 1027824404, 'ReceiveJob', 1072056311, '"^AVTOTEKA.txt$"', 1, 1, '2010-10-21 12:12:31', '2010-11-15 17:06:20', '', NULL),
(1066346049, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:26', 14400, 20, '029_Загрузить прайс АНКАР SQL', NULL, 1027824405, 'ReceiveJob', 1072056312, '"^stoc_ankar_quantity.csv$"', 1, 1, '2010-10-21 12:14:13', '2010-11-15 17:06:20', '', NULL),
(1066346050, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:27', 14400, 20, '030_Загрузить прайс СТАЛКЕР НАЛИЧИЕ 2 SQL', NULL, 1027824406, 'ReceiveJob', 1072056313, '"^sklad2_price.txt$"', 1, 1, '2010-10-21 12:18:00', '2010-11-15 17:06:20', '', NULL),
(1066346051, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:29', 14400, 20, '031_Загрузить прайс СТАЛКЕР НАЛИЧИЕ SQL', NULL, 1027824406, 'ReceiveJob', 1072056313, '"^stalk_price.txt$"', 1, 1, '2010-10-21 12:19:12', '2010-11-15 17:06:20', '', NULL),
(1066346052, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:29', 14400, 20, '032_Загрузить прайс ASHIKA и 033_Загрузить прайс ASHIKA', NULL, 1027824407, 'ReceiveJob', 1072056314, '"^RVM -5 s nalichiem.xls$"', 1, 1, '2010-10-21 12:20:36', '2010-11-15 17:06:20', '', NULL),
(1066346053, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:30', 14400, 20, '034_Загрузить прайс ТУНГУСОВ ИП МАСЛА ', NULL, 1027824408, 'ReceiveJob', 1072056315, '"^1.xls$"', 1, 1, '2010-10-21 12:38:06', '2010-11-15 17:06:20', '', NULL),
(1066346054, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:30', 14400, 20, '034_Загрузить прайс ТУНГУСОВ ИП МАСЛА', NULL, 1027824408, 'ReceiveJob', 1072056315, '"^1.txt$"', 1, 1, '2010-10-21 12:38:36', '2010-11-15 17:06:20', '', NULL),
(1066346055, '2010-10-21 12:40:00', '2010-10-21 12:40:00', NULL, 14400, 20, '037_Обновить прайс CPD', NULL, NULL, NULL, 1072056316, '\\".*\\"', 0, 1, '2010-10-21 12:40:58', '2010-10-21 12:40:58', '', NULL),
(1066346056, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:30', 14400, 20, '042_Загрузить прайс AS MOTORS НАЛИЧИЕ SQL', NULL, 1027824409, 'ReceiveJob', 1072056317, '"^asmotors_price.csv$"', 1, 1, '2010-10-21 12:41:34', '2010-11-15 17:06:20', '', NULL),
(1066346057, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:31', 14400, 20, '043_Загрузить прайс ASVA SQL', NULL, 1027824410, 'ReceiveJob', 1072056318, '"^asvarif.xls$"', 1, 1, '2010-10-21 12:42:30', '2010-11-15 17:06:20', '', ''),
(1066346058, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:31', 14400, 20, '048_Загрузить прайс РИНА SQL', NULL, 1027824411, 'ReceiveJob', 1072056319, '"^РИНА.xls$"', 1, 1, '2010-10-21 12:43:20', '2010-11-15 17:06:20', '', NULL),
(1066346059, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:31', 14400, 20, '051_Загрузить прайс Ю.С. ИМПЕКС MAZDA НАЛИЧИЕ', NULL, 1027824412, 'ReceiveJob', 1072056320, '"^DMS_05 USI_Stock_Opt.xls$"', 1, 1, '2010-10-21 12:55:14', '2010-11-15 17:06:20', '', NULL),
(1066346060, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:32', 14400, 20, '052_Загрузить ШООРИ SQL', NULL, 1027824413, 'ReceiveJob', 480201602, '"^sklad.txt$"', 1, 1, '2010-10-21 12:58:53', '2010-11-15 17:06:20', '', NULL),
(1066346061, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:33', 14400, 20, '075_Загрузить прайс наличия МИКАДО', NULL, 1027824414, 'ReceiveJob', 1072056321, '"^MikStockA_All.csv$"', 1, 1, '2010-10-21 12:59:55', '2010-11-15 17:06:20', '', NULL),
(1066346062, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:34', 14400, 20, '076_Загрузить прайс ДЖЕНСЕР НИССАН НАЛИЧИЕ', NULL, 1027824396, 'ReceiveJob', 1072056305, '"^GenserNaL.xls$"', 1, 1, '2010-10-21 13:00:48', '2010-11-15 17:06:20', '', NULL),
(1066346063, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:34', 14400, 20, '077_Загрузить прайс ДЖЕНСЕР МАЗДА ЦС SQL', NULL, 1027824396, 'ReceiveJob', 1072056305, '"^GenserCS.xls$"', 1, 1, '2010-10-21 13:01:16', '2010-11-15 17:06:20', '', NULL),
(1066346064, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:03:20', 14400, 20, '079_Загрузить прайс RMS TOYOTA НАЛИЧИЕ SQL и 080_Загрузить прайс RMS MAZDA НАЛИЧИЕ SQL и 081_Загрузить прайс RMS MMC НАЛИЧИЕ SQL и 085_Загрузить прайс RMS HONDA ОМАН и 086_Загрузить прайс RMS HONDA НАЛИЧИЕ SQL ', NULL, 1027824415, 'ReceiveJob', 1072056322, '"^JapanAr.txt$"', 1, 1, '2010-10-21 13:02:43', '2010-11-15 17:06:20', '', NULL),
(1066346065, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:35', 14400, 20, '082_Загрузить прайс SPD', NULL, 1027824416, 'ReceiveJob', 1072056323, '"^1-500.txt$"', 1, 1, '2010-10-21 13:07:41', '2010-11-15 17:06:20', '', NULL),
(1066346066, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:36', 14400, 20, '083_Загрузить прайс Tayota SPD(масла)', NULL, 1027824416, 'ReceiveJob', 1072056323, '"^масло.xls$"', 1, 1, '2010-10-21 13:09:14', '2010-11-15 17:06:20', '', NULL),
(1066346067, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:36', 14400, 20, '084_Загрузить прайс Tayota SPD(запчасти)', NULL, 1027824416, 'ReceiveJob', 1072056323, '"^Запчасти.xls$"', 1, 1, '2010-10-21 13:09:44', '2010-11-15 17:06:20', '', NULL),
(1066346068, '2010-11-13 13:00:00', '2010-11-13 12:03:10', NULL, 14400, 20, '089_Загрузить прайсы в базу PRICE SQL', NULL, 1027824417, 'ReceiveJob', 1072056324, 'zzz', 1, 0, '2010-10-21 13:12:41', '2010-11-13 12:03:10', '', ''),
(1066346069, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:36', 14400, 20, '092_Загрузить прайс Ивика SQL', NULL, 1027824418, 'ReceiveJob', 1072056325, '"^ivika.xls$"', 1, 1, '2010-10-21 13:13:43', '2010-11-15 17:06:20', '', NULL),
(1066346071, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:43', 14400, 20, '094_Загрузить прайс MAJOR MAZDA НАЛИЧИЕ и 093_Загрузить прайс MAJOR HONDA ', NULL, 1027824426, 'ReceiveJob', 1072056304, '"^parts_major.txt$"', 1, 1, '2010-10-21 13:16:51', '2010-11-15 17:06:20', '', NULL),
(1066346072, '2010-11-13 13:00:00', '2010-11-13 12:19:00', NULL, 14400, 20, '096_Загрузить прайс АВТОИМПЭКС (ЛУЦИД) SQL (неверный пароль)', NULL, 1027824419, 'ReceiveJob', 1072056326, '"^АвтоИмпэкс.xls$"', 0, 0, '2010-10-21 13:18:54', '2010-11-13 12:22:46', '', ''),
(1066346073, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:43', 14400, 20, '097_Загрузить прайс МОСКВОРЕЧЬЕ SQL', NULL, 1027824420, 'ReceiveJob', 1072056327, '"^PriceForeign.xls$"', 1, 1, '2010-10-21 13:19:49', '2010-11-15 17:06:20', '', NULL),
(1066346074, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:43', 14400, 20, '098_Загрузить прайс НИКА АКСЕССУАРЫ НАЛИЧИЕ', NULL, 1027824421, 'ReceiveJob', 1072056328, '"^SKLAD-" + Time.zone.now.strftime(''%d %m %y'') + ".TXT$"', 1, 1, '2010-10-21 13:21:20', '2010-11-15 17:06:20', '', NULL),
(1066346075, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:44', 14400, 20, '101_Загрузить прайс AUTOSPAR SQL', NULL, 746173547, 'ReceiveJob', 594805345, '"^Autospar.txt$"', 1, 1, '2010-10-21 13:35:50', '2010-11-15 17:06:20', '', NULL),
(1066346076, '2010-11-13 13:00:00', '2010-11-13 12:03:11', NULL, 14400, 20, '112_Загрузить прайсы в базу PRICE SQL', NULL, 1027824417, 'ReceiveJob', 1072056324, '123', 1, 0, '2010-10-21 13:39:15', '2010-11-13 12:03:11', '', ''),
(1066346077, '2010-11-15 21:00:00', '2010-11-15 17:06:20', '2010-11-15 17:00:45', 14400, 20, '227_Загрузить прайс НОВЛАЙН', NULL, 1027824510, 'ReceiveJob', 1072056329, '"(?i-mx:^Novline.txt$)"', 1, 1, '2010-10-21 13:43:54', '2010-11-15 17:06:20', '', NULL),
(1066346078, '2010-10-21 13:45:00', '2010-10-21 13:45:00', NULL, 14400, 20, '001_PriceMoscow-xls.xls', NULL, NULL, NULL, 1072056324, '123', 0, 0, '2010-10-21 13:45:52', '2010-11-13 11:32:49', '', ''),
(1066346079, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:00:45', 14400, 20, '047_Загрузить склад ROLF АКСЕССУАРЫ', NULL, 1027824423, 'ReceiveJob', 1072056330, '"^ROLF AKS 1.txt$"', 1, 1, '2010-10-21 13:47:05', '2010-11-15 17:06:21', '', NULL),
(1066346080, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:00:46', 14400, 20, '047_Загрузить склад ROLF НЕОРИГИНАЛ', NULL, 1027824423, 'ReceiveJob', 1072056330, '"^ROLF.txt$"', 1, 1, '2010-10-21 13:48:09', '2010-11-15 17:06:21', '', NULL),
(1066346081, '2010-10-21 13:49:00', '2010-10-21 13:49:00', NULL, 14400, 20, '095_Загрузить прайсы в базу PRICE SQL ', NULL, NULL, NULL, 1072056324, '123', 0, 0, '2010-10-21 13:49:19', '2010-11-13 11:32:54', '', ''),
(1066346082, '2010-11-14 21:00:00', '2010-11-14 18:26:24', '2010-10-22 09:55:43', 2592000, 200, '146_MBA MMC ГЕРМАНИЯ', NULL, 1027824424, 'ReceiveJob', 1072056331, 'Mitsubishi.zip', 1, 0, '2010-10-21 13:51:18', '2010-11-14 18:26:24', '', NULL),
(1066346083, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:00:47', 14400, 20, '156_Загрузить склад ROLF XLS(ЦЕНТРАЛЬНЫЙ СКЛАД) ', NULL, 1027824425, 'ReceiveJob', 1072056330, '"^sklad" + Time.zone.now.strftime(''%d%m%y'') + ".xls$"', 1, 1, '2010-10-21 13:57:41', '2010-11-15 17:06:21', '', NULL),
(1066346084, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 16:28:31', 14400, 20, 'MBA MAZDA ГЕРМАНИЯ', NULL, 1027824428, 'ReceiveJob', 1072056331, 'Mazda.zip', 1, 1, '2010-10-22 09:57:26', '2010-11-15 17:06:21', '', NULL),
(1066346086, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 16:07:49', 14400, 200, 'Прием Land Rover', NULL, 1027824428, 'ReceiveJob', 1072056331, 'Land Rover.zip', 1, 1, '2010-11-02 12:33:48', '2010-11-15 17:06:21', '', NULL),
(1066346087, NULL, '2010-11-15 16:07:54', '2010-11-15 16:08:10', 2592000, 200, 'Распаковка LandRover''a', 1066346086, 980190963, 'UnpackJob', 1072056331, '".*"', 0, 1, '2010-11-02 12:54:26', '2010-11-15 16:08:10', '', NULL),
(1066346088, NULL, '2010-11-15 16:08:10', '2010-11-15 16:09:10', 2592000, 200, 'Конвертирование в csv Land Rover''a', 1066346087, 980190963, 'ConvertJob', 1072056331, '".*"', 0, 1, '2010-11-02 12:55:01', '2010-11-15 16:09:10', '', NULL),
(1066346089, '2010-11-15 17:00:00', '2010-11-15 16:28:31', '2010-11-15 16:29:34', 14400, 20, 'Распаковываем мазду', 1066346084, 980190964, 'UnpackJob', 1072056331, '".*"', 0, 1, '2010-11-02 13:56:16', '2010-11-15 16:29:34', '', NULL),
(1066346090, NULL, '2010-11-15 16:29:34', '2010-11-15 16:29:51', 14400, 20, 'Конвертируем Мазду', 1066346089, 980190964, 'ConvertJob', 1072056331, '".*"', 0, 1, '2010-11-02 13:57:05', '2010-11-15 16:29:51', '', NULL),
(1066346091, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 16:09:19', 14400, 20, 'Прием Mitsubishi', NULL, 1027824428, 'ReceiveJob', 1072056331, 'Mitsubishi.zip', 1, 1, '2010-11-02 14:07:57', '2010-11-15 17:06:21', '', NULL),
(1066346092, NULL, '2010-11-15 16:09:19', '2010-11-15 16:09:43', 14400, 20, 'Распаковать митсубиши', 1066346091, 980190965, 'UnpackJob', 1072056331, '".*"', 0, 1, '2010-11-02 14:08:45', '2010-11-15 16:09:43', '', NULL),
(1066346093, NULL, '2010-11-15 16:09:43', '2010-11-15 16:10:43', 14400, 20, 'Конвертировать митсубиши', 1066346092, 980190965, 'ConvertJob', 1072056331, '".*"', 0, 1, '2010-11-02 14:09:18', '2010-11-15 16:10:43', '', NULL),
(1066346142, NULL, '2010-11-09 15:52:51', '2010-11-09 15:54:14', 14400, 20, 'Фильтрация', 1066346141, 8, 'FilterJob', 1044098171, '".*"', 0, 1, '2010-11-08 07:25:42', '2010-11-09 15:54:14', '023', NULL),
(1066346141, NULL, '2010-11-09 15:51:23', '2010-11-09 15:52:51', 2592000, 20, 'Конвертируем в csv', 459943152, 980190981, 'ConvertJob', 1044098171, '".*"', 0, 1, '2010-11-08 07:21:16', '2010-11-09 15:52:51', '', NULL),
(1066346140, NULL, '2010-11-09 15:52:50', '2010-11-09 15:54:12', 14400, 20, 'Фильтрация', 1066346138, 7, 'FilterJob', 1044098171, '".*"', 0, 1, '2010-11-08 07:10:10', '2010-11-09 15:54:12', 'наличие', NULL),
(1066346138, NULL, '2010-11-09 15:51:22', '2010-11-09 15:52:50', 14400, 20, 'Сконвертировать', 84851029, 980190980, 'ConvertJob', 1044098171, '.*', 0, 1, '2010-11-08 07:07:26', '2010-11-09 15:52:50', '', NULL),
(1066346233, NULL, '2010-11-15 16:28:00', '2010-11-15 16:28:32', NULL, NULL, 'Перекодирование', 1066346056, 980191008, 'ConvertJob', 1072056317, '".*"', 0, 1, '2010-11-13 12:43:48', '2010-11-15 16:28:32', '', ''),
(1066346147, NULL, '2010-11-15 17:06:26', '2010-11-15 16:40:49', 14400, 20, 'Конвертируем в csv', 1066346022, 980190982, 'ConvertJob', 1072056296, '".*"', 1, 1, '2010-11-08 16:07:39', '2010-11-15 17:06:26', '', NULL),
(1066346146, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:03', 14400, 20, '146_Загрузить склад ROLF XLS(ЦЕНТРАЛЬНЫЙ СКЛАД) ', NULL, 1027824488, 'ReceiveJob', 1072056330, '"^sklad" + Time.zone.now.strftime(''%d%m%y'') + ".xls$"', 1, 1, '2010-11-08 15:59:18', '2010-11-15 17:06:21', '', NULL),
(1066346145, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:04', 14400, 20, '047_Загрузить склад ROLF АКСЕССУАРЫ', NULL, 1027824487, 'ReceiveJob', 1072056330, '"^ROLF AKS 1.txt$"', 1, 1, '2010-11-08 15:56:13', '2010-11-15 17:06:21', '', NULL),
(1066346148, NULL, '2010-11-15 17:06:27', '2010-11-15 16:41:13', 14400, 20, 'Конвертируем в csv', 1066346023, 980190983, 'ConvertJob', 1072056296, '".*"', 1, 1, '2010-11-08 16:12:53', '2010-11-15 17:06:27', '', NULL),
(1066346149, NULL, '2010-11-15 17:06:30', '2010-11-15 16:29:31', 2592000, 20, 'Конвертируем в csv', 1066346027, 980190984, 'ConvertJob', 239384643, '".*"', 1, 1, '2010-11-08 16:18:48', '2010-11-15 17:06:30', '', ''),
(1066346150, NULL, '2010-11-15 16:29:31', '2010-11-15 16:29:46', 2592000, 20, 'Берем только начинающиеся на SE', 1066346149, 9, 'FilterJob', 239384643, '".*"', 0, 1, '2010-11-08 16:20:26', '2010-11-15 16:29:46', 'SB', NULL),
(1066346151, NULL, '2010-11-15 16:29:31', '2010-11-15 16:29:50', 2592000, 20, 'Берем только начинающиеся на SE', 1066346149, 10, 'FilterJob', 239384643, '".*"', 0, 1, '2010-11-08 16:21:00', '2010-11-15 16:29:50', 'SE', ''),
(1066346157, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:04', 14400, 20, 'прием', NULL, 1027824489, 'ReceiveJob', 1072056334, '"^тойота мицубиси.xls$"', 1, 1, '2010-11-09 08:05:44', '2010-11-15 17:06:21', '', NULL),
(1066346158, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:05', 14400, 20, 'Тот же прием, только с "-1"', NULL, 1027824391, 'ReceiveJob', 1072056300, '"^ACSCOM-1.xls$"', 1, 1, '2010-11-09 08:21:37', '2010-11-15 17:06:21', '', ''),
(1066346159, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:06', 14400, 20, 'Другой прием из папки', NULL, 1027824490, 'ReceiveJob', 1072056302, '"(?i-mx:^SKLAD HIMki)"', 1, 1, '2010-11-09 08:23:21', '2010-11-15 17:06:21', '', NULL),
(1066346160, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:07', 14400, 20, 'Другой прием из папки', NULL, 1027824394, 'ReceiveJob', 1072056303, '"^skl-1.xls$"', 1, 1, '2010-11-09 08:25:47', '2010-11-15 17:06:21', '', NULL),
(1066346161, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:08', 14400, 20, 'Прием', NULL, 1027824491, 'ReceiveJob', 1072056297, '"^FORUM-AUTO - 1.xls$"', 1, 1, '2010-11-09 08:38:21', '2010-11-15 17:06:21', '', NULL),
(1066346162, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:09', 14400, 20, 'Прием', NULL, 1027824492, 'ReceiveJob', 1072056298, '"^splintex_stock-1.xls$"', 1, 1, '2010-11-09 08:43:47', '2010-11-15 17:06:21', '', NULL),
(1066346163, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:10', 14400, 20, 'Прием', NULL, 1027824493, 'ReceiveJob', 1072056299, '"^Forward-1.xls$"', 1, 1, '2010-11-09 08:45:39', '2010-11-15 17:06:21', '', NULL),
(1066346164, NULL, '2010-11-15 16:07:55', '2010-11-15 16:08:57', 14400, 20, 'Конвертируем в csv', 1066346163, 980190985, 'ConvertJob', 1072056299, '".*"', 0, 1, '2010-11-09 08:59:00', '2010-11-15 16:08:57', '', NULL),
(1066346165, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:10', 14400, 20, 'Прием', NULL, 1027824494, 'ReceiveJob', 1072056334, '"^тойота мицубиси-1.xls$"', 1, 1, '2010-11-09 09:10:50', '2010-11-15 17:06:21', '', NULL),
(1066346166, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:13', 14400, 20, 'Прием', NULL, 1027824495, 'ReceiveJob', 1072056304, '".*"', 1, 1, '2010-11-09 10:03:32', '2010-11-15 17:06:21', '', NULL),
(1066346215, NULL, '2010-11-15 16:08:11', '2010-11-15 16:09:11', 4000, 20, 'Нормализация', 1066346203, 14, 'FilterJob', 1072056300, '".*"', 0, 1, '2010-11-10 16:21:30', '2010-11-15 16:09:11', 'n', ''),
(1066346216, NULL, '2010-11-15 16:28:32', '2010-11-15 16:29:30', NULL, NULL, 'Нормализация', 1066346233, 15, 'FilterJob', 1072056317, '".*"', 0, 1, '2010-11-10 16:23:29', '2010-11-15 16:29:30', 'n', ''),
(1066346172, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:15', 14400, 20, 'Прием', NULL, 1027824502, 'ReceiveJob', 1072056318, '".*"', 1, 1, '2010-11-09 10:34:26', '2010-11-15 17:06:21', '', ''),
(1066346170, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:16', 14400, 20, 'Прием', NULL, 1027824500, 'ReceiveJob', 1072056311, '".*"', 1, 1, '2010-11-09 10:28:00', '2010-11-15 17:06:21', '', NULL),
(1066346171, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:22', 14400, 20, 'Прием', NULL, 1027824501, 'ReceiveJob', 1072056315, '".*"', 1, 1, '2010-11-09 10:31:49', '2010-11-15 17:06:21', '', NULL),
(1066346169, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:22', 14400, 20, 'Прием с фтп', NULL, 1027824499, 'ReceiveJob', 1072056310, '"^BUHLOG.txt$"', 1, 1, '2010-11-09 10:26:35', '2010-11-15 17:06:21', '', NULL),
(1066346173, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:23', 14400, 20, 'Прием', NULL, 1027824411, 'ReceiveJob', 1072056319, '".*"', 1, 1, '2010-11-09 10:36:39', '2010-11-15 17:06:21', '', NULL),
(1066346176, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:03:19', 14400, 20, 'Прием', NULL, 1027824505, 'ReceiveJob', 1072056322, '".*"', 1, 1, '2010-11-09 11:10:59', '2010-11-15 17:06:21', '', NULL),
(1066346175, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:28', 14400, 20, 'Прием', NULL, 1027824504, 'ReceiveJob', 1072056305, '".*"', 1, 1, '2010-11-09 10:41:37', '2010-11-15 17:06:21', '', NULL),
(1066346177, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:30', 14400, 20, 'Прием', NULL, 1027824506, 'ReceiveJob', 1072056326, '".*"', 1, 1, '2010-11-09 11:22:34', '2010-11-15 17:06:21', '', NULL),
(1066346178, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:32', 14400, 20, 'Прием', NULL, 1027824507, 'ReceiveJob', 1072056327, '".*"', 1, 1, '2010-11-09 11:23:33', '2010-11-15 17:06:21', '', NULL),
(1066346179, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:33', 14400, 20, 'Прием', NULL, 1027824508, 'ReceiveJob', 594805345, '".*"', 1, 1, '2010-11-09 11:27:58', '2010-11-15 17:06:21', '', NULL),
(1066346180, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:34', 14400, 20, '102_Загрузить прайс ЛУЦИД', NULL, 1027824509, 'ReceiveJob', 1072056326, '".*"', 1, 1, '2010-11-09 11:29:29', '2010-11-15 17:06:21', '', NULL),
(1066346181, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:34', 14400, 20, 'Прием', NULL, 1027824511, 'ReceiveJob', 1072056329, '"^Novline.xls$"', 1, 1, '2010-11-09 11:33:31', '2010-11-15 17:06:21', '', NULL),
(1066346184, NULL, '2010-11-10 10:29:12', '2010-11-10 10:29:16', 4000, 20, 'Распаковка rar', 1066346183, 980190969, 'UnpackJob', 1072056335, '.*', 0, 1, '2010-11-10 07:21:17', '2010-11-10 10:29:16', '', NULL),
(1066346183, '2010-11-14 21:00:00', '2010-11-14 18:04:34', '2010-11-10 10:29:09', 4000, 20, 'Заглушка для приема', NULL, NULL, NULL, 1072056335, '".*"', 1, 1, '2010-11-10 07:20:28', '2010-11-14 18:04:34', '', 'maal79@mail.ru\r\n\r\nПрайс по хонде АВТОФОКС\r\n\r\n\r\n\r\n\r\nСовременная мобильная почта - для смартфонов и телефонов.\r\n\r\nОцените мобильный m.mail.ru с Вашего телефона\r\n\r\n\r\n\r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5603 (20101109) __________\r\n\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n\r\n'),
(1066346182, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:36', 4000, 20, 'Прием', NULL, 1027824512, 'ReceiveJob', 1072056323, '".*"', 1, 1, '2010-11-09 11:45:01', '2010-11-15 17:06:21', '', NULL),
(1066346185, NULL, '2010-11-10 10:29:16', '2010-11-10 10:29:24', 4000, 20, 'Конвертируем в csv', 1066346184, 980190986, 'ConvertJob', 1072056335, '".*"', 0, 1, '2010-11-10 07:22:07', '2010-11-10 10:29:24', '', NULL),
(1066346187, '2010-11-10 08:51:00', '2010-11-10 08:51:00', NULL, 4000, 20, 'Конвертируем в csv', 1066346186, 980190987, 'ConvertJob', 1072056316, '".*"', 0, 1, '2010-11-10 08:51:52', '2010-11-10 08:52:19', '', NULL),
(1066346188, '2010-11-10 08:52:00', '2010-11-10 08:52:00', NULL, 4000, 20, 'Распаковка', 1066346186, NULL, NULL, 1072056316, '".*"', 0, 1, '2010-11-10 08:52:37', '2010-11-10 08:52:48', '', NULL),
(1066346189, '2010-11-10 08:53:00', '2010-11-15 08:56:25', '2010-11-15 08:56:25', NULL, NULL, 'Ручной прием из почты', NULL, NULL, NULL, 1072056316, '".*"', 0, 1, '2010-11-10 08:53:27', '2010-11-15 08:56:25', '', 'spo@nikamotors.ru\r\n\r\n\r\n С уважением,\r\n\r\nСпециалист оптовых продаж ОЗЧ\r\n\r\nГумелевский Максим Валерьевич\r\n\r\n\r\nТойота Центр Отрадное (ООО "Ника Моторс Холдинг") \r\n\r\n\r\n127566, г. Москва, ул. Римского-Корсакова, д.3 \r\n\r\n\r\ntel +7(495)780-78-78 int 1306: \r\n\r\n\r\nspo@nikamotors.ru\r\n\r\nmgum@nikamotors.ru\r\n\r\n\r\nwww.toyotanm.ru\r\n\r\n\r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5605 (20101109) __________\r\n\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n\r\n'),
(1066346190, NULL, '2010-11-15 08:56:25', '2010-11-15 08:56:29', NULL, NULL, 'Распаковка 2', 1066346189, 980190971, 'UnpackJob', 1072056316, '".*"', 0, 1, '2010-11-10 08:53:42', '2010-11-15 08:56:29', '', ''),
(1066346191, NULL, '2010-11-15 08:56:29', '2010-11-15 09:02:43', 172800, 20, 'Конвертируем в csv', 1066346190, 980190988, 'ConvertJob', 1072056316, '".*"', 0, 1, '2010-11-10 08:54:17', '2010-11-15 09:02:43', '', ''),
(1066346192, NULL, '2010-11-14 19:21:55', '2010-11-14 19:21:55', 4000, 20, 'Заглушка для ручного приема', NULL, 1027824514, 'ReceiveJob', 1072056336, '".*"', 1, 1, '2010-11-10 10:39:14', '2010-11-14 19:21:55', '', 'Здравствуйте, .\r\n\r\n\r\n\r\n\r\n---------- Пересылаемое письмо ----------\r\n\r\nОт:                  Alexey Manaenkov <am@sia-motors.ru>\r\n\r\nК:                   Гапонова Наталия <gaponova_n@avtorif.ru>\r\n\r\nА также к:           \r\n\r\nВремя создания:      Tue, 9 Nov 2010 12:19:55 +0300\r\n\r\nТема:                Обновите прайс MMC.\r\n\r\nПрикрепленные файлы: Письмо.html, Mitsubishi_11_10.rar\r\n\r\n\r\nНаталья день добрый, обновите пож. прайс по митцу.\r\n\r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5602 (20101108) __________\r\n\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n\r\n\r\n\r\n\r\n---------- Конец пересылаемого письма ----------\r\n\r\n-- \r\n\r\nС уважением,\r\n\r\n Гапонова                          mailto:gaponova_n@avtorif.ru\r\n\r\nПисьмо.html\r\n\r\nНаталья день добрый, обновите пож. прайс по митцу.\r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5602 (20101108) __________\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n'),
(1066346193, NULL, '2010-11-14 19:21:55', '2010-11-14 19:21:59', 4000, 20, 'распаковать', 1066346192, 980190977, 'UnpackJob', 1072056336, '".*"', 0, 1, '2010-11-10 10:40:03', '2010-11-14 19:21:59', '', ''),
(1066346194, NULL, '2010-11-14 19:21:59', '2010-11-14 19:22:02', 4000, 20, 'Конвертируем в csv', 1066346193, 980190990, 'ConvertJob', 1072056336, '".*"', 0, 1, '2010-11-10 10:42:09', '2010-11-14 19:22:02', '', ''),
(1066346195, NULL, '2010-11-15 08:27:18', '2010-11-15 08:27:18', 4000, 20, 'Ручник', NULL, 1027824515, 'ReceiveJob', 1072056328, '".*"', 1, 1, '2010-11-10 11:30:31', '2010-11-15 08:27:18', '', 'spo@nikamotors.ru\r\n\r\n С уважением,\r\n\r\nСпециалист оптовых продаж ОЗЧ\r\n\r\nГумелевский Максим Валерьевич\r\n\r\n\r\nТойота Центр Отрадное (ООО "Ника Моторс Холдинг") \r\n\r\n\r\n127566, г. Москва, ул. Римского-Корсакова, д.3 \r\n\r\n\r\ntel +7(495)780-78-78 int 1306: \r\n\r\n\r\nspo@nikamotors.ru\r\n\r\nmgum@nikamotors.ru\r\n\r\n\r\nwww.toyotanm.ru\r\n\r\n\r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5605 (20101109) __________\r\n\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\n\r\nhttp://www.esetnod32.ru/.ml'),
(1066346196, NULL, '2010-11-15 08:27:19', '2010-11-15 08:27:29', 4000, 20, 'Конвертируем в csv', 1066346195, 980190992, 'ConvertJob', 1072056328, '".*"', 0, 1, '2010-11-10 11:32:12', '2010-11-15 08:27:29', '', ''),
(1066346197, '2010-11-10 11:37:00', '2010-11-13 14:28:41', '2010-11-13 14:28:41', 4000, 20, 'Ручник', NULL, NULL, NULL, 1072056337, '".*"', 0, 1, '2010-11-10 11:37:28', '2010-11-13 14:28:41', '', 'volkov@avtorif.ru\r\n\r\nЗдравствуйте, support@avtorif.ru.\r\n\r\n\r\nэто письмо пришло в Авториф (на мою почту) в 20-22 08/11/2010\r\n\r\n\r\nпочему его нет на почте support@avtorif.ru ?\r\n\r\n\r\n---------- Пересылаемое письмо ----------\r\n\r\nОт:                  Avers Co., Vasiliy <vasiliy@avrs.ru>\r\n\r\nК:                   Волков Владимир Владиславович <volkov@avtorif.ru>\r\n\r\nА также к:           support@avtorif.ru\r\n\r\nВремя создания:      Mon, 8 Nov 2010 20:22:06 +0300\r\n\r\nТема:                обновление прайса\r\n\r\nПрикрепленные файлы: Письмо.html, price_mc.rar\r\n\r\n\r\nДобрый день.\r\n\r\n\r\nОбновленный прайс по митсубиси, все типы доставки.\r\n\r\n\r\n\r\n-- \r\n\r\nС уважением,\r\n\r\n Vasiliy                          mailto:vasiliy@avrs.ru\r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5602 (20101108) __________\r\n\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n\r\n\r\n\r\n\r\n---------- Конец пересылаемого письма ----------\r\n\r\n-- \r\n\r\nС уважением,\r\n\r\n Волков                          mailto:volkov@avtorif.ru\r\n\r\nПисьмо.html\r\n\r\nДобрый день.\r\n\r\nОбновленный прайс по митсубиси, все типы доставки.\r\n\r\n\r\n-- \r\nС уважением,\r\n Vasiliy                          mailto:vasiliy@avrs.ru\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5602 (20101108) __________\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n'),
(1066346198, NULL, '2010-11-13 14:28:41', '2010-11-13 14:28:42', 4000, 20, 'Распаковка', 1066346197, 980190978, 'UnpackJob', 1072056337, '".*"', 0, 1, '2010-11-10 11:38:12', '2010-11-13 14:28:42', '', ''),
(1066346199, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 17:01:36', 4000, 20, 'Прием с фтп', NULL, 1027824516, 'ReceiveJob', 1072056332, '".*"', 1, 1, '2010-11-10 11:41:20', '2010-11-15 17:06:21', '', 'В тестовом пока режиме подключить прайс-лист по наличию нового поставщика - Лекс Моторс.\r\n\r\nони выкладывают своё наличие на наш FTP:\r\n\r\nЛогин: leks\r\nПароль: Udj6sK310s\r\nС уважением, Андреев А.Н.\r\nнач.отд.з/ч ООО "АВТОРИФ"\r\nт. (495) 785-64-95 доб.2-23 или 2-40, (499) 903-68-22 доб.2-23 или 2-40\r\nandreev_a@avtorif.ru\r\n \r\n \r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5584 (20101102) __________\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n\r\n\r\n\r\n \r\nДобрый день !\r\n \r\n1) Состояние складов они будут выкладывать ежедневно вечером до 20.00ч., поэтому в загрузчик на точки можно включать в 07.00ч. следующего дня.\r\n\r\n2) в строке "Валюта закупки:" - руб.\r\n3) в строке "Срок доставки:"   - 3 дня\r\n \r\n4) в строке "Процент наценки:"  - 30%\r\n \r\n5) в строке "Учитывать вес при продаже:"  - Нет\r\n \r\n6) при автоматической отправке заказов поставщику должен быть забит эл.адрес их почты - orders@lexm.ru\r\n \r\n7) заказы этого поставщика должны иметь абривиатуру - LEX - .... \r\n    \r\nС уважением, Андреев А.Н.\r\nт. (495) 785-64-95 доб.2-23 или 2-40, (499) 903-68-22 доб.2-23 или 2-40\r\nandreev_a@avtorif.ru\r\n\r\n\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5584 (20101102) __________\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\nhttp://www.esetnod32.ru/.ml\r\n'),
(1066346200, NULL, '2010-11-15 16:08:03', '2010-11-15 16:09:05', 2592000, 20, 'Конвертируем в csv', 1066346199, 980190993, 'ConvertJob', 1072056332, '".*"', 0, 1, '2010-11-10 11:43:06', '2010-11-15 16:09:05', '', ''),
(1066346201, '2010-11-10 12:21:00', '2010-11-10 12:23:09', '2010-11-10 12:23:09', 4000, 20, 'пустышка', NULL, 980190994, 'ConvertJob', 1072056338, '".*"', 0, 1, '2010-11-10 12:22:00', '2010-11-10 12:23:09', '', 'Здравствуйте Support,\r\n\r\n  обновление прайса наличия Акира Ойл. Кол-во проставляем - 500 шт.\r\n\r\n-- С уважением, Волков Владимир mailto:volkov@avtorif.ru '),
(1066346202, NULL, '2010-11-10 12:23:09', '2010-11-10 12:23:15', 4000, 20, 'Конвертируем в csv', 1066346201, 980190995, 'ConvertJob', 1072056338, '".*"', 0, 1, '2010-11-10 12:22:46', '2010-11-10 12:23:15', '', '');
INSERT INTO `jobs` (`id`, `next_start`, `last_start`, `last_finish`, `seconds_between_jobs`, `seconds_working`, `title`, `job_id`, `jobable_id`, `jobable_type`, `supplier_id`, `file_mask`, `locked`, `active`, `created_at`, `updated_at`, `job_code`, `description`) VALUES
(1066346205, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 16:08:47', 4000, 20, 'Skoda ФГР', NULL, 1027824521, 'ReceiveJob', 1044098171, '1', 1, 1, '2010-11-10 15:24:39', '2010-11-15 17:06:21', '', 'Здравствуйте, .\r\n\r\n\r\n\r\n---------- Пересылаемое письмо ----------\r\nОт:                  a.lomakin@pelican.ru <a.lomakin@pelican.ru>\r\nК:                   Архаров Виталий М. <arharov_vm@avtorif.ru>\r\nА также к:           \r\nВремя создания:      Wed, 10 Nov 2010 16:44:57 +0300\r\nТема:                Fwd: Re: Пеликан-Авто НЕ  МОГУ НАЙТИ ПРАЙСЫ!\r\nПрикрепленные файлы: Письмо.html\r\n\r\n \r\n Здравствуйте, Архаров.\r\n \r\n \r\n 1)PEL.xls-\r\n Nissan Вагоноремонтная\r\n Nissan Дмитровка\r\n 2)PEC.xls-\r\n Nissan HMP\r\n 3)PER.xls-\r\n Спецпрайс Вагоноремонтная\r\n Склад ОПТ\r\n 4)PE1.xls-\r\n Склад 1\r\n \r\n \r\n \r\n \r\n -- \r\n С уважением ,\r\n Начальник отдела оптовой торговли\r\n Компании "Пеликан Авто"\r\n Ломакин Александр\r\n \r\n Вы писали 10 ноября 2010 г., 16:22:13:\r\n Архаров Виталий М.> Здравствуйте, .\r\n \r\n \r\n \r\n Архаров Виталий М.> ---------- Пересылаемое письмо ----------\r\n Архаров Виталий М.> От:                  Архаров Виталий М. <arharov_vm@avtorif.ru>\r\n Архаров Виталий М.> К:                   d.knyazev@pelican.ru\r\n Архаров Виталий М.> А также к:           \r\n Архаров Виталий М.> Время создания:      Wed, 10 Nov 2010 16:21:12 +0300\r\n Архаров Виталий М.> Тема:                Пеликан-Авто\r\n Архаров Виталий М.> Прикрепленные файлы: <none>\r\n \r\n Архаров Виталий М.> Здравствуйте, d.\r\n \r\n Архаров Виталий М.> Вы писали 10 ноября 2010 г., 14:19:28:\r\n \r\n >>   \r\n >>   \r\n \r\n >>  \r\n \r\n >>  \r\n >> День добрый, Виталий! \r\n >> Прошу Вас обратить внимание, что теперь на нашем сайте вы можете\r\n >> заказывать запчасти c центрального склада на автомобили марки TOYOTA\r\n >> (прайс-лист "Toyota ТМР" ), срок поставки 2 раб. дня. \r\n >>  \r\n \r\n >>  \r\n >> Вот ссылка по которой вы попадёте на наш сайт и в разделе "Прайс\r\n >> листы" сможете скачивать наши прайсы : \r\n >>  \r\n \r\n >>  \r\n \r\n >>  \r\n >> http://sklad.pelican.ru \r\n >>  \r\n \r\n >>  \r\n \r\n >>  \r\n >> Логин     АВТОРИФ (БУКВЫ ЗАГЛАВНЫЕ , при регистрации на сайте -\r\n >> логин и пароль не вносить методом копирования) \r\n >>  \r\n \r\n >>  \r\n >> Пароль     7240 \r\n >>  \r\n \r\n >>  \r\n \r\n Архаров Виталий М.> А какие у вас прайсы соответствуют когда вы на FTP выкладывали?\r\n Архаров Виталий М.> 1)PEL.xls-\r\n Архаров Виталий М.> 2)PEC.xls-\r\n Архаров Виталий М.> 3)PER.xls-\r\n Архаров Виталий М.> 4)PE1.xls-\r\n \r\n Архаров Виталий М.> ?не могу их найти!\r\n \r\n Архаров Виталий М.> -- \r\n Архаров Виталий М.> С уважением,\r\n Архаров Виталий М.> Архаров, Желаю удачного рабочего дня!            \r\n Архаров Виталий М.> mailto:arharov_vm@avtorif.ru\r\n \r\n \r\n Архаров Виталий М.> ---------- Конец пересылаемого письма ----------\r\n \r\n __________ Information from ESET NOD32 Antivirus, version of virus signature database 5606 (20101110) __________\r\n \r\n The message was checked by ESET NOD32 Antivirus.\r\n \r\n http://www.esetnod32.ru/.ml\r\n  \r\n  \r\n\r\n---------- Конец пересылаемого письма ----------\r\n-- С уважением, Архаров, Желаю удачного рабочего дня! mailto:arharov_vm@avtorif.ru\r\n\r\n\r\n1.eml\r\nSubject:\r\nRe: Fwd: Re: Пеликан-Авто НЕ МОГУ НАЙТИ ПРАЙСЫ!\r\nFrom:\r\na.lomakin@pelican.ru\r\nDate:\r\nWed, 10 Nov 2010 16:44:57 +0300\r\nTo:\r\nАрхаров Виталий М. <arharov_vm@avtorif.ru>\r\n\r\nЗдравствуйте, Архаров.\r\n\r\n\r\n1)PEL.xls-\r\nNissan Вагоноремонтная\r\nNissan Дмитровка\r\n2)PEC.xls-\r\nNissan HMP\r\n3)PER.xls-\r\nСпецпрайс Вагоноремонтная\r\nСклад ОПТ\r\n4)PE1.xls-\r\nСклад 1\r\n\r\n\r\n\r\n\r\n-- \r\nС уважением ,\r\nНачальник отдела оптовой торговли\r\nКомпании "Пеликан Авто"\r\nЛомакин Александр\r\n\r\nВы писали 10 ноября 2010 г., 16:22:13:\r\nАрхаров Виталий М.> Здравствуйте, .\r\n\r\n\r\n\r\nАрхаров Виталий М.> ---------- Пересылаемое письмо ----------\r\nАрхаров Виталий М.> От:                  Архаров Виталий М. <arharov_vm@avtorif.ru>\r\nАрхаров Виталий М.> К:                   d.knyazev@pelican.ru\r\nАрхаров Виталий М.> А также к:           \r\nАрхаров Виталий М.> Время создания:      Wed, 10 Nov 2010 16:21:12 +0300\r\nАрхаров Виталий М.> Тема:                Пеликан-Авто\r\nАрхаров Виталий М.> Прикрепленные файлы: <none>\r\n\r\nАрхаров Виталий М.> Здравствуйте, d.\r\n\r\nАрхаров Виталий М.> Вы писали 10 ноября 2010 г., 14:19:28:\r\n\r\n>>   \r\n>>   \r\n\r\n>>  \r\n\r\n>>  \r\n>> День добрый, Виталий! \r\n>> Прошу Вас обратить внимание, что теперь на нашем сайте вы можете\r\n>> заказывать запчасти c центрального склада на автомобили марки TOYOTA\r\n>> (прайс-лист "Toyota ТМР" ), срок поставки 2 раб. дня. \r\n>>  \r\n\r\n>>  \r\n>> Вот ссылка по которой вы попадёте на наш сайт и в разделе "Прайс\r\n>> листы" сможете скачивать наши прайсы : \r\n>>  \r\n\r\n>>  \r\n\r\n>>  \r\n>> http://sklad.pelican.ru \r\n>>  \r\n\r\n>>  \r\n\r\n>>  \r\n>> Логин     АВТОРИФ (БУКВЫ ЗАГЛАВНЫЕ , при регистрации на сайте -\r\n>> логин и пароль не вносить методом копирования) \r\n>>  \r\n\r\n>>  \r\n>> Пароль     7240 \r\n>>  \r\n\r\n>>  \r\n\r\nАрхаров Виталий М.> А какие у вас прайсы соответствуют когда вы на FTP выкладывали?\r\nАрхаров Виталий М.> 1)PEL.xls-\r\nАрхаров Виталий М.> 2)PEC.xls-\r\nАрхаров Виталий М.> 3)PER.xls-\r\nАрхаров Виталий М.> 4)PE1.xls-\r\n\r\nАрхаров Виталий М.> ?не могу их найти!\r\n\r\nАрхаров Виталий М.> -- \r\nАрхаров Виталий М.> С уважением,\r\nАрхаров Виталий М.> Архаров, Желаю удачного рабочего дня!            \r\nАрхаров Виталий М.> mailto:arharov_vm@avtorif.ru\r\n\r\n\r\nАрхаров Виталий М.> ---------- Конец пересылаемого письма ----------\r\n\r\n__________ Information from ESET NOD32 Antivirus, version of virus signature database 5606 (20101110) __________\r\n\r\nThe message was checked by ESET NOD32 Antivirus.\r\n\r\nhttp://www.esetnod32.ru/.ml'),
(1066346203, NULL, '2010-11-15 16:07:55', '2010-11-15 16:08:11', 4000, 20, 'Конвертируем в csv', 1066346158, 980190999, 'ConvertJob', 1072056300, '".*"', 0, 1, '2010-11-10 12:55:43', '2010-11-15 16:08:11', '', ''),
(1066346234, NULL, '2010-11-15 16:28:35', '2010-11-15 16:29:32', 4000, 20, 'Фильтрация', 1066346217, 21, 'FilterJob', 1072056314, '".*"', 0, 1, '2010-11-13 12:47:32', '2010-11-15 16:29:32', 'hjk', ''),
(1066346219, NULL, '2010-11-15 16:09:07', '2010-11-15 16:09:37', 4000, 20, 'Нормализация febestrif.txt', 1066346223, 16, 'FilterJob', 1072056318, '"^febestrif.txt$"', 0, 1, '2010-11-10 17:31:51', '2010-11-15 16:09:37', 'g', ''),
(1066346208, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 16:08:13', 4000, 20, 'Skoda Вагоноремонтная', NULL, 1027824521, 'ReceiveJob', 1044098171, '7', 1, 1, '2010-11-10 15:38:16', '2010-11-15 17:06:21', '', ''),
(1066346207, '2010-11-15 21:00:00', '2010-11-15 17:06:21', '2010-11-15 16:09:03', 4000, 20, 'Nissan HMP', NULL, 1027824521, 'ReceiveJob', 1044098171, '6', 1, 1, '2010-11-10 15:37:08', '2010-11-15 17:06:21', '', ''),
(1066346209, '2010-11-15 21:00:00', '2010-11-15 17:06:22', '2010-11-15 16:09:03', 4000, 20, 'Спецпрайс Вагоноремонтная', NULL, 1027824521, 'ReceiveJob', 1044098171, '8', 1, 1, '2010-11-10 15:38:49', '2010-11-15 17:06:22', '', ''),
(1066346210, '2010-11-15 21:00:00', '2010-11-15 17:06:22', '2010-11-15 16:09:05', 4000, 20, 'Nissan Вагоноремонтная', NULL, 1027824521, 'ReceiveJob', 1044098171, '11', 1, 1, '2010-11-10 15:39:33', '2010-11-15 17:06:22', '', ''),
(1066346211, '2010-11-15 21:00:00', '2010-11-15 17:06:22', '2010-11-15 16:09:06', 4000, 20, 'Nissan Дмитровка', NULL, 1027824521, 'ReceiveJob', 1044098171, '12', 1, 1, '2010-11-10 15:39:59', '2010-11-15 17:06:22', '', ''),
(1066346212, '2010-11-15 21:00:00', '2010-11-15 17:06:22', '2010-11-15 16:09:05', 4000, 20, 'Склад ОПТ', NULL, 1027824521, 'ReceiveJob', 1044098171, '14', 1, 1, '2010-11-10 15:40:19', '2010-11-15 17:06:22', '', ''),
(1066346213, '2010-11-15 21:00:00', '2010-11-15 17:06:22', '2010-11-15 16:07:14', 4000, 20, 'Toyota ТМР', NULL, 1027824521, 'ReceiveJob', 1044098171, '17', 1, 1, '2010-11-10 15:40:40', '2010-11-15 17:06:22', '', ''),
(1066346214, NULL, '2010-11-10 15:54:44', '2010-11-10 15:56:05', 4000, 20, 'Тестовое конвертирование в csv', 1066346206, 980191000, 'ConvertJob', 1044098171, '".*"', 0, 1, '2010-11-10 15:53:28', '2010-11-10 15:56:05', '', ''),
(1066346225, NULL, '2010-11-11 16:57:31', '2010-11-11 16:57:35', 4000, 20, 'распаковка', 1066346224, 980190983, 'UnpackJob', 1072056305, '".*"', 0, 1, '2010-11-11 16:45:41', '2010-11-11 16:57:35', '', ''),
(1066346226, NULL, '2010-11-11 16:57:35', '2010-11-11 16:57:39', 4000, 20, 'конвертирование', 1066346225, 980191004, 'ConvertJob', 1072056305, '".*"', 0, 1, '2010-11-11 16:46:10', '2010-11-11 16:57:39', '', ''),
(1066346227, NULL, '2010-11-15 16:08:02', '2010-11-15 16:08:48', NULL, NULL, 'Конвертирование №%;%? формата', 1066346179, 980191005, 'ConvertJob', 594805345, '".*"', 0, 1, '2010-11-12 12:24:15', '2010-11-15 16:08:48', '', ''),
(1066346228, NULL, '2010-11-15 16:08:48', '2010-11-14 19:36:42', 172800, 20, 'Фильтрация', 1066346227, 19, 'FilterJob', 594805345, '".*"', 1, 1, '2010-11-12 14:29:11', '2010-11-15 16:08:48', 'kkgd', ''),
(1066346229, NULL, '2010-11-15 16:09:07', '2010-11-15 16:09:39', 4000, 20, 'Нормализация asvarif-1.txt', 1066346223, 20, 'FilterJob', 1072056318, '"^asvarif-1.txt$"', 0, 1, '2010-11-12 15:31:49', '2010-11-15 16:09:39', 'nbnb', ''),
(1066346230, NULL, '2010-11-15 16:08:09', '2010-11-15 16:09:08', 4000, 20, 'Преобразование *?:% формата для ASVARIF.TXT', 1066346172, 980191006, 'ConvertJob', 1072056318, '"^ASVARIF.TXT$"', 0, 1, '2010-11-12 15:37:19', '2010-11-15 16:09:08', '', ''),
(1066346231, '2010-11-12 16:20:00', '2010-11-15 16:51:07', '2010-11-15 16:51:07', NULL, NULL, 'Ручник', NULL, NULL, NULL, 1072056340, '".*"', 0, 1, '2010-11-12 16:20:54', '2010-11-15 16:51:07', '', 'rnoil-09@mail.ru\r\n\r\n-- \r\nС уважением, Базанова Ольга.\r\nКоординатор отдела продаж\r\nКомпании "Мировые смазочные материалы"\r\n(ИП Тунгусов Д.Г.)\r\nтел. (495) 617-15-31\r\ne-mail: rnoil-09@mail.ru\r\n'),
(1066346232, NULL, '2010-11-15 16:51:07', '2010-11-15 16:51:17', 129600, 200, 'Конвертирование из экселя в csv', 1066346231, 980191007, 'ConvertJob', 1072056340, '".*"', 0, 1, '2010-11-12 16:21:24', '2010-11-15 16:51:17', '', ''),
(1066346235, NULL, '2010-11-15 16:09:02', '2010-11-15 16:09:33', 4000, 20, 'Нормализуем Лист1', 1066346218, 22, 'FilterJob', 1072056303, '"^Лист1$"', 0, 1, '2010-11-13 12:55:56', '2010-11-15 16:09:33', 'list1', ''),
(1066346237, NULL, '2010-11-15 16:29:26', '2010-11-15 16:29:46', 4000, 20, 'Конвертируем в csv', 1066346236, 23, 'FilterJob', 594805345, '".*"', 0, 1, '2010-11-13 14:18:39', '2010-11-15 16:29:46', 'llkcsd', ''),
(1066346238, NULL, '2010-11-13 14:28:42', '2010-11-13 14:29:39', 4000, 20, 'Фильтруем', 1066346198, 25, 'FilterJob', 1072056337, '".*"', 0, 1, '2010-11-13 14:26:53', '2010-11-13 14:29:39', 'lls', ''),
(1066346236, NULL, '2010-11-15 16:28:18', '2010-11-15 16:29:26', 4000, 20, 'Перекодирование', 1066346075, 980191009, 'ConvertJob', 594805345, '".*"', 0, 1, '2010-11-13 14:17:13', '2010-11-15 16:29:26', '', ''),
(1066346239, '2010-11-13 14:30:00', '2010-11-15 16:48:52', '2010-11-15 16:48:52', 4000, 20, 'Приемник для ручника', NULL, NULL, NULL, 1072056308, '".*"', 0, 1, '2010-11-13 14:30:43', '2010-11-15 16:48:52', '', ''),
(1066346240, NULL, '2010-11-15 16:48:52', '2010-11-15 16:49:05', 4000, 20, 'Преобразуем из csv', 1066346239, 980191010, 'ConvertJob', 1072056308, '".*"', 0, 1, '2010-11-13 14:31:00', '2010-11-15 16:49:05', '', ''),
(1066346241, NULL, '2010-11-15 16:49:05', '2010-11-15 16:49:05', 4000, 20, 'Перекодирование', 1066346240, 980191011, 'ConvertJob', 1072056308, '".*"', 0, 1, '2010-11-13 15:03:05', '2010-11-15 16:49:05', '', ''),
(1066346244, '2010-11-14 14:57:00', '2010-11-14 14:57:00', NULL, 4000, 20, '1', NULL, NULL, NULL, 1072056341, '1', 0, 1, '2010-11-14 14:58:01', '2010-11-14 14:58:01', '', ''),
(1066346243, NULL, '2010-11-15 16:49:05', '2010-11-15 16:49:10', 4000, 20, 'Пробная фильтрация', 1066346241, 26, 'FilterJob', 1072056308, '".*"', 0, 1, '2010-11-13 16:23:43', '2010-11-15 16:49:10', 'oop', ''),
(1066346245, NULL, '2010-11-15 16:07:59', '2010-11-15 16:08:23', 4000, 20, 'Конвертируем в csv parts_major', 1066346166, 980191013, 'ConvertJob', 1072056304, '"^parts_major.txt$"', 0, 1, '2010-11-14 15:26:58', '2010-11-15 16:08:23', '', ''),
(1066346246, NULL, '2010-11-15 16:08:25', '2010-11-15 16:12:05', 4000, 20, 'Фильтруем Mazda.txt', 1066346251, 27, 'FilterJob', 1072056304, '"^Mazda.txt$"', 0, 1, '2010-11-14 15:28:17', '2010-11-15 16:12:05', 'good_fmt', ''),
(1066346247, NULL, '2010-11-15 16:08:38', '2010-11-15 16:09:24', 4000, 20, 'Конвертируем в csv', 1066346071, 980191014, 'ConvertJob', 1072056304, '".*"', 0, 1, '2010-11-14 15:30:27', '2010-11-15 16:09:24', '', ''),
(1066346248, NULL, '2010-11-15 16:09:24', '2010-11-15 16:10:36', 4000, 20, 'Фильтруем', 1066346247, 28, 'FilterJob', 1072056304, '".*"', 0, 1, '2010-11-14 15:32:17', '2010-11-15 16:10:36', '', ''),
(1066346253, NULL, '2010-11-15 16:29:27', '2010-11-15 16:29:42', 4000, 20, 'Конвертируем по правилам csv, но кавычки за спецсимвол не считаем', 1066346254, 30, 'FilterJob', 1072056329, '".*"', 0, 1, '2010-11-14 18:38:52', '2010-11-15 16:29:42', 'jija', ''),
(1066346251, NULL, '2010-11-15 16:07:59', '2010-11-15 16:08:25', 4000, 20, 'Перекодирова', 1066346166, 980191016, 'ConvertJob', 1072056304, '"^Mazda.txt$"', 0, 1, '2010-11-14 16:49:34', '2010-11-15 16:08:25', '', ''),
(1066346254, NULL, '2010-11-15 16:28:19', '2010-11-15 16:29:27', 4000, 20, 'Перекодировка из CP1251', 1066346077, 980191018, 'ConvertJob', 1072056329, '".*"', 0, 1, '2010-11-14 18:40:37', '2010-11-15 16:29:27', '', ''),
(1066346252, NULL, '2010-11-15 17:06:23', '2010-11-15 16:29:25', 4000, 20, 'Конвертируем из Excel', 427111281, 980191017, 'ConvertJob', 769483063, '".*"', 1, 1, '2010-11-14 18:36:12', '2010-11-15 17:06:23', '', ''),
(1066346255, NULL, '2010-11-15 16:08:56', '2010-11-15 16:09:32', 4000, 20, 'Фильтруем', 1066346256, 31, 'FilterJob', 480201602, '".*"', 0, 1, '2010-11-14 18:49:24', '2010-11-15 16:09:32', 'gfv', ''),
(1066346256, NULL, '2010-11-15 16:08:03', '2010-11-15 16:08:56', 4000, 20, 'Перекодирование из CP1251', 1066346060, 980191019, 'ConvertJob', 480201602, '".*"', 0, 1, '2010-11-14 18:51:03', '2010-11-15 16:08:56', '', ''),
(1066346257, NULL, '2010-11-15 16:07:57', '2010-11-15 16:08:17', 4000, 20, 'Конвертируем из Excel', 1066346161, 980191020, 'ConvertJob', 1072056297, '".*"', 0, 1, '2010-11-14 18:54:01', '2010-11-15 16:08:17', '', ''),
(1066346258, NULL, '2010-11-15 16:08:17', '2010-11-15 16:09:13', 4000, 20, 'Фильтрация', 1066346257, 32, 'FilterJob', 1072056297, '".*"', 0, 1, '2010-11-14 18:54:51', '2010-11-15 16:09:13', 'jhgyt', ''),
(1066346259, NULL, '2010-11-15 17:06:25', '2010-11-15 16:29:23', 4000, 20, 'Перекодирова', 852046107, 980191021, 'ConvertJob', 854858892, '".*"', 1, 1, '2010-11-14 19:02:55', '2010-11-15 17:06:25', '', ''),
(1066346260, NULL, '2010-11-15 16:29:23', '2010-11-15 16:29:36', 4000, 20, 'Конвертируем в csv', 1066346259, 33, 'FilterJob', 854858892, '".*"', 0, 1, '2010-11-14 19:04:32', '2010-11-15 16:29:36', 'dfgredb', ''),
(1066346261, NULL, '2010-11-15 16:08:04', '2010-11-15 16:08:59', 4000, 20, 'Какой-то так надо :)', 1066346171, 980191022, 'ConvertJob', 1072056315, '"ТакНадо.xls"', 0, 1, '2010-11-14 19:12:51', '2010-11-15 16:08:59', '', ''),
(1066346262, NULL, '2010-11-15 16:08:08', '2010-11-15 16:09:19', 4000, 20, 'Конвертируем оба файла в csv', 1066346173, 980191023, 'ConvertJob', 1072056319, '".*"', 0, 1, '2010-11-14 19:18:25', '2010-11-15 16:09:19', '', ''),
(1066346263, NULL, '2010-11-15 16:28:13', '2010-11-15 16:29:23', 4000, 20, 'Фильтрация', 1066346051, 34, 'FilterJob', 1072056313, '".*"', 0, 1, '2010-11-14 19:23:08', '2010-11-15 16:29:23', 'kfgdkl', ''),
(1066346264, NULL, '2010-11-15 01:00:18', '2010-11-15 01:00:27', 4000, 20, 'Фильтрация', 1066346050, 35, 'FilterJob', 1072056313, '".*"', 0, 1, '2010-11-14 19:24:39', '2010-11-15 01:00:27', 'dfgsd', ''),
(1066346265, NULL, '2010-11-15 16:08:06', '2010-11-15 16:09:05', 4000, 20, 'Конвертирование из UCS-2 LE', 1066346061, 980191024, 'ConvertJob', 1072056321, '".*"', 0, 1, '2010-11-15 08:13:38', '2010-11-15 16:09:05', '', ''),
(1066346267, NULL, '2010-11-15 16:09:05', '2010-11-15 16:09:39', 4000, 20, 'Замена переносов', 1066346265, 980191025, 'ConvertJob', 1072056321, '".*"', 0, 1, '2010-11-15 08:24:44', '2010-11-15 16:09:39', '', ''),
(1066346266, NULL, '2010-11-15 16:09:39', '2010-11-15 16:11:40', 4000, 20, 'Фильтрация', 1066346267, 36, 'FilterJob', 1072056321, '".*"', 0, 1, '2010-11-15 08:15:17', '2010-11-15 16:11:40', 'fildsa', ''),
(1066346268, '2010-11-15 21:00:00', '2010-11-15 17:06:22', '2010-11-15 17:03:16', 4000, 20, 'Загрузка', NULL, 1027824415, 'ReceiveJob', 1072056322, '"777"', 1, 1, '2010-11-15 09:10:40', '2010-11-15 17:06:22', '', 'Новый прием, узнал из почты. Почему-то в Excel выгрузке отсутствует'),
(1066346269, NULL, '2010-11-15 17:03:16', '2010-11-15 17:03:37', 4000, 20, 'Распаковка архивов', 1066346268, 980190984, 'UnpackJob', 1072056322, '".*"', 0, 1, '2010-11-15 09:11:22', '2010-11-15 17:03:37', '', ''),
(1066346270, NULL, '2010-11-15 17:03:37', '2010-11-15 17:03:51', 4000, 20, 'Перекодировка', 1066346269, 980191026, 'ConvertJob', 1072056322, '".*"', 0, 1, '2010-11-15 09:14:36', '2010-11-15 17:03:51', '', ''),
(1066346271, NULL, '2010-11-15 17:03:51', '2010-11-15 17:04:02', 4000, 20, 'Фильтрация', 1066346270, 37, 'FilterJob', 1072056322, '".*"', 0, 1, '2010-11-15 09:18:27', '2010-11-15 17:04:02', 'lllp', ''),
(1066346272, NULL, '2010-11-15 16:09:08', '2010-11-15 16:09:40', 4000, 20, 'Перекодировка', 1066346230, 980191027, 'ConvertJob', 1072056318, '".*"', 0, 1, '2010-11-15 15:48:47', '2010-11-15 16:09:40', 'vvfds', '');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs_repeats`
--

CREATE TABLE IF NOT EXISTS `jobs_repeats` (
  `repeat_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `jobs_repeats`
--

INSERT INTO `jobs_repeats` (`repeat_id`, `job_id`, `created_at`, `updated_at`) VALUES
(859158658, 1066346089, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346073, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 427111281, NULL, NULL),
(859158658, 1066346049, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346047, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346060, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346048, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 852046107, NULL, NULL),
(859158658, 1066346075, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 646346657, NULL, NULL),
(859158658, 1066346072, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346046, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346040, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346039, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346086, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346022, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(859158658, 1066346023, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(859158658, 1066346024, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346025, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346026, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346027, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346035, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346038, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346037, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346036, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346050, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346045, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346041, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346052, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346053, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346054, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346056, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346057, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346058, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346059, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346061, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346062, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346063, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346064, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346065, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346066, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346067, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346068, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346083, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346051, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346069, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346084, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346071, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346074, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 552234132, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346076, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346077, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346078, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346079, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346080, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346081, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346082, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346091, '2010-10-20 11:31:09', '2010-10-20 11:59:21'),
(859158658, 1066346145, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346146, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346157, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346158, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346159, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346160, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346161, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346162, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346163, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346165, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158658, 1066346166, '2010-10-20 11:31:09', '2010-11-02 14:10:55'),
(859158659, 1066346268, '2010-11-10 15:25:07', '2010-11-10 15:25:07'),
(859158658, 1066346169, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346170, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346171, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346172, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346173, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346175, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346176, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346177, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346178, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346179, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346180, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346181, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346182, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346183, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158658, 1066346199, '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158659, 1066346205, '2010-11-10 15:25:07', '2010-11-10 15:25:07'),
(859158659, 1066346207, '2010-11-10 15:25:07', '2010-11-10 15:25:07'),
(859158659, 1066346208, '2010-11-10 15:25:07', '2010-11-10 15:25:07'),
(859158659, 1066346209, '2010-11-10 15:25:07', '2010-11-10 15:25:07'),
(859158659, 1066346210, '2010-11-10 15:25:07', '2010-11-10 15:25:07'),
(859158659, 1066346211, '2010-11-10 15:25:07', '2010-11-10 15:25:07'),
(859158659, 1066346212, '2010-11-10 15:25:07', '2010-11-10 15:25:07'),
(859158659, 1066346213, '2010-11-10 15:25:07', '2010-11-10 15:25:07');

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturers`
--

CREATE TABLE IF NOT EXISTS `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `manufacturers`
--


-- --------------------------------------------------------

--
-- Структура таблицы `mies`
--

CREATE TABLE IF NOT EXISTS `mies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `mies`
--

INSERT INTO `mies` (`id`, `created_at`, `updated_at`) VALUES
(298486374, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(980190962, '2010-10-20 11:31:09', '2010-10-20 11:31:09');

-- --------------------------------------------------------

--
-- Структура таблицы `periods`
--

CREATE TABLE IF NOT EXISTS `periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thousand_kilometers` int(11) DEFAULT NULL,
  `months` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `periods`
--

INSERT INTO `periods` (`id`, `thousand_kilometers`, `months`, `created_at`, `updated_at`) VALUES
(298486374, 1, 1, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(980190962, 1, 1, '2010-10-20 11:31:09', '2010-10-20 11:31:09');

-- --------------------------------------------------------

--
-- Структура таблицы `prices`
--

CREATE TABLE IF NOT EXISTS `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` decimal(10,0) DEFAULT NULL,
  `initial_cost` decimal(10,3) DEFAULT NULL,
  `result_cost` decimal(10,3) DEFAULT NULL,
  `margin` decimal(10,3) DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catalog_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inn` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kpp` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estimate_days` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `prices`
--


-- --------------------------------------------------------

--
-- Структура таблицы `receive_jobs`
--

CREATE TABLE IF NOT EXISTS `receive_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiveable_id` int(11) DEFAULT NULL,
  `receiveable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1027824522 ;

--
-- Дамп данных таблицы `receive_jobs`
--

INSERT INTO `receive_jobs` (`id`, `receiveable_id`, `receiveable_type`, `created_at`, `updated_at`) VALUES
(338983884, 302439171, 'EmailReceive', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(508517365, 1058689885, 'FtpReceive', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(584111877, 59105197, 'FtpReceive', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(609423326, 319468209, 'FolderReceive', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(738464244, 889787413, 'FtpReceive', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(746173547, 221035715, 'FtpReceive', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(1027824375, 752622840, 'EmailReceive', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(1027824376, 1058689886, 'FtpReceive', '2010-10-20 11:32:20', '2010-10-20 11:32:20'),
(1027824377, 1058689887, 'FtpReceive', '2010-10-20 12:05:44', '2010-10-20 12:05:44'),
(1027824378, 1058689888, 'FtpReceive', '2010-10-20 13:08:29', '2010-10-20 13:08:29'),
(1027824379, 1058689889, 'FtpReceive', '2010-10-20 13:13:56', '2010-10-20 13:13:56'),
(1027824380, 339903780, 'SmbReceive', '2010-10-20 13:19:24', '2010-10-20 13:19:24'),
(1027824391, 339903789, 'SmbReceive', '2010-10-20 14:12:30', '2010-10-20 14:12:30'),
(1027824392, 1058689892, 'FtpReceive', '2010-10-20 14:33:11', '2010-10-20 14:33:11'),
(1027824393, 1058689893, 'FtpReceive', '2010-10-20 14:38:03', '2010-10-20 14:38:03'),
(1027824394, 339903790, 'SmbReceive', '2010-10-20 15:43:00', '2010-10-20 15:43:00'),
(1027824396, 1058689895, 'FtpReceive', '2010-10-21 09:46:31', '2010-10-21 09:46:31'),
(1027824397, 339903791, 'SmbReceive', '2010-10-21 09:47:38', '2010-10-21 09:47:38'),
(1027824398, 339903792, 'SmbReceive', '2010-10-21 09:49:05', '2010-10-21 09:49:05'),
(1027824399, 1058689896, 'FtpReceive', '2010-10-21 11:34:23', '2010-10-21 11:34:23'),
(1027824401, 339903794, 'SmbReceive', '2010-10-21 12:04:20', '2010-10-21 12:04:20'),
(1027824402, 1058689897, 'FtpReceive', '2010-10-21 12:07:52', '2010-10-21 12:07:52'),
(1027824403, 1058689898, 'FtpReceive', '2010-10-21 12:10:54', '2010-10-21 12:10:54'),
(1027824404, 1058689899, 'FtpReceive', '2010-10-21 12:12:47', '2010-10-21 12:12:47'),
(1027824405, 1058689900, 'FtpReceive', '2010-10-21 12:14:26', '2010-10-21 12:14:26'),
(1027824406, 1058689901, 'FtpReceive', '2010-10-21 12:18:19', '2010-10-21 12:18:19'),
(1027824407, 1058689902, 'FtpReceive', '2010-10-21 12:20:48', '2010-10-21 12:20:48'),
(1027824408, 1058689903, 'FtpReceive', '2010-10-21 12:38:18', '2010-10-21 12:38:18'),
(1027824409, 1058689904, 'FtpReceive', '2010-10-21 12:41:48', '2010-10-21 12:41:48'),
(1027824410, 1058689905, 'FtpReceive', '2010-10-21 12:42:42', '2010-10-21 12:42:42'),
(1027824411, 339903795, 'SmbReceive', '2010-10-21 12:43:39', '2010-10-21 12:43:39'),
(1027824412, 1058689906, 'FtpReceive', '2010-10-21 12:56:34', '2010-10-21 12:56:34'),
(1027824413, 1058689907, 'FtpReceive', '2010-10-21 12:59:06', '2010-10-21 12:59:06'),
(1027824414, 339903796, 'SmbReceive', '2010-10-21 13:00:20', '2010-10-21 13:00:20'),
(1027824415, 1058689908, 'FtpReceive', '2010-10-21 13:03:39', '2010-10-21 13:03:39'),
(1027824416, 1058689909, 'FtpReceive', '2010-10-21 13:07:56', '2010-10-21 13:07:56'),
(1027824417, 1058689910, 'FtpReceive', '2010-10-21 13:12:58', '2010-10-21 13:12:58'),
(1027824418, 1058689911, 'FtpReceive', '2010-10-21 13:13:55', '2010-10-21 13:13:55'),
(1027824419, 1058689912, 'FtpReceive', '2010-10-21 13:19:18', '2010-10-21 13:19:18'),
(1027824420, 1058689913, 'FtpReceive', '2010-10-21 13:20:14', '2010-10-21 13:20:14'),
(1027824421, 339903797, 'SmbReceive', '2010-10-21 13:21:49', '2010-10-21 13:21:49'),
(1027824422, 1058689914, 'FtpReceive', '2010-10-21 13:44:09', '2010-10-21 13:44:09'),
(1027824423, 1058689915, 'FtpReceive', '2010-10-21 13:47:19', '2010-10-21 13:47:19'),
(1027824424, 339903798, 'SmbReceive', '2010-10-21 13:51:50', '2010-10-21 13:51:50'),
(1027824425, 339903799, 'SmbReceive', '2010-10-21 13:58:18', '2010-10-21 13:58:18'),
(1027824426, 1058689916, 'FtpReceive', '2010-10-22 08:02:59', '2010-10-22 08:02:59'),
(1027824428, 4, 'HttpReceive', '2010-11-02 14:06:00', '2010-11-02 14:06:00'),
(1027824429, 1058689917, 'FtpReceive', '2010-11-02 15:24:43', '2010-11-02 15:24:43'),
(1027824430, 5, 'HttpReceive', '2010-11-03 10:19:51', '2010-11-03 10:19:51'),
(1027824434, 1058689919, 'FtpReceive', '2010-11-03 11:37:19', '2010-11-03 11:37:19'),
(1027824435, 7, 'HttpReceive', '2010-11-03 12:22:06', '2010-11-03 12:22:06'),
(1027824436, 1058689920, 'FtpReceive', '2010-11-03 12:22:31', '2010-11-03 12:22:31'),
(1027824437, 8, 'HttpReceive', '2010-11-03 12:22:38', '2010-11-03 12:22:38'),
(1027824438, 855325038, 'EmailReceive', '2010-11-03 12:25:40', '2010-11-03 12:25:40'),
(1027824439, 339903801, 'SmbReceive', '2010-11-03 12:25:53', '2010-11-03 12:25:53'),
(1027824440, 1058689921, 'FtpReceive', '2010-11-03 12:26:06', '2010-11-03 12:26:06'),
(1027824442, 1058689923, 'FtpReceive', '2010-11-03 12:26:57', '2010-11-03 12:26:57'),
(1027824443, 1058689924, 'FtpReceive', '2010-11-03 12:27:06', '2010-11-03 12:27:06'),
(1027824444, 9, 'HttpReceive', '2010-11-03 12:27:59', '2010-11-03 12:27:59'),
(1027824445, 1058689925, 'FtpReceive', '2010-11-03 12:28:48', '2010-11-03 12:28:48'),
(1027824446, 1058689922, 'FtpReceive', '2010-11-03 12:30:20', '2010-11-03 12:59:41'),
(1027824448, 1058689927, 'FtpReceive', '2010-11-03 13:05:42', '2010-11-03 13:05:42'),
(1027824449, 1027824449, 'FtpReceive', '2010-11-03 13:06:53', '2010-11-03 13:14:01'),
(1027824451, 1058689930, 'FtpReceive', '2010-11-03 13:16:44', '2010-11-03 13:16:44'),
(1027824452, 1058689931, 'FtpReceive', '2010-11-03 13:17:41', '2010-11-03 13:17:41'),
(1027824453, 1058689932, 'FtpReceive', '2010-11-03 13:17:58', '2010-11-03 13:17:58'),
(1027824454, 1058689933, 'FtpReceive', '2010-11-03 13:19:03', '2010-11-03 13:19:03'),
(1027824455, 1058689934, 'FtpReceive', '2010-11-03 13:33:26', '2010-11-03 13:33:26'),
(1027824456, 1058689935, 'FtpReceive', '2010-11-03 13:33:35', '2010-11-03 13:33:35'),
(1027824457, 1058689936, 'FtpReceive', '2010-11-03 13:33:42', '2010-11-03 13:33:42'),
(1027824458, 1058689937, 'FtpReceive', '2010-11-03 13:34:39', '2010-11-03 13:34:39'),
(1027824459, 1058689938, 'FtpReceive', '2010-11-03 13:34:49', '2010-11-03 13:34:49'),
(1027824460, 1058689939, 'FtpReceive', '2010-11-03 13:35:15', '2010-11-03 13:35:15'),
(1027824461, 1058689940, 'FtpReceive', '2010-11-03 13:35:46', '2010-11-03 13:35:46'),
(1027824462, 1058689941, 'FtpReceive', '2010-11-03 13:36:00', '2010-11-03 13:36:00'),
(1027824463, 1058689942, 'FtpReceive', '2010-11-03 13:36:28', '2010-11-03 13:36:28'),
(1027824464, 1058689943, 'FtpReceive', '2010-11-03 13:36:38', '2010-11-03 13:36:38'),
(1027824465, 1058689944, 'FtpReceive', '2010-11-03 13:37:00', '2010-11-03 13:37:00'),
(1027824466, 1058689945, 'FtpReceive', '2010-11-03 13:37:13', '2010-11-03 13:37:13'),
(1027824467, 1058689946, 'FtpReceive', '2010-11-03 13:37:26', '2010-11-03 13:37:26'),
(1027824468, 1058689947, 'FtpReceive', '2010-11-03 13:37:33', '2010-11-03 13:37:33'),
(1027824469, 1058689948, 'FtpReceive', '2010-11-03 13:38:25', '2010-11-03 13:38:25'),
(1027824470, 1058689949, 'FtpReceive', '2010-11-03 13:40:02', '2010-11-03 13:40:02'),
(1027824471, 1058689950, 'FtpReceive', '2010-11-03 13:40:21', '2010-11-03 13:40:21'),
(1027824472, 1058689951, 'FtpReceive', '2010-11-03 15:27:31', '2010-11-03 15:27:31'),
(1027824473, 1058689952, 'FtpReceive', '2010-11-03 15:28:02', '2010-11-03 15:28:02'),
(1027824474, 11, 'HttpReceive', '2010-11-03 15:30:37', '2010-11-03 15:30:37'),
(1027824475, 339903802, 'SmbReceive', '2010-11-03 15:31:03', '2010-11-03 15:31:03'),
(1027824476, 339903803, 'SmbReceive', '2010-11-03 15:35:27', '2010-11-03 15:35:27'),
(1027824477, 339903804, 'SmbReceive', '2010-11-03 15:36:01', '2010-11-03 15:36:01'),
(1027824478, 339903805, 'SmbReceive', '2010-11-03 15:39:07', '2010-11-03 15:39:07'),
(1027824479, 12, 'HttpReceive', '2010-11-03 15:42:06', '2010-11-03 15:42:06'),
(1027824480, 1058689953, 'FtpReceive', '2010-11-03 15:42:19', '2010-11-03 15:42:19'),
(1027824481, 855325039, 'EmailReceive', '2010-11-03 15:42:36', '2010-11-03 15:42:36'),
(1027824482, 319468210, 'FolderReceive', '2010-11-03 15:42:47', '2010-11-03 15:42:47'),
(1027824483, 1058689954, 'FtpReceive', '2010-11-03 16:29:45', '2010-11-03 16:29:45'),
(1027824484, 1058689955, 'FtpReceive', '2010-11-03 16:55:23', '2010-11-03 16:55:23'),
(1027824485, 13, 'HttpReceive', '2010-11-03 16:55:52', '2010-11-03 16:55:52'),
(1027824486, 1058689956, 'FtpReceive', '2010-11-03 16:56:03', '2010-11-03 16:56:03'),
(1027824487, 339903806, 'SmbReceive', '2010-11-08 15:56:56', '2010-11-08 15:56:56'),
(1027824488, 339903807, 'SmbReceive', '2010-11-08 16:00:57', '2010-11-08 16:00:57'),
(1027824489, 1058689957, 'FtpReceive', '2010-11-09 08:05:59', '2010-11-09 08:05:59'),
(1027824490, 339903808, 'SmbReceive', '2010-11-09 08:23:39', '2010-11-09 08:23:39'),
(1027824491, 339903809, 'SmbReceive', '2010-11-09 08:38:40', '2010-11-09 08:38:40'),
(1027824492, 339903810, 'SmbReceive', '2010-11-09 08:44:11', '2010-11-09 08:44:11'),
(1027824493, 339903811, 'SmbReceive', '2010-11-09 08:45:55', '2010-11-09 08:45:55'),
(1027824494, 339903812, 'SmbReceive', '2010-11-09 09:11:01', '2010-11-09 09:11:01'),
(1027824495, 339903813, 'SmbReceive', '2010-11-09 10:03:45', '2010-11-09 10:03:45'),
(1027824496, 339903814, 'SmbReceive', '2010-11-09 10:07:54', '2010-11-09 10:07:54'),
(1027824497, 339903815, 'SmbReceive', '2010-11-09 10:17:31', '2010-11-09 10:17:31'),
(1027824498, 339903816, 'SmbReceive', '2010-11-09 10:24:59', '2010-11-09 10:24:59'),
(1027824499, 1058689958, 'FtpReceive', '2010-11-09 10:26:48', '2010-11-09 10:26:48'),
(1027824500, 339903817, 'SmbReceive', '2010-11-09 10:28:28', '2010-11-09 10:28:28'),
(1027824501, 339903818, 'SmbReceive', '2010-11-09 10:32:03', '2010-11-09 10:32:03'),
(1027824502, 339903819, 'SmbReceive', '2010-11-09 10:34:37', '2010-11-09 10:34:37'),
(1027824503, 339903820, 'SmbReceive', '2010-11-09 10:38:32', '2010-11-09 10:38:32'),
(1027824504, 339903821, 'SmbReceive', '2010-11-09 10:41:53', '2010-11-09 10:41:53'),
(1027824505, 339903822, 'SmbReceive', '2010-11-09 11:11:19', '2010-11-09 11:11:19'),
(1027824506, 339903823, 'SmbReceive', '2010-11-09 11:22:46', '2010-11-09 11:22:46'),
(1027824507, 339903824, 'SmbReceive', '2010-11-09 11:23:46', '2010-11-09 11:23:46'),
(1027824508, 339903825, 'SmbReceive', '2010-11-09 11:28:09', '2010-11-09 11:28:09'),
(1027824509, 339903826, 'SmbReceive', '2010-11-09 11:29:49', '2010-11-09 11:29:49'),
(1027824510, 339903827, 'SmbReceive', '2010-11-09 11:31:02', '2010-11-09 11:31:02'),
(1027824511, 1058689959, 'FtpReceive', '2010-11-09 11:33:50', '2010-11-09 11:33:50'),
(1027824512, 339903828, 'SmbReceive', '2010-11-09 11:45:15', '2010-11-09 11:45:15'),
(1027824513, 1058689960, 'FtpReceive', '2010-11-10 10:41:31', '2010-11-10 10:41:31'),
(1027824514, 1058689961, 'FtpReceive', '2010-11-10 10:43:19', '2010-11-10 10:43:19'),
(1027824515, 1058689962, 'FtpReceive', '2010-11-10 11:31:53', '2010-11-10 11:31:53'),
(1027824516, 1058689963, 'FtpReceive', '2010-11-10 11:41:33', '2010-11-10 11:41:33'),
(1027824517, 1058689964, 'FtpReceive', '2010-11-10 13:00:44', '2010-11-10 13:00:44'),
(1027824518, 14, 'HttpReceive', '2010-11-10 13:03:24', '2010-11-10 13:03:24'),
(1027824519, 15, 'HttpReceive', '2010-11-10 14:11:45', '2010-11-10 14:11:45'),
(1027824520, 16, 'HttpReceive', '2010-11-10 14:33:48', '2010-11-10 14:33:48'),
(1027824521, 17, 'HttpReceive', '2010-11-10 15:26:21', '2010-11-10 15:26:21');

-- --------------------------------------------------------

--
-- Структура таблицы `repeats`
--

CREATE TABLE IF NOT EXISTS `repeats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cron_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=859158660 ;

--
-- Дамп данных таблицы `repeats`
--

INSERT INTO `repeats` (`id`, `cron_string`, `title`, `created_at`, `updated_at`) VALUES
(859158658, '0 */4 * * *', 'Каждые четыре часа', '2010-10-20 11:31:09', '2010-11-09 10:22:57'),
(859158659, '0 */12 * * *', 'Каждые 12 часов', '2010-11-10 15:25:07', '2010-11-10 15:25:07');

-- --------------------------------------------------------

--
-- Структура таблицы `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20100721092747'),
('20100726075153'),
('20100727083550'),
('20100727142307'),
('20100728081548'),
('20100730133602'),
('20100802093744'),
('20100803073109'),
('20100803073119'),
('20100803123249'),
('20100804105539'),
('20100809103746'),
('20100809111859'),
('20100929141156'),
('20101004105812'),
('20101014133013'),
('20101014133045'),
('20101014133056'),
('20101014133128'),
('20101014133204'),
('20101014133232'),
('20101014133636'),
('20101019094727'),
('20101019095403'),
('20101020124312'),
('20101020124337'),
('20101020125502'),
('20101021102612'),
('20101021115739'),
('20101021115938'),
('20101021120548'),
('20101022095213'),
('20101025064958'),
('20101025130130'),
('20101027140059'),
('20101029102603'),
('20101029103058'),
('20101030144013'),
('20101101122718'),
('20101102111315'),
('20101102140339'),
('20101102154815'),
('20101110085721'),
('20101110163441'),
('20101111110944'),
('20101112132012'),
('20101113155418'),
('20101115105043');

-- --------------------------------------------------------

--
-- Структура таблицы `smb_receives`
--

CREATE TABLE IF NOT EXISTS `smb_receives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'rif2010',
  `share` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT '445',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT '/',
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'office',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT '2',
  `workgroup` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=339903829 ;

--
-- Дамп данных таблицы `smb_receives`
--

INSERT INTO `smb_receives` (`id`, `server`, `share`, `port`, `path`, `login`, `password`, `workgroup`, `created_at`, `updated_at`) VALUES
(325745029, 'netgear', 'common', 445, 'Архаров_Вит', 'Гость', 'Гость', NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(339903779, 'rif2010', '/MAG_ALT/', 445, '/DATA/MAJOR/', 'Office', '2', NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(339903781, NULL, NULL, 445, '/', 'Гость', 'Гость', NULL, '2010-10-20 13:20:02', '2010-10-20 13:20:02'),
(339903782, NULL, NULL, 445, '/', 'Гость', 'Гость', NULL, '2010-10-20 13:20:19', '2010-10-20 13:20:19'),
(339903783, NULL, NULL, 445, '/', 'Гость', 'Гость', NULL, '2010-10-20 13:21:58', '2010-10-20 13:21:58'),
(339903784, '1', '', 445, '/', 'Гость', 'Гость', '', '2010-10-20 13:22:20', '2010-10-20 13:22:20'),
(339903785, '56', '', 445, '/', 'Гость', 'Гость', '', '2010-10-20 13:22:34', '2010-10-20 13:22:34'),
(339903786, '1', '', 445, '/', 'Гость', 'Гость', '', '2010-10-20 13:24:17', '2010-10-20 13:24:17'),
(339903787, 'еее', '', 445, '/', 'Гость', 'Гость', '', '2010-10-20 13:24:49', '2010-10-20 13:24:49'),
(339903788, 'Rif2010', '/SCLAD/', 445, '/DATA/ACSCOM/', 'office', '2', '', '2010-10-20 13:26:55', '2010-10-20 13:32:53'),
(339903789, 'Rif2010', '/SCLAD/', 445, '/DATA/ACSCOM/', 'office', '2', '', '2010-10-20 14:12:30', '2010-10-20 14:12:30'),
(339903790, 'Rif2010', '/SCLAD/', 445, '/DATA/ASPI/', 'office', '2', '', '2010-10-20 15:43:00', '2010-10-20 15:43:00'),
(339903791, 'Rif2010', '/SCLAD/', 445, '/DATA/КАПОТ/', 'office', '2', '', '2010-10-21 09:47:38', '2010-10-21 09:47:38'),
(339903792, 'Rif2010', '/SCLAD/', 445, '/DATA/СЕВЕН АВТО/www/stock/', 'office', '2', '', '2010-10-21 09:49:05', '2010-10-21 09:49:05'),
(339903793, 'rif2010', '/ggg/', 445, '/f/', 'office', '2', '', '2010-10-21 12:02:17', '2010-10-21 12:02:17'),
(339903794, 'rif2010', '/sclad/', 445, '/DATA/НЕЗАВИСИМОСТЬ/', 'office', '2', '', '2010-10-21 12:04:20', '2010-10-21 12:04:20'),
(339903795, 'rif2010', '/SCLAD/', 445, '/DATA/РИНА/', 'office', '2', '', '2010-10-21 12:43:39', '2010-10-21 12:44:16'),
(339903796, 'rif2010', '/MAG_ALT/', 445, '/DATA/МИКАДО/', 'office', '2', '', '2010-10-21 13:00:20', '2010-10-21 13:00:20'),
(339903797, 'rif2010', '/SCLAD/', 445, '/DATA/НИКА/', 'office', '2', '', '2010-10-21 13:21:49', '2010-10-21 13:21:49'),
(339903798, 'rif2010', '/SCLAD/', 445, '/AVPraice/MBA/Митса/', 'office', '2', '', '2010-10-21 13:51:50', '2010-10-21 13:51:50'),
(339903799, 'Netgear', '/COMMON/', 445, '/ПОСТАВЩИКИ/ОБЩИЙ СКЛАД/ротон-и/', 'office', '2', '', '2010-10-21 13:58:18', '2010-10-21 13:58:18'),
(339903800, 'rif2010', '', 445, '/', 'office', '2', '', '2010-11-03 11:36:16', '2010-11-03 11:36:16'),
(339903801, 'rif2010', '', 445, '/', 'office', '2', '', '2010-11-03 12:25:53', '2010-11-03 12:25:53'),
(339903802, 'rif2010', '', 445, '/', 'office', '2', '', '2010-11-03 15:31:03', '2010-11-03 15:31:03'),
(339903803, 'rif2010', '', 445, '/', 'office', '2', '', '2010-11-03 15:35:27', '2010-11-03 15:35:27'),
(339903804, 'rif2010', '', 445, '/', 'office', '2', '', '2010-11-03 15:36:01', '2010-11-03 15:36:01'),
(339903805, 'rif2010', '', 445, '/', 'office', '2', '', '2010-11-03 15:39:07', '2010-11-03 15:39:07'),
(339903806, 'rif2010', '/SCLAD/', 445, '/DATA/ROLF_Аксессуары/', 'office', '2', '', '2010-11-08 15:56:56', '2010-11-08 15:56:56'),
(339903807, 'Netgear', '/COMMON/', 445, '/ПОСТАВЩИКИ/ОБЩИЙ СКЛАД/ротон-и', 'office', '2', '', '2010-11-08 16:00:57', '2010-11-08 16:00:57'),
(339903808, 'rif2010', '/sclad/', 445, '/DATA/АВТОСПЕЦЦЕНТР/', 'office', '2', '', '2010-11-09 08:23:39', '2010-11-09 08:23:39'),
(339903809, 'rif2010', '/sclad/', 445, '/DATA/ФОРУМ-АВТО/', 'office', '2', '', '2010-11-09 08:38:40', '2010-11-09 08:38:40'),
(339903810, 'rif2010', '/sclad/', 445, '/DATA/БОР СПЛИНТЕКС/', 'office', '2', '', '2010-11-09 08:44:11', '2010-11-09 08:44:32'),
(339903811, 'rif2010', '/SCLAD/', 445, '/DATA/ФОРВАРД/', 'office', '2', '', '2010-11-09 08:45:55', '2010-11-09 08:45:55'),
(339903812, 'rif2010', '/SCLAD', 445, '/DATA/АВТОКУЗОВ/', 'office', '2', '', '2010-11-09 09:11:01', '2010-11-09 09:11:01'),
(339903813, 'rif2010', '/mag_alt/', 445, '/DATA/MAJOR/', 'office', '2', '', '2010-11-09 10:03:45', '2010-11-09 10:03:45'),
(339903814, 'rif2010', '/mag_alt/', 445, '/DATA/ДЖЕНСЕР УЦЕНКА/', 'office', '2', '', '2010-11-09 10:07:54', '2010-11-09 10:08:06'),
(339903815, 'rif2010', 'mag_alt', 445, '/DATA/ПЕЛИКАН', 'office', '2', '', '2010-11-09 10:17:31', '2010-11-09 10:17:31'),
(339903816, 'rif2010', '/sclad/', 445, 'DATA/BUH', 'office', '2', '', '2010-11-09 10:24:59', '2010-11-09 10:24:59'),
(339903817, 'rif2010', '/MAG_ALT/', 445, '/DATA/АВТОТЕКА/', 'office', '2', '', '2010-11-09 10:28:28', '2010-11-09 10:28:28'),
(339903818, 'rif2010', '/sclad', 445, '/AVPraice/ИП_Тунгусов', 'office', '2', '', '2010-11-09 10:32:03', '2010-11-09 10:32:03'),
(339903819, 'rif2010', '/sclad/', 445, 'DATA/ASVA', 'office', '2', '', '2010-11-09 10:34:37', '2010-11-09 10:34:37'),
(339903820, 'rif2010', '/sclad', 445, '/DATA/ЮС_Импекс ', 'office', '2', '', '2010-11-09 10:38:32', '2010-11-09 10:39:25'),
(339903821, 'rif2010', 'mag_alt', 445, '/DATA/ДЖЕНСЕР НАЛИЧИЕ', 'office', '2', '', '2010-11-09 10:41:53', '2010-11-09 10:41:53'),
(339903822, 'rif2010', '/mag_alt/', 445, 'DATA/RMS', 'office', '2', '', '2010-11-09 11:11:19', '2010-11-09 11:11:19'),
(339903823, 'rif2010', '/SCLAD/', 445, 'DATA/АВТОИМПЭКС', 'office', '2', '', '2010-11-09 11:22:46', '2010-11-09 11:22:46'),
(339903824, 'rif2010', '/SCLAD/', 445, 'DATA\\МОСКВОРЕЧЬЕ', 'office', '2', '', '2010-11-09 11:23:46', '2010-11-09 11:23:46'),
(339903825, 'rif2010', 'sclad', 445, '/DATA/AUTOSPAR', 'office', '2', '', '2010-11-09 11:28:09', '2010-11-09 11:28:09'),
(339903826, 'rif2010', '/sclad', 445, '/DATA/LUCID', 'office', '2', '', '2010-11-09 11:29:49', '2010-11-09 11:29:49'),
(339903827, 'rif2010', '/mag_alt/', 445, 'DATA/Новлайн', 'office', '2', '', '2010-11-09 11:31:02', '2010-11-09 11:31:02'),
(339903828, 'rif2010', '/mag_alt', 445, '/DATA/CPD/ДляSQL', 'office', '2', '', '2010-11-09 11:45:15', '2010-11-09 11:45:15');

-- --------------------------------------------------------

--
-- Структура таблицы `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inn` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kpp` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1072056342 ;

--
-- Дамп данных таблицы `suppliers`
--

INSERT INTO `suppliers` (`id`, `title`, `inn`, `kpp`, `login`, `password`, `contact_info`, `created_at`, `updated_at`) VALUES
(222198489, 'ruslan_kornev_gmail', NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(239384643, 'JAPANCARS', '', '', 'тут два метода импорта', '', NULL, '2010-10-20 11:31:09', '2010-10-20 13:17:52'),
(244397494, 'webtest_avtorif', NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(289598915, 'ДЖИПШОП', NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(480201602, 'ШООРИ', NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(594805345, 'AUTOSPAR', NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(610276578, 'local_test', NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(769483063, 'РАДИАТОР-СЕРВИС', '', '', '', '', NULL, '2010-10-20 11:31:09', '2010-10-21 09:12:21'),
(854858892, 'ФЕБЕСТ', '', '', '', '', NULL, '2010-10-20 11:31:09', '2010-10-22 08:23:36'),
(1044098171, 'ПЕЛИКАН-АВТО', NULL, NULL, NULL, NULL, NULL, '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(1072056296, 'У-СЕРВИС', '', '', '', '', NULL, '2010-10-20 11:31:48', '2010-10-20 11:31:48'),
(1072056297, 'ФОРУМ-АВТО', '', '', '', '', NULL, '2010-10-20 12:02:50', '2010-10-20 12:02:50'),
(1072056298, 'БОРСПЛИНТЕКС', '', '', '', '', NULL, '2010-10-20 13:07:27', '2010-10-20 13:07:27'),
(1072056299, 'ФОРВАРД', '', '', '', '', NULL, '2010-10-20 13:08:53', '2010-10-20 13:08:53'),
(1072056300, 'ACSCOM', '', '', '', '', NULL, '2010-10-20 13:18:08', '2010-10-20 13:18:08'),
(1072056302, 'АВТОСПЕЦЦЕНТР', '', '', '', '', NULL, '2010-10-20 14:32:11', '2010-10-20 14:32:11'),
(1072056303, 'ASPI Group', '', '', '', '', NULL, '2010-10-20 15:42:09', '2010-10-20 15:42:09'),
(1072056304, 'MAJOR', '', '', '', '', NULL, '2010-10-20 15:46:32', '2010-10-20 15:46:32'),
(1072056305, 'ДЖЕНСЕР', '', '', '', '', NULL, '2010-10-21 09:45:50', '2010-10-21 09:45:50'),
(1072056306, 'КАПОТ', '', '', '', '', NULL, '2010-10-21 09:46:52', '2010-10-21 09:46:52'),
(1072056307, 'SEVEN-AUTO', '', '', '', '', NULL, '2010-10-21 09:48:07', '2010-10-21 09:48:07'),
(1072056308, 'НЕЗАВИСИМОСТЬ', '', '', '', '', NULL, '2010-10-21 12:03:20', '2010-10-21 12:03:20'),
(1072056309, 'TTM', '', '', '', '', NULL, '2010-10-21 12:05:13', '2010-10-21 12:05:13'),
(1072056310, 'ОСТАТКИ БУХГАЛТЕРИИ', '', '', '', '', NULL, '2010-10-21 12:09:12', '2010-11-09 10:24:40'),
(1072056311, 'АВТОТЕКА', '', '', '', '', NULL, '2010-10-21 12:11:48', '2010-10-21 12:11:48'),
(1072056312, 'АНКАР', '', '', '', '', NULL, '2010-10-21 12:13:50', '2010-10-21 12:13:50'),
(1072056313, 'СТАЛКЕР', '', '', '', '', NULL, '2010-10-21 12:17:39', '2010-10-21 12:17:39'),
(1072056314, 'ASHIKA', '', '', '', '', NULL, '2010-10-21 12:20:07', '2010-10-21 12:20:07'),
(1072056315, 'ТУНГУСОВ ИП', '', '', '', '', NULL, '2010-10-21 12:37:30', '2010-10-21 12:37:30'),
(1072056316, 'CPD', '', '', '', '', NULL, '2010-10-21 12:40:38', '2010-10-21 12:40:38'),
(1072056317, 'AS MOTORS', '', '', '', '', NULL, '2010-10-21 12:41:18', '2010-10-21 12:41:18'),
(1072056318, 'ASVA', '', '', '', '', NULL, '2010-10-21 12:42:13', '2010-10-21 12:42:13'),
(1072056319, 'РИНА', '', '', '', '', NULL, '2010-10-21 12:42:54', '2010-10-21 12:42:54'),
(1072056320, 'ИМПЕКС', '', '', '', '', NULL, '2010-10-21 12:54:44', '2010-10-21 12:54:44'),
(1072056321, 'МИКАДО', '', '', '', '', NULL, '2010-10-21 12:59:36', '2010-10-21 12:59:36'),
(1072056322, 'RMS', '', '', '', '', NULL, '2010-10-21 13:02:18', '2010-10-21 13:02:18'),
(1072056323, 'SPD', '', '', '', '', NULL, '2010-10-21 13:06:56', '2010-10-21 13:06:56'),
(1072056324, 'PRICE - ???', '', '', '', '', NULL, '2010-10-21 13:12:18', '2010-10-21 13:39:41'),
(1072056325, 'ИВИКА', '', '', '', '', NULL, '2010-10-21 13:13:17', '2010-11-09 11:15:31'),
(1072056326, 'АВТОИМПЭКС (ЛУЦИД)', '', '', '', '', NULL, '2010-10-21 13:18:34', '2010-10-21 13:18:34'),
(1072056327, 'МОСКВОРЕЧЬЕ', '', '', '', '', NULL, '2010-10-21 13:19:32', '2010-10-21 13:19:32'),
(1072056328, 'НИКА', '', '', '', '', NULL, '2010-10-21 13:20:47', '2010-10-21 13:20:58'),
(1072056329, 'НОВЛАЙН', '', '', '', '', NULL, '2010-10-21 13:43:29', '2010-10-21 13:43:29'),
(1072056330, 'ROLF', '', '', '', '', NULL, '2010-10-21 13:46:46', '2010-10-21 13:46:46'),
(1072056331, 'MBA', '', '', '', '', NULL, '2010-10-21 13:51:02', '2010-10-22 09:07:50'),
(1072056332, 'ЛЕКС МОТОРС', '', '', '', '', NULL, '2010-11-02 15:23:43', '2010-11-02 15:23:43'),
(1072056341, 'Тестовый', '', '', '', '', NULL, '2010-11-14 14:57:55', '2010-11-14 14:57:55'),
(1072056334, 'АВТОКУЗОВ', '', '', '', '', NULL, '2010-11-09 08:05:21', '2010-11-09 08:05:21'),
(1072056335, 'АВТОФОКС', '', '', '', '', NULL, '2010-11-10 07:20:02', '2010-11-10 07:20:02'),
(1072056336, 'СИА-МОТОРС', '', '', '', '', NULL, '2010-11-10 10:38:50', '2010-11-10 10:38:50'),
(1072056337, 'AVERS', '', '', '', '', NULL, '2010-11-10 11:37:04', '2010-11-10 11:37:04'),
(1072056338, 'АКИРА ОИЛ', '', '', '', '', NULL, '2010-11-10 12:21:40', '2010-11-10 12:21:40'),
(1072056340, 'Мировые смазочные материалы', '', '', '', '', NULL, '2010-11-12 16:20:21', '2010-11-12 16:20:21');

-- --------------------------------------------------------

--
-- Структура таблицы `supplier_prices`
--

CREATE TABLE IF NOT EXISTS `supplier_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_file_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_file_size` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_updated_at` datetime DEFAULT NULL,
  `md5` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `email_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `job_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `wc_stat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `supplier_prices`
--

INSERT INTO `supplier_prices` (`id`, `attachment_file_name`, `attachment_content_type`, `attachment_file_size`, `attachment_updated_at`, `md5`, `supplier_id`, `email_id`, `created_at`, `updated_at`, `job_code`, `job_id`, `wc_stat`, `group_code`) VALUES
(2, 'avtorif.xls', 'application/vnd.ms-excel', '97792', '2010-11-15 17:06:23', '58e5172d3136856e740af00c1ca3f38e', 769483063, NULL, '2010-11-15 17:06:23', '2010-11-15 17:06:23', '', 427111281, ' 1533  4859 97792 /tmp/77118dbcb9598f0bd006b33a6fa2c7e63c3e82dc20101115-16209-os2fyq-0\n', 'rMon Nov 15 20:06:23 +0300 2010'),
(3, 'AVTORIF.txt', 'text/plain', '1098139', '2010-11-15 17:06:24', 'fb21d7c7394ddf9cc2367015ca4b9f6c', 289598915, NULL, '2010-11-15 17:06:24', '2010-11-15 17:06:24', '', 646346657, '  16723  102755 1098139 /tmp/c09782725eefa0b6804cf02d64153f25b898af5820101115-16209-mttih5-0\n', 'rMon Nov 15 20:06:23 +0300 2010'),
(4, 'febestrif.txt', 'text/plain', '250950', '2010-11-15 17:06:25', '9cb0e15cb9c7086201bec9f3db2591d9', 854858892, NULL, '2010-11-15 17:06:25', '2010-11-15 17:06:25', '', 852046107, '  3935  20389 250950 /tmp/b80f26ee266142bad4a50dc786a0298f8727a8e620101115-16209-1pib6kv-0\n', 'rMon Nov 15 20:06:24 +0300 2010'),
(5, 'U_SERV_COL.xls', 'application/vnd.ms-office', '259072', '2010-11-15 17:06:25', '7adde224e6a7c0481836df4142a54109', 1072056296, NULL, '2010-11-15 17:06:26', '2010-11-15 17:06:26', '', 1066346022, '  8140  11438 259072 /tmp/a41afedcff14728ce36cfabe7417ce610915552720101115-16209-ap1fia-0\n', 'rMon Nov 15 20:06:25 +0300 2010'),
(6, 'U_SERV_NMR.xls', 'application/vnd.ms-office', '2205184', '2010-11-15 17:06:26', '75be93301fed09e3c2a271b59eacb9c8', 1072056296, NULL, '2010-11-15 17:06:27', '2010-11-15 17:06:27', 'НИССАН ЦС', 1066346023, '  52833   63831 2205184 /tmp/1fbf7ee511de8b430680052381eda1b61b1599d920101115-16209-deb9cc-0\n', 'rMon Nov 15 20:06:26 +0300 2010'),
(7, 'LucJC.xls', 'application/vnd.ms-office', '4487168', '2010-11-15 17:06:29', 'fd3d3a6eeb56be1469e90d840f3c29a3', 239384643, NULL, '2010-11-15 17:06:30', '2010-11-15 17:06:30', '', 1066346027, ' 126100  202873 4487168 /tmp/eeb766ce7531badb2cab52213bb1fc1024c9659b20101115-16209-1u24nja-0\n', 'rMon Nov 15 20:06:28 +0300 2010'),
(8, 'МЕРТВЫЙ СКЛАД 220609.TXT', 'text/plain', '37692', '2010-11-15 17:06:31', 'd3106816eccf427c5c565085340d661d', 1072056305, NULL, '2010-11-15 17:06:31', '2010-11-15 17:06:31', '', 1066346039, '  965  1543 37692 /tmp/7ecd96910e5b991be63a2232060e19b5b339c58420101115-16209-a3c9ky-0\n', 'Mon Nov 15 20:06:31 +0300 2010');

-- --------------------------------------------------------

--
-- Структура таблицы `transmissions`
--

CREATE TABLE IF NOT EXISTS `transmissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190963 ;

--
-- Дамп данных таблицы `transmissions`
--

INSERT INTO `transmissions` (`id`, `title`, `created_at`, `updated_at`) VALUES
(298486374, 'MyString', '2010-10-20 11:31:09', '2010-10-20 11:31:09'),
(980190962, 'MyString', '2010-10-20 11:31:09', '2010-10-20 11:31:09');

-- --------------------------------------------------------

--
-- Структура таблицы `unpack_jobs`
--

CREATE TABLE IF NOT EXISTS `unpack_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=980190985 ;

--
-- Дамп данных таблицы `unpack_jobs`
--

INSERT INTO `unpack_jobs` (`id`, `created_at`, `updated_at`) VALUES
(298486374, '2010-11-02 12:28:18', '2010-11-02 12:28:18'),
(980190962, '2010-11-02 12:28:18', '2010-11-02 12:28:18'),
(980190963, '2010-11-02 12:54:31', '2010-11-02 12:54:31'),
(980190964, '2010-11-02 13:56:22', '2010-11-02 13:56:22'),
(980190965, '2010-11-02 14:08:52', '2010-11-02 14:08:52'),
(980190966, '2010-11-03 08:45:59', '2010-11-03 08:45:59'),
(980190967, '2010-11-03 09:46:02', '2010-11-03 09:46:02'),
(980190968, '2010-11-03 10:09:49', '2010-11-03 10:09:49'),
(980190969, '2010-11-10 07:21:28', '2010-11-10 07:21:28'),
(980190970, '2010-11-10 08:52:52', '2010-11-10 08:52:52'),
(980190971, '2010-11-10 08:53:46', '2010-11-10 08:53:46'),
(980190972, '2010-11-10 10:40:06', '2010-11-10 10:40:06'),
(980190973, '2010-11-10 10:40:49', '2010-11-10 10:40:49'),
(980190974, '2010-11-10 10:40:56', '2010-11-10 10:40:56'),
(980190975, '2010-11-10 10:41:02', '2010-11-10 10:41:02'),
(980190976, '2010-11-10 10:41:37', '2010-11-10 10:41:37'),
(980190977, '2010-11-10 10:43:31', '2010-11-10 10:43:31'),
(980190978, '2010-11-10 11:39:03', '2010-11-10 11:39:03'),
(980190979, '2010-11-10 13:01:24', '2010-11-10 13:01:24'),
(980190980, '2010-11-10 13:03:09', '2010-11-10 13:03:09'),
(980190981, '2010-11-10 13:03:18', '2010-11-10 13:03:18'),
(980190982, '2010-11-10 13:04:04', '2010-11-10 13:04:04'),
(980190983, '2010-11-11 16:45:48', '2010-11-11 16:45:48'),
(980190984, '2010-11-15 09:12:25', '2010-11-15 09:12:25');
