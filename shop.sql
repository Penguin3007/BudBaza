-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 17 2019 г., 13:38
-- Версия сервера: 5.7.13
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(3, NULL, 1, 'Крепеж', 'krepezh', '2019-01-13 21:31:17', '2019-01-13 21:31:17'),
(4, NULL, 1, 'Строительные смеси', 'stroitel-nye-smesi', '2019-01-30 22:53:21', '2019-01-30 22:53:21'),
(5, NULL, 1, 'Кровля', 'krovlya', '2019-02-06 12:12:11', '2019-02-06 12:12:11');

-- --------------------------------------------------------

--
-- Структура таблицы `Category_products`
--

CREATE TABLE IF NOT EXISTS `Category_products` (
  `id` int(10) unsigned NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Category_products`
--

INSERT INTO `Category_products` (`id`, `product_id`, `created_at`, `updated_at`, `category_id`) VALUES
(2, 1, NULL, NULL, 3),
(3, 2, NULL, NULL, 3),
(4, 3, NULL, NULL, 3),
(5, 4, NULL, NULL, 4),
(6, 5, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 5),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 6),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 7),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 10),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}', 12),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 13),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 14),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(22, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 11),
(23, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(24, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
(25, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
(26, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(27, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
(28, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(30, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(31, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(32, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(33, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(34, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(35, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(36, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
(37, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
(38, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(39, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(40, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
(41, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(42, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(43, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(44, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(45, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(46, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(47, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(48, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(49, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(50, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
(51, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(52, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(53, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
(54, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(55, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(57, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(58, 7, 'title', 'text', 'Название', 0, 1, 1, 1, 1, 1, '{}', 2),
(59, 7, 'quanity', 'number', 'Количество', 0, 1, 1, 1, 1, 1, '{}', 3),
(60, 7, 'price', 'number', 'Цена', 0, 1, 1, 1, 1, 1, '{}', 4),
(61, 7, 'id_cat', 'number', 'Id Cat', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 7, 'img', 'multiple_images', 'Изображения', 0, 1, 1, 1, 1, 1, '{}', 7),
(63, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(64, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(65, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(66, 8, 'product_id', 'text', 'Product Id', 0, 0, 1, 0, 0, 1, '{}', 3),
(67, 8, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 4),
(68, 8, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 5),
(69, 8, 'user_id', 'text', 'User Id', 0, 0, 1, 0, 0, 1, '{}', 7),
(70, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(71, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(73, 8, 'order_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"id","key":"id","label":"name","pivot_table":"Category_products","pivot":"0","taggable":"0"}', 6),
(75, 7, 'desc', 'rich_text_box', 'Описание', 0, 1, 1, 1, 1, 1, '{}', 10),
(76, 7, 'status', 'radio_btn', 'Статус', 0, 1, 1, 1, 1, 1, '{"default":"in","options":{"in":"In stock","out":"Out of stock"}}', 11),
(81, 7, 'product_belongstomany_categories_product_relationship', 'relationship', 'Категории', 0, 1, 1, 1, 1, 1, '{"model":"TCG\\\\Voyager\\\\Models\\\\Category","table":"categories","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"Category_products","pivot":"1","taggable":"on"}', 5),
(82, 7, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:products,slug"}}', 11),
(83, 7, 'disc_price', 'number', 'Акционная цена', 0, 1, 1, 1, 1, 1, '{}', 12),
(84, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 8),
(85, 1, 'lname', 'text', 'Фамилия', 0, 1, 1, 1, 1, 1, '{}', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null}', '2019-01-13 19:09:07', '2019-04-18 22:14:48'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(7, 'products', 'products', 'Product', 'Products', 'voyager-list', 'App\\Product', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-01-13 19:35:03', '2019-04-17 17:43:02'),
(8, 'Orders', 'orders', 'Order', 'Orders', 'voyager-credit-cards', 'App\\Order', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-01-13 19:45:20', '2019-01-13 21:32:16');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(2, 'Main menu', '2019-01-13 21:53:13', '2019-01-13 21:53:13');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-01-13 19:09:07', '2019-01-13 19:09:07', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2019-01-13 19:09:07', '2019-01-13 19:09:07', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-01-13 19:09:07', '2019-01-13 19:09:07', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-01-13 19:09:07', '2019-01-13 19:09:07', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2019-01-13 19:09:07', '2019-01-13 19:09:07', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2019-01-13 19:09:07', '2019-01-13 19:09:07', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2019-01-13 19:09:07', '2019-01-13 19:09:07', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2019-01-13 19:09:07', '2019-01-13 19:09:07', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2019-01-13 19:09:07', '2019-01-13 19:09:07', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2019-01-13 19:09:07', '2019-01-13 19:09:07', 'voyager.settings.index', NULL),
(11, 1, 'Категории', '', '_self', 'voyager-categories', '#000000', NULL, 8, '2019-01-13 19:09:10', '2019-01-30 22:46:57', 'voyager.categories.index', 'null'),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2019-01-13 19:09:10', '2019-01-13 19:09:10', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2019-01-13 19:09:10', '2019-01-13 19:09:10', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2019-01-13 19:09:10', '2019-01-13 19:09:10', 'voyager.hooks', NULL),
(15, 1, 'Products', '', '_self', 'voyager-list', NULL, NULL, 15, '2019-01-13 19:35:03', '2019-01-13 19:35:03', 'voyager.products.index', NULL),
(16, 1, 'Orders', '', '_self', NULL, NULL, NULL, 16, '2019-01-13 19:45:20', '2019-01-13 19:45:20', 'voyager.orders.index', NULL),
(17, 2, 'Главная', '/', '_self', NULL, '#000000', NULL, 1, '2019-01-13 21:53:41', '2019-01-13 21:54:25', NULL, ''),
(18, 2, 'Блог', '/blog', '_self', NULL, '#000000', NULL, 3, '2019-01-13 21:54:21', '2019-02-05 18:58:50', NULL, ''),
(19, 2, 'Магазин', '/shop', '_self', NULL, '#000000', NULL, 2, '2019-01-13 21:54:47', '2019-02-05 18:58:49', NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 2),
(4, '2016_01_01_000000_create_data_types_table', 2),
(5, '2016_05_19_173453_create_menu_table', 2),
(6, '2016_10_21_190000_create_roles_table', 2),
(7, '2016_10_21_190000_create_settings_table', 2),
(8, '2016_11_30_135954_create_permission_table', 2),
(9, '2016_11_30_141208_create_permission_role_table', 2),
(10, '2016_12_26_201236_data_types__add__server_side', 2),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(12, '2017_01_14_005015_create_translations_table', 2),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(17, '2017_08_05_000000_add_group_to_settings_table', 2),
(18, '2017_11_26_013050_add_user_role_relationship', 2),
(19, '2017_11_26_015000_create_user_roles_table', 2),
(20, '2018_03_11_000000_add_user_settings', 2),
(21, '2018_03_14_000000_add_details_to_data_types_table', 2),
(22, '2018_03_16_000000_make_settings_value_nullable', 2),
(23, '2016_01_01_000000_create_pages_table', 3),
(24, '2016_01_01_000000_create_posts_table', 3),
(25, '2016_02_15_204651_create_categories_table', 3),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Orders`
--

CREATE TABLE IF NOT EXISTS `Orders` (
  `id` int(10) unsigned NOT NULL,
  `products` longtext COLLATE utf8mb4_unicode_ci,
  `price` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Orders`
--

INSERT INTO `Orders` (`id`, `products`, `price`, `status`, `user_id`, `created_at`, `updated_at`, `f_name`, `l_name`, `email`, `phone`, `shipping_method`, `payment_method`, `address`) VALUES
(1, NULL, 500, NULL, NULL, '2019-02-02 17:44:48', '2019-02-02 17:44:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 41, 'wait-for-pay', NULL, NULL, NULL, 'Yaroslav', 'Stefaniuk', 'nuwolofixi@shop4mail.net', '3414233241', 'pickup', NULL, NULL),
(3, NULL, 41, 'wait-for-pay', NULL, NULL, NULL, 'Yaroslav', 'Stefaniuk', 'nuwolofixi@shop4mail.net', '3414233241', 'pickup', NULL, NULL),
(4, NULL, 41, 'wait-for-pay', NULL, NULL, NULL, 'Yaroslav', 'Stefaniuk', 'zigac@mymailbest.com', '3414233241', 'pickup', NULL, NULL),
(5, NULL, 41, 'wait-for-pay', NULL, NULL, NULL, 'Yaroslav', 'Stefaniuk', 'muju@shop4mail.net', '3414233241', 'pickup', NULL, NULL),
(6, NULL, 41, 'wait-for-pay', NULL, NULL, NULL, 'Yaroslav', 'Stefaniuk', 'xoni@next-mail.online', '3414233241', 'pickup', NULL, NULL),
(7, NULL, 41, 'wait-for-pay', 1, NULL, NULL, 'Yaroslav', 'Stefaniuk', 'saculekus@maxmail.info', '3414233241', 'pickup', NULL, NULL),
(8, NULL, 932, 'wait-for-pay', NULL, NULL, NULL, 'Максым', 'Гуня', 'saculekus@maxmail.info', '1234567890', 'pickup', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-01-13 19:09:10', '2019-01-13 19:09:10');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(2, 'browse_bread', NULL, '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(3, 'browse_database', NULL, '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(4, 'browse_media', NULL, '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(5, 'browse_compass', NULL, '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(6, 'browse_menus', 'menus', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(7, 'read_menus', 'menus', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(8, 'edit_menus', 'menus', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(9, 'add_menus', 'menus', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(10, 'delete_menus', 'menus', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(11, 'browse_roles', 'roles', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(12, 'read_roles', 'roles', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(13, 'edit_roles', 'roles', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(14, 'add_roles', 'roles', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(15, 'delete_roles', 'roles', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(16, 'browse_users', 'users', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(17, 'read_users', 'users', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(18, 'edit_users', 'users', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(19, 'add_users', 'users', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(20, 'delete_users', 'users', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(21, 'browse_settings', 'settings', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(22, 'read_settings', 'settings', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(23, 'edit_settings', 'settings', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(24, 'add_settings', 'settings', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(25, 'delete_settings', 'settings', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(26, 'browse_categories', 'categories', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(27, 'read_categories', 'categories', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(28, 'edit_categories', 'categories', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(29, 'add_categories', 'categories', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(30, 'delete_categories', 'categories', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(31, 'browse_posts', 'posts', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(32, 'read_posts', 'posts', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(33, 'edit_posts', 'posts', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(34, 'add_posts', 'posts', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(35, 'delete_posts', 'posts', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(36, 'browse_pages', 'pages', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(37, 'read_pages', 'pages', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(38, 'edit_pages', 'pages', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(39, 'add_pages', 'pages', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(40, 'delete_pages', 'pages', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(41, 'browse_hooks', NULL, '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(42, 'browse_products', 'products', '2019-01-13 19:35:03', '2019-01-13 19:35:03'),
(43, 'read_products', 'products', '2019-01-13 19:35:03', '2019-01-13 19:35:03'),
(44, 'edit_products', 'products', '2019-01-13 19:35:03', '2019-01-13 19:35:03'),
(45, 'add_products', 'products', '2019-01-13 19:35:03', '2019-01-13 19:35:03'),
(46, 'delete_products', 'products', '2019-01-13 19:35:03', '2019-01-13 19:35:03'),
(47, 'browse_Orders', 'Orders', '2019-01-13 19:45:20', '2019-01-13 19:45:20'),
(48, 'read_Orders', 'Orders', '2019-01-13 19:45:20', '2019-01-13 19:45:20'),
(49, 'edit_Orders', 'Orders', '2019-01-13 19:45:20', '2019-01-13 19:45:20'),
(50, 'add_Orders', 'Orders', '2019-01-13 19:45:20', '2019-01-13 19:45:20'),
(51, 'delete_Orders', 'Orders', '2019-01-13 19:45:20', '2019-01-13 19:45:20');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-01-13 19:09:10', '2019-01-13 19:09:10');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quanity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `id_cat` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disc_price` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `quanity`, `price`, `id_cat`, `img`, `created_at`, `updated_at`, `desc`, `status`, `slug`, `disc_price`) VALUES
(2, 'Гвозди для битумной черепицы ( 5 кг/уп)', 100, 300, NULL, '["products\\\\January2019\\\\aS2jo589d7jl2mvtZHoE.jpg"]', '2019-01-30 22:50:00', '2019-01-30 23:43:29', '<p><span style="color: #222222; font-family: Roboto, sans-serif;">ГВОЗДИ - это единственный правильный материал для крепления гибкой битумной черепицы, благодаря своим превосходным крепежным свойствам. Используйте устойчивые&nbsp; к коррозии гвозди длиной 25 мм и диаметром шляпки 10мм. Гвоздь должен быть 3 мм в диаметре&nbsp; и иметь зазубрины. Для гибкой черепицы Шинглас, требуются гвозди длиной 25-30 мм . Хорошие гвозди это необходимость,&nbsp; они обеспечивают долговечность Вашей кровле.</span></p>', 'in', 'gvozdi-dlya-bitumnoj-cherepicy-5-kg-up', NULL),
(3, 'Гвозди строительные 200 мм (кг)', 48, 41, NULL, '["products\\\\January2019\\\\v52esashrp7TGS02FKbx.jpg"]', '2019-01-30 22:52:00', '2019-01-30 23:43:22', '<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #222222; font-family: Roboto, sans-serif; outline-width: 0px !important;"><span style="box-sizing: border-box; outline-width: 0px !important;"><span style="box-sizing: border-box; outline-width: 0px !important; font-weight: bold;">Гвозди строительные (200 мм)</span></span><span style="box-sizing: border-box; outline-width: 0px !important;">&nbsp;являются самым распространенным видом крепежа в тех случаях, когда необходимо выполнить неразъемное соединение (создать неразборные узлы) с достаточно высокой механической прочностью.Как правило, строительные гвозди изготавливаются из стали, хотя в отдельных случаях могут применяться и другие материалы, например латунь или цинк. Некоторые сборочные операции требуют использования даже пластиковых гвоздей, однако, наиболее привычным вариантом все-таки являются стальные гвозди.&nbsp;</span></p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 10px; color: #222222; font-family: Roboto, sans-serif; outline-width: 0px !important;"><span style="box-sizing: border-box; outline-width: 0px !important;"><span style="box-sizing: border-box; outline-width: 0px !important;"><span style="box-sizing: border-box; outline-width: 0px !important; font-weight: bold;">Свойства:</span></span></span></p>\r\n<ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: #222222; font-family: Roboto, sans-serif; outline-width: 0px !important;">\r\n<li style="box-sizing: border-box; outline-width: 0px !important;"><span style="box-sizing: border-box; outline-width: 0px !important;">долговечность</span></li>\r\n<li style="box-sizing: border-box; outline-width: 0px !important;"><span style="box-sizing: border-box; outline-width: 0px !important;">надежность</span></li>\r\n</ul>', 'in', 'gvozdi-stroitel-nye-200-mm-kg', NULL),
(4, 'Гипсовая штукатурка Master G-Start (30 кг)', 20, 110, NULL, '["products\\\\January2019\\\\mYctop8QMGKHyQLGrv8s.jpg"]', '2019-01-30 22:56:00', '2019-01-30 23:43:17', '<p class="MsoNormal" style="box-sizing: border-box; margin: 0px 0px 5.3pt; color: #222222; font-family: Roboto, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: normal; outline-width: 0px !important;"><span style="box-sizing: border-box; outline-width: 0px !important; font-weight: bold;">Гипсовая штукатурка Master G-Start&nbsp;</span>&nbsp;- смесь строительная сухая модифицированная для оштукатуривания на основе гипса предназначена для обработки бетонных, кирпичных, цементно-песчаных, гипсовых поверхностей внутри зданий. Применяется для предварительного выравнивания потолков и стен под последующее нанесение финишных шпатлевок или отделки обоями. Для внутренних работ.</p>\r\n<p class="MsoNormal" style="box-sizing: border-box; margin: 0px 0px 5.3pt; color: #222222; font-family: Roboto, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: normal; outline-width: 0px !important;"><span style="box-sizing: border-box; outline-width: 0px !important; font-weight: bold;">Свойства:</span></p>\r\n<ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: #222222; font-family: Roboto, sans-serif; outline-width: 0px !important;" type="disc">\r\n<li class="MsoNormal" style="box-sizing: border-box; outline-width: 0px !important; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Пластичная</li>\r\n<li class="MsoNormal" style="box-sizing: border-box; outline-width: 0px !important; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Слой за одно нанесение до 30 мм</li>\r\n<li class="MsoNormal" style="box-sizing: border-box; outline-width: 0px !important; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Устойчивая к усадке</li>\r\n<li class="MsoNormal" style="box-sizing: border-box; outline-width: 0px !important; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Паропроницаемая</li>\r\n<li class="MsoNormal" style="box-sizing: border-box; outline-width: 0px !important; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Удобная в применении</li>\r\n<li class="MsoNormal" style="box-sizing: border-box; outline-width: 0px !important; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Создает благоприятный климат в помещении</li>\r\n<li class="MsoNormal" style="box-sizing: border-box; outline-width: 0px !important; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Технологически стойкая к дальнейшей обработке</li>\r\n<li class="MsoNormal" style="box-sizing: border-box; outline-width: 0px !important; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Экологически чистая</li>\r\n</ul>', 'in', 'gipsovaya-shtukaturka-master-g-start-30-kg', NULL),
(5, 'ЧЕРЕПИЦА ГИБКАЯ SHINGLAS ВЕСТЕРН КАНЬОН УП. 1,5 М2', 50, 233, NULL, '["products\\\\February2019\\\\9hSbVlxukGE3km2kYgKS.jpg"]', '2019-02-06 12:14:00', '2019-04-17 17:39:47', '<table class="table table-bordered" style="box-sizing: border-box; border-spacing: 0px; border-collapse: collapse; margin: 0px 0px 20px; padding: 0px; border: 1px solid #dddddd; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 24px; line-height: inherit; font-family: Lato, Arial, sans-serif; vertical-align: baseline; width: 856.8px; max-width: 100%; color: #676767;">\r\n<tbody style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">\r\n<tr style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">\r\n<td style="box-sizing: border-box; padding: 8px 20px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<h6 style="box-sizing: border-box; font-family: inherit; font-weight: inherit; line-height: inherit; color: #666666; margin: 0px; font-size: 19px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline;">Гарантия</h6>\r\n</td>\r\n<td style="box-sizing: border-box; padding: 25px 70px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<p style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #838383;">55 лет</p>\r\n</td>\r\n</tr>\r\n<tr style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">\r\n<td style="box-sizing: border-box; padding: 8px 20px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<h6 style="box-sizing: border-box; font-family: inherit; font-weight: inherit; line-height: inherit; color: #666666; margin: 0px; font-size: 19px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline;">Модель</h6>\r\n</td>\r\n<td style="box-sizing: border-box; padding: 25px 70px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<p style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #838383;">Shinglas Вестерн Каньон</p>\r\n</td>\r\n</tr>\r\n<tr style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">\r\n<td style="box-sizing: border-box; padding: 8px 20px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<h6 style="box-sizing: border-box; font-family: inherit; font-weight: inherit; line-height: inherit; color: #666666; margin: 0px; font-size: 19px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline;">Производитель</h6>\r\n</td>\r\n<td style="box-sizing: border-box; padding: 25px 70px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<p style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #838383;">ТехноНиколь</p>\r\n</td>\r\n</tr>\r\n<tr style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">\r\n<td style="box-sizing: border-box; padding: 8px 20px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<h6 style="box-sizing: border-box; font-family: inherit; font-weight: inherit; line-height: inherit; color: #666666; margin: 0px; font-size: 19px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline;">Цвет</h6>\r\n</td>\r\n<td style="box-sizing: border-box; padding: 25px 70px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<p style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #838383;">Коричневый</p>\r\n</td>\r\n</tr>\r\n<tr style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">\r\n<td style="box-sizing: border-box; padding: 8px 20px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<h6 style="box-sizing: border-box; font-family: inherit; font-weight: inherit; line-height: inherit; color: #666666; margin: 0px; font-size: 19px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline;">Тип</h6>\r\n</td>\r\n<td style="box-sizing: border-box; padding: 25px 70px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<p style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #838383;">Битумная гибкая черепица</p>\r\n</td>\r\n</tr>\r\n<tr style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">\r\n<td style="box-sizing: border-box; padding: 8px 20px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<h6 style="box-sizing: border-box; font-family: inherit; font-weight: inherit; line-height: inherit; color: #666666; margin: 0px; font-size: 19px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; vertical-align: baseline;">Дополнительно</h6>\r\n</td>\r\n<td style="box-sizing: border-box; padding: 25px 70px; margin: 0px; border: 1px solid #dddddd; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 1.42857; font-family: inherit; vertical-align: middle;">\r\n<p style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #838383;">Форма - вестерн (два слоя)</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'in', 'cherepica-gibkaya-shinglas-vestern-kan-on-up-1-5-m2', 57.5);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) unsigned NOT NULL,
  `product_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `product_slug`, `name`, `email`, `text`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 'gvozdi-dlya-bitumnoj-cherepicy-5-kg-up', 'Yaroslav Stefaniuk', 'hofufit@p33.org', 'dsgfdsghdgfjhgfjg', '5', 'in-review', NULL, NULL),
(2, 'gvozdi-dlya-bitumnoj-cherepicy-5-kg-up', 'fasdf', 'asdfs@fdsf.s', 'fadsfasdgds', '3', 'in-review', NULL, NULL),
(3, 'gvozdi-dlya-bitumnoj-cherepicy-5-kg-up', 'gfsdgd', 'gfdgdfagdf@fdsfsd.sg', 'sdgfgs', '1', 'in-review', NULL, NULL),
(4, 'gvozdi-dlya-bitumnoj-cherepicy-5-kg-up', 'gdsfg', 'asdfsdg@fds.gfds', 'gfdsgfh', '2', 'in-review', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-01-13 19:09:07', '2019-01-13 19:09:07'),
(2, 'user', 'Normal User', '2019-01-13 19:09:07', '2019-01-13 19:09:07');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\January2019\\uRJamr3RpRWUci8rFIKb.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-01-13 19:09:10', '2019-01-13 19:09:10'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-01-13 19:09:10', '2019-01-13 19:09:10');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `lname`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$GoyKpQbfc2yVSX6I7qbtj.vKHHjL/hCY9YgkLVNaep7p.85HO80mK', 'C61nte2a4EXANeglDhggSPgsHIyj06ibiiexRSQpG1nBfP2L0UxLltLuZepo', NULL, '2019-01-13 19:09:10', '2019-01-13 19:09:10', NULL),
(3, 2, 'Yaroslav', 'lukugun@mymailbest.com', 'users/default.png', NULL, '$2y$10$Ptk68MXLpqt2Nc8ys0TpVO9ZxTkqiTiqVed59w46ysn3H8JbHuqWa', NULL, NULL, NULL, NULL, NULL),
(4, 2, 'Yaroslav', 'saculekus@maxmail.info', 'users/default.png', NULL, '$2y$10$8/9RZsQq/HcpFTNsM3D9r.xRicsS1kaVqRapjL1iLwps9XnjfyM52', NULL, NULL, NULL, NULL, NULL),
(5, 2, 'fsagfds', 'hofufit@p33.org', 'users/default.png', NULL, '$2y$10$TNj.8ceM2ZhYQWqN.awvaeAe2dr9PQVcgxWdr8cssrNEMN5blPJGO', 'LAsiUakSc220AL1JcQegep2a5tLyOTpYAPxKd7jj3L8xXK69PyiPqFrUyGHq', NULL, '2019-04-18 23:25:56', '2019-04-18 23:25:56', NULL),
(6, 2, 'Penguin', 'kogav@mail-list.top', 'users/default.png', NULL, '$2y$10$QkyJ.xUNgkzIRXxfaUN.WO4hhu3tOCsHnSjD4MgcfxSPAOnJySFs2', 'wJZfHjSFgpjg0ptlKgSljqp5CbnhUVr8SlSx3w06JlMG2BwS0Opk16iLXJvL', NULL, '2019-04-18 23:36:06', '2019-04-18 23:46:35', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `Category_products`
--
ALTER TABLE `Category_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `Category_products`
--
ALTER TABLE `Category_products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT для таблицы `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
