-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 01 2024 г., 10:18
-- Версия сервера: 10.8.4-MariaDB
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demoshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_active_users`
--

CREATE TABLE `adkq_active_users` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `internalKey` int(11) NOT NULL DEFAULT 0,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lasthit` int(11) NOT NULL DEFAULT 0,
  `action` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_active_users`
--

INSERT INTO `adkq_active_users` (`sid`, `internalKey`, `username`, `lasthit`, `action`, `id`) VALUES
('s4gtt1odhlcq5u6gm1g38ep6gvkv2m43', 1, 'admin', 1730408313, '67', 57);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_active_user_locks`
--

CREATE TABLE `adkq_active_user_locks` (
  `id` int(11) NOT NULL,
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `internalKey` int(11) NOT NULL DEFAULT 0,
  `elementType` int(11) NOT NULL DEFAULT 0,
  `elementId` int(11) NOT NULL DEFAULT 0,
  `lasthit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_active_user_locks`
--

INSERT INTO `adkq_active_user_locks` (`id`, `sid`, `internalKey`, `elementType`, `elementId`, `lasthit`) VALUES
(40, 's4gtt1odhlcq5u6gm1g38ep6gvkv2m43', 1, 6, 5, 1730408184),
(41, 's4gtt1odhlcq5u6gm1g38ep6gvkv2m43', 1, 2, 9, 1730408215),
(42, 's4gtt1odhlcq5u6gm1g38ep6gvkv2m43', 1, 7, 2, 1730408263);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_active_user_sessions`
--

CREATE TABLE `adkq_active_user_sessions` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `internalKey` int(11) NOT NULL DEFAULT 0,
  `lasthit` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_active_user_sessions`
--

INSERT INTO `adkq_active_user_sessions` (`sid`, `internalKey`, `lasthit`, `ip`) VALUES
('s4gtt1odhlcq5u6gm1g38ep6gvkv2m43', 1, 1730408313, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_categories`
--

CREATE TABLE `adkq_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_categories`
--

INSERT INTO `adkq_categories` (`id`, `category`, `rank`) VALUES
(1, 'Manager and Admin', 5),
(2, 'Content', 2),
(3, 'Navigation', 6),
(4, 'SEO', 8),
(5, 'Commerce', 3),
(6, 'editDocs', 4),
(7, 'Шаблоны', 7),
(8, 'Контент', 1),
(9, 'Filter params', 0),
(10, 'Filters', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_commerce_currency`
--

CREATE TABLE `adkq_commerce_currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(8) NOT NULL,
  `value` float NOT NULL DEFAULT 1,
  `left` varchar(32) NOT NULL DEFAULT '',
  `right` varchar(32) NOT NULL DEFAULT '',
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `decsep` varchar(8) NOT NULL,
  `thsep` varchar(8) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `default` tinyint(1) UNSIGNED NOT NULL,
  `lang` varchar(8) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `adkq_commerce_currency`
--

INSERT INTO `adkq_commerce_currency` (`id`, `title`, `code`, `value`, `left`, `right`, `decimals`, `decsep`, `thsep`, `active`, `default`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Рубль', 'RUB', 1, '', ' руб.', 2, ',', ' ', 1, 1, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_commerce_orders`
--

CREATE TABLE `adkq_commerce_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `amount` decimal(16,6) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `lang` varchar(32) NOT NULL,
  `fields` text DEFAULT NULL,
  `status_id` tinyint(3) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `adkq_commerce_orders`
--

INSERT INTO `adkq_commerce_orders` (`id`, `customer_id`, `name`, `phone`, `email`, `amount`, `currency`, `lang`, `fields`, `status_id`, `hash`, `created_at`, `updated_at`) VALUES
(1, 0, 'tssttt', '213123123123', 'awfmlkwajdflk@fawjfawl.faf', '1859.000000', 'RUB', 'ru', '{\"formid\":\"order\"}', 1, 'f5b96c94a1ce0a34b1284c478b09dfa2', '2024-10-25 20:26:00', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_commerce_order_history`
--

CREATE TABLE `adkq_commerce_order_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `notify` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `adkq_commerce_order_history`
--

INSERT INTO `adkq_commerce_order_history` (`id`, `order_id`, `status_id`, `comment`, `notify`, `user_id`, `created_at`) VALUES
(1, 1, 1, '', 0, 1, '2024-10-25 20:26:00');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_commerce_order_payments`
--

CREATE TABLE `adkq_commerce_order_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(16,6) NOT NULL,
  `paid` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `hash` varchar(128) NOT NULL,
  `payment_method` varchar(255) NOT NULL DEFAULT '',
  `original_order_id` varchar(255) NOT NULL DEFAULT '',
  `meta` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_commerce_order_products`
--

CREATE TABLE `adkq_commerce_order_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(16,6) NOT NULL,
  `count` float UNSIGNED NOT NULL DEFAULT 1,
  `options` text DEFAULT NULL,
  `meta` text DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `adkq_commerce_order_products`
--

INSERT INTO `adkq_commerce_order_products` (`id`, `order_id`, `product_id`, `title`, `price`, `count`, `options`, `meta`, `position`) VALUES
(1, 1, 49, 'Corporis tempora adipisci dolor.', '1859.000000', 1, '[]', '[]', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_commerce_order_statuses`
--

CREATE TABLE `adkq_commerce_order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(6) NOT NULL DEFAULT '',
  `notify` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `canbepaid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `adkq_commerce_order_statuses`
--

INSERT INTO `adkq_commerce_order_statuses` (`id`, `title`, `alias`, `color`, `notify`, `default`, `canbepaid`) VALUES
(1, 'Новый', 'order.status.new', '000000', 0, 1, 1),
(2, 'В обработке', 'order.status.processing', '4CAF50', 0, 0, 1),
(3, 'Оплачен', 'order.status.paid', 'E91E63', 1, 0, 1),
(4, 'Доставлен', 'order.status.shipped', '673AB7', 0, 0, 1),
(5, 'Отменен', 'order.status.canceled', 'FF5722', 1, 0, 0),
(6, 'Завершен', 'order.status.complete', '2196F3', 0, 0, 0),
(7, 'Ожидание', 'order.status.pending', '9E9E9E', 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_documentgroup_names`
--

CREATE TABLE `adkq_documentgroup_names` (
  `id` int(11) NOT NULL,
  `name` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `private_memgroup` int(11) DEFAULT 0 COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` int(11) DEFAULT 0 COMMENT 'determines whether the document is private to web users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_document_groups`
--

CREATE TABLE `adkq_document_groups` (
  `id` int(11) NOT NULL,
  `document_group` int(11) NOT NULL DEFAULT 0,
  `document` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_event_log`
--

CREATE TABLE `adkq_event_log` (
  `id` int(11) NOT NULL,
  `eventid` int(11) DEFAULT 0,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT 0 COMMENT 'link to user table',
  `usertype` int(11) NOT NULL DEFAULT 0 COMMENT '0 - manager, 1 - web',
  `source` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_event_log`
--

INSERT INTO `adkq_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(124, 0, 1730404197, 3, 1, 0, 'Plugin - eFilterHelper / SQLSTATE[42000]: Syntax e', '<h2 style=\"color:red\">&laquo; Evolution CMS Parse Error &raquo;</h2><h3 style=\"color:red\">SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;AND templateid=3&#039; at line 1<br><br>SELECT COUNT(*) FROM adkq_site_tmplvar_templates WHERE tmplvarid= AND templateid=3</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://demoshop.localhost/manager/?a=27&amp;r=1&amp;id=87</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Manager action</td>\n		<td>27 - Editing resource</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://demoshop.localhost/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2024-10-31 22:49:57</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.3528 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.3528 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>21.586418151855 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Support\\Facades\\Facade::__callStatic</strong>(\'handleRoute\', array $var2)<br />manager/index.php on line 162</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handleRoute</strong>()<br />core/vendor/illuminate/support/Facades/Facade.php on line 261</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatch</strong>(Illuminate\\Http\\Request $var1)<br />core/src/ManagerTheme.php on line 403</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->dispatchToRoute</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Router.php on line 651</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRoute</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Routing\\Route $var2)<br />core/vendor/illuminate/routing/Router.php on line 662</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->runRouteWithinStack</strong>(Illuminate\\Routing\\Route $var1, Illuminate\\Http\\Request $var2)<br />core/vendor/illuminate/routing/Router.php on line 698</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->then</strong>(Closure $var1)<br />core/vendor/illuminate/routing/Router.php on line 723</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 103</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\VerifyCsrfToken->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/VerifyCsrfToken.php on line 10</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Middleware\\Manager->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/src/Middleware/Manager.php on line 25</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest</strong>(Illuminate\\Http\\Request $var1, Illuminate\\Session\\Store $var2, Closure $var3)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 64</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/session/Middleware/StartSession.php on line 121</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Middleware\\SubstituteBindings->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/routing/Middleware/SubstituteBindings.php on line 50</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle</strong>(Illuminate\\Http\\Request $var1, Closure $var2)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 167</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/view/Middleware/ShareErrorsFromSession.php on line 49</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}</strong>(Illuminate\\Http\\Request $var1)<br />core/vendor/illuminate/pipeline/Pipeline.php on line 128</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\Route->run</strong>()<br />core/vendor/illuminate/routing/Router.php on line 721</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Routing\\Route->runController</strong>()<br />core/vendor/illuminate/routing/Route.php on line 205</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Routing\\ControllerDispatcher->dispatch</strong>(Illuminate\\Routing\\Route $var1, EvolutionCMS\\Controllers\\Actions $var2, \'handleAction\')<br />core/vendor/illuminate/routing/Route.php on line 262</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Controllers\\Actions->handleAction</strong>()<br />core/vendor/illuminate/routing/ControllerDispatcher.php on line 48</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\ManagerTheme->handle</strong>(27)<br />core/src/Controllers/Actions.php on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->render</strong>()<br />core/src/ManagerTheme.php on line 416</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\View->renderContents</strong>()<br />core/vendor/illuminate/view/View.php on line 91</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\View->getContents</strong>()<br />core/vendor/illuminate/view/View.php on line 122</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->get</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/View.php on line 139</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\View\\Engines\\PhpEngine->evaluatePath</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 38</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem->getRequire</strong>(string $var1, array $var2)<br />core/vendor/illuminate/view/Engines/PhpEngine.php on line 58</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}</strong>()<br />core/vendor/illuminate/filesystem/Filesystem.php on line 108</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>require</strong>(string $var1)<br />core/vendor/illuminate/filesystem/Filesystem.php on line 107</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>include_once</strong>(string $var1)<br />manager/views/page/27.php on line 5</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Core->invokeEvent</strong>(\'OnDocFormRender\', array $var2)<br />manager/actions/mutate_content.dynamic.php on line 1502</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Core->evalPlugin</strong>(string $var1, array $var2)<br />core/src/Core.php on line 5596</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>eval</strong>()<br />core/src/Core.php on line 1851</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>EvolutionCMS\\Database->getValue</strong>(string $var1)<br />core/src/Core.php(1851) : eval()\'d code on line 114</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>EvolutionCMS\\Database->query</strong>(string $var1)<br />core/src/Database.php on line 250</td>\n	</tr>\n</table>\n');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_list_catagory_table`
--

CREATE TABLE `adkq_list_catagory_table` (
  `id` int(11) NOT NULL,
  `sort` int(5) NOT NULL DEFAULT 0,
  `title` text NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `adkq_list_catagory_table`
--

INSERT INTO `adkq_list_catagory_table` (`id`, `sort`, `title`) VALUES
(1, 1, 'Brand'),
(2, 2, 'Color');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_list_value_table`
--

CREATE TABLE `adkq_list_value_table` (
  `id` int(5) NOT NULL,
  `parent` int(5) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `sort` int(5) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `adkq_list_value_table`
--

INSERT INTO `adkq_list_value_table` (`id`, `parent`, `title`, `description`, `sort`) VALUES
(1, 1, 'Brand one==1', 'Comment with brand one', 1),
(2, 1, 'Brand two==2', 'Brand two so good', 2),
(3, 2, 'Red==1', '', 1),
(4, 2, 'Green==2', '', 2),
(5, 2, 'Blue==3', '', 3),
(6, 1, 'Brand three==3', 'Three or tree, idk', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_manager_log`
--

CREATE TABLE `adkq_manager_log` (
  `id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `internalKey` int(11) NOT NULL DEFAULT 0,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` int(11) NOT NULL DEFAULT 0,
  `itemid` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `itemname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_manager_log`
--

INSERT INTO `adkq_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1, 1730401775, 1, 'admin', 13, '', '-', 'Viewing logging', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(2, 1730401922, 1, 'admin', 27, '4', 'Cat Section One', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(3, 1730401998, 1, 'admin', 16, '9', 'Text', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(4, 1730402002, 1, 'admin', 96, '9', 'Text Копия', 'Duplicate Template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(5, 1730402002, 1, 'admin', 16, '11', 'Text Копия', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(6, 1730402024, 1, 'admin', 20, '11', 'Sitemap', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(7, 1730402025, 1, 'admin', 16, '11', 'Sitemap', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(8, 1730402027, 1, 'admin', 4, '', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(9, 1730402031, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(10, 1730402031, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(11, 1730402039, 1, 'admin', 5, '-', 'sitemap.xml', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(12, 1730402040, 1, 'admin', 27, '104', 'sitemap.xml', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(13, 1730402049, 1, 'admin', 5, '104', 'sitemap.xml', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(14, 1730402049, 1, 'admin', 27, '104', 'sitemap.xml', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(15, 1730402093, 1, 'admin', 27, '104', 'sitemap.xml', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(16, 1730402101, 1, 'admin', 5, '104', 'sitemap.xml', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(17, 1730402101, 1, 'admin', 27, '104', 'sitemap.xml', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(18, 1730402641, 1, 'admin', 301, '4', 'Изображение для соцсетей', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(19, 1730402663, 1, 'admin', 302, '4', 'Изображение для соцсетей', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(20, 1730402663, 1, 'admin', 301, '4', 'Изображение для соцсетей', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(21, 1730402665, 1, 'admin', 27, '4', 'Cat Section One', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(22, 1730402680, 1, 'admin', 5, '4', 'Cat Section One', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(23, 1730402680, 1, 'admin', 27, '4', 'Cat Section One', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(24, 1730402726, 1, 'admin', 302, '4', 'Изображение для соцсетей', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(25, 1730402726, 1, 'admin', 301, '4', 'Изображение для соцсетей', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(26, 1730402728, 1, 'admin', 27, '4', 'Cat Section One', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(27, 1730402749, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(28, 1730402820, 1, 'admin', 27, '87', 'Praesentium doloremque debitis sit eum nemo provident.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(29, 1730402832, 1, 'admin', 16, '3', 'Product', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(30, 1730402837, 1, 'admin', 117, '3', '-', 'Editing tv rank', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(31, 1730402866, 1, 'admin', 117, '3', '-', 'Editing tv rank', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(32, 1730402870, 1, 'admin', 27, '87', 'Praesentium doloremque debitis sit eum nemo provident.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(33, 1730402878, 1, 'admin', 120, '', '-', 'Idle (unknown)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(34, 1730402901, 1, 'admin', 27, '87', 'Praesentium doloremque debitis sit eum nemo provident.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(35, 1730402908, 1, 'admin', 27, '4', 'Cat Section One', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(36, 1730402927, 1, 'admin', 27, '4', 'Cat Section One', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(37, 1730403792, 1, 'admin', 300, '', 'Новый шаблон', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(38, 1730403828, 1, 'admin', 302, '-', 'Brand', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(39, 1730403829, 1, 'admin', 301, '17', 'Brand', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(40, 1730403833, 1, 'admin', 27, '87', 'Praesentium doloremque debitis sit eum nemo provident.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(41, 1730403841, 1, 'admin', 304, '17', 'product_brand Копия', 'Duplicate Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(42, 1730403841, 1, 'admin', 301, '18', 'Brand Duplicate ', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(43, 1730403854, 1, 'admin', 302, '18', 'Colors', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(44, 1730403855, 1, 'admin', 301, '18', 'Colors', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(45, 1730403875, 1, 'admin', 301, '17', 'Brand', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(46, 1730403880, 1, 'admin', 302, '17', 'Brand', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(47, 1730403881, 1, 'admin', 301, '17', 'Brand', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(48, 1730403883, 1, 'admin', 27, '87', 'Praesentium doloremque debitis sit eum nemo provident.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(49, 1730404116, 1, 'admin', 112, '1', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(50, 1730404160, 1, 'admin', 102, '14', 'eFilterHelper', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(51, 1730404168, 1, 'admin', 108, '5', 'eLists', 'Edit module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(52, 1730404177, 1, 'admin', 301, '19', 'Настройка фильтра', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(53, 1730404187, 1, 'admin', 302, '19', 'Настройка фильтра', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(54, 1730404188, 1, 'admin', 301, '19', 'Настройка фильтра', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(55, 1730404212, 1, 'admin', 76, '', 'Praesentium doloremque debitis sit eum nemo provident.', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(56, 1730404222, 1, 'admin', 109, '5', 'eLists', 'Saving module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(57, 1730404222, 1, 'admin', 108, '5', 'eLists', 'Edit module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(58, 1730404225, 1, 'admin', 27, '4', 'Cat Section One', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(59, 1730404232, 1, 'admin', 27, '2', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(60, 1730404268, 1, 'admin', 5, '2', 'Каталог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(61, 1730404268, 1, 'admin', 27, '2', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(62, 1730404271, 1, 'admin', 27, '87', 'Praesentium doloremque debitis sit eum nemo provident.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(63, 1730404286, 1, 'admin', 27, '27', 'Expedita mollitia excepturi et.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(64, 1730404331, 1, 'admin', 76, '', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(65, 1730404343, 1, 'admin', 76, '', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(66, 1730404346, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(67, 1730404356, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(68, 1730404362, 1, 'admin', 301, '17', 'Brand', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(69, 1730404366, 1, 'admin', 302, '17', 'Brand', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(70, 1730404367, 1, 'admin', 301, '17', 'Brand', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(71, 1730404372, 1, 'admin', 301, '18', 'Colors', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(72, 1730404387, 1, 'admin', 22, '29', 'multiParams', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(73, 1730404406, 1, 'admin', 302, '18', 'Colors', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(74, 1730404407, 1, 'admin', 301, '18', 'Colors', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(75, 1730404413, 1, 'admin', 302, '17', 'Brand', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(76, 1730404414, 1, 'admin', 301, '17', 'Brand', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(77, 1730404422, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(78, 1730404425, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(79, 1730404440, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(80, 1730404458, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(81, 1730404460, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(82, 1730404462, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(83, 1730404469, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(84, 1730404476, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(85, 1730404480, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(86, 1730404483, 1, 'admin', 27, '27', 'Expedita mollitia excepturi et.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(87, 1730404492, 1, 'admin', 5, '27', 'Expedita mollitia excepturi et.', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(88, 1730404493, 1, 'admin', 27, '27', 'Expedita mollitia excepturi et.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(89, 1730404507, 1, 'admin', 112, '4', 'EditDocs', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(90, 1730404510, 1, 'admin', 112, '4', 'EditDocs', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(91, 1730404703, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(92, 1730404707, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(93, 1730404730, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(94, 1730404735, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(95, 1730404739, 1, 'admin', 112, '5', 'eLists', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(96, 1730405181, 1, 'admin', 93, '', '-', 'Backup Manager', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(97, 1730405184, 1, 'admin', 93, '', '-', 'Backup Manager', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(98, 1730405186, 1, 'admin', 112, '4', 'EditDocs', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(99, 1730405190, 1, 'admin', 112, '4', 'EditDocs', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(100, 1730405219, 1, 'admin', 27, '42', 'Id cupiditate quod officiis sit consequatur.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(101, 1730405236, 1, 'admin', 27, '4', 'Cat Section One', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(102, 1730408150, 1, 'admin', 27, '2', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(103, 1730408184, 1, 'admin', 108, '5', 'eLists', 'Edit module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(104, 1730408196, 1, 'admin', 76, '', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(105, 1730408209, 1, 'admin', 301, '9', 'Цена товара', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(106, 1730408215, 1, 'admin', 302, '9', 'Цена товара', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(107, 1730408216, 1, 'admin', 301, '9', 'Цена товара', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(108, 1730408221, 1, 'admin', 27, '2', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(109, 1730408246, 1, 'admin', 5, '2', 'Каталог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(110, 1730408246, 1, 'admin', 27, '2', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(111, 1730408263, 1, 'admin', 5, '2', 'Каталог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(112, 1730408263, 1, 'admin', 27, '2', 'Каталог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(113, 1730408305, 1, 'admin', 71, '', '-', 'Searching', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(114, 1730408307, 1, 'admin', 27, '57', 'Minima saepe ipsum reiciendis aperiam omnis.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(115, 1730408312, 1, 'admin', 5, '57', 'Minima saepe ipsum reiciendis aperiam omnis.', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36'),
(116, 1730408312, 1, 'admin', 27, '57', 'Minima saepe ipsum reiciendis aperiam omnis.', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 YaBrowser/24.10.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_membergroup_access`
--

CREATE TABLE `adkq_membergroup_access` (
  `id` int(11) NOT NULL,
  `membergroup` int(11) NOT NULL DEFAULT 0,
  `documentgroup` int(11) NOT NULL DEFAULT 0,
  `context` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_membergroup_names`
--

CREATE TABLE `adkq_membergroup_names` (
  `id` int(11) NOT NULL,
  `name` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_member_groups`
--

CREATE TABLE `adkq_member_groups` (
  `id` int(11) NOT NULL,
  `user_group` int(11) NOT NULL DEFAULT 0,
  `member` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_migrations_install`
--

CREATE TABLE `adkq_migrations_install` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_migrations_install`
--

INSERT INTO `adkq_migrations_install` (`id`, `migration`, `batch`) VALUES
(1, '2018_06_29_182342_create_active_user_locks_table', 1),
(2, '2018_06_29_182342_create_active_user_sessions_table', 1),
(3, '2018_06_29_182342_create_active_users_table', 1),
(4, '2018_06_29_182342_create_categories_table', 1),
(5, '2018_06_29_182342_create_document_groups_table', 1),
(6, '2018_06_29_182342_create_documentgroup_names_table', 1),
(7, '2018_06_29_182342_create_event_log_table', 1),
(8, '2018_06_29_182342_create_manager_log_table', 1),
(9, '2018_06_29_182342_create_manager_users_table', 1),
(10, '2018_06_29_182342_create_member_groups_table', 1),
(11, '2018_06_29_182342_create_membergroup_access_table', 1),
(12, '2018_06_29_182342_create_membergroup_names_table', 1),
(13, '2018_06_29_182342_create_permissions_groups_table', 1),
(14, '2018_06_29_182342_create_permissions_table', 1),
(15, '2018_06_29_182342_create_role_permissions_table', 1),
(16, '2018_06_29_182342_create_site_content_table', 1),
(17, '2018_06_29_182342_create_site_htmlsnippets_table', 1),
(18, '2018_06_29_182342_create_site_module_access_table', 1),
(19, '2018_06_29_182342_create_site_module_depobj_table', 1),
(20, '2018_06_29_182342_create_site_modules_table', 1),
(21, '2018_06_29_182342_create_site_plugin_events_table', 1),
(22, '2018_06_29_182342_create_site_plugins_table', 1),
(23, '2018_06_29_182342_create_site_snippets_table', 1),
(24, '2018_06_29_182342_create_site_templates_table', 1),
(25, '2018_06_29_182342_create_site_tmplvar_access_table', 1),
(26, '2018_06_29_182342_create_site_tmplvar_contentvalues_table', 1),
(27, '2018_06_29_182342_create_site_tmplvar_templates_table', 1),
(28, '2018_06_29_182342_create_site_tmplvars_table', 1),
(29, '2018_06_29_182342_create_system_eventnames_table', 1),
(30, '2018_06_29_182342_create_system_settings_table', 1),
(31, '2018_06_29_182342_create_user_attributes_table', 1),
(32, '2018_06_29_182342_create_user_roles_table', 1),
(33, '2018_06_29_182342_create_user_settings_table', 1),
(34, '2018_06_29_182342_create_web_groups_table', 1),
(35, '2018_06_29_182342_create_web_user_attributes_table', 1),
(36, '2018_06_29_182342_create_web_user_settings_table', 1),
(37, '2018_06_29_182342_create_web_users_table', 1),
(38, '2018_06_29_182342_create_webgroup_access_table', 1),
(39, '2018_06_29_182342_create_webgroup_names_table', 1),
(40, '2020_09_12_110820_create_site_content_closure', 1),
(41, '2020_09_16_110820_update_web_user_attributes_table', 1),
(42, '2020_10_05_124820_second_update_web_user_attributes_table', 1),
(43, '2020_10_05_154230_drop_manager_user_tables', 1),
(44, '2020_10_05_162325_rename_web_user_tables', 1),
(45, '2020_10_08_112342_remove_column_from_role_table', 1),
(46, '2020_10_12_065655_make_guid_nullable_in_modules', 1),
(47, '2020_10_12_065655_make_moduleguid_nullable_in_plugins', 1),
(48, '2020_10_28_154230_drop_webuser_group_tables', 1),
(49, '2020_10_30_065655_make_dob_nullable_in_userattributes', 1),
(50, '2020_11_02_100555_add_token_columns_to_user_table', 1),
(51, '2020_11_10_110555_add_verified_columns_to_user_table', 1),
(52, '2020_11_22_114803_create_user_role_vars', 1),
(53, '2020_11_22_114809_create_user_values', 1),
(54, '2020_12_23_065655_make_display_nullable_in_tmplvars', 1),
(55, '2021_02_05_121655_add_index_to_pubdate_column_content_table', 1),
(56, '2021_02_10_060454_add_properties_column_to_site_tmplvars', 1),
(57, '2021_02_17_102610_rename_donthit_column_in_site_content_table', 1),
(58, '2022_04_17_133922_add_context_column_to_membergroup_access', 1),
(59, '2022_09_07_130522_resize_ip_column_in_manager_log', 1),
(60, '2022_12_03_183200_add_unique_index_to_name_col_in_system_eventnames_table', 1),
(61, '2023_01_06_191600_add_indexes_to_fields_in_manager_log_table', 1),
(62, '2023_10_06_145300_modify_fullname_column_in_userattributes_table', 1),
(63, '2024_03_13_001412_add_templatecontroller_column_to_site_templates', 1),
(64, '2018_06_29_182342_create_permissions_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_permissions`
--

CREATE TABLE `adkq_permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_permissions`
--

INSERT INTO `adkq_permissions` (`id`, `name`, `key`, `lang_key`, `group_id`, `disabled`, `created_at`, `updated_at`) VALUES
(1, 'Request manager frames', 'frames', 'role_frames', 1, 1, NULL, NULL),
(2, 'Request manager intro page', 'home', 'role_home', 1, 1, NULL, NULL),
(3, 'Log out of the manager', 'logout', 'role_logout', 1, 1, NULL, NULL),
(4, 'View help pages', 'help', 'role_help', 1, 0, NULL, NULL),
(5, 'View action completed screen', 'action_ok', 'role_actionok', 1, 1, NULL, NULL),
(6, 'View error dialog', 'error_dialog', 'role_errors', 1, 1, NULL, NULL),
(7, 'View the about page', 'about', 'role_about', 1, 1, NULL, NULL),
(8, 'View credits', 'credits', 'role_credits', 1, 1, NULL, NULL),
(9, 'Change password', 'change_password', 'role_change_password', 1, 0, NULL, NULL),
(10, 'Save password', 'save_password', 'role_save_password', 1, 0, NULL, NULL),
(11, 'View a Resource\'s data', 'view_document', 'role_view_docdata', 2, 1, NULL, NULL),
(12, 'Create new Resources', 'new_document', 'role_create_doc', 2, 0, NULL, NULL),
(13, 'Edit a Resource', 'edit_document', 'role_edit_doc', 2, 0, NULL, NULL),
(14, 'Change Resource-Type', 'change_resourcetype', 'role_change_resourcetype', 2, 0, NULL, NULL),
(15, 'Save Resources', 'save_document', 'role_save_doc', 2, 0, NULL, NULL),
(16, 'Publish Resources', 'publish_document', 'role_publish_doc', 2, 0, NULL, NULL),
(17, 'Delete Resources', 'delete_document', 'role_delete_doc', 2, 0, NULL, NULL),
(18, 'Permanently purge deleted Resources', 'empty_trash', 'role_empty_trash', 2, 0, NULL, NULL),
(19, 'Empty the site\'s cache', 'empty_cache', 'role_cache_refresh', 2, 0, NULL, NULL),
(20, 'View Unpublished Resources', 'view_unpublished', 'role_view_unpublished', 2, 0, NULL, NULL),
(21, 'Use the file manager (full root access)', 'file_manager', 'role_file_manager', 3, 0, NULL, NULL),
(22, 'Manage assets/files', 'assets_files', 'role_assets_files', 3, 0, NULL, NULL),
(23, 'Manage assets/images', 'assets_images', 'role_assets_images', 3, 0, NULL, NULL),
(24, 'Use the Category Manager', 'category_manager', 'role_category_manager', 4, 0, NULL, NULL),
(25, 'Create new Module', 'new_module', 'role_new_module', 5, 0, NULL, NULL),
(26, 'Edit Module', 'edit_module', 'role_edit_module', 5, 0, NULL, NULL),
(27, 'Save Module', 'save_module', 'role_save_module', 5, 0, NULL, NULL),
(28, 'Delete Module', 'delete_module', 'role_delete_module', 5, 0, NULL, NULL),
(29, 'Run Module', 'exec_module', 'role_run_module', 5, 0, NULL, NULL),
(30, 'List Module', 'list_module', 'role_list_module', 5, 0, NULL, NULL),
(31, 'Create new site Templates', 'new_template', 'role_create_template', 6, 0, NULL, NULL),
(32, 'Edit site Templates', 'edit_template', 'role_edit_template', 6, 0, NULL, NULL),
(33, 'Save Templates', 'save_template', 'role_save_template', 6, 0, NULL, NULL),
(34, 'Delete Templates', 'delete_template', 'role_delete_template', 6, 0, NULL, NULL),
(35, 'Create new Snippets', 'new_snippet', 'role_create_snippet', 7, 0, NULL, NULL),
(36, 'Edit Snippets', 'edit_snippet', 'role_edit_snippet', 7, 0, NULL, NULL),
(37, 'Save Snippets', 'save_snippet', 'role_save_snippet', 7, 0, NULL, NULL),
(38, 'Delete Snippets', 'delete_snippet', 'role_delete_snippet', 7, 0, NULL, NULL),
(39, 'Create new Chunks', 'new_chunk', 'role_create_chunk', 8, 0, NULL, NULL),
(40, 'Edit Chunks', 'edit_chunk', 'role_edit_chunk', 8, 0, NULL, NULL),
(41, 'Save Chunks', 'save_chunk', 'role_save_chunk', 8, 0, NULL, NULL),
(42, 'Delete Chunks', 'delete_chunk', 'role_delete_chunk', 8, 0, NULL, NULL),
(43, 'Create new Plugins', 'new_plugin', 'role_create_plugin', 9, 0, NULL, NULL),
(44, 'Edit Plugins', 'edit_plugin', 'role_edit_plugin', 9, 0, NULL, NULL),
(45, 'Save Plugins', 'save_plugin', 'role_save_plugin', 9, 0, NULL, NULL),
(46, 'Delete Plugins', 'delete_plugin', 'role_delete_plugin', 9, 0, NULL, NULL),
(47, 'Create new users', 'new_user', 'role_new_user', 10, 0, NULL, NULL),
(48, 'Edit users', 'edit_user', 'role_edit_user', 10, 0, NULL, NULL),
(49, 'Save users', 'save_user', 'role_save_user', 10, 0, NULL, NULL),
(50, 'Delete users', 'delete_user', 'role_delete_user', 10, 0, NULL, NULL),
(51, 'Manager access permissions', 'access_permissions', 'manager_access_permissions', 11, 0, NULL, NULL),
(52, 'Manage document and user groups', 'manage_groups', 'manage_groups', 11, 0, NULL, NULL),
(53, 'Manage document permissions', 'manage_document_permissions', 'manage_document_permissions', 11, 0, NULL, NULL),
(54, 'Manage module permissions', 'manage_module_permissions', 'manage_module_permissions', 11, 0, NULL, NULL),
(55, 'Manage TV permissions', 'manage_tv_permissions', 'manage_tv_permissions', 11, 0, NULL, NULL),
(56, 'Create new roles', 'new_role', 'role_new_role', 12, 0, NULL, NULL),
(57, 'Edit roles', 'edit_role', 'role_edit_role', 12, 0, NULL, NULL),
(58, 'Save roles', 'save_role', 'role_save_role', 12, 0, NULL, NULL),
(59, 'Delete roles', 'delete_role', 'role_delete_role', 12, 0, NULL, NULL),
(60, 'View event log', 'view_eventlog', 'role_view_eventlog', 13, 0, NULL, NULL),
(61, 'Delete event log', 'delete_eventlog', 'role_delete_eventlog', 13, 0, NULL, NULL),
(62, 'View system logs', 'logs', 'role_view_logs', 14, 0, NULL, NULL),
(63, 'Change site settings', 'settings', 'role_edit_settings', 14, 0, NULL, NULL),
(64, 'Use the Backup Manager', 'bk_manager', 'role_bk_manager', 14, 0, NULL, NULL),
(65, 'Remove Locks', 'remove_locks', 'role_remove_locks', 14, 0, NULL, NULL),
(66, 'Display Locks', 'display_locks', 'role_display_locks', 14, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_permissions_groups`
--

CREATE TABLE `adkq_permissions_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_permissions_groups`
--

INSERT INTO `adkq_permissions_groups` (`id`, `name`, `lang_key`, `created_at`, `updated_at`) VALUES
(1, 'General', 'page_data_general', NULL, NULL),
(2, 'Content Management', 'role_content_management', NULL, NULL),
(3, 'File Management', 'role_file_management', NULL, NULL),
(4, 'Category Management', 'category_management', NULL, NULL),
(5, 'Module Management', 'role_module_management', NULL, NULL),
(6, 'Template Management', 'role_template_management', NULL, NULL),
(7, 'Snippet Management', 'role_snippet_management', NULL, NULL),
(8, 'Chunk Management', 'role_chunk_management', NULL, NULL),
(9, 'Plugin Management', 'role_plugin_management', NULL, NULL),
(10, 'User Management', 'role_user_management', NULL, NULL),
(11, 'Permissions', 'role_udperms', NULL, NULL),
(12, 'Role Management', 'role_role_management', NULL, NULL),
(13, 'Events Log Management', 'role_eventlog_management', NULL, NULL),
(14, 'Config Management', 'role_config_management', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_role_permissions`
--

CREATE TABLE `adkq_role_permissions` (
  `id` int(11) NOT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_role_permissions`
--

INSERT INTO `adkq_role_permissions` (`id`, `permission`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'frames', 1, NULL, NULL),
(2, 'home', 1, NULL, NULL),
(3, 'logout', 1, NULL, NULL),
(4, 'help', 1, NULL, NULL),
(5, 'role_actionok', 1, NULL, NULL),
(6, 'error_dialog', 1, NULL, NULL),
(7, 'about', 1, NULL, NULL),
(8, 'credits', 1, NULL, NULL),
(9, 'change_password', 1, NULL, NULL),
(10, 'save_password', 1, NULL, NULL),
(11, 'view_document', 1, NULL, NULL),
(12, 'new_document', 1, NULL, NULL),
(13, 'edit_document', 1, NULL, NULL),
(14, 'change_resourcetype', 1, NULL, NULL),
(15, 'save_document', 1, NULL, NULL),
(16, 'publish_document', 1, NULL, NULL),
(17, 'delete_document', 1, NULL, NULL),
(18, 'empty_trash', 1, NULL, NULL),
(19, 'empty_cache', 1, NULL, NULL),
(20, 'view_unpublished', 1, NULL, NULL),
(21, 'file_manager', 1, NULL, NULL),
(22, 'assets_files', 1, NULL, NULL),
(23, 'assets_images', 1, NULL, NULL),
(24, 'category_manager', 1, NULL, NULL),
(25, 'new_module', 1, NULL, NULL),
(26, 'edit_module', 1, NULL, NULL),
(27, 'save_module', 1, NULL, NULL),
(28, 'delete_module', 1, NULL, NULL),
(29, 'exec_module', 1, NULL, NULL),
(30, 'list_module', 1, NULL, NULL),
(31, 'new_template', 1, NULL, NULL),
(32, 'edit_template', 1, NULL, NULL),
(33, 'save_template', 1, NULL, NULL),
(34, 'delete_template', 1, NULL, NULL),
(35, 'new_snippet', 1, NULL, NULL),
(36, 'edit_snippet', 1, NULL, NULL),
(37, 'save_snippet', 1, NULL, NULL),
(38, 'delete_snippet', 1, NULL, NULL),
(39, 'new_chunk', 1, NULL, NULL),
(40, 'edit_chunk', 1, NULL, NULL),
(41, 'save_chunk', 1, NULL, NULL),
(42, 'delete_chunk', 1, NULL, NULL),
(43, 'new_plugin', 1, NULL, NULL),
(44, 'edit_plugin', 1, NULL, NULL),
(45, 'save_plugin', 1, NULL, NULL),
(46, 'delete_plugin', 1, NULL, NULL),
(47, 'new_user', 1, NULL, NULL),
(48, 'edit_user', 1, NULL, NULL),
(49, 'save_user', 1, NULL, NULL),
(50, 'delete_user', 1, NULL, NULL),
(51, 'access_permissions', 1, NULL, NULL),
(52, 'manage_groups', 1, NULL, NULL),
(53, 'manage_document_permissions', 1, NULL, NULL),
(54, 'manage_module_permissions', 1, NULL, NULL),
(55, 'manage_tv_permissions', 1, NULL, NULL),
(56, 'new_role', 1, NULL, NULL),
(57, 'edit_role', 1, NULL, NULL),
(58, 'save_role', 1, NULL, NULL),
(59, 'delete_role', 1, NULL, NULL),
(60, 'view_eventlog', 1, NULL, NULL),
(61, 'delete_eventlog', 1, NULL, NULL),
(62, 'logs', 1, NULL, NULL),
(63, 'settings', 1, NULL, NULL),
(64, 'bk_manager', 1, NULL, NULL),
(65, 'remove_locks', 1, NULL, NULL),
(66, 'display_locks', 1, NULL, NULL),
(67, 'frames', 2, NULL, NULL),
(68, 'home', 2, NULL, NULL),
(69, 'logout', 2, NULL, NULL),
(70, 'help', 2, NULL, NULL),
(71, 'role_actionok', 2, NULL, NULL),
(72, 'error_dialog', 2, NULL, NULL),
(73, 'about', 2, NULL, NULL),
(74, 'credits', 2, NULL, NULL),
(75, 'change_password', 2, NULL, NULL),
(76, 'save_password', 2, NULL, NULL),
(77, 'view_document', 2, NULL, NULL),
(78, 'new_document', 2, NULL, NULL),
(79, 'edit_document', 2, NULL, NULL),
(80, 'change_resourcetype', 2, NULL, NULL),
(81, 'save_document', 2, NULL, NULL),
(82, 'publish_document', 2, NULL, NULL),
(83, 'delete_document', 2, NULL, NULL),
(84, 'empty_cache', 2, NULL, NULL),
(85, 'view_unpublished', 2, NULL, NULL),
(86, 'file_manager', 2, NULL, NULL),
(87, 'assets_files', 2, NULL, NULL),
(88, 'assets_images', 2, NULL, NULL),
(89, 'exec_module', 2, NULL, NULL),
(90, 'list_module', 2, NULL, NULL),
(91, 'edit_chunk', 2, NULL, NULL),
(92, 'save_chunk', 2, NULL, NULL),
(93, 'remove_locks', 2, NULL, NULL),
(94, 'display_locks', 2, NULL, NULL),
(95, 'access_permissions', 2, NULL, NULL),
(96, 'manage_document_permissions', 2, NULL, NULL),
(97, 'frames', 3, NULL, NULL),
(98, 'home', 3, NULL, NULL),
(99, 'logout', 3, NULL, NULL),
(100, 'help', 3, NULL, NULL),
(101, 'role_actionok', 3, NULL, NULL),
(102, 'error_dialog', 3, NULL, NULL),
(103, 'about', 3, NULL, NULL),
(104, 'credits', 3, NULL, NULL),
(105, 'change_password', 3, NULL, NULL),
(106, 'save_password', 3, NULL, NULL),
(107, 'view_document', 3, NULL, NULL),
(108, 'new_document', 3, NULL, NULL),
(109, 'edit_document', 3, NULL, NULL),
(110, 'change_resourcetype', 3, NULL, NULL),
(111, 'save_document', 3, NULL, NULL),
(112, 'publish_document', 3, NULL, NULL),
(113, 'delete_document', 3, NULL, NULL),
(114, 'empty_trash', 3, NULL, NULL),
(115, 'empty_cache', 3, NULL, NULL),
(116, 'view_unpublished', 3, NULL, NULL),
(117, 'file_manager', 3, NULL, NULL),
(118, 'assets_files', 3, NULL, NULL),
(119, 'assets_images', 3, NULL, NULL),
(120, 'exec_module', 3, NULL, NULL),
(121, 'list_module', 3, NULL, NULL),
(122, 'new_template', 3, NULL, NULL),
(123, 'edit_template', 3, NULL, NULL),
(124, 'save_template', 3, NULL, NULL),
(125, 'delete_template', 3, NULL, NULL),
(126, 'new_chunk', 3, NULL, NULL),
(127, 'edit_chunk', 3, NULL, NULL),
(128, 'save_chunk', 3, NULL, NULL),
(129, 'delete_chunk', 3, NULL, NULL),
(130, 'new_user', 3, NULL, NULL),
(131, 'edit_user', 3, NULL, NULL),
(132, 'save_user', 3, NULL, NULL),
(133, 'delete_user', 3, NULL, NULL),
(134, 'logs', 3, NULL, NULL),
(135, 'settings', 3, NULL, NULL),
(136, 'bk_manager', 3, NULL, NULL),
(137, 'remove_locks', 3, NULL, NULL),
(138, 'display_locks', 3, NULL, NULL),
(139, 'access_permissions', 3, NULL, NULL),
(140, 'manage_document_permissions', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_content`
--

CREATE TABLE `adkq_site_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'document',
  `contentType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `longtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `link_attributes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(11) NOT NULL DEFAULT 0,
  `pub_date` int(11) NOT NULL DEFAULT 0,
  `unpub_date` int(11) NOT NULL DEFAULT 0,
  `parent` int(11) NOT NULL DEFAULT 0,
  `isfolder` int(11) NOT NULL DEFAULT 0,
  `introtext` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Used to provide quick summary of the document',
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `richtext` tinyint(1) NOT NULL DEFAULT 1,
  `template` int(11) NOT NULL DEFAULT 0,
  `menuindex` int(11) NOT NULL DEFAULT 0,
  `searchable` int(11) NOT NULL DEFAULT 1,
  `cacheable` int(11) NOT NULL DEFAULT 1,
  `createdby` int(11) NOT NULL DEFAULT 0,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedby` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `deletedon` int(11) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL DEFAULT 0,
  `publishedon` int(11) NOT NULL DEFAULT 0 COMMENT 'Date the document was published',
  `publishedby` int(11) NOT NULL DEFAULT 0 COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Menu title',
  `hide_from_tree` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Hide document from menu',
  `alias_visible` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_content`
--

INSERT INTO `adkq_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `hide_from_tree`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Главная', '', '', 'glavnaya', '', 1, 0, 0, 0, 0, '', '', 1, 1, 0, 1, 1, 0, 1130304721, 1, 1729970255, 0, 0, 0, 1130304721, 1, '', 0, 0, 0, 0, 0, 1),
(2, 'document', 'text/html', 'Каталог', '', '', 'catalog', '', 1, 0, 0, 0, 1, '', '', 1, 2, 1, 1, 1, 1, 1728752833, 0, 1729970255, 0, 0, 0, 1728752833, 1, '', 0, 0, 0, 0, 0, 1),
(3, 'document', 'text/html', 'Корзина', '', '', 'cart', '', 1, 0, 0, 0, 0, '', '', 1, 4, 6, 1, 1, 1, 1728753000, 0, 1729970255, 0, 0, 0, 1728753000, 1, '', 0, 0, 0, 0, 1, 1),
(4, 'document', 'text/html', 'Cat Section One', '', '', 'cat-section-one', '', 1, 0, 0, 2, 1, '', '<p>Similique delectus voluptates sint quibusdam non nam. Dicta labore alias aut pariatur. Velit fugit est omnis qui velit quis. Voluptate magni quis dolorum in. Natus doloribus aut consequatur quas accusamus nemo commodi. Eaque quisquam culpa earum aut. Autem non maiores recusandae amet. Omnis consectetur exercitationem ut saepe maxime consequuntur. Dicta praesentium fuga doloribus perspiciatis. Maxime est est provident aut aliquam quod itaque ad. Dolor est enim est. Nihil eaque recusandae voluptates in officiis maiores dolore temporibus. Molestiae quos in est rerum exercitationem modi. In facere minima libero dolore porro illo. Sed dolorem ut modi tempore laboriosam et. Consequatur eum similique ullam rerum recusandae ab. Non veniam doloribus ratione voluptatem id recusandae quia molestiae. Pariatur consectetur voluptatum laborum qui distinctio eum sint qui. Eos rerum perferendis occaecati perspiciatis voluptatem qui delectus. At sint dolores repellendus quasi. Nihil non atque et.</p>', 1, 5, 0, 1, 1, 1, 1728756115, 1, 1729713649, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(5, 'document', 'text/html', 'Section tree', '', '', 'section-tree', '', 1, 0, 0, 2, 1, '', '<p>Voluptates nisi doloribus sed modi est nemo odit illum. Consequatur ea eum veritatis sint blanditiis eum nobis eos. Voluptatum corrupti nobis et odio ducimus. Rerum impedit cupiditate est suscipit ea sed odit. Soluta et cupiditate repudiandae repellendus minus mollitia voluptas. Magni quaerat voluptatum ut eos architecto. Hic facere aut ex et sapiente temporibus. Et soluta voluptatem consequatur pariatur omnis consequatur rerum accusantium. Nisi beatae et quia at dolores ipsum. Dolore aut rerum inventore voluptatum. Error atque aut tenetur eveniet. Illo porro quos saepe cumque corporis. Cupiditate dolores debitis ut omnis eum et. Ut molestiae quia quos hic maxime. Debitis dolores at et id est. Blanditiis maxime repudiandae magnam qui earum placeat quia est. Cum velit modi tempora qui ducimus. Earum voluptatem reprehenderit delectus eum optio. Maxime dolor fugit vel rerum. Fuga totam omnis voluptatibus. Quibusdam quae illum nemo et est sed deserunt.</p>', 1, 5, 1, 1, 1, 1, 1728756115, 1, 1729713649, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(6, 'document', 'text/html', 'Section two', '', '', 'section-two', '', 1, 0, 0, 2, 1, '', '<p>Doloribus ullam repellat blanditiis doloremque sed aut. Dolorum voluptas enim magnam atque. Non expedita molestias qui quasi aliquam. Praesentium repellat laborum voluptatem molestiae cupiditate. Quaerat corporis amet ab. Numquam iure est numquam numquam ad error vitae. Magnam rerum ex quod rem atque aspernatur. Consectetur optio blanditiis sunt. Voluptatem deserunt nemo id quaerat. Quo ea qui similique. Necessitatibus sit porro sed sed id aperiam inventore. Quas deleniti dolor eligendi. Distinctio quis occaecati fuga natus aut in. Reprehenderit nemo fugiat ipsam commodi veniam dolore. Maiores corrupti id doloremque laborum est ipsa animi. Architecto ipsa magni sunt nobis modi doloremque. Aliquid optio qui similique et. Aut ad autem minus similique. Dolorum similique debitis provident doloremque necessitatibus ut. Eius possimus facilis saepe culpa quidem consequuntur non. Amet officiis nihil minus veritatis aut hic praesentium.</p>', 1, 5, 2, 1, 1, 1, 1728756115, 1, 1729713649, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(7, 'document', 'text/html', 'Section Four', '', '', 'section-four', '', 1, 0, 0, 2, 1, '', '<p>Id voluptatum voluptate sit aliquam nesciunt nihil. Fuga amet asperiores voluptas nobis. Saepe aut dolores est voluptatibus illum. Non omnis amet delectus ex. Nostrum porro perferendis expedita. Quaerat excepturi aut ab nihil. Eum quam beatae non temporibus non qui a. In esse itaque libero quae eveniet molestiae. Magni nulla accusamus rerum et et error magni. Aut laudantium eos esse reprehenderit enim odio. Corrupti vitae voluptate sequi magni vitae. Et dolorem neque minima ratione rerum. Natus maiores nam natus velit. Ullam quas molestiae ut. Minus tempore et ad enim dolores dolorum. Illo dignissimos in ut eum temporibus. Quo eaque ea veniam facilis eos. Distinctio nihil sit maiores. Et perferendis consequatur et neque harum quibusdam eveniet repellendus. Reprehenderit reprehenderit quasi reiciendis. Consequatur omnis saepe maxime quia blanditiis et. Fugiat dolores distinctio ex doloribus autem sit. Enim animi at non nemo.</p>', 1, 5, 5, 1, 1, 1, 1728756115, 1, 1729713649, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(8, 'document', 'text/html', 'Section five', '', '', 'section-five', '', 1, 0, 0, 2, 1, '', '<p>Qui officiis explicabo ipsam est qui et. Pariatur molestiae debitis sed ad. Sunt sit aliquid sit. Porro rerum totam consequatur recusandae aut omnis officia molestiae. Pariatur quo et delectus placeat consequuntur quaerat deleniti. Molestiae omnis illo id et a quam dicta. Repellendus quis quaerat aut cupiditate omnis veritatis. Modi earum rerum sapiente similique. Et eveniet omnis alias suscipit fugit. Dignissimos illum corporis corrupti. Velit alias magnam autem optio. Sed autem quia nam modi rem dolorem maiores. Pariatur provident quos debitis quas. Voluptatem accusamus aut non et ea earum eaque. Distinctio facere aperiam maxime. Excepturi itaque omnis qui dicta quasi esse consectetur blanditiis. At reprehenderit repellat a quis impedit. Enim qui excepturi necessitatibus quam. Quo aut consequuntur est voluptas velit nisi error. Sed accusamus quidem est corrupti blanditiis non. Tempora a doloremque atque saepe repellendus quos error.</p>', 1, 5, 3, 1, 1, 1, 1728756115, 1, 1729713652, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(9, 'document', 'text/html', 'Обзоры', '', '', 'articles', '', 1, 0, 0, 0, 1, '', '<p>Officia et similique repudiandae aut delectus aut. Voluptatem assumenda modi ea qui saepe et. Omnis dolorem numquam cumque est. Nesciunt molestias facilis eum non. Dolor nam sed dicta quis accusantium deleniti. Nihil quia repudiandae quia fuga quis velit sint explicabo. Et necessitatibus enim quo perferendis. Voluptatem voluptatem ipsa esse vel tenetur in sint consectetur. Sequi laudantium ut voluptatibus nihil. Rem quo blanditiis et est. Nam non veritatis odio ipsum vero. Et sit aut aliquam reprehenderit possimus aliquid velit. Voluptas accusantium tempora quia. Soluta et maxime facilis et ea. Repudiandae in quas sapiente adipisci. Molestiae iste vel in temporibus qui. Non cum est ad rerum enim voluptatibus dicta. Dolorem ex nulla praesentium explicabo rerum vel. Nam ea ipsa molestiae aliquid quis. Possimus doloremque omnis fuga accusantium est. Eum pariatur sunt in dolorem eius non.</p>', 1, 6, 2, 1, 1, 1, 1728756115, 1, 1729970255, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 0, 1),
(10, 'document', 'text/html', 'Оформление', '', '', 'send', '', 1, 0, 0, 0, 0, '', '<p>Occaecati et nihil odio. Sit praesentium quia iusto earum exercitationem aut voluptatum. Mollitia et velit voluptas explicabo error fugiat vel. Et ea qui qui dolore at enim. Dolorem est veniam facere ab. Nihil eligendi rerum nulla ducimus omnis nisi. Qui aut et reiciendis temporibus accusantium corporis. Illum voluptas magnam beatae aliquam nulla. Error veniam nihil rerum quidem. Ducimus quas et qui dolorum in numquam. Accusamus vel labore sit quia quia. Non ut sit ducimus cupiditate. Explicabo ea quo facilis eaque neque. Soluta porro adipisci distinctio non ex nulla laborum. Id fugiat et odit modi unde iure. Sunt eos et asperiores incidunt non vel. Non quia sed esse at beatae nobis. Iste vitae ab impedit natus dicta illum. Error occaecati dolor dicta. Ratione aut non earum aliquam totam est. Repudiandae commodi ea qui. Distinctio consequatur iure asperiores occaecati autem iure harum unde.</p>', 1, 3, 7, 1, 1, 1, 1728756115, 1, 1729970255, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(11, 'document', 'text/html', '404', '', '', '404', '', 1, 0, 0, 0, 0, '', '<p>Not found</p>\r\n<p>Expedita qui in omnis mollitia animi molestias. Qui dolores ratione quia maiores. Et laudantium doloremque fugit maxime veritatis iste non in. Accusamus cumque sit neque mollitia totam odio harum iure. Minima recusandae sunt optio odit voluptatem. Eum ut ipsa sit et aliquam. Rerum delectus sed quas neque omnis quia. Molestiae fuga consequuntur deserunt rem. Odit nisi possimus sequi. Ut aut veniam voluptatem numquam suscipit velit quo. Earum deleniti nihil eaque facere esse et in. Enim corporis quia fugiat vel odio. Nobis deserunt ullam qui nobis. Autem earum vitae tenetur quasi laudantium sit consequatur officiis. Non omnis enim repudiandae possimus debitis occaecati sed eos. Iure aut itaque suscipit voluptate harum. Error omnis doloribus aut deserunt et sint omnis sit. Est exercitationem hic aut quae cupiditate et deleniti. Voluptas tempora autem et fuga ea eos tenetur. Possimus illo mollitia magni est. Non quasi doloribus iure et. Illo dolorem et aliquid veritatis officiis labore.</p>', 1, 8, 8, 1, 1, 1, 1728756115, 1, 1729970255, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(12, 'document', 'text/html', 'О компании', '', '', 'about', '', 1, 0, 0, 0, 0, '', '<p>Veniam eum quaerat cupiditate et. Molestias deleniti accusamus deserunt veniam sapiente sit qui eligendi. Enim ducimus est aperiam omnis animi. Tenetur quisquam incidunt asperiores molestiae ut. Libero quaerat mollitia eum in eum quidem. Nisi et delectus repellat dolores quisquam. Sint eligendi totam ratione corrupti. Enim nemo voluptatem qui id omnis qui inventore quod. Dolorem eveniet qui dicta et delectus error. Et possimus explicabo ipsum rerum minus iste beatae. At ut impedit magnam odit ipsa deleniti. Nobis laboriosam voluptatibus dolor. Voluptas sunt id itaque recusandae sed similique dolor. Consequuntur eaque et libero impedit. Eum rerum libero illo in. Voluptas vitae amet quae et. Eos cupiditate deserunt ea molestias. Dolorum et officiis voluptatem. Laborum exercitationem sed corporis dicta consequatur. Est commodi adipisci placeat atque et nesciunt aliquam eos. Est a quis sed commodi autem quae iusto.</p>', 1, 9, 3, 1, 1, 1, 1728756115, 1, 1729970255, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 0, 1),
(13, 'document', 'text/html', 'Контакты', '', '', 'contacts', '', 1, 0, 0, 0, 0, '', '', 0, 10, 4, 1, 1, 1, 1728756115, 1, 1729970255, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 0, 1),
(14, 'document', 'text/html', 'Commodi aliquid voluptates qui eos ex.', '', '', 'commodi-aliquid-voluptates-qui-eos-ex', '', 1, 0, 0, 0, 0, '', 'Et animi eos nisi voluptas. Molestias et placeat velit a. Beatae consequatur ut voluptatibus assumenda. Quaerat ipsam asperiores et quo. Ratione ab aut dolores et vitae. Doloremque laboriosam non itaque cumque est aliquam nostrum incidunt. Molestiae quam tenetur quas reiciendis deserunt. Rerum in sed modi ut id qui similique. Expedita eum blanditiis at aut sunt dolorem dolor. Distinctio consequatur tempora in vero. Nihil et possimus illum facilis. Laboriosam voluptas commodi aspernatur doloribus et est omnis asperiores. Quibusdam aspernatur minus rem praesentium voluptatem sint. Velit sit aperiam facere impedit repellat dolor tempore. Et dolore quia suscipit nostrum aliquam minima doloribus. Ex sit nobis asperiores eius et laborum eligendi. Non deleniti et quia. Sint sit ut esse voluptas et et quisquam. Et et libero placeat explicabo at in. Error quis reiciendis totam facere porro excepturi vel autem. Esse non hic voluptatem odit.', 1, 3, 5, 1, 1, 1, 1728756115, 1, 1729970255, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(15, 'document', 'text/html', 'Odit neque et autem numquam aut sunt.', '', '', 'odit-neque-et-autem-numquam-aut-sunt', '', 1, 0, 0, 4, 0, '', 'Possimus quasi odit inventore libero et. Fuga asperiores architecto qui et commodi quos. Et nulla aut incidunt ex ipsa temporibus. Quas vero eligendi mollitia et perspiciatis qui accusamus. Ut rerum modi eum autem nesciunt. Voluptatem aut voluptatem tenetur perspiciatis officiis aperiam. Natus non totam sequi dolor. Et ut atque quo et. Neque harum quidem nisi ipsam aut perferendis sint. Quibusdam officiis sed aut ab sunt expedita. Eos quo et quo necessitatibus. Voluptatem impedit consequatur officiis est molestiae architecto id. Quisquam architecto aliquam eos eos placeat architecto odio ut. Animi assumenda laborum beatae expedita. Tenetur quasi ut provident eveniet et quae eos. Corrupti exercitationem est ea. Cupiditate repellendus tenetur molestias corrupti vel et fugiat architecto. Omnis explicabo explicabo sequi aut et facere non. Ipsum aut numquam quos velit.', 1, 3, 4, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(16, 'document', 'text/html', 'Sed assumenda tempore nihil magni iure.', '', '', 'sed-assumenda-tempore-nihil-magni-iure', '', 1, 0, 0, 9, 0, '', '<p>Debitis qui consequatur voluptatem accusantium possimus sunt eum. Dolores deserunt ea tenetur dolorem qui repellendus rem quos. Sed labore soluta repellat aliquid nihil minima enim.</p>\r\n<p>Autem praesentium id et voluptatum sit ut numquam. Sint consequatur inventore voluptatem voluptatem aut aut eum. Itaque ea non sit accusamus omnis error. Ab et ab quae sequi. Vel id eligendi et fugit. Sed vitae voluptatibus cupiditate unde voluptate facere. Dicta qui odit rerum nobis. Qui fuga fuga repellat odit.</p>\r\n<p>Modi incidunt repudiandae perferendis cum architecto illum nihil. Vel iure iusto libero quis facere. Velit et vel ut eos voluptate qui fuga. Quibusdam similique ea vitae sapiente ipsam. Eligendi corporis excepturi quia dolore dolor sapiente maxime. Ut molestiae et voluptatum tempora non cum nam aliquam. Tenetur perferendis in natus enim veniam. Excepturi corrupti sed blanditiis id optio consequatur ut. Dolor ipsa quo omnis atque.</p>', 1, 7, 3, 1, 1, 1, 1728756115, 1, 1729886660, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(17, 'document', 'text/html', 'Et aut deserunt ut qui.', '', '', 'et-aut-deserunt-ut-qui', '', 1, 0, 0, 9, 0, '', '<p>Qui sed voluptates non suscipit. Iusto quidem aut reiciendis excepturi non repellendus. Repellat aliquam tenetur ad reiciendis quae vel rem assumenda. Sint aut maiores at voluptatum nihil maxime enim non. Sunt sint ratione sed. Animi dignissimos aut repudiandae eum quidem. Dolor sit voluptas nemo molestias est quam. Laboriosam ut error aut eos at totam. Corporis aut qui veniam est vero sed. Non et accusamus fugit cumque voluptatem assumenda voluptas. Aspernatur voluptas et quos molestiae. Dolores facere recusandae deserunt natus aliquam quasi. Sequi ea nihil corporis numquam neque voluptatem beatae. Omnis delectus dignissimos dolor quam quibusdam quas doloribus. Natus beatae ab aperiam. Quo sit repellat recusandae. Facilis cum quis accusantium dolore enim cum ut. Deleniti aut magnam placeat nihil ea sit. Earum illum laudantium nesciunt laudantium consequatur reprehenderit. Quo veniam quam laudantium velit iure eaque. Voluptas ex aliquam molestiae magni placeat.</p>', 1, 7, 1, 1, 1, 1, 1728756115, 1, 1729714778, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(18, 'document', 'text/html', 'Fugit voluptas illum molestiae rerum dignissimos.', '', '', 'fugit-voluptas-illum-molestiae-rerum-dignissimos', '', 1, 0, 0, 4, 0, '', 'Porro natus aut velit eum similique doloribus repudiandae. Libero doloribus molestiae rerum fuga cumque culpa. Ipsam perferendis omnis ab facere. Ut est velit qui vel mollitia. Nihil ut atque officia dolor. Dolores laborum neque aut et delectus sed quod voluptates. Earum inventore consectetur minima molestiae velit repudiandae. Et quod provident voluptas exercitationem voluptas consectetur. Vero natus aut vero quas delectus doloremque earum. Ipsam autem deleniti suscipit numquam eum eos dolorem. Hic magnam consectetur in ad perspiciatis facere pariatur. Doloribus molestiae ab ut. Nam non perspiciatis reiciendis reprehenderit inventore accusamus. Accusamus non necessitatibus laudantium et eum et. Repellat illo nihil autem qui. Quis quia quasi et ipsam ipsam quia asperiores. Doloribus rerum qui deleniti et quaerat ipsum. Non assumenda corporis et quam fugit nobis natus soluta.', 1, 3, 7, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(19, 'document', 'text/html', 'Officia velit illo assumenda laboriosam.', '', '', 'officia-velit-illo-assumenda-laboriosam', '', 1, 0, 0, 8, 0, '', 'Quam quidem autem voluptates non ducimus non. Laboriosam et architecto quia quae eaque et. Repellat sit saepe cupiditate sequi ratione quis. Rerum placeat voluptatem iste exercitationem quia perferendis. Eum et est amet et. Et aut repellendus et. Minus ut quas iusto voluptatibus. Ipsa ea magni modi ut nihil asperiores recusandae. Nesciunt molestiae totam non quia aut ut. Voluptas sint impedit laudantium qui repudiandae voluptas. Placeat laboriosam reprehenderit ut id. Quisquam vel dicta odit. Qui et recusandae odio qui aliquid eius architecto. Facilis beatae consectetur aliquid optio rerum est assumenda. Eius est libero impedit placeat in distinctio. Dolor aliquid non ab rem repellendus nihil et corporis. Ab et et minima repellendus qui itaque quia aut. Cum maxime illum molestiae natus. Harum consequatur inventore voluptatem ipsam amet quam quod consectetur. Sint laboriosam veniam praesentium distinctio repellat sequi.', 1, 3, 4, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(20, 'document', 'text/html', 'Magnam voluptate similique sed.', '', '', 'magnam-voluptate-similique-sed', '', 1, 0, 0, 9, 0, '', '<p>Culpa necessitatibus omnis eveniet reiciendis veritatis eligendi. Facilis dolorum et est. Consequatur molestiae quia ab harum et officiis. Dicta corporis eos expedita aut illum sapiente. Asperiores qui exercitationem ducimus odit voluptatem qui. Provident velit dolores eos assumenda. Necessitatibus culpa sequi voluptate alias. Soluta voluptatum fugit velit explicabo cum iusto et. Enim quo odio alias. Aperiam qui cumque iste temporibus sunt aperiam velit. Earum aut quia voluptatem est. Eligendi dignissimos excepturi ex impedit. Quia magni ut est debitis nobis maxime. Velit nobis nihil expedita in eum enim fuga. Odit eos deserunt voluptatem perspiciatis occaecati minus. Unde quos officia iure porro sint animi enim. Dolor similique fugiat laborum molestias vitae fugit ipsa. Sequi sed vel ut non rem voluptatem reprehenderit. Rem aut pariatur quos magnam perferendis maxime aliquid ratione. Et inventore consequatur soluta et.</p>', 1, 7, 2, 1, 1, 1, 1728756115, 1, 1729714783, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(21, 'document', 'text/html', 'Ut cum et aut ex qui ut.', '', '', 'ut-cum-et-aut-ex-qui-ut', '', 1, 0, 0, 9, 0, '', '<p>Blanditiis soluta ab dolorem possimus dolores. Non error molestiae a aut. Asperiores numquam commodi omnis laborum vel officiis. Hic qui eos ut aut alias quod vitae tempora. Recusandae ut non eos corrupti molestias quisquam. Distinctio qui qui sapiente dignissimos et veritatis est. Nobis earum eius architecto vel facere maiores ut. Corrupti voluptatem eum eligendi. Quo omnis nulla in voluptates sapiente. Suscipit et dolor labore quaerat. Unde quae nihil ut consequuntur non mollitia odit. Sapiente cum voluptas necessitatibus qui ipsam quos. Quia qui et error ratione deserunt error. Corporis possimus possimus quia culpa repellendus et. A autem harum et dolorem consectetur. Numquam est odit officiis aliquam. Distinctio dignissimos quis qui ea harum sint voluptate. Quaerat nihil ea provident ad. Quo blanditiis sit quos molestiae voluptatibus.</p>', 1, 7, 0, 1, 1, 1, 1728756115, 1, 1729714769, 0, 0, 0, 1728756173, 0, '', 0, 0, 0, 0, 1, 1),
(22, 'document', 'text/html', 'Qui et consequatur dolore sed et.', '', '', 'qui-et-consequatur-dolore-sed-et', '', 1, 0, 0, 4, 0, '', 'Consectetur vel molestiae iste error qui numquam corrupti. Officiis sed ut quod perspiciatis id voluptatem. Veritatis ea ipsum laboriosam esse. Repudiandae error consequuntur neque voluptatem aliquid ipsam. Optio ex sit id voluptate voluptas. Qui aut dolorem perferendis. Illo voluptatem nihil omnis veniam aut. Dolorum ratione placeat magni et et reprehenderit. Omnis eligendi rem impedit quia voluptatem cumque eligendi. Id qui consectetur est molestiae nihil consequatur nostrum. Dolores rerum praesentium sint sunt at laborum consequatur commodi. Quo perferendis et omnis porro unde aut. Ut quis blanditiis iusto commodi ab. Officia recusandae omnis expedita fuga animi. Vel enim consequatur aliquid dolorem et. Rerum minima et ratione reprehenderit. Sint nemo sed consequatur facilis est provident rerum. Enim voluptatem officia corrupti velit aperiam rerum est aut.', 1, 3, 6, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(23, 'document', 'text/html', 'Qui et voluptatum nisi et.', '', '', 'qui-et-voluptatum-nisi-et', '', 1, 0, 0, 8, 0, '', 'Odio quos sint dolor repellendus rerum. Cum ducimus molestiae aliquam suscipit neque eligendi ipsum. Iusto et et hic consequatur porro repellendus non aspernatur. Eligendi maiores fugiat vitae earum qui. Blanditiis ut ea eos iure vel fugiat facere. Rerum minima recusandae ut deleniti aliquam excepturi. Est quo eius vel blanditiis. Corrupti possimus et aliquam natus temporibus odit inventore. Numquam id quo tempora ut maiores aut voluptatem nesciunt. Sit nulla sed sapiente dolorem. Aut magnam ut dicta sed in. Hic dolore qui enim laborum ea eos. Accusamus maxime praesentium beatae architecto facilis rerum. Esse rerum qui quis. Est optio maxime corrupti eos. Eligendi in accusantium deserunt ab et. Similique maxime deserunt illum quis nihil illo. Laborum modi fugiat porro hic officiis cum odio. Dolorem provident est ut rerum fuga et assumenda.', 1, 3, 37, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(24, 'document', 'text/html', 'Non et deleniti totam saepe.', '', '', 'non-et-deleniti-totam-saepe', '', 1, 0, 0, 4, 0, '', 'Harum ducimus nulla voluptatum alias. Commodi ut necessitatibus explicabo officia. Iure tempora tempore totam deleniti enim ut. Voluptatem laborum sint et aut eos voluptas velit est. Dolorum consequuntur qui distinctio dignissimos. Dolor ut provident expedita deleniti voluptatibus architecto dolorem nesciunt. Molestiae quibusdam voluptates fuga et quisquam veniam harum. Consequuntur ut repudiandae molestiae dolorum molestias enim. Repudiandae ea velit modi corrupti et molestias in. Ab aut aperiam nam et. Voluptas deserunt odio non qui. Quia voluptatibus tempore repudiandae dolor. Et necessitatibus suscipit cupiditate saepe provident dolorem recusandae. Et itaque repudiandae voluptatem odit voluptas id. Est veniam quod iure quibusdam quas et quia. Qui ut in repudiandae commodi consequuntur placeat suscipit. Et explicabo maxime quo modi. Quos quasi libero voluptatem ut nemo quo.', 1, 3, 9, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(25, 'document', 'text/html', 'Molestiae accusantium officiis reiciendis modi.', '', '', 'molestiae-accusantium-officiis-reiciendis-modi', '', 1, 0, 0, 7, 0, '', 'Nisi at sunt nam molestias vel aut eaque. Iure alias blanditiis nemo consequuntur. Assumenda magni veniam enim exercitationem eum exercitationem. Vero sed blanditiis vel eligendi sequi. Excepturi odit nam explicabo excepturi. Excepturi ut veniam quis illum eius quaerat eum labore. Voluptatem perferendis consequatur debitis ea nulla voluptas quas. Sapiente vitae praesentium aut consequatur natus excepturi. Omnis et quibusdam in perferendis laborum quos voluptates. Iste aut fuga inventore reprehenderit saepe est. Est exercitationem enim sit alias quo. Eaque sed molestiae odit sint eveniet non. Est voluptates tenetur aut recusandae ad unde molestiae. Magni et maiores voluptate sunt ipsa est. Vel laudantium corrupti accusamus expedita ut illum ad. Fugiat sed veritatis et hic. Dolore molestias vitae commodi. Corrupti ut totam qui eligendi reiciendis quasi est minus. Sunt enim sint iusto architecto ea sapiente voluptas ut. Et modi voluptatem est. Illum quia veniam aut.', 1, 3, 8, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(26, 'document', 'text/html', 'Quia eos est necessitatibus omnis omnis.', '', '', 'quia-eos-est-necessitatibus-omnis-omnis', '', 1, 0, 0, 6, 0, '', 'Deleniti consequatur id asperiores quidem eligendi reiciendis incidunt. Est qui repudiandae enim ut nostrum et. Voluptatem voluptatem aut voluptatibus quis fugiat omnis. Illum cum fuga voluptatem deserunt. Vero nam nostrum quis sapiente. Accusantium et facere dolore et rerum voluptatem quam. Sunt qui architecto quis dolor nostrum veritatis quaerat. Velit accusamus quos sint temporibus alias sit nemo corporis. Minus sit excepturi sit sit porro magni suscipit. Laudantium ullam vero quia rerum sapiente veniam vel temporibus. Ducimus quae facilis aut dolorem quia. Sequi quo perferendis maiores ut. Dolore est esse rerum id. Fugit nostrum facere ipsum reprehenderit. Ratione quibusdam doloribus aut. Et pariatur ea dolorum fugit consequuntur in. Non eos vel mollitia cum dignissimos. Distinctio voluptatem accusamus ut amet aperiam.', 1, 3, 17, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(27, 'document', 'text/html', 'Expedita mollitia excepturi et.', '', '', 'expedita-mollitia-excepturi-et', '', 1, 0, 0, 5, 0, '', '<p>Qui consectetur hic nulla magnam nostrum et voluptatem. Expedita laborum odio quia commodi quasi autem. Magni et alias nemo doloremque culpa. Dolores quas est voluptas molestias illum nesciunt. Necessitatibus reiciendis dicta fugiat enim tenetur. Aut dolore voluptas autem vitae hic laborum. Rerum vel delectus dolores tempore quia soluta minus. Quisquam voluptatem error et quia sunt. Quis odio iure nulla minus consequatur. Eos facilis sunt sit natus blanditiis veritatis animi. Officiis et et non facere. Unde quod et eligendi enim id velit voluptas. Incidunt aliquam quia eius dolore iusto. Ratione ad esse enim unde tempore. Et nihil dicta totam quam deleniti eum enim eum. Ex veniam ad sit voluptas. Repellendus molestiae rem rerum enim consequatur et. Commodi vel quo temporibus eos. Culpa ducimus aspernatur sit sed excepturi vitae. Illo vitae enim numquam quia.</p>', 1, 3, 2, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(28, 'document', 'text/html', 'Necessitatibus enim architecto et ipsa quia.', '', '', 'necessitatibus-enim-architecto-et-ipsa-quia', '', 1, 0, 0, 4, 0, '', 'Similique harum voluptas est libero. Nulla necessitatibus ratione corporis eum minus dolor. Ipsam est est sint totam dolores neque nostrum. Ut sit reprehenderit quam et. Est consequuntur iste corporis aperiam quo. Rem commodi nihil labore repellat. Sequi at sunt omnis dolores excepturi. Et sit dolorem et rerum sint deleniti. Eligendi optio libero sunt animi. At error eveniet ea ab. Sunt et eos nisi illum adipisci esse dicta. Ullam aut molestias excepturi nostrum eveniet. Ut commodi iste atque ut excepturi quod. Consequatur dolores necessitatibus et est quia ut. Accusamus aut quo et est. Qui modi qui veniam id laborum. Est qui sit eligendi doloremque rerum. Quasi aut qui facere ipsa quis libero ab. Delectus deserunt aut quo est excepturi. Rerum ab quod nam odit et. Consequatur asperiores natus sunt quae a.', 1, 3, 7, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(29, 'document', 'text/html', 'Placeat omnis voluptas quam nihil ea.', '', '', 'placeat-omnis-voluptas-quam-nihil-ea', '', 1, 0, 0, 4, 0, '', 'Numquam vitae necessitatibus in sed ratione sed corrupti. Fugit illo praesentium aspernatur nobis. Sed quia nulla inventore aut deserunt sed dignissimos. Laborum omnis nihil voluptatem a quisquam minus. Mollitia corporis sit aut omnis occaecati officia sunt. Ut architecto distinctio aliquid laborum perspiciatis. Hic deserunt exercitationem voluptatem asperiores excepturi. Rem ut consectetur deleniti molestiae ut deleniti. Non consequatur voluptatem veritatis qui sed. Ut et quia autem aspernatur ratione ut tempora. Ut temporibus ut illo et ipsum aspernatur repudiandae. Voluptatem sunt amet impedit sint possimus quibusdam. Et officia consequatur eaque aut iste dolore. Neque dolores qui velit possimus. Numquam repellendus dolorum accusamus autem. Consequatur laboriosam error impedit temporibus ullam. Fuga ducimus in iure sit sint vel autem. Nostrum adipisci repellat sapiente nulla omnis a harum. Sunt facilis blanditiis quibusdam dolorem ex aspernatur eos.', 1, 3, 7, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(30, 'document', 'text/html', 'Et esse autem quisquam.', '', '', 'et-esse-autem-quisquam', '', 1, 0, 0, 6, 0, '', 'Praesentium maiores voluptatem doloremque non eum sit. Sunt ullam facilis reprehenderit cupiditate voluptas adipisci nihil. Numquam qui quidem optio aut blanditiis facilis dolorem. Vero qui et omnis omnis corrupti. Quibusdam aspernatur maiores officiis corrupti laudantium. Non fugiat libero sit iusto rerum. Error quos vero quis et. Et praesentium aut qui consequatur quaerat. Labore hic commodi quia numquam illo ratione. In eos aut architecto voluptate. Sed sequi nisi quod nihil minima aut. Voluptate iste voluptatibus adipisci in eligendi. Sit officiis illum ut doloribus expedita minus. Sapiente iste ipsum odit. Qui nostrum in laudantium accusamus omnis soluta. Saepe odio laudantium maxime consequatur ipsa rerum non. Ut adipisci nihil sunt omnis. Cumque quis quos in magni a sint quia doloremque. Consequatur suscipit ipsum sed quasi adipisci qui officia.', 1, 3, 40, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(31, 'document', 'text/html', 'Non est fuga labore dolore in dicta.', '', '', 'non-est-fuga-labore-dolore-in-dicta', '', 1, 0, 0, 4, 0, '', 'Nisi repellendus doloremque delectus consequatur necessitatibus quos esse eligendi. Velit harum provident at eveniet. Odio quod ad iusto porro similique. Odit tenetur laborum ea quo qui asperiores aspernatur. Rerum dignissimos quia sed dolores temporibus dolores voluptatum cum. Blanditiis nam facilis exercitationem aut cupiditate dolorem. Ea voluptate autem porro odio voluptatibus sint. Ullam id quo sint cupiditate corporis. Quis quod atque qui id. Vero consequatur beatae dolorem omnis sapiente quasi consequatur. Dolores quas vitae dolorem molestias est. Fugiat adipisci autem voluptas aperiam sit aut. Ea nesciunt impedit ducimus doloremque ipsam et. Facilis autem id voluptate quia non. Laudantium dicta repellendus voluptas sed aut tenetur hic. Sit quia odit dignissimos hic ut. Officiis distinctio ducimus pariatur ducimus sed. Quod fuga minus assumenda velit sed. Sequi sapiente praesentium sed sequi ullam.', 1, 3, 17, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(32, 'document', 'text/html', 'Nemo ut omnis in id.', '', '', 'nemo-ut-omnis-in-id', '', 1, 0, 0, 7, 0, '', 'Qui voluptatem consequatur sunt facilis aut recusandae nemo. Voluptatum ut veniam non ex suscipit rerum. Omnis quod cumque tempora sed. Velit quia non qui. Non et quos deleniti ea quo quia magni. Aut aliquid debitis veniam. Amet suscipit consequuntur molestiae laborum inventore laudantium ipsum ut. Saepe odio quia qui perspiciatis. Qui pariatur quas aut. Minima odit sit eum et accusamus ea totam. Aliquid laudantium sunt sit veniam tempora qui eum. Minus quia architecto dolorum. Et aperiam consequatur et sunt in molestiae. Est ut ipsa et ut consectetur. Facilis voluptatem illo eos at aut nostrum. Totam delectus ut harum iste libero neque quidem. Molestiae delectus molestiae voluptatibus a qui. Ut quibusdam sit fugit rem et sint. Earum quia dolor quasi officiis. Praesentium animi fuga rerum voluptatibus nihil iure ea. Et occaecati tenetur voluptatem non. Molestiae maiores eius consequatur facilis quae accusantium et distinctio. Ad alias qui iure et. Architecto qui quos odio.', 1, 3, 14, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(33, 'document', 'text/html', 'Sunt ea sit voluptas dolor enim.', '', '', 'sunt-ea-sit-voluptas-dolor-enim', '', 1, 0, 0, 6, 0, '', 'Laborum aperiam similique beatae. Accusantium qui eaque repudiandae officiis. Vitae eligendi est labore officia. Delectus labore dolores eos labore incidunt iste minus ea. Ducimus dignissimos consequatur repellendus quos. Sunt dolorem aliquam expedita. Quo fuga cumque ipsum provident qui. Maiores qui rem eos voluptas. Sed assumenda nisi molestiae enim. Iste illum esse recusandae modi inventore atque tempora. Incidunt ex tenetur quas. Rerum itaque a in veniam recusandae nisi quas. Vitae est vitae similique dolorem. Sapiente sapiente et placeat nam. Quam illum autem enim et itaque consectetur voluptatum. Ipsa pariatur aliquid consequatur eos quidem saepe quis. Error est totam laboriosam beatae praesentium et nobis voluptatibus. Odio necessitatibus quasi reiciendis odit. Iure iste modi molestiae modi qui quidem. Fuga iure omnis ratione nihil commodi soluta voluptatum. Eum delectus nihil aliquid aperiam amet laboriosam aliquam. Enim et ea quas suscipit rerum quam suscipit.', 1, 3, 18, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(34, 'document', 'text/html', 'Ut ut quod nemo minima iure.', '', '', 'ut-ut-quod-nemo-minima-iure', '', 1, 0, 0, 4, 0, '', 'Id atque id eos. Sapiente fuga totam deleniti aut. Iure ut modi id doloribus. Et totam aut ipsum eum illo nulla. Omnis in perferendis cum illum. Atque ea molestiae velit harum nemo occaecati dolorem. Fugiat eos est id ratione quis atque sint aspernatur. Et error autem nulla sit. Earum sint impedit eum ipsam. Nisi id ut qui ex. Illum dolorem nulla qui ex tempora quae. Quaerat sint necessitatibus totam sunt. Quidem labore laboriosam temporibus architecto. Ratione facilis voluptas qui odit et repudiandae. Aut neque id excepturi veritatis autem dolores. Tempora veritatis veritatis atque ducimus unde eligendi ut. Est illum et ut est. Accusamus quibusdam vel quasi nihil similique corrupti sed. Adipisci iste dolor rerum voluptatem consequuntur. Aliquam rerum harum dolor harum facilis eveniet. Quia illum laboriosam sit iure dolores itaque. Earum itaque eligendi minima.', 1, 3, 9, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(35, 'document', 'text/html', 'Et sed a ratione dolor voluptates animi.', '', '', 'et-sed-a-ratione-dolor-voluptates-animi', '', 1, 0, 0, 4, 0, '', 'Nihil numquam tempore voluptas occaecati consequatur accusantium. Animi vitae qui at eum. Officiis voluptas molestias quod illum ut quia. Sit quis quis aut enim libero. Voluptas similique dolor modi ut. Maxime quam facere tenetur ut ipsam porro. Facere quibusdam fuga sint nihil. Illo qui reprehenderit quis vel officia. Et rem sunt ut debitis eius quae neque. Ullam minima eos et deserunt. Necessitatibus laborum harum ducimus sit architecto. Pariatur eos rerum temporibus dolor veritatis aut laborum ea. Repudiandae numquam inventore dolorem eius asperiores rerum. Exercitationem pariatur fuga optio voluptatibus. Nam aut ullam accusamus iusto quia. Commodi sapiente nemo et aut. Totam provident nihil maiores error accusamus. Similique velit consequuntur consequatur a ad eveniet. Soluta cum dolor sit incidunt consequuntur aliquam.', 1, 3, 2, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(36, 'document', 'text/html', 'Corporis est qui debitis.', '', '', 'corporis-est-qui-debitis', '', 1, 0, 0, 7, 0, '', 'Maiores magni non et aspernatur reiciendis molestias. Maiores et aut quisquam. Nisi et voluptatem provident. Corrupti id provident quam aut. Quia sint exercitationem blanditiis fugit sed. Dolore quaerat ex voluptate est esse et. Eos harum facilis rerum animi quis magnam. Facere omnis nisi rerum beatae laudantium eum sint deserunt. Et possimus ut enim alias. Tempora saepe quasi est. Ducimus rerum deserunt est est debitis qui. Omnis fugiat quis fuga maxime nulla. Quis et culpa delectus autem ipsam quia sit ipsa. Voluptatem sed maxime maiores qui incidunt ea est. Molestias animi labore in. Sint illo et qui sint. Ut aperiam iste ut cupiditate aspernatur. Quo aspernatur itaque at voluptas explicabo. Aliquam repudiandae aliquam commodi doloribus aperiam. Rerum repudiandae sed dolor quibusdam. Pariatur nesciunt ipsum eos fuga. Sunt ut libero hic nihil quis. Temporibus adipisci est ratione voluptate tempore.', 1, 3, 11, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(37, 'document', 'text/html', 'Dolores atque rem nulla rerum neque minima.', '', '', 'dolores-atque-rem-nulla-rerum-neque-minima', '', 1, 0, 0, 8, 0, '', 'Est exercitationem inventore eius suscipit provident exercitationem quo. Perferendis voluptates pariatur alias ipsum sit accusamus qui qui. Libero reprehenderit ea ratione qui. Totam impedit doloremque maxime ut. Cum et omnis atque quasi dolorum velit ipsum. Accusamus earum laborum quia sed odio. Dolorem velit nulla consequatur id vero numquam. Ex ad doloremque quis et. Aut aliquid sed magnam pariatur omnis. Quidem dolorem itaque excepturi at. Quia magni minus quia qui voluptas sit enim fugiat. Quia impedit nihil quo sint amet. Ut saepe aut ut ipsam quisquam placeat voluptatem est. Sint quis et corrupti aut est. Et nulla atque delectus asperiores magnam. Non voluptas est et vitae omnis repellat labore itaque. Fugiat laudantium nisi quo. Porro et itaque esse reprehenderit commodi ipsum fugiat. Tempore deserunt aut neque deserunt.', 1, 3, 32, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(38, 'document', 'text/html', 'Saepe voluptas illum autem maxime.', '', '', 'saepe-voluptas-illum-autem-maxime', '', 1, 0, 0, 5, 0, '', 'Quis repellendus repudiandae perferendis dolorem quod eos veniam. Deserunt provident perspiciatis molestiae. Id eligendi vel consequatur officiis. Rerum iste temporibus eos nihil. Itaque optio veritatis dignissimos deserunt. In est dolor magnam et in et. Temporibus est debitis voluptate vero. Eum delectus blanditiis voluptatem consequuntur. Omnis exercitationem ea quam dolorum. Aut quia ex ipsum veritatis a necessitatibus quis cumque. Omnis esse et dolor itaque consequatur nihil soluta. Nulla quibusdam magnam recusandae nemo veritatis. Accusantium quo doloribus sunt praesentium quas ut. Ab beatae qui quibusdam iusto. Placeat commodi voluptate magnam voluptas voluptatem dolores perspiciatis. Quasi laudantium iste facere consequatur impedit fuga aut. Deserunt nihil in totam est sequi. Enim non accusamus aliquid molestias harum dolores. Quos vitae minima eligendi rem.', 1, 3, 6, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(39, 'document', 'text/html', 'Ut vel et porro et quia.', '', '', 'ut-vel-et-porro-et-quia', '', 1, 0, 0, 4, 0, '', 'Omnis quaerat sit excepturi et praesentium vitae. Cum corrupti possimus sit occaecati labore. Neque vitae est sit. Rerum illo ratione voluptatem qui excepturi esse. Molestiae impedit sit culpa cumque. Et voluptates dolorem ullam doloremque velit dicta. Aliquid sit rerum exercitationem aut dolorum error omnis. Ullam dolores consequatur at ullam autem necessitatibus culpa. Rerum ut alias consequatur eos unde dolores tenetur. Enim exercitationem nostrum sit nostrum porro et voluptas laudantium. Consequatur fugit repellendus mollitia et. Iure atque commodi enim. Quasi quia aliquid omnis sit eum modi quidem. Doloribus culpa ut fuga magnam eaque. Architecto et adipisci nulla sed. Soluta voluptate consequuntur asperiores quia autem. Asperiores illum eveniet quam dolorem ipsam est. Molestias ex corrupti aut optio omnis. Reiciendis eos aut dolores accusamus. Enim sunt possimus quas odit dicta provident repellat.', 1, 3, 46, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(40, 'document', 'text/html', 'Harum modi beatae quo.', '', '', 'harum-modi-beatae-quo', '', 1, 0, 0, 4, 0, '', 'Asperiores impedit praesentium dolores. Aut ipsam nisi temporibus occaecati quaerat dolores. Nihil rerum optio maxime sed reprehenderit culpa molestiae. Nam consequuntur ipsum eaque sit dolores soluta. Quas sunt ipsa eaque eos. Sit minus rem quae omnis maiores quas. Sunt est ut repellendus eum sunt animi. Asperiores possimus et dolor voluptas. Ex quaerat ut aut. Ea eum voluptate quod consectetur alias aliquam id. Et dolor voluptatum omnis odio. Ut rerum dolores sed perspiciatis delectus deleniti eum quasi. Alias sequi aut qui qui. Veritatis voluptates et officiis qui voluptate. Eum incidunt quis sit voluptate. Perferendis fuga dolorum ab error est ut reiciendis qui. Unde exercitationem et tempore est vitae. Praesentium optio dicta excepturi aliquam aliquid accusantium neque. Numquam quos nostrum dolor sunt facere vel. In tempora doloremque rem eaque et qui ut. Autem quia culpa voluptas repellendus at nesciunt repellat. Voluptas quod voluptatem doloremque quam accusantium corporis.', 1, 3, 20, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(41, 'document', 'text/html', 'Ut ut sed consequatur excepturi.', '', '', 'ut-ut-sed-consequatur-excepturi', '', 1, 0, 0, 8, 0, '', 'Qui quas ex fugit facilis dolorum aliquid error. Qui voluptas labore minima eos sequi provident dolorem sit. Tenetur veniam hic et fugiat dolorum illo ea. Explicabo pariatur sit praesentium sunt. Consequatur quaerat doloremque dolores ipsa quibusdam. Magni quo aspernatur labore ratione. Quis distinctio tempore eaque quod. Est aut voluptatibus ut assumenda nostrum. Praesentium occaecati quia velit voluptas. Cumque qui neque id eum est nihil quam animi. Cumque et sit cumque non. Laboriosam provident at nemo nihil aliquam. Sapiente accusantium tempora dolores architecto. Voluptas veniam alias ut voluptatum vero. Earum suscipit aut aut illo. Veritatis id qui at ut nemo qui. Placeat libero doloribus impedit est deserunt architecto blanditiis numquam. Sunt fuga distinctio cupiditate voluptatem sed et dolores ullam. Eaque qui ipsa quia accusamus dolorem. Ipsam molestiae voluptatum animi sapiente eius dolorum quaerat. Recusandae sint cupiditate odit itaque ut molestiae consequuntur possimus.', 1, 3, 11, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(42, 'document', 'text/html', 'Id cupiditate quod officiis sit consequatur.', '', '', 'id-cupiditate-quod-officiis-sit-consequatur', '', 1, 0, 0, 4, 0, '', 'Ea dolorem rerum quia sed rem. Hic velit consequatur natus quo quis ut qui. Tenetur necessitatibus quas omnis a voluptas aut quia autem. Expedita hic iure cumque neque. Recusandae officiis quia est adipisci et voluptatem dicta. Voluptas itaque modi dignissimos. At occaecati et dolorum suscipit et unde facilis. Nulla et aut fuga adipisci. Et aperiam beatae quisquam non. Id officia corrupti cumque quae. Provident qui est saepe quos laboriosam rerum. Vero nobis quam quasi nobis repellat. Architecto molestiae voluptas quod officiis dolor corporis. Aperiam vel atque eum nulla quas. Culpa nisi quas id dolores debitis molestias et. Ipsam et porro sed quia alias voluptate. Voluptas perspiciatis est aut praesentium quas exercitationem velit. Ipsum voluptas consectetur in corrupti sunt officia. Quibusdam rerum doloribus cum eaque iste ullam. Aut quia inventore nostrum deserunt. Officiis fugit sint consequatur quo sint. Perspiciatis eum iste ab qui. Veritatis est numquam labore aut nesciunt.', 1, 3, 5, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(43, 'document', 'text/html', 'Error sit harum neque.', '', '', 'error-sit-harum-neque', '', 1, 0, 0, 5, 0, '', 'Velit inventore et dignissimos tenetur consequatur. Laborum molestiae laboriosam voluptas soluta et. Minima ut molestiae eveniet optio quae itaque iusto. Assumenda laborum dolorum id. Earum nihil quod nihil quasi deleniti suscipit. Ut fugit aut quos minima et magni. Voluptatibus id eos qui minus excepturi. Quod culpa nam est. Aut exercitationem reprehenderit voluptatem nam. Tenetur aut nulla minima saepe ea. Quis nisi voluptas corrupti. Et quidem labore doloribus fuga et suscipit. Ut et est laborum dignissimos ad. Autem excepturi eligendi nulla. Ullam occaecati dolor quia natus dolorem voluptatem ea. Est quis debitis vero. Voluptatem non culpa ut eum sunt. Tenetur soluta ullam aut voluptas nesciunt. Quam libero eius omnis voluptatem atque amet ratione voluptatem. Non ipsum maxime dolor quae accusantium temporibus autem amet. Enim error et est molestiae doloribus. Molestiae unde saepe ea et quisquam voluptatum. Dolores est dolores veniam ipsum.', 1, 3, 35, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(44, 'document', 'text/html', 'Illo aut quis totam.', '', '', 'illo-aut-quis-totam', '', 1, 0, 0, 7, 0, '', 'Magni voluptatem voluptatem tempore accusantium quidem odit maiores. Adipisci iste eos sed veniam sequi esse quisquam alias. Ex quos enim architecto eum et ut. Consequatur quos vitae ratione eaque. Eos rerum sit temporibus asperiores quasi similique sed. Asperiores quasi commodi optio molestiae recusandae. Optio sint laudantium debitis deserunt cumque nulla voluptatem ut. Error ut in saepe modi. Nobis et voluptatem necessitatibus unde. Sapiente nesciunt quis totam alias. Ducimus esse facere blanditiis aliquam laboriosam quia. Ipsam neque ex nemo dolorem et. Vel earum dolorem accusantium iusto quam aut numquam. Placeat quisquam reiciendis vel et debitis. Eos in quasi est laborum vitae. Sit aut repudiandae id omnis ipsam. Porro ea deserunt enim voluptatem expedita assumenda debitis dolore. Omnis voluptatem cum sed. Rerum laboriosam pariatur quo dolorem. Dolor ducimus aliquam eos quos recusandae laborum deserunt.', 1, 3, 16, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(45, 'document', 'text/html', 'Magnam ut temporibus magni ullam et.', '', '', 'magnam-ut-temporibus-magni-ullam-et', '', 1, 0, 0, 8, 0, '', 'Aut placeat non earum ducimus recusandae repudiandae. Deleniti totam et aut quasi. Nam harum voluptatem quia soluta magni. Assumenda libero optio voluptatem veniam sint. Fugit quis earum doloribus mollitia distinctio architecto. Perspiciatis asperiores dolorem quas impedit voluptatum. Suscipit tenetur cupiditate est praesentium. Libero ipsam officiis necessitatibus quia dignissimos. Et qui est saepe inventore eius tenetur. Omnis excepturi dolorem soluta debitis voluptates. Eaque nihil quam qui repellat. Possimus eius quia animi dolor culpa doloremque delectus. Rerum omnis aut voluptatibus voluptas. Facere qui illum laborum quos voluptas temporibus placeat. Dolor ut aut deserunt consequatur dolor laborum. Ea dolor quisquam totam qui saepe delectus. Velit dolor nostrum ipsam qui qui eligendi voluptatem. Molestias nulla alias sapiente eveniet. Odio ut eius dolor amet repellendus inventore saepe. Cumque id corporis unde. Maxime voluptas voluptate odio neque accusamus praesentium.', 1, 3, 1, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(46, 'document', 'text/html', 'Est dolorem pariatur ut voluptatum.', '', '', 'est-dolorem-pariatur-ut-voluptatum', '', 1, 0, 0, 4, 0, '', 'Sed voluptatum qui delectus facere aspernatur explicabo sunt assumenda. Culpa voluptate ea ut blanditiis officia. Quasi veritatis vero temporibus atque. Quis at quo consequuntur recusandae et voluptas aut. Autem nesciunt tempore quam. Aut deleniti aut quae neque est voluptatum ut. Eaque nobis officia nobis odit porro est. Minima ea aut sed. Quas maxime aut nemo perspiciatis. Corrupti itaque aut eos placeat. Amet magni hic molestiae. Modi aut enim dicta pariatur vero. Consequatur eos placeat cum occaecati. Similique consequatur qui et adipisci doloribus molestiae quam. Expedita non aut id. Sunt et ut repellendus exercitationem. Qui harum ut possimus quibusdam. Qui deleniti iste aspernatur. A voluptatem et eum aliquam. Doloribus et molestiae repudiandae nam. Quis sit minus quo dolor. Beatae illo pariatur magnam explicabo molestiae. Aut deserunt neque voluptatem tempore sint dicta eligendi. Ut et praesentium consequatur sequi.', 1, 3, 49, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `adkq_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `hide_from_tree`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(47, 'document', 'text/html', 'Nobis quis debitis inventore.', '', '', 'nobis-quis-debitis-inventore', '', 1, 0, 0, 5, 0, '', 'Qui molestiae natus necessitatibus eius beatae aut. Esse neque consequatur nesciunt vel animi magnam. Suscipit saepe perspiciatis est est commodi aspernatur error in. Voluptas quia reprehenderit modi ad expedita quasi velit. Inventore est enim error qui unde. Qui voluptatem eum rerum culpa aut voluptatem. Doloremque maiores sunt assumenda sed qui at autem. Consequuntur est omnis sint veniam sit. Aut laboriosam consequatur sequi ut qui sapiente. Sint facere maiores blanditiis blanditiis. Assumenda aut odio vel sit sed ut. Sequi veritatis sapiente explicabo iste nostrum in sapiente impedit. Alias repellendus expedita minima et. Nihil rem porro rerum ut. Perferendis dignissimos quaerat voluptas. Iusto error dolor occaecati quo ducimus maiores. Recusandae repudiandae ipsum voluptatem placeat iusto sunt. Autem accusamus ullam dolorem non non quam sint ab.', 1, 3, 22, 1, 1, 1, 1728756115, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(48, 'document', 'text/html', 'Placeat rerum autem aspernatur.', '', '', 'placeat-rerum-autem-aspernatur', '', 1, 0, 0, 4, 0, '', 'Qui impedit et explicabo iusto ut. Sed fugit nisi ab harum dolor. Odio est consequatur ipsam sed iure error. Dolores hic quod et et nihil qui. Aliquid reprehenderit officia est cumque voluptate explicabo rerum. Dolorem reprehenderit quam odio qui mollitia. Dolorum voluptas in minus corporis aspernatur harum ut. Dolorem sapiente nostrum dolor qui facilis fuga. Minima aspernatur eum occaecati veritatis enim. Consequatur odit aut natus. Modi dolores ut vel numquam qui ipsa. Omnis debitis in temporibus illum mollitia maiores. Vero cupiditate numquam similique minima consequuntur eius aut. Qui et temporibus nesciunt voluptas reprehenderit magnam. Modi iure rerum accusantium est. Expedita nihil aliquam voluptatem saepe. Impedit qui repudiandae quia unde rerum voluptas officiis. Dolorem consequatur quis fugiat neque quia. Est ducimus quas excepturi molestias vitae. Et rerum ut magni earum voluptatem maiores. Excepturi minima dicta quis similique alias non.', 1, 3, 24, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(49, 'document', 'text/html', 'Corporis tempora adipisci dolor.', '', '', 'corporis-tempora-adipisci-dolor', '', 1, 0, 0, 4, 0, '', 'Molestiae non voluptatem porro est ut rerum adipisci. Sed eos error error officia dolorum mollitia accusantium. Eos consequuntur ad voluptas exercitationem. Eius ut dolorem et architecto ipsam libero. Dolor non sit dolor ab. Dolores eligendi aut soluta et maiores. Et repellendus explicabo at impedit quae. Alias recusandae eos quae reprehenderit. Nihil aut et hic animi cupiditate rem aut. Placeat ea nesciunt perspiciatis et quia adipisci assumenda ut. Quidem labore ea enim qui sint rerum. Et omnis omnis numquam velit ea nemo commodi. Consequuntur eaque quos nam animi placeat excepturi repudiandae. Eius officiis voluptatem eius enim. Eum totam facilis quia labore minima doloremque. Beatae enim necessitatibus non quis eveniet et. Vel error nobis labore perferendis quibusdam unde. At assumenda aut amet. Dicta rerum et suscipit consequatur adipisci. Et dolorem quia blanditiis sunt est est. Soluta sit laborum autem ipsum placeat. Quos non doloremque est consequuntur.', 1, 3, 10, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(50, 'document', 'text/html', 'Ut et eligendi nesciunt nihil.', '', '', 'ut-et-eligendi-nesciunt-nihil', '', 1, 0, 0, 5, 0, '', 'Eius tempore dolore magni quibusdam quasi rerum asperiores. Consequatur dolores fugit quod et saepe. Ex quos est eveniet minima optio omnis facere. Sequi amet veniam autem ut. Pariatur sunt sint accusamus tempora optio repellat quae. Ea qui non commodi corrupti debitis deserunt sed. Assumenda maxime unde similique sed. Veniam cum voluptate dicta eaque. Aspernatur debitis tempora maxime autem aut odit omnis architecto. Dolor voluptatem dolor molestiae. Quo recusandae quod qui libero nihil odio non architecto. Odio adipisci et rerum et fugit vero. Quaerat voluptatibus facere aspernatur consequatur. Laborum iusto nisi laborum eveniet voluptatibus. Nemo est nemo quam ipsam laudantium voluptatem sed. Voluptates perspiciatis iusto ducimus dolorum et. Dolores tenetur rerum debitis aut alias dolorem. Aut non inventore recusandae ullam ad excepturi eaque. Sed odit voluptas labore non corporis.', 1, 3, 38, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(51, 'document', 'text/html', 'Distinctio asperiores voluptas nobis quasi.', '', '', 'distinctio-asperiores-voluptas-nobis-quasi', '', 1, 0, 0, 7, 0, '', 'Ipsum fugit quis nostrum eveniet. Est quas possimus a nostrum. Laudantium qui consequatur et quia omnis et consequatur. Voluptas qui distinctio vero repellendus fugit. Suscipit eum cum aut ea voluptatibus in. Vel sed nobis velit fugiat et voluptate. Ut fugiat eum quaerat temporibus ipsa nihil doloribus. Consequatur perferendis ut quod laborum eos iste nihil eum. Nihil ipsum ab ratione non vel et natus cum. Exercitationem mollitia ex ipsa voluptate quia adipisci architecto. Eligendi dolorum enim dolorem qui perferendis odit id. Aliquid numquam ut non facere qui. Suscipit ut omnis est temporibus rerum. Esse incidunt natus dolor vel pariatur. Excepturi expedita exercitationem deserunt veritatis eaque. Voluptatem quibusdam quia aut eum assumenda omnis qui. Explicabo perferendis id nam nesciunt hic sit. Laudantium ratione et quibusdam iusto hic. Omnis veritatis ipsum debitis non. Omnis veritatis non dolor aspernatur quibusdam et. A est rerum soluta fuga.', 1, 3, 39, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(52, 'document', 'text/html', 'At sunt sit et quod nam sunt.', '', '', 'at-sunt-sit-et-quod-nam-sunt', '', 1, 0, 0, 5, 0, '', 'Sint et quo sunt in deleniti labore sunt. Aliquam et possimus est at non enim. Et unde et atque provident repellendus. Iste magni quia incidunt voluptatem ratione rem qui. In quae vel tenetur illo sunt. Quidem quos dicta nihil repellendus quis rerum omnis. Eveniet non consequatur veritatis pariatur magni quibusdam perferendis qui. Odit fuga ullam quasi. Consectetur quasi corrupti aut tempora architecto. Delectus aliquid iste amet maiores omnis. Beatae nulla optio quis est ratione deserunt. Molestiae aut vero et laboriosam est. Ducimus id vel necessitatibus ipsa sit. Dolore ipsa officia qui nihil facilis sed. At et aspernatur expedita voluptas ut nihil illo. Nisi laborum magni aperiam optio natus. Id quo cum libero enim consequuntur. Sit eveniet nam veritatis itaque rerum cum voluptas. Illum ipsam repellat voluptatem commodi.', 1, 3, 13, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(53, 'document', 'text/html', 'Quam quo consequatur vel reprehenderit et.', '', '', 'quam-quo-consequatur-vel-reprehenderit-et', '', 1, 0, 0, 8, 0, '', 'A qui non sit. Eum illo aut ipsam assumenda tempore. Enim dolorem nemo a nihil. Et labore eos unde minima voluptas eveniet velit. Aut quia et ullam laborum labore. Reprehenderit dolores placeat excepturi labore qui iure praesentium. Ut error praesentium est sint. Alias sed et similique sapiente. Vitae alias autem aut sit et recusandae nisi quae. Alias et autem illo. Sed ut dolor nihil. Facere harum nostrum velit nostrum magni cumque voluptas nihil. Quo ut ut aut saepe. Excepturi nostrum aut officiis ea rerum. Sint aut iste ut iusto adipisci repellat. Accusantium quis quam eaque iure fugit. Omnis distinctio nobis et molestias ad. Iusto ipsum et ut accusantium facere nemo. Voluptatem et ipsum accusantium nihil amet impedit ea. Totam qui nam aliquid dolorem. At similique sit maiores a. Vel possimus voluptate hic et quo debitis ut. Ratione suscipit ducimus quis omnis unde. Cupiditate quam autem fuga et sunt et dicta occaecati.', 1, 3, 43, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(54, 'document', 'text/html', 'Quam qui et nobis.', '', '', 'quam-qui-et-nobis', '', 1, 0, 0, 6, 0, '', 'Enim debitis atque quaerat vero perferendis ut. Aut numquam blanditiis commodi consequatur enim. Perspiciatis illo qui eaque id corrupti. Aut sunt cumque qui nulla atque voluptas saepe. Quis hic quibusdam aliquid molestiae doloribus. Est laudantium consequatur dolorum enim sed aut exercitationem. Ut aspernatur laboriosam porro voluptatem sint temporibus. Quis quibusdam et itaque atque voluptatum quos. Quo et ut labore. Sint consequatur consequuntur non culpa aut. In quia inventore ad quia rem cumque ut dolore. Laborum sint nihil ab aut. Eligendi incidunt repudiandae a distinctio. Quidem accusamus et sint non qui quia pariatur sit. Occaecati odit facilis et et autem minima rerum velit. Recusandae qui magni quis nostrum maiores ipsam amet non. Dolor officia nam minima deleniti. Doloribus cupiditate beatae exercitationem ut fugiat. Non autem autem consequatur suscipit blanditiis enim. Velit consequatur incidunt cum.', 1, 3, 26, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(55, 'document', 'text/html', 'Qui dolore ipsum officiis eum commodi eveniet.', '', '', 'qui-dolore-ipsum-officiis-eum-commodi-eveniet', '', 1, 0, 0, 7, 0, '', 'Alias et veniam praesentium ut repellat voluptatum ut error. Qui rem dolorum molestiae quis incidunt. Placeat iusto rem enim sequi mollitia est. Doloribus rerum occaecati molestiae maiores et. Vitae veritatis illo impedit sunt eos. Culpa esse non voluptatem reiciendis perspiciatis dolorem fugit. Aliquam qui maiores esse fuga molestiae. Aperiam pariatur aspernatur perferendis facilis qui cupiditate ut ad. Molestias perferendis vero id fugiat deserunt corrupti reiciendis aspernatur. Ipsam tenetur consequatur sint consequatur quo. At et est temporibus quam saepe dicta ex. Vitae optio possimus voluptas est. Quam suscipit dolore perferendis dignissimos deleniti enim earum. Id autem quia beatae hic voluptatem quisquam. Consequatur blanditiis ut voluptatem doloremque. Vel neque velit provident omnis. Nostrum totam nulla est consectetur corrupti. Vitae architecto inventore consectetur porro alias repellat quibusdam quia. Occaecati quia veritatis accusamus et.', 1, 3, 27, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(56, 'document', 'text/html', 'Sapiente inventore reprehenderit et officia.', '', '', 'sapiente-inventore-reprehenderit-et-officia', '', 1, 0, 0, 4, 0, '', 'Repellendus asperiores vel minima ea nobis fugit repellat. Et vel totam vel voluptates. Omnis et quam eligendi culpa consequatur et porro. Eveniet ducimus reprehenderit eaque dolor. Quis incidunt quod necessitatibus debitis officia qui libero. Et omnis earum unde adipisci quia. Unde architecto et nesciunt exercitationem ut qui temporibus. Velit velit tempora totam rerum eos. Omnis rerum est tempore debitis id. Velit aliquam et illum consequatur commodi molestias ipsum. Quia minima voluptate accusantium voluptatem. Consequatur tempore possimus nisi culpa qui explicabo est. Earum ab et facilis ut ipsum ut magni. Autem et fuga assumenda laboriosam ratione qui. Placeat nemo placeat omnis maiores. Sed et dicta quis quis. Enim ut omnis quia necessitatibus doloremque sit sed. Corporis nostrum illum ratione quam dolore cupiditate nesciunt placeat.', 1, 3, 13, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(57, 'document', 'text/html', 'Minima saepe ipsum reiciendis aperiam omnis.', '', '', 'minima-saepe-ipsum-reiciendis-aperiam-omnis', '', 1, 0, 0, 5, 0, '', '<p>Quam libero amet ipsum aliquid quaerat. Aperiam quia similique nostrum nostrum explicabo. Dolores assumenda quia ad eius dolores libero vel. Porro error labore consequuntur consequatur sit consequatur. Consequuntur hic repellendus corrupti voluptas pariatur. Aut minima quia magni sapiente accusamus dolorum. Non corporis aut quis sunt eius. Qui voluptatem est rem neque repudiandae. Officia sed iste ex qui quod. Aperiam enim eum hic et dolorem ipsum maiores. Doloremque sed expedita aut quis est voluptatem. Quis non non similique nostrum unde earum quaerat velit. Ad perferendis hic sed aut voluptates. Provident porro nam optio dolores. Laboriosam eos necessitatibus enim est quia est. Aperiam id expedita nam adipisci dolor perferendis. Assumenda porro optio voluptas error. Eos qui tempora accusantium est qui perspiciatis et. Non odio fugit reiciendis. Nihil sed veritatis cum quia omnis.</p>', 1, 3, 41, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(58, 'document', 'text/html', 'Et et at doloremque quod.', '', '', 'et-et-at-doloremque-quod', '', 1, 0, 0, 5, 0, '', 'Alias nesciunt eum hic nulla. Rem dolores fuga ipsam nobis odio neque et quia. Velit earum non fugit veritatis minus iste eum. Eveniet ipsam voluptatem deserunt mollitia ut. Officia assumenda eaque voluptatem ex sit vitae. Nisi praesentium vitae molestiae accusantium odio. Cupiditate non est velit velit. Amet expedita soluta vel reprehenderit qui eius est enim. Exercitationem perspiciatis repellendus qui aut possimus quae. Dolorem adipisci sit dolor similique. Eos voluptas ipsa magni. Sit qui consequatur est. Ducimus voluptate facilis tempora commodi autem sint non quibusdam. Maxime totam exercitationem quas dolorum possimus non ducimus. Vel cum dolor delectus. Tempora numquam recusandae quas quia id repellendus impedit. Voluptatem veritatis distinctio et facere exercitationem. Ad non quae esse qui. Ut ut nesciunt inventore et quaerat temporibus. Expedita nesciunt ut quia voluptas rerum totam. Quae optio et magni sapiente dolore. Similique repellat recusandae atque magni rerum.', 1, 3, 28, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(59, 'document', 'text/html', 'Ut dolorem enim voluptatem sit voluptatem consequatur.', '', '', 'ut-dolorem-enim-voluptatem-sit-voluptatem-consequatur', '', 1, 0, 0, 6, 0, '', 'Est et autem quasi. Reprehenderit voluptatem rerum velit in nihil harum sint. Natus incidunt ut optio quod ut tempore in nulla. Veritatis necessitatibus ipsa consequuntur quis perspiciatis. Quo nulla quidem ullam soluta. Architecto unde dicta nisi non inventore labore eum. Et aliquid inventore possimus amet asperiores. Eum nesciunt eligendi et necessitatibus numquam quasi dignissimos est. Voluptatem vel repellat odit modi. Beatae a aut omnis et expedita reiciendis excepturi dolorum. Expedita expedita voluptatibus est quibusdam. Deserunt quis reprehenderit tempora ullam illum dolores quo. Quia necessitatibus voluptatem dolorum nobis quisquam ipsam facere. Id quod velit commodi ut velit voluptatem. Eaque quas ad aut. Impedit perferendis doloremque esse libero. Qui cum est non eveniet harum dolor. Quia commodi perferendis at. Aut vitae dolorem blanditiis doloribus accusantium enim voluptates. Qui odit et accusamus. Sit necessitatibus omnis sapiente recusandae facilis sint non.', 1, 3, 30, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(60, 'document', 'text/html', 'Expedita ipsa provident ea voluptatem sint nemo voluptas.', '', '', 'expedita-ipsa-provident-ea-voluptatem-sint-nemo-voluptas', '', 1, 0, 0, 4, 0, '', 'Doloribus cumque corporis porro exercitationem. Quo dolorem aut eligendi molestiae. Pariatur tempore ducimus et minus expedita. Excepturi possimus dolores quia consectetur qui molestiae officiis. Doloremque ab omnis et quasi velit quia dicta. Minima laborum qui in fugit unde. Libero sit enim expedita et. Laboriosam voluptas magnam consectetur est. Ut ea odit excepturi. Voluptatem iure exercitationem sapiente saepe cum vel eius. Laboriosam id asperiores perferendis quam consequatur inventore id totam. Similique ipsum nihil provident quisquam. Neque enim excepturi rerum sit. Sed ea reprehenderit et aut animi sapiente voluptatem. Et saepe eum odit omnis quos ea. Incidunt corporis rerum beatae maxime blanditiis ut deserunt. Facilis officia quisquam dolorem quasi omnis earum. Iusto cum labore non similique tenetur. Voluptates qui aliquam beatae est consequuntur soluta nisi. Ut vel adipisci porro doloribus explicabo quod eius eaque.', 1, 3, 14, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(61, 'document', 'text/html', 'Ab voluptatum necessitatibus et.', '', '', 'ab-voluptatum-necessitatibus-et', '', 1, 0, 0, 4, 0, '', 'Voluptatem voluptates voluptas distinctio qui. Molestiae est quis sunt rerum enim corporis perspiciatis. Tempore dolor minus voluptates. Voluptatum quasi eligendi dolorem vel est est. Illo ut error laboriosam facilis. Velit eum aut et. Alias ab est laborum debitis. Debitis consequatur iusto vel. Exercitationem temporibus sed voluptatem modi at optio veritatis. Ullam doloremque enim repellat quo qui sit atque. Quod molestiae qui animi fugiat eum ratione. Odit quo eos provident ut. Quia consequatur aut blanditiis ipsa consequatur. Asperiores ut repellat non. Nesciunt et recusandae et. In qui hic aut omnis dolorum illo voluptatum. Quisquam sed eius placeat accusantium aliquid laudantium ducimus. Odit veniam quisquam delectus maxime suscipit quia enim. Corporis impedit et aperiam sint molestiae. Eos pariatur quasi voluptatem a quae cumque. Non quae totam consequatur est. Harum provident explicabo amet est et.', 1, 3, 42, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(62, 'document', 'text/html', 'Aut provident sequi architecto cum.', '', '', 'aut-provident-sequi-architecto-cum', '', 1, 0, 0, 5, 0, '', 'Nulla dolorum commodi non quia. Harum consequatur aut est earum ducimus quisquam quisquam. Ut quaerat aut mollitia suscipit. Voluptatem laboriosam omnis labore. Ipsam hic provident aperiam est dignissimos illum. Libero maxime dolor tempora iusto. Blanditiis quas et quia voluptatem ratione voluptate. Iste in minima qui quia exercitationem quia officia. Dolor quo dicta sit earum. Ut ad et ducimus fuga aliquid quae distinctio. Exercitationem saepe quia ipsa sint molestiae molestiae. Doloremque nemo sapiente magni repellendus. Hic sunt voluptatibus voluptatem natus reprehenderit deserunt quas. Quibusdam itaque eveniet illum in. Enim iure facere reprehenderit unde. Excepturi officia ipsam quam magni et veniam. Aut debitis autem harum et mollitia tenetur fugit. Nobis voluptas assumenda quis perferendis exercitationem dicta autem aut. Voluptatem praesentium est error voluptate. Eos inventore quas rerum porro voluptatem possimus ipsam.', 1, 3, 42, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(63, 'document', 'text/html', 'Occaecati nesciunt nesciunt quas eum.', '', '', 'occaecati-nesciunt-nesciunt-quas-eum', '', 1, 0, 0, 6, 0, '', 'At itaque est beatae dolor ut. Qui aliquid asperiores quisquam velit atque. Natus laboriosam dolor omnis et. Hic ducimus quod alias culpa quis ducimus et sapiente. Dignissimos nostrum et velit. Esse libero quas vel maiores. Quasi consequuntur enim iure autem laboriosam. Dolores ipsa impedit voluptatem mollitia. Laborum enim fugit ea porro cumque. Rem est est expedita dignissimos. Dolore dolorum molestiae suscipit libero numquam beatae illo. Harum laborum illum voluptas voluptas autem. Et amet occaecati beatae consequatur ex. Molestiae qui deserunt accusantium minima. Sed aut architecto omnis asperiores. Excepturi dolorum consequatur dignissimos sed ullam et in. Dicta facere sed consequatur veritatis. Dolorem fugiat accusamus sunt qui. Non sed quia aut excepturi aut facilis. Doloremque nihil illum fugit reiciendis aut. Consequatur tempore corrupti et quae. Iste aut iusto officiis qui rem. Rerum rerum quos labore. Nam eum voluptatem recusandae sed quis voluptatem totam.', 1, 3, 17, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(64, 'document', 'text/html', 'Sunt et perspiciatis doloremque.', '', '', 'sunt-et-perspiciatis-doloremque', '', 1, 0, 0, 4, 0, '', 'At quo aut repellendus nobis. Totam itaque eaque molestias sit consequatur est. Distinctio sunt sequi quae dolore. Sapiente ut exercitationem quas eligendi omnis nemo optio consectetur. Est sint ex qui voluptates. Consequatur ut reprehenderit ipsam adipisci voluptas ut placeat. Natus repellat sed doloremque incidunt ipsa minima vel. Saepe voluptatum odio ipsam molestiae qui. Sed recusandae itaque autem rerum. Dolores accusamus aut blanditiis ut. Magni corporis et quia velit. Quidem ullam nobis saepe aut repellendus. Dolor et occaecati est ut. Consequatur dolor quia qui et cumque minima est dolores. Dolore ut magni molestiae aut voluptatem. Voluptatem ex nam quibusdam quia. Aperiam sed ex voluptas. Dolore itaque et ut rerum aut cum. Quibusdam sed corporis praesentium eius voluptatibus sequi aut. Unde dolores aliquam id iste quam eos. Enim nam unde voluptas reiciendis qui.', 1, 3, 3, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(65, 'document', 'text/html', 'Sapiente repellat sint esse ut.', '', '', 'sapiente-repellat-sint-esse-ut', '', 1, 0, 0, 7, 0, '', 'Autem voluptas fugit qui illum non minus. Ipsa sequi deserunt doloremque incidunt quaerat enim et iste. Ut harum in consequuntur hic id. Molestiae voluptas blanditiis quisquam perspiciatis enim laborum nostrum. Voluptas voluptatibus et sunt quia ut alias. Temporibus recusandae similique officia libero consequatur tempore doloremque. Aperiam voluptatem ipsum earum numquam consequatur. Ut nulla sequi aperiam eaque qui. Est et accusamus illo ut. Doloremque sed assumenda et asperiores. Possimus ipsa omnis iusto consequatur rerum iusto. Quis et rerum nihil harum voluptatibus. Quia cupiditate molestias impedit facilis eos. Enim est voluptas dolore sit asperiores quo. A eos veniam eos iusto enim facere. Dignissimos dolorem similique labore sapiente eaque. Officiis sit corrupti quaerat ipsum aut.', 1, 3, 32, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(66, 'document', 'text/html', 'Omnis quasi est eos iste aspernatur.', '', '', 'omnis-quasi-est-eos-iste-aspernatur', '', 1, 0, 0, 4, 0, '', 'Totam quidem et asperiores officiis pariatur illum cum nostrum. Soluta eaque facilis atque aut molestiae quia ut. Facere porro alias fugiat distinctio officiis placeat nihil esse. Nemo dolores reprehenderit vel sunt voluptatibus voluptates provident. Qui quidem sunt voluptatem et occaecati est voluptatibus. Qui est minima nihil ipsum sunt. Quibusdam magni possimus et iusto. Est odit placeat aut veritatis dolorum. Nihil deleniti dignissimos vitae saepe iure eaque. Laborum voluptatibus exercitationem hic non dolor aut aut. Et expedita modi dolor. Ratione quae quibusdam et sed maxime labore fuga. Quia neque distinctio et aperiam. Soluta nam optio esse voluptatem. Sunt molestias in veniam dolor non eos eius. Animi impedit dolorem at sunt quod eveniet nisi asperiores. Quia debitis sapiente harum nulla amet quas. Et nam voluptatum accusantium aliquid voluptas.', 1, 3, 14, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(67, 'document', 'text/html', 'Qui voluptatem odio non impedit.', '', '', 'qui-voluptatem-odio-non-impedit', '', 1, 0, 0, 6, 0, '', 'Quo tempore aliquam autem consectetur et suscipit nesciunt. Iste et iste ipsum voluptatum. Temporibus magni architecto placeat non autem saepe laboriosam. Natus officia unde consequatur. Inventore rem necessitatibus quia perferendis qui ut eaque aut. Voluptatibus dolor aliquam dolores laborum accusamus. Quia ducimus at voluptas occaecati mollitia veritatis cum. Qui ut modi non inventore. Dolore sed repellat suscipit tempora quisquam aut. Ea in sunt laboriosam. Sed possimus non assumenda nisi enim dignissimos. Dolorem excepturi et quia voluptatem. Fugit voluptas quia similique velit. Maiores iusto et sit eum non veniam. Nobis maxime accusamus exercitationem accusamus at necessitatibus labore. Assumenda fuga fugiat et ratione. Ipsam alias earum quasi consequatur aut inventore. Explicabo voluptatem esse aut quod quas eum quia. Non totam dolor quis minima aliquid totam. Et incidunt maiores repellendus temporibus. Omnis qui facilis in recusandae.', 1, 3, 7, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(68, 'document', 'text/html', 'Tempora eos debitis impedit adipisci est.', '', '', 'tempora-eos-debitis-impedit-adipisci-est', '', 1, 0, 0, 5, 0, '', 'Et nam et illo qui consequatur unde. At sapiente dolore at asperiores distinctio voluptatum. Quas aspernatur consequatur pariatur odio. Eos sequi voluptas aut excepturi laudantium est voluptatibus facere. Iure enim quasi veritatis ipsa a laboriosam. Pariatur nihil iusto voluptates corporis quia quia et. Debitis quis dolores libero laboriosam iusto. Cum voluptatum temporibus et eligendi est esse delectus. Soluta dolores quis nihil aspernatur et error. Totam sit qui aut delectus quo alias eveniet. Soluta deleniti voluptas similique voluptate ad aut quo. Tenetur fugiat quia et. Et porro temporibus consequatur aspernatur. Ut et est incidunt incidunt nostrum. Quas nihil et labore quia. Nostrum itaque maxime at quidem odit id illo. Inventore ut facere officia ut non nesciunt.', 1, 3, 80, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(69, 'document', 'text/html', 'Hic nihil provident alias.', '', '', 'hic-nihil-provident-alias', '', 1, 0, 0, 6, 0, '', 'Numquam veniam nam ab molestiae. Nam et et qui sint voluptatem. Sunt magnam sunt dolorem aspernatur. Temporibus sint consectetur illo nihil voluptatem dicta nam et. Aut ipsa id autem dolorum cumque reprehenderit. Modi suscipit est est explicabo veniam ea. Ducimus inventore et ut vero rerum. Quasi et dignissimos cum vitae repellat. Rerum facilis non sunt nulla nisi. Nulla est neque quia temporibus in consectetur et nihil. Non porro quae facere sequi nulla officiis voluptatem. Culpa exercitationem voluptatem non voluptas. Fugiat quisquam quia eos nulla. Saepe exercitationem odio praesentium unde ut placeat nulla. Itaque voluptas et laboriosam placeat ut accusamus rerum. Unde dignissimos voluptas maiores labore. Illum aliquam tempore veritatis et adipisci inventore ut et. Numquam qui aliquam repudiandae nihil pariatur et.', 1, 3, 3, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(70, 'document', 'text/html', 'Consequatur laboriosam et aut.', '', '', 'consequatur-laboriosam-et-aut', '', 1, 0, 0, 7, 0, '', 'Minima sed et harum est rerum. Amet aut alias fuga consequuntur ratione odio est. Ut omnis qui eius sapiente reprehenderit totam repellat. Qui porro at quam itaque. Consectetur ea ratione in quidem fugit. Iure culpa voluptatem repudiandae doloremque. Quos quis enim id ut voluptatem autem. Iure hic exercitationem hic. Aut voluptatibus et voluptatem maxime ipsam ea placeat ut. Iste sequi nobis omnis omnis explicabo. Non error sapiente eos est debitis. Laborum doloribus sed natus exercitationem consequatur sit. Saepe blanditiis corporis est iusto alias. Ut rerum voluptatem dolorum laboriosam. Omnis deleniti aut iusto ut. Alias architecto minus vel rerum repudiandae et ex. Aut voluptatem eveniet officia quis sapiente. Nostrum nam tenetur dignissimos quia est ad asperiores. Saepe ratione consequatur voluptatem doloremque explicabo enim cumque ut. Consequatur maxime non ut velit quasi neque. Porro in laborum dolores rerum occaecati fugit quas. Sit consequatur culpa est illum.', 1, 3, 21, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(71, 'document', 'text/html', 'Est esse optio id.', '', '', 'est-esse-optio-id', '', 1, 0, 0, 4, 0, '', 'Accusantium error culpa tenetur qui ex. Ex consequatur explicabo at tempore ea. Assumenda est fuga deserunt exercitationem sit deleniti. Nobis dolore perferendis aut quia. Deserunt voluptas ea nesciunt velit facere. Repellat in omnis pariatur possimus dolor impedit. Quod praesentium ab voluptas dolores error quod ut. Nostrum explicabo similique totam animi. Praesentium nemo architecto non commodi fugit velit. Ab non tempora impedit error recusandae quibusdam. Sit recusandae omnis saepe. Quibusdam et explicabo dolor dolore magnam quae cum. Possimus fugiat magni exercitationem autem ipsam. Ullam soluta numquam assumenda. Et quas officiis id aliquam animi non. Accusamus molestias atque est aperiam dolores deleniti in dolor. Est necessitatibus dolorem placeat magnam sed inventore id. Animi quia vel libero quibusdam suscipit libero. Earum distinctio debitis rem animi molestiae dolores sed. Ipsum voluptates id laudantium et voluptatem nisi. Ut perspiciatis minima est nam sequi blanditiis.', 1, 3, 7, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(72, 'document', 'text/html', 'Ut fugiat nam officiis.', '', '', 'ut-fugiat-nam-officiis', '', 1, 0, 0, 5, 0, '', 'Deserunt harum fugit rerum autem ipsum quia. Laudantium et amet eius saepe eligendi error. Qui quos rem incidunt aut eaque. Velit voluptatibus dolorem sequi omnis. Molestiae est et quas aut commodi inventore tempore iste. Consequuntur animi quos exercitationem molestiae iure tempora molestiae. Molestias adipisci sit culpa vel laudantium. Deleniti dolor facere ut et maiores alias. Fuga dolores aliquid rerum dolorem est. Repellat id necessitatibus facilis saepe autem laudantium. Dolorem eum adipisci porro. Cum ipsam alias neque. Nemo aut aliquam aliquid. Dolor hic aperiam dolore explicabo dicta voluptatem cumque. Esse praesentium inventore similique ut dolor quo et quos. Veniam totam id et veritatis beatae dignissimos quaerat. Veniam et dignissimos placeat iusto doloremque voluptate non. Amet veniam quis eum totam sed sint. Officia nostrum eum quod. Neque eius amet quisquam necessitatibus aut ut sequi. Ut consequatur minus enim. Eos dolorem qui velit perferendis.', 1, 3, 36, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(73, 'document', 'text/html', 'Enim aut qui unde sunt asperiores cum.', '', '', 'enim-aut-qui-unde-sunt-asperiores-cum', '', 1, 0, 0, 7, 0, '', 'Itaque unde occaecati qui rerum hic excepturi. Esse eum minima mollitia ut magnam. Optio libero quos quidem quis et beatae. Quidem voluptatibus provident perferendis consequuntur reiciendis quo. Temporibus quos omnis fuga. Ipsa dolorem id sit rerum impedit ea corrupti. Dolores recusandae molestiae delectus. Ad odit qui suscipit est. Est odit et commodi. Architecto voluptatibus reiciendis fugit quae qui natus deserunt. Neque qui tempore est non qui incidunt quibusdam. Hic iste eos ut culpa. Delectus illo voluptas non reiciendis cumque. Sed accusantium culpa placeat. Officiis inventore repellendus repellendus et assumenda. Voluptatibus ut fuga blanditiis praesentium totam deleniti. Temporibus est veritatis tempore nihil exercitationem. Totam ut et et vel architecto id reprehenderit minima. Ut harum nesciunt exercitationem dignissimos illum.', 1, 3, 37, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(74, 'document', 'text/html', 'Molestiae aut eveniet quo facere non.', '', '', 'molestiae-aut-eveniet-quo-facere-non', '', 1, 0, 0, 6, 0, '', 'Distinctio nemo id necessitatibus perspiciatis. Rerum et at quia sapiente rerum. Sint laboriosam repellat nulla doloremque eligendi accusamus incidunt. Architecto neque reprehenderit similique quis molestiae ex. Provident non voluptatem nam nemo quis qui modi. Autem hic pariatur ut explicabo culpa. Quia iure eum eligendi sit maiores pariatur. Fugit nobis deleniti distinctio ab dolor occaecati. Aliquam rerum voluptatum numquam nulla. Quidem enim facilis corporis voluptate maiores. Odio modi in enim fuga consequatur. Sint nam consequuntur eum corporis delectus quia. Ea iste aut nobis ut voluptatem sequi cum. Doloremque labore ut itaque. Veniam nesciunt enim unde nihil. Qui dolore impedit rerum porro aut veritatis quibusdam. Tenetur consequuntur omnis iusto facere voluptatem. Excepturi vero iusto et non id. Unde odit natus perferendis veritatis eos aut accusantium nulla. Quas libero culpa consequatur sunt et voluptas consequatur.', 1, 3, 9, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(75, 'document', 'text/html', 'Sit ex numquam est omnis.', '', '', 'sit-ex-numquam-est-omnis', '', 1, 0, 0, 5, 0, '', 'Porro iusto iure eius corporis. Aperiam est excepturi assumenda vel accusamus labore ullam. Omnis harum dolore facilis magnam qui et quos consequuntur. Est tempore qui repellat nam expedita. Minus sequi voluptas provident quis ducimus voluptatem est sequi. Autem similique quo et id. Et minus aut qui. Beatae et adipisci autem quia voluptas. Eaque quae voluptatibus perspiciatis aspernatur rerum asperiores excepturi. Quasi non dolor maiores ut quis velit. Beatae et minima fugit qui nulla magni dicta. Autem consequatur quis accusamus soluta ut cumque illum. Commodi non nihil vel magnam reprehenderit rerum voluptas qui. Voluptatum officiis est molestiae esse non sunt hic. Ut incidunt aspernatur rerum dolorem. Sit qui et atque mollitia. Voluptatem autem iusto molestias totam itaque et molestiae. Quia quidem illum illo repellendus autem minus. Exercitationem aperiam dicta dolorem sed aliquam. Velit aut molestias eos eum. Ad atque omnis nisi velit voluptas.', 1, 3, 51, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(76, 'document', 'text/html', 'Eos illo quas quo dolor iste.', '', '', 'eos-illo-quas-quo-dolor-iste', '', 1, 0, 0, 6, 0, '', 'Quia maiores fugit rerum. Voluptatem officia at at nihil rerum consectetur earum nesciunt. Nostrum vel voluptates nemo. Necessitatibus ex neque qui perspiciatis aut incidunt eos. Nihil officiis consequuntur laborum aliquid voluptas. Sint similique ut illo provident ea et. Ex rerum sint quia expedita quia odit et. Laboriosam quidem voluptate cupiditate error pariatur quam a. Error voluptate est et qui iure impedit rem. Consequuntur labore illum blanditiis quia. Praesentium voluptates iure alias dignissimos dolorum veritatis animi. Similique provident accusantium aut omnis dolores. Fugit et praesentium tempore dolores sed et vero eum. Sapiente sunt nihil voluptas. Dicta iusto excepturi temporibus repellat totam. Dolore reprehenderit modi aperiam. Nisi qui odit laboriosam qui ut. Iusto adipisci architecto sunt magni. Dolore sed sed porro porro amet ipsa. Eaque quo natus excepturi odit. Quis sed nihil doloribus et accusamus.', 1, 3, 23, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(77, 'document', 'text/html', 'Eius architecto suscipit reprehenderit quo ex eaque.', '', '', 'eius-architecto-suscipit-reprehenderit-quo-ex-eaque', '', 1, 0, 0, 6, 0, '', 'Voluptatem quia aut cumque non nulla sint. Perferendis delectus quidem consequatur nesciunt distinctio. Aut harum libero assumenda eos eum vel eos. Tempore nemo quod quis accusamus quibusdam incidunt. Aut voluptas facere quo rem vero est nesciunt totam. Ut quo quia eum facere est sapiente. Excepturi quos iste ut ut et. Consequatur sed reiciendis iure aspernatur est enim accusantium. Est quasi sit ex sed est velit. Quaerat consequuntur fugit quaerat cumque quae. Tenetur unde dolor tempore aut facere quo quam. Laboriosam minima earum sit unde. Occaecati esse id beatae est voluptas asperiores. Qui et eum quae sunt odio inventore. Quo enim tempore a et impedit in sequi. Rerum distinctio ab ea ut. Cumque sed et vero magni praesentium nostrum. Error molestiae eligendi quia qui repellendus est officia. Architecto neque dolores doloremque natus nemo. Temporibus voluptatem est excepturi neque.', 1, 3, 25, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(78, 'document', 'text/html', 'Qui error autem beatae libero id quo.', '', '', 'qui-error-autem-beatae-libero-id-quo', '', 1, 0, 0, 4, 0, '', 'Voluptas quo est est et. Atque voluptas qui quis non vitae commodi veniam. Sed aliquid odio et rem aut sit nemo. Et ab quis eius aliquam asperiores. Alias eveniet non asperiores autem dignissimos consectetur recusandae. Accusamus autem et nemo iste doloremque ipsa. Commodi consequatur reprehenderit animi neque commodi. Enim earum reprehenderit sequi in aut consequatur dignissimos eum. Molestias aspernatur aut inventore nihil. Consectetur beatae consectetur laborum expedita qui aspernatur. Autem ea et nihil esse perspiciatis. Qui perspiciatis accusantium vel corrupti totam eius optio nulla. Laboriosam corporis minus perspiciatis assumenda. Temporibus sunt odit sunt. Nesciunt a placeat quidem voluptatem tempora fugiat eaque. Ex omnis sequi et dicta id quia. Cupiditate adipisci est minima veritatis quae. Voluptate voluptatibus ut maiores mollitia. Sed dolorem vel totam veritatis accusamus. Voluptatem hic dolor a distinctio. Ipsum quibusdam at corrupti sit eaque.', 1, 3, 11, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(79, 'document', 'text/html', 'Similique nihil dolores eaque quia non itaque.', '', '', 'similique-nihil-dolores-eaque-quia-non-itaque', '', 1, 0, 0, 7, 0, '', 'Sunt debitis in aut tenetur dolorem omnis. Repellendus quia molestias error molestias molestiae totam. Commodi mollitia perferendis et et culpa ad explicabo. Sed inventore perspiciatis molestias omnis. Aut provident in qui earum. Deserunt ut eum odio reprehenderit iste quibusdam quis. Et voluptas repellat deleniti ea nihil. Ea officiis sunt ullam perferendis corrupti est. Numquam quia molestias omnis reiciendis placeat. Impedit est accusantium est doloribus nulla natus ut. Beatae ea libero sapiente nam quasi hic non commodi. Cum natus sit officiis dignissimos voluptatem. Laboriosam doloremque et at nisi laborum quae explicabo. Ea iste odio sunt facere quaerat dolorem. Excepturi quibusdam voluptatem eum debitis omnis et excepturi qui. Et quo rem quasi molestiae. Tempora aut non occaecati et. Fugiat aut praesentium blanditiis qui deserunt at qui fugiat. Quia distinctio eligendi est ut. Pariatur error temporibus ea nihil illum.', 1, 3, 39, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(80, 'document', 'text/html', 'Facere culpa distinctio consequuntur.', '', '', 'facere-culpa-distinctio-consequuntur', '', 1, 0, 0, 6, 0, '', 'Perspiciatis voluptate vero harum sed ducimus nulla. Minima quae ipsam et ad. Enim laudantium cupiditate cupiditate unde. Quis neque natus quibusdam maiores commodi blanditiis. Ipsum qui est consequatur vero veniam deleniti harum. Quia pariatur aut culpa labore quia. Ut maxime blanditiis eos tempore quam adipisci consequatur. Non quidem quidem sint esse. Et aliquid numquam veritatis molestiae quidem animi et. Consequatur aliquam laborum enim delectus. Pariatur iste officia incidunt sint porro. Cum omnis debitis temporibus sapiente. Sapiente ut non ratione vero voluptatibus voluptatem modi. Sit nostrum provident non accusamus aut dolores. Nam iure eos et expedita excepturi. Molestiae consequatur id architecto nulla minus. Dolorem suscipit et ut et eum aut dignissimos. Doloremque ut voluptate voluptatibus sunt rerum magni est. Quia architecto vel iure voluptas voluptatum ipsam optio. Laborum iure facilis tenetur iste.', 1, 3, 40, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(81, 'document', 'text/html', 'Quam ad eos sit.', '', '', 'quam-ad-eos-sit', '', 1, 0, 0, 7, 0, '', 'Ut beatae dolorum aperiam accusamus labore. Aut distinctio error voluptas occaecati nemo. Id aut necessitatibus sit. Veritatis sit et enim incidunt doloremque rerum voluptatem. Et omnis quia porro iusto assumenda vel laborum. Sunt molestiae nihil omnis expedita perspiciatis. Distinctio provident doloremque consequatur qui modi. Ut facilis accusamus et illum facere. Repudiandae magnam magni voluptatibus esse velit at. Aperiam architecto necessitatibus facere alias. Enim ducimus repudiandae numquam facilis aut eum officia. Qui quia odio quas accusantium. Et voluptas nobis non sunt facere. Hic magni non reiciendis et. Amet est hic voluptas odio nisi. Veritatis eius in dolores. Occaecati delectus rerum facere quia. Et eveniet natus quia sunt voluptatem atque. Itaque voluptates quo quibusdam exercitationem. Itaque et aliquid aut officiis maiores velit. Velit excepturi libero tempora hic sit.', 1, 3, 14, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(82, 'document', 'text/html', 'Delectus temporibus exercitationem tempore.', '', '', 'delectus-temporibus-exercitationem-tempore', '', 1, 0, 0, 5, 0, '', 'Magnam et assumenda est minus ut. Laboriosam ut atque dolores delectus. Iste aut laudantium placeat officiis cum. Ut qui adipisci aliquid aliquid. In maxime autem eum ut. Corrupti repudiandae autem nemo. Iusto repudiandae temporibus est quod sint sunt sint. Sapiente blanditiis in animi debitis assumenda velit. Quis possimus laborum est rerum. Voluptas voluptas sint officia reiciendis rerum natus sit. Qui facilis nam sit ipsam iure ipsa. Dolor et qui modi odio quas aperiam soluta. Perferendis sit omnis rerum eligendi repellat architecto. Itaque blanditiis aut et culpa illum veniam. Doloremque asperiores quia accusantium sed ut. Quas cupiditate saepe voluptas. Quisquam consectetur et facere doloribus. Velit a non ipsam dolores neque. Nemo eos aut ut quia omnis dolore. Eligendi dignissimos doloribus odio ab. Repellendus porro expedita nisi quia qui est tenetur. Illum nemo quia eos enim labore. Voluptatem iste enim vel voluptatem maxime vel.', 1, 3, 69, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(83, 'document', 'text/html', 'Eum voluptatem ea illum.', '', '', 'eum-voluptatem-ea-illum', '', 1, 0, 0, 5, 0, '', 'Commodi alias vel eveniet iure consequatur. Tenetur optio voluptas voluptatem consectetur rerum quibusdam. Saepe voluptatibus et molestiae quisquam exercitationem. Necessitatibus minus dicta enim dolor sunt velit quia quibusdam. Amet culpa consequuntur odio sunt. Rerum distinctio temporibus suscipit nihil minima quia. In maxime error beatae. Sapiente dignissimos quaerat necessitatibus quibusdam aspernatur et dolor. Error quia nulla reiciendis odit earum rerum. Et quo neque eum laboriosam mollitia. Harum quam quod saepe consequuntur nisi aut maxime. Qui ipsum sint non. Nisi autem dolor quia deleniti quos animi iste. Commodi nam quis est nobis voluptas. Non unde dolor sapiente deleniti dolor. Sunt dolore sit quae occaecati repellat. Et laborum facilis ab veritatis qui quasi et. Iste nihil ex rerum qui dolores quis. Sunt tempora quaerat veritatis molestiae aut ut.', 1, 3, 81, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(84, 'document', 'text/html', 'Quia quia cumque quia architecto est vero.', '', '', 'quia-quia-cumque-quia-architecto-est-vero', '', 1, 0, 0, 4, 0, '', 'Ipsum in ut veritatis quisquam eveniet officiis. Consequuntur esse enim maiores non dolore rem et. Odio esse cumque sed. Omnis dolor perspiciatis sed qui velit eos quis. Reprehenderit voluptate quo illum dicta illo. Ea officia explicabo quisquam ab. Est quia dicta cum. Nesciunt dolores harum suscipit expedita optio. Quibusdam est maxime quaerat dolores explicabo asperiores. Temporibus sint voluptatem sunt quasi unde. Cupiditate nihil eum rem dolores. Delectus hic voluptatum quidem magnam nihil ipsam. Ab doloremque blanditiis inventore laborum est. Deserunt nemo molestias quis laborum magni nihil. Nisi et et eius quibusdam dolor odio aut vel. Illum voluptas vel optio et nemo omnis. Libero beatae et qui sed. Non placeat commodi reprehenderit quae et. Alias quos reprehenderit vero ipsa. Ut et nihil perspiciatis ex iusto fuga. Laboriosam consequatur modi dolor. Est quisquam magnam omnis illum aspernatur corporis quisquam et.', 1, 3, 27, 1, 1, 1, 1728756116, 1, 1730405213, 0, 0, 0, 1730405213, 0, '', 0, 0, 0, 0, 1, 1),
(85, 'document', 'text/html', 'Illo nobis nostrum similique ipsum maxime.', '', '', 'illo-nobis-nostrum-similique-ipsum-maxime', '', 1, 0, 0, 6, 0, '', 'Consequatur nihil soluta qui harum amet delectus. Dolores id voluptas esse ut et corrupti. Nesciunt magnam nobis aliquam recusandae vitae aspernatur. Consectetur ducimus debitis distinctio natus est numquam. Natus exercitationem dolorem omnis voluptate et sapiente consequatur. Architecto id impedit eum iusto. Pariatur soluta deserunt iusto quibusdam odio ex similique. Pariatur placeat nisi est ratione labore necessitatibus. Reiciendis quaerat aut voluptatem quas voluptas dolor ipsum. Fuga saepe aperiam optio eaque. Deleniti fugiat quia rerum unde asperiores. Voluptatem perferendis nostrum ducimus in dolorem corrupti beatae. Quae iure dolorem soluta libero et quae. Praesentium ab ad tenetur ratione corrupti earum. Dolorem eos qui libero nam molestiae. Omnis et qui dolorem quia repudiandae nam. Ullam esse eum facere qui inventore temporibus accusamus.', 1, 3, 28, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(86, 'document', 'text/html', 'Qui quia aut est est.', '', '', 'qui-quia-aut-est-est', '', 1, 0, 0, 8, 0, '', 'Temporibus ut doloribus harum aut perspiciatis earum. Blanditiis et non repudiandae alias. Eum iste doloremque quo. Facere vero corporis aut dolores et fugiat voluptatem. Vitae eos voluptatum sit maiores labore nesciunt eius. Tempore nulla vel molestias eveniet cum sit possimus. Aut ut sit blanditiis mollitia aut. Voluptates reiciendis odio dicta minima eum. Nihil quia et quo. Consequuntur aut eaque vitae dolores. Ea beatae voluptatum nihil soluta. Est voluptatem rerum quia. Ut voluptas inventore id iste ut. Necessitatibus maiores at inventore. Magni qui nulla quo est quasi dolorum. Laborum laboriosam qui consequatur doloremque. Accusantium sint nesciunt voluptatem perferendis id labore aut. Aperiam quo quia dolores vel odio dolorum. Sint repellat dolores voluptatibus rem iste est. Dolore aspernatur praesentium minima consequatur provident quos itaque sunt.', 1, 3, 0, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(87, 'document', 'text/html', 'Praesentium doloremque debitis sit eum nemo provident.', '', '', 'praesentium-doloremque-debitis-sit-eum-nemo-provident', '', 1, 0, 0, 4, 0, '', 'Harum soluta et repellat. Culpa quaerat est dolorem. Sed repellendus vel incidunt aut. Error odio dolorem et iure est magni magni. In distinctio quo doloremque eveniet accusantium sunt quasi perferendis. Nemo impedit ipsa quis alias. Voluptatem aperiam sed facilis. Repellat eum distinctio doloremque. Dolorem et incidunt sunt aliquam laudantium corporis quo. Nesciunt consequatur reprehenderit doloribus commodi dolorem qui vel. Veritatis commodi aperiam corrupti qui cupiditate voluptas itaque. Ea aperiam voluptates ea modi cumque. Accusantium voluptatem nemo tenetur dignissimos sit. Non voluptatem atque dolorem voluptatem repellat quas vel. Repellat autem saepe necessitatibus eligendi qui. Sapiente at et molestiae officia. Aut non vero fugit natus perferendis nulla ipsam. Natus eaque odit impedit unde voluptatem. Ipsum ullam repellendus minus rerum sit. Sunt earum voluptate est nisi id praesentium voluptatem. Rerum corporis voluptas magni atque officiis rerum cumque fuga.', 1, 3, 0, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(88, 'document', 'text/html', 'Nulla expedita cumque commodi.', '', '', 'nulla-expedita-cumque-commodi', '', 1, 0, 0, 5, 0, '', 'In debitis corrupti adipisci id reprehenderit. Nostrum praesentium dicta odit et quam repellendus aperiam. Velit ut ex consequatur consequuntur. Dignissimos sint et similique qui distinctio. Voluptatem est reprehenderit distinctio est doloremque cupiditate voluptatem. Totam id rerum dolorem architecto rerum culpa et. Ullam numquam sed qui dolor est dolor et. Et nostrum nisi reprehenderit occaecati dolor. Officiis vero atque maxime est quis eum omnis voluptas. Facere inventore totam soluta unde sunt. Aliquid sed libero temporibus quia dolorem doloribus necessitatibus. Eum non beatae nisi. Quis dolor error et explicabo in debitis consequatur nesciunt. Perferendis accusamus illum dicta facere corporis non. Enim ad ad autem aliquid labore ullam. Eum labore animi minus qui earum. Ut laudantium rerum voluptas. In ut accusantium laboriosam aspernatur. Expedita sint aut aut nisi nisi sunt adipisci. Fugiat ut illo rerum aut sapiente voluptatibus. Dolore assumenda sint quo eaque.', 1, 3, 29, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `adkq_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `hide_from_tree`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(89, 'document', 'text/html', 'Totam laudantium impedit ad soluta fugit.', '', '', 'totam-laudantium-impedit-ad-soluta-fugit', '', 1, 0, 0, 7, 0, '', 'Aut est cumque voluptatum ullam sit eum non. Ut dolores sit ab sit. Laudantium nesciunt libero placeat veniam sunt perspiciatis. Odit eos et ut placeat culpa ipsum quis. Fuga expedita quos animi sed distinctio blanditiis est. Occaecati et et consequatur quia. Voluptas eum quas hic id a quam architecto. Aut nam quo sed quia vel odio qui corrupti. Qui architecto autem occaecati quia animi id eius aut. Blanditiis consequatur consequuntur et blanditiis quisquam. Est pariatur perspiciatis ipsa earum similique recusandae tempore dolorem. Velit reprehenderit officia nesciunt aliquam est animi tempora ducimus. Fuga voluptate aliquam dignissimos dolores nostrum cum est. Ut sed quia modi. Esse aperiam consequatur molestiae provident qui quis illo. Nesciunt sit ipsum eius consectetur tenetur consequatur id. Sunt consequuntur quia expedita et autem at.', 1, 3, 29, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(90, 'document', 'text/html', 'Vel corporis sequi consectetur et aut.', '', '', 'vel-corporis-sequi-consectetur-et-aut', '', 1, 0, 0, 4, 0, '', 'Iure laboriosam eligendi nostrum veritatis occaecati vero. Autem perspiciatis nulla reprehenderit velit numquam qui quaerat. Distinctio libero voluptatem aut consequatur. Excepturi asperiores qui enim non sint. Sit optio recusandae quia sit nam esse quibusdam quas. Nesciunt expedita officiis sit ea assumenda assumenda occaecati. Ut nihil voluptatum consequatur occaecati. Aut et autem unde impedit nam consequatur. Optio earum consequuntur mollitia occaecati quaerat dolorem. Quia quas sapiente ad accusantium suscipit quis impedit nobis. Culpa voluptatem molestias aut saepe facere. Quo in dolorem nobis rem quaerat. Voluptates ut officiis ut sint soluta quidem dolorum. Veniam maiores consequatur quisquam fuga voluptatem aut. Qui rerum rerum quo totam sed adipisci itaque. Doloribus minus porro quidem ut rerum. Sed voluptas labore dolores non quia nihil. Deserunt culpa qui necessitatibus minus. Unde ducimus non inventore et est cumque ut explicabo.', 1, 3, 15, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(91, 'document', 'text/html', 'Qui occaecati ipsum illo nihil.', '', '', 'qui-occaecati-ipsum-illo-nihil', '', 1, 0, 0, 6, 0, '', 'Necessitatibus et omnis qui. Qui doloremque consequatur modi quasi dolorem incidunt. Reiciendis repellat quia architecto aut quidem. Ullam amet rerum aut. Et hic perspiciatis tempora in dolores. Harum eius doloremque nam harum voluptatem quo nobis. Non recusandae molestiae est occaecati reprehenderit. Minima dolorem eum in qui libero. Ut omnis voluptatibus vitae expedita nihil totam debitis. Dolorum et nihil dolore molestias. Dolor et aut voluptates ex. Est quisquam ea corporis consequuntur soluta iure eveniet. Qui non amet qui dolor officiis et. Fugiat voluptatibus sequi doloribus. Ea omnis sint ad tempora ut inventore iste tempora. Architecto qui aspernatur ut id eum corrupti deserunt. Iusto sequi similique quibusdam quis. Et numquam similique sit perspiciatis distinctio omnis. Optio beatae consequatur omnis. Praesentium vitae cupiditate natus laboriosam ipsam quos.', 1, 3, 13, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(92, 'document', 'text/html', 'In aut quo quibusdam molestiae.', '', '', 'in-aut-quo-quibusdam-molestiae', '', 1, 0, 0, 6, 0, '', 'Odit ullam commodi et ratione. Impedit dolorum unde quod odio. Rerum voluptates quo et nemo reiciendis tenetur. Autem ab et perspiciatis enim veniam officiis. Unde asperiores et nisi quos at tempora. Necessitatibus totam vero ex adipisci iste id rerum. Sunt cum ut consequatur libero. Quis qui qui deleniti accusantium. Quibusdam esse incidunt cum voluptas quae perspiciatis sit. Ad eos hic sapiente dolor. Architecto vel occaecati architecto id. Voluptatum eaque assumenda nesciunt et vel autem. Ipsum sit unde modi. Quos a aliquam quam commodi sit aspernatur. Sed officiis ad a qui quidem perferendis. Sunt numquam libero eaque quidem nihil quam. Aliquid aut et omnis voluptas. Dolor libero repudiandae eos. Vel esse molestiae molestiae quis autem nihil. Iure occaecati in dolor et. Rerum dolore ex libero adipisci itaque dignissimos voluptatem. Deleniti nostrum non et architecto voluptatem distinctio corporis. Ut rerum ratione optio mollitia rerum eius. Voluptatem maiores sunt voluptatem aut.', 1, 3, 43, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(93, 'document', 'text/html', 'Deleniti sint repudiandae occaecati eius aliquam.', '', '', 'deleniti-sint-repudiandae-occaecati-eius-aliquam', '', 1, 0, 0, 8, 0, '', 'Sint voluptatem nam rerum. Nihil sit et quia magnam ullam. Quisquam corrupti nulla assumenda voluptatum occaecati molestiae. Vitae magnam voluptatibus iusto quo. Sit et eos dolores ut totam veritatis suscipit atque. Minima explicabo dolore sunt suscipit iste assumenda. Ipsum omnis non aut neque. Est autem sit nihil dolorem dolores. Sed quia facilis pariatur. Neque voluptatum in voluptas atque. Aut nihil enim error cupiditate quis. Porro ex aut veniam et. Est ducimus ab beatae quia quidem nemo fugiat. Similique quod mollitia incidunt mollitia non. Aut voluptatum molestiae at dolorem officiis suscipit illo. Aut sapiente aut ex in. Est maxime qui accusamus odit. Laborum veniam nihil voluptas ducimus nam et. Minus ipsa temporibus nam aut. Dignissimos sit aspernatur aut itaque qui dolores iste eveniet. Rerum accusamus minima suscipit.', 1, 3, 2, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(94, 'document', 'text/html', 'Aut et voluptatum at.', '', '', 'aut-et-voluptatum-at', '', 1, 0, 0, 7, 0, '', 'Eligendi delectus aut voluptate temporibus rem iure. Natus non occaecati officia. Ut aspernatur ipsa quam et id suscipit. Reiciendis in sed voluptatum earum fugiat quos. Provident error in cupiditate autem ad quisquam. Accusantium odio aspernatur voluptas officiis in. Ipsam perferendis in ipsa. Sequi occaecati et ullam. Error expedita eveniet perferendis ipsam voluptatem consequuntur. Totam amet excepturi rerum exercitationem quo dolorem dolorum fuga. Provident voluptas quaerat rem quos unde. Unde et maxime ut accusamus dicta. Labore et et dolor. Reiciendis fuga nulla dolor voluptas ut. Quia velit blanditiis cupiditate est occaecati dolores similique sapiente. Totam hic quae id sint. Sapiente velit pariatur iste nisi expedita exercitationem a. Odit corporis accusantium et eos. Natus quo blanditiis velit animi quos est. Est deleniti et laboriosam sed autem pariatur ut. Est sint enim dolores et aut ullam.', 1, 3, 5, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(95, 'document', 'text/html', 'Ducimus quis at soluta distinctio.', '', '', 'ducimus-quis-at-soluta-distinctio', '', 1, 0, 0, 7, 0, '', 'Ea consequatur consequuntur dolorum rerum ratione sunt mollitia. Dignissimos id non sequi perferendis mollitia ea rerum vero. Perferendis aut et assumenda ea. Labore asperiores maxime qui quae facere. Et qui veritatis fugit non consequatur. Quisquam est reiciendis veritatis sed et pariatur totam. Aut nihil delectus voluptatum adipisci voluptate officia. Sunt blanditiis quod voluptas qui sit. Sequi error aspernatur vel reprehenderit. Nihil cum nemo similique dolorem suscipit qui. Ducimus laborum et ut laboriosam est voluptatem qui vitae. Doloremque assumenda tenetur accusantium. Aut est in ut ab. Aspernatur non molestiae dignissimos aut debitis voluptas. Quia molestias sed officiis natus modi vel aspernatur quod. Dolore ut accusantium labore nesciunt et. Ea temporibus iste minus placeat eius et ea. Voluptatem nesciunt odit doloremque eaque et est.', 1, 3, 33, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(96, 'document', 'text/html', 'Explicabo et beatae voluptas doloremque est ea.', '', '', 'explicabo-et-beatae-voluptas-doloremque-est-ea', '', 1, 0, 0, 5, 0, '', 'Ad minus vitae et sequi impedit. Accusantium est dolorem nemo quo assumenda. Perspiciatis quasi beatae rerum aut ad maxime quos molestiae. Doloremque explicabo ipsam illum quidem praesentium molestiae. Cumque assumenda dolor itaque quis iste enim est. Dolores in nam dolor facere sint. Et quis maxime eius minus. Tempora ducimus et vitae vitae distinctio. Mollitia neque sapiente eos autem dicta nobis. Odit et quia occaecati. Est nobis iusto ut aut fugiat. Labore quaerat dolorem magnam nostrum vel iusto. Perspiciatis earum neque vitae corporis porro nobis. Sed beatae dolorem enim perferendis iste tenetur. Rerum quibusdam id quos sint quos est maxime voluptatem. Enim tempora quas fugit qui qui. Minus sed labore delectus facilis rerum aperiam. In neque cupiditate quam nobis laboriosam sint itaque. Iusto est sunt laborum quaerat. Assumenda architecto modi et maiores facilis voluptatem. Veritatis quidem iure sequi ut itaque commodi et cumque.', 1, 3, 34, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(97, 'document', 'text/html', 'Dolores cupiditate error alias qui natus.', '', '', 'dolores-cupiditate-error-alias-qui-natus', '', 1, 0, 0, 6, 0, '', 'Eum voluptatem ratione aut debitis. Suscipit exercitationem voluptatem officia laudantium sit aut. Rem sint accusamus quia qui pariatur. Consequatur facere est doloribus. Unde dolor eveniet omnis quos dignissimos iure blanditiis quia. Molestias consequuntur consequuntur reprehenderit nihil quod veniam modi voluptas. Et mollitia ex perspiciatis qui et. Magni nostrum eos est commodi. Voluptate voluptatibus necessitatibus architecto beatae accusamus qui quia. Earum neque voluptas quia adipisci inventore. Quaerat fugit dolor consectetur incidunt. Aspernatur qui id aut velit. Et perspiciatis nihil ab omnis unde. Tempore eaque ratione optio ut aut est impedit. Accusantium corrupti maxime odit ea. Vel eos ipsum praesentium inventore sequi. Et sed temporibus eius velit molestiae recusandae. At ea eos atque optio odit velit sapiente. Eius magni cum aliquam autem amet veniam.', 1, 3, 8, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(98, 'document', 'text/html', 'Fugiat placeat sed voluptas.', '', '', 'fugiat-placeat-sed-voluptas', '', 1, 0, 0, 5, 0, '', 'Eius adipisci blanditiis autem nihil. Expedita quia eaque quo id maxime cumque est voluptatem. Unde magnam beatae velit voluptas eos. Harum eius velit voluptatibus aspernatur expedita. Fugit sint ea facere dolores consequatur blanditiis. Et ipsum ut laborum voluptas. At provident aperiam minus dolorem cumque autem. Dolor consequuntur ut et necessitatibus architecto deserunt sit. Qui in enim dolor ut rerum. Rerum eveniet non sit dolorum doloremque qui. Delectus ut consequatur sed cum. Omnis odit et ut ratione totam deserunt. Soluta natus excepturi quia dolorem sapiente quidem error. Sequi aut commodi excepturi ipsum. Aut et ea eaque nihil eos. Totam ullam molestiae et omnis. Nam voluptatem beatae officiis et. Accusantium dolores quas laboriosam error. Iste voluptas similique maiores eligendi enim est expedita. Et at eius in sunt. Non possimus aut non iure ut perferendis qui. Et sed sequi aperiam quasi id molestiae velit.', 1, 3, 71, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(99, 'document', 'text/html', 'Eum quo a odio ut maiores.', '', '', 'eum-quo-a-odio-ut-maiores', '', 1, 0, 0, 7, 0, '', 'Quisquam qui deserunt veritatis odio voluptates et quia. Sunt nihil recusandae assumenda consequatur est sunt inventore. At magni fuga ipsum debitis. Nihil autem soluta qui aut consequatur distinctio voluptatem. Non omnis reprehenderit esse labore saepe voluptatem modi voluptas. Quo et omnis officia voluptas quis. Occaecati adipisci quia ad inventore ratione dolor. Repudiandae sit qui laudantium totam ducimus. Repellendus neque nisi inventore omnis eligendi qui suscipit. Ipsa similique minus voluptas minus. Enim a dolore veniam fugit qui deleniti inventore. Rerum qui sed perferendis aut iure magnam aspernatur. Impedit sint magnam recusandae hic. Nesciunt vero nihil voluptatem velit. Recusandae recusandae rerum animi nobis rerum. Sint odit officia quo est architecto sapiente autem. Id praesentium reprehenderit cumque dolorem inventore recusandae aut nisi. Nostrum placeat reprehenderit sequi dolorem excepturi. Natus excepturi quasi ut quidem corrupti. Illo reprehenderit qui ab quia.', 1, 3, 21, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(100, 'document', 'text/html', 'Voluptates amet dolorem aut nam quos.', '', '', 'voluptates-amet-dolorem-aut-nam-quos', '', 1, 0, 0, 8, 0, '', 'Consequatur dolorem sit soluta et. Aut qui officiis doloremque ut magnam consequatur. Eum occaecati tenetur eligendi aspernatur. Doloremque possimus reprehenderit maxime in nisi mollitia consequatur. Aut consequatur neque rem est et ipsam aut. Quia illum quasi aspernatur magni in eveniet quam. A dolores nihil qui voluptatibus in qui occaecati. Ratione adipisci consequatur itaque minus amet voluptatem est. Est quas et voluptatibus in quia. Dolores laboriosam temporibus tenetur voluptas perferendis omnis. Aliquam at modi eos rerum. Accusamus est libero neque id et dignissimos. Consequatur voluptates fugiat cum voluptatem facilis possimus. Eveniet et rerum porro ut. Voluptates qui delectus culpa nam laborum. Nisi mollitia sequi eligendi aliquid. Ducimus laboriosam libero fuga vero velit. Omnis temporibus eveniet veritatis autem aliquid dicta. Et quidem quis quas voluptatum explicabo. Et saepe vel libero rerum porro.', 1, 3, 3, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(101, 'document', 'text/html', 'Rerum ipsa ex corporis.', '', '', 'rerum-ipsa-ex-corporis', '', 1, 0, 0, 4, 0, '', 'Eveniet et quidem odio libero voluptas. Accusantium qui est eius illum. Sequi natus tempore occaecati temporibus quia excepturi. Est velit aut odit id. Quia aspernatur repellat aut ratione sunt architecto voluptatem. Deserunt facilis sequi praesentium. Delectus cumque suscipit nam voluptatem fuga. Ut et autem qui et qui. Id non quas natus. Est est molestiae repellat earum. Ea modi asperiores rem quia dolorem occaecati. Praesentium voluptas optio nostrum est id dolores. Explicabo est molestiae voluptas libero neque enim dolor. Quae aut facilis tenetur fugit. Aut inventore ut velit enim nostrum distinctio magnam. Nulla libero nobis similique culpa. Praesentium libero qui sapiente eaque. Impedit dolores quo architecto beatae. Aut architecto officiis illo doloremque. Autem dolore et iusto. Excepturi fugit quia illo culpa. Facere natus qui facere officiis. Totam quasi laboriosam non nulla ut repellendus. Ullam accusantium blanditiis inventore ducimus non corporis.', 1, 3, 8, 1, 1, 1, 1728756116, 1, 1730405214, 0, 0, 0, 1730405214, 0, '', 0, 0, 0, 0, 1, 1),
(104, 'document', 'text/xml', 'sitemap.xml', '', 'sitemap.xml', 'sitemap.xml', '', 1, 0, 0, 0, 0, '', '', 1, 11, 9, 1, 0, 1, 1730402039, 1, 1730402049, 0, 0, 0, 1730402039, 1, '', 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_content_categories`
--

CREATE TABLE `adkq_site_content_categories` (
  `doc` int(10) NOT NULL,
  `category` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_content_closure`
--

CREATE TABLE `adkq_site_content_closure` (
  `closure_id` int(10) UNSIGNED NOT NULL,
  `ancestor` int(10) UNSIGNED NOT NULL,
  `descendant` int(10) UNSIGNED NOT NULL,
  `depth` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_content_closure`
--

INSERT INTO `adkq_site_content_closure` (`closure_id`, `ancestor`, `descendant`, `depth`) VALUES
(1, 1, 1, 0),
(2, 2, 2, 0),
(3, 3, 3, 0),
(4, 2, 102, 1),
(5, 102, 102, 0),
(6, 2, 103, 1),
(7, 103, 103, 0),
(8, 104, 104, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_htmlsnippets`
--

CREATE TABLE `adkq_site_htmlsnippets` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Cache option',
  `snippet` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Disables the snippet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_modules`
--

CREATE TABLE `adkq_site_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `wrap` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `guid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(1) NOT NULL DEFAULT 0,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modulecode` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'module boot up code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_modules`
--

INSERT INTO `adkq_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Extras', '<strong>0.1.3</strong> first repository for Evolution CMS', 0, 0, 1, 0, 0, '', 0, '', 1728745019, 1728745019, 'store435243542tf542t5t', 1, '', ' \n/**\n * Extras\n * \n * first repository for Evolution CMS\n * \n * @category	module\n * @version 	0.1.3\n * @internal	@properties\n * @internal	@guid store435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/store/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  25/11/2016\n */\n\n//AUTHORS: Bumkaka & Dmi3yy \ninclude_once(\'../assets/modules/store/core.php\');'),
(2, 'ClientSettings', '<strong>2.2.1</strong> Customizable set of fields for user settings', 0, 0, 1, 0, 0, '', 0, '', 1728745615, 1728751134, 'clsee234523g354f542t5t', 1, '{\"prefix\":[{\"label\":\"Prefix for settings\",\"type\":\"text\",\"value\":\"client_\",\"default\":\"client_\",\"desc\":\"\"}],\"config_path\":[{\"label\":\"Path to configuration files\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', '\n\nrequire_once MODX_BASE_PATH . \'assets/modules/clientsettings/core/src/ClientSettings.php\';\n\nif (!$modx->hasPermission(\'exec_module\')) {\n    $modx->sendRedirect(\'index.php?a=106\');\n}\n\nif (!is_array($modx->event->params)) {\n    $modx->event->params = [];\n}\n\nif (!function_exists(\'renderFormElement\')) {\n    include_once MODX_MANAGER_PATH . \'includes/tmplvars.commands.inc.php\';\n    include_once MODX_MANAGER_PATH . \'includes/tmplvars.inc.php\';\n}\n\nif (isset($_REQUEST[\'stay\'])) {\n    $_SESSION[\'stay\'] = $_REQUEST[\'stay\'];\n} else if (isset($_SESSION[\'stay\'])) {\n    $_REQUEST[\'stay\'] = $_SESSION[\'stay\'];\n}\n\n(new ClientSettings($params))->processRequest();\n'),
(3, 'Commerce', '<strong>0.7.0</strong> Commerce solution', 0, 0, 5, 0, 0, '', 0, '', 1728751154, 1728759352, '', 0, '', 'if (!$modx->hasPermission(\'exec_module\')) {\n    $modx->sendRedirect(\'index.php?a=106\');\n}\n\nif (!is_array($modx->event->params)) {\n    $modx->event->params = [];\n}\n\nif (!isset($_COOKIE[\'MODX_themeMode\'])) {\n    $_COOKIE[\'MODX_themeMode\'] = \'\';\n}\n\n$manager = new Commerce\\Module\\Manager($modx, array_merge($modx->event->params, [\n    \'module_url\' => \'index.php?a=112&id=\' . $_GET[\'id\'],\n    \'stay\' => \'\',\n]));\n\n$route = filter_input(INPUT_GET, \'type\', FILTER_VALIDATE_REGEXP, [\'options\' => [\n    \'regexp\'  => \'/^[a-z]+(:?\\/[a-z-]+)*$/\',\n    \'default\' => \'\',\n]]);\n\nreturn $manager->processRoute($route);\n'),
(4, 'EditDocs', '<strong>2.2.6</strong> Ajax powered modules for edit fields DB & TV, update, import, export, mass movement of documents;', 0, 0, 1, 0, 0, '', 0, '', 1728752177, 1728752177, '', 0, '{\"include_fields\":[{\"label\":\"Include fields\",\"type\":\"string\",\"value\":\"id,pagetitle,longtitle,description,alias,published,parent,introtext,content,template,menuindex,deleted,menutitle,hidemenu,createdon\",\"default\":\"id,pagetitle,longtitle,description,alias,published,parent,introtext,content,template,menuindex,deleted,menutitle,hidemenu,createdon\",\"desc\":\"a list with a choice of main fields separated by a comma of the document for editing and export \"}],\"include_tvs\":[{\"label\":\"Include TV\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"TV list separated by commas for editing or export (if empty = all TVs)\"}],\"include_tmpls\":[{\"label\":\"IDs of available templates\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"list of id of available templates (if empty = all templates) \"}],\"step\":[{\"label\":\"Step\",\"type\":\"string\",\"value\":\"100\",\"default\":\"100\",\"desc\":\"The number of iterations per ajax request. Be careful with this parameter. Better not to change.\"}],\"e\":[{\"label\":\"Quote Escaping Fields\",\"type\":\"string\",\"value\":\"pagetitle\",\"default\":\"pagetitle\",\"desc\":\"comma-separated list of fields to escape \"}],\"win1251\":[{\"label\":\"Enable Win-1251 encoding on export by default\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"columns\":[{\"label\":\"Default table columns against which we check during IMPORT\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"FROM_BASE==FROM_EXCEL\"}],\"max_rows\":[{\"label\":\"The number of table rows displayed in the browser during import\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"Leave blank for no limit\"}],\"event_plugins\":[{\"label\":\"Events «OnBeforeDocFormSave» and «OnDocFormSave» for plugins when saving documents\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"Don`t change this config, if you don`t know what you do\"}]}', 'include_once(MODX_BASE_PATH.\'assets/modules/editdocs/editdocs.module.php\');\n\n'),
(5, 'eLists', '<strong>0.1</strong> manage product params lists', 0, 0, 10, 0, 0, '', 0, '', 1730404150, 1730404222, 'eFilters', 1, '{\r\n  \"param_tv_id\": [\r\n    {\r\n      \"label\": \"ID TV параметров товара tovarparams\",\r\n      \"type\": \"string\",\r\n      \"value\": \"19\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"product_templates_id\": [\r\n    {\r\n      \"label\": \"ID шаблонов товара\",\r\n      \"type\": \"string\",\r\n      \"value\": \"3\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"param_cat_id\": [\r\n    {\r\n      \"label\": \"ID категории параметров\",\r\n      \"type\": \"string\",\r\n      \"value\": \"9\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"param_cat_id_common\": [\r\n    {\r\n      \"label\": \"ID категории общих параметров\",\r\n      \"type\": \"string\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"exclude_tvs_from_list\": [\r\n    {\r\n      \"label\": \"Не включать ТВ в параметры при выводе\",\r\n      \"type\": \"string\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"tovarChunkName\": [\r\n    {\r\n      \"label\": \"Имя чанка вывода товара\",\r\n      \"type\": \"string\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"pattern_folder\": [\r\n    {\r\n      \"label\": \"Папка паттернов\",\r\n      \"type\": \"string\",\r\n      \"value\": \"assets/images/pattern/\",\r\n      \"default\": \"assets/images/pattern/\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"tv_category_tag\": [\r\n    {\r\n      \"label\": \"ID TV, используемого для связки товар-категории через tagSaver\",\r\n      \"type\": \"string\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ]\r\n}', '/*\r\n модуль для управления списками параметров и их значениями, которые можно использовать\r\n затем для заполнения параметров продуктов и последующей фильтрации\r\n необходимо включить общие параметры и настроить зависимости для общие: \r\n\r\n  Plugins\r\ntovarParams\r\n\r\n  Snippets\r\neFilter\r\neFilterResult\r\nmultiParams\r\ntovarParams\r\n\r\n//аналогично в указанных плагинах и сниппетах импортировать параметры из модуля eLists\r\n\r\n */\r\n\r\nrequire_once MODX_BASE_PATH . \"assets/modules/eLists/module.eLists.php\";\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_module_access`
--

CREATE TABLE `adkq_site_module_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `module` int(11) NOT NULL DEFAULT 0,
  `usergroup` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_module_depobj`
--

CREATE TABLE `adkq_site_module_depobj` (
  `id` int(11) NOT NULL,
  `module` int(11) NOT NULL DEFAULT 0,
  `resource` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_module_depobj`
--

INSERT INTO `adkq_site_module_depobj` (`id`, `module`, `resource`, `type`) VALUES
(1, 2, 7, 30),
(2, 5, 26, 40),
(3, 5, 27, 40),
(4, 5, 29, 40),
(5, 5, 30, 40),
(6, 5, 14, 30);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_plugins`
--

CREATE TABLE `adkq_site_plugins` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Cache option',
  `plugincode` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Default Properties',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_plugins`
--

INSERT INTO `adkq_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `createdon`, `editedon`) VALUES
(1, 'AboutEvoWidget', '<strong>1.1.0</strong> displays useful links at the dashboardn', 0, 1, 0, 'require MODX_BASE_PATH.\'assets/plugins/aboutevo/plugin.aboutevo.php\';\n', 0, '{\"col_lg\":[{\"label\":\"Widget width\",\"type\":\"list\",\"value\":\"6\",\"options\":\"1,2,3,4,5,6,7,8,9,10,11,12\",\"default\":\"6\",\"desc\":\"\"}],\"menu_index\":[{\"label\":\"Output position\",\"type\":\"text\",\"value\":\"11\",\"default\":\"11\",\"desc\":\"\"}],\"hide_menu\":[{\"label\":\"Hide\",\"type\":\"list\",\"value\":\"0\",\"options\":\"0,1\",\"default\":\"0\",\"desc\":\"\"}]}', 0, '', 1728745019, 1728745019),
(2, 'CodeMirror', '<strong>1.7</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)', 0, 1, 0, '\n/**\n * CodeMirror\n *\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\n *\n * @category    plugin\n * @version     1.7\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @package     evo\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit,OnTVFormRender\n * @internal    @modx_category Manager and Admin\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;true &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\n * @internal    @installset base\n * @reportissues https://github.com/evolution-cms/evolution/issues/\n * @documentation Official docs https://codemirror.net/doc/manual.html\n * @author      hansek from http://www.modxcms.cz\n * @author      update Mihanik71\n * @author      update Deesen\n * @author      update 64j\n * @lastupdate  08-01-2018\n */\n\n$_CM_BASE = \'assets/plugins/codemirror/\';\n\n$_CM_URL = MODX_SITE_URL . $_CM_BASE;\n\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');\n', 0, '{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}', 0, '', 1728745019, 1728745019),
(3, 'OutdatedExtrasCheck', '<strong>1.4.6</strong> Check for Outdated critical extras not compatible with EVO 1.4.6', 0, 1, 0, '/**\n * OutdatedExtrasCheck\n *\n * Check for Outdated critical extras not compatible with EVO 1.4.6\n *\n * @category	plugin\n * @version     1.4.6\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @package     evo\n * @author      Author: Nicola Lambathakis\n * @internal    @events OnManagerWelcomeHome\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;AdminOnly &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username)\n * @internal    @modx_category Manager and Admin\n * @internal    @installset base\n * @internal    @disabled 0\n */\n\nrequire MODX_BASE_PATH . \'assets/plugins/extrascheck/OutdatedExtrasCheck.plugin.php\';\n', 0, '{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', 0, '', 1728745019, 1728745019),
(4, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 1, 0, 'require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';', 0, '{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', 0, '', 1728745019, 1728745019),
(5, 'Updater', '<strong>0.9.2</strong> show message about outdated CMS version', 0, 1, 0, 'require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';\n', 0, '{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}]}', 0, '', 1728745019, 1728745019),
(6, 'userHelper', '<strong>1.21.1</strong> addition to FormLister', 0, 2, 0, 'require MODX_BASE_PATH.\'assets/snippets/FormLister/plugin.userHelper.php\';\n', 0, '{\"model\":[{\"label\":\"Model\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"logoutKey\":[{\"label\":\"Request key\",\"type\":\"text\",\"value\":\"logout\",\"default\":\"logout\",\"desc\":\"\"}],\"cookieName\":[{\"label\":\"Cookie Name\",\"type\":\"text\",\"value\":\"WebLoginPE\",\"default\":\"WebLoginPE\",\"desc\":\"\"}],\"cookieLifetime\":[{\"label\":\"Cookie Lifetime, seconds\",\"type\":\"text\",\"value\":\"157680000\",\"default\":\"157680000\",\"desc\":\"\"}],\"maxFails\":[{\"label\":\"Max failed logins\",\"type\":\"text\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"blockTime\":[{\"label\":\"Block for, seconds\",\"type\":\"text\",\"value\":\"3600\",\"default\":\"3600\",\"desc\":\"\"}],\"trackWebUserActivity\":[{\"label\":\"Track web user activity\",\"type\":\"list\",\"value\":\"No\",\"options\":\"No,Yes\",\"default\":\"No\",\"desc\":\"\"}]}', 1, '', 1728745605, 1728745605),
(7, 'ClientSettings', '<strong>2.2.1</strong> Creates menu item for user module ClientSettings', 0, 1, 0, '\n\nif ($modx->event->name == \'OnManagerMenuPrerender\') {\n    require_once MODX_BASE_PATH . \'assets/modules/clientsettings/core/src/ClientSettings.php\';\n\n    $cs   = new ClientSettings($params);\n    $mid  = $cs->getModuleId();\n    $lang = $cs->loadLang();\n    $tabs = $cs->loadStructure();\n\n    if (!empty($tabs)) {\n        $menuparams = [\'client_settings\', \'main\', \'<i class=\"fa fa-cog\"></i>\' . $lang[\'cs.module_title\'], \'index.php?a=112&id=\' . $mid . \'&type=default\', $lang[\'cs.module_title\'], \'\', \'\', \'main\', 0, 100, \'\'];\n\n        if (count($tabs) > 1) {\n            $menuparams[3] = \'javscript:;\';\n            $menuparams[5] = \'return false;\';\n            $sort = 0;\n\n            $params[\'menu\'][\'client_settings_main\'] = [\'client_settings_main\', \'client_settings\', \'<i class=\"fa fa-cog\"></i>\' . $lang[\'cs.module_title\'], \'index.php?a=112&id=\' . $mid . \'&type=default\', $lang[\'cs.module_title\'], \'\', \'\', \'main\', 0, $sort, \'\'];\n\n            foreach ($tabs as $alias => $item) {\n                if ($alias != \'default\') {\n                    $params[\'menu\'][\'client_settings_\' . $alias] = [\'client_settings_\' . $alias, \'client_settings\', \'<i class=\"fa \' . (isset($item[\'menu\'][\'icon\']) ? $item[\'menu\'][\'icon\'] : \'fa-cog\') . \'\"></i>\' . $item[\'menu\'][\'caption\'], \'index.php?a=112&id=\' . $mid . \'&type=\' . $alias, $item[\'menu\'][\'caption\'], \'\', \'\', \'main\', 0, $sort += 10, \'\'];\n                }\n            }\n        }\n\n        $params[\'menu\'][\'client_settings\'] = $menuparams;\n        $modx->event->output(serialize($params[\'menu\']));\n    }\n\n    return;\n}\n\n', 0, '', 0, 'clsee234523g354f542t5t', 1728745615, 1728751134),
(10, 'Commerce', '<strong>0.13.2</strong> Commerce solution', 0, 5, 0, 'if (!class_exists(\'Commerce\\\\Commerce\')) {\r\n    require_once MODX_BASE_PATH . \'assets/plugins/commerce/autoload.php\';\r\n\r\n    $ci = ci();\r\n\r\n    $ci->set(\'modx\', function($ci) use ($modx) {\r\n        return $modx;\r\n    });\r\n\r\n    $ci->set(\'commerce\', function($ci) use ($modx, $params) {\r\n        return new Commerce\\Commerce($modx, $params);\r\n    });\r\n\r\n    $ci->set(\'currency\', function($ci) {\r\n        return $ci->commerce->currency;\r\n    });\r\n\r\n    $ci->set(\'cache\', function($ci) use ($modx) {\r\n        return Commerce\\Cache::getInstance();\r\n    });\r\n\r\n    $ci->set(\'carts\', function($ci) use ($modx) {\r\n        return Commerce\\CartsManager::getManager($modx);\r\n    });\r\n\r\n    $ci->set(\'db\', function($ci) {\r\n        return $ci->modx->db;\r\n    });\r\n\r\n    $ci->set(\'tpl\', function($ci) use ($modx) {\r\n        require_once MODX_BASE_PATH . \'assets/snippets/DocLister/lib/DLTemplate.class.php\';\r\n        return DLTemplate::getInstance($modx);\r\n    });\r\n\r\n    $ci->set(\'flash\', function($ci) {\r\n        return new Commerce\\Module\\FlashMessages;\r\n    });\r\n\r\n    $ci->set(\'statuses\', function($ci) use ($modx) {\r\n        return new Commerce\\Statuses($modx);\r\n    });\r\n}\r\n\r\nif ($modx instanceof \\Illuminate\\Container\\Container) {\r\n    if (!$modx->offsetExists(\'commerce\')) {\r\n        $modx->instance(\'commerce\', ci()->commerce);\r\n        $modx->commerce->initializeCommerce();\r\n    }\r\n} else if (!isset($modx->commerce) || isset($modx->commerce) && !($modx->commerce instanceof \\Commerce\\Commerce)) {\r\n    $modx->commerce = ci()->commerce;\r\n    $modx->commerce->initializeCommerce();\r\n}\r\n\r\nswitch ($modx->event->name) {\r\n    case \'OnWebPageInit\': {\r\n        $order_id = ci()->flash->get(\'last_order_id\');\r\n\r\n        if (!empty($order_id) && is_numeric($order_id)) {\r\n            $modx->commerce->loadProcessor()->populateOrderPlaceholders($order_id);\r\n        }\r\n\r\n        $payment_id = ci()->flash->get(\'last_payment_id\');\r\n\r\n        if (!empty($payment_id) && is_numeric($payment_id)) {\r\n            $modx->commerce->loadProcessor()->populatePaymentPlaceholders($payment_id);\r\n        }\r\n\r\n        break;\r\n    }\r\n\r\n    case \'OnLoadWebDocument\': {\r\n        if (!empty($params[\'product_templates\'])) {\r\n            $templates = array_map(\'trim\', explode(\',\', $params[\'product_templates\']));\r\n\r\n            if (in_array($modx->documentObject[\'template\'], $templates)) {\r\n                $modx->commerce->populateProductPagePlaceholders();\r\n            }\r\n        }\r\n\r\n        break;\r\n    }\r\n\r\n    case \'OnWebPagePrerender\': {\r\n        $modx->documentOutput = str_replace(\'</body>\', $modx->commerce->populateClientScripts() . \'</body>\', $modx->documentOutput);\r\n        return;\r\n    }\r\n\r\n    case \'OnManagerMenuPrerender\': {\r\n        if(!isset($params[\'module_id\'])) {\r\n            $moduleid = $modx->db->getValue($modx->db->select(\'id\', $modx->getFullTablename(\'site_modules\'), \"name = \'Commerce\'\"));\r\n        } else {\r\n            $moduleid = $params[\'module_id\'];\r\n        }\r\n        $url = \'index.php?a=112&id=\' . $moduleid;\r\n        $lang = $modx->commerce->getUserLanguage(\'menu\');\r\n\r\n        $params[\'menu\'] = array_merge($params[\'menu\'], [\r\n            \'commerce\' => [\'commerce\', \'main\', \'<i class=\"fa fa-shopping-cart\"></i>\' . $lang[\'menu.commerce\'], \'javascript:;\', $lang[\'menu.commerce\'], \'return false;\', \'exec_module\', \'main\', 0, 90, \'\'],\r\n            \'orders\'   => [\'orders\', \'commerce\', \'<i class=\"fa fa-list\"></i>\' . $lang[\'menu.orders\'], $url . \'&type=orders\', $lang[\'menu.orders\'], \'\', \'exec_module\', \'main\', 0, 10, \'\'],\r\n            \'statuses\' => [\'statuses\', \'commerce\', \'<i class=\"fa fa-play-circle\"></i>\' . $lang[\'menu.statuses\'], $url . \'&type=statuses\', $lang[\'menu.statuses\'], \'\', \'exec_module\', \'main\', 0, 20, \'\'],\r\n            \'currency\' => [\'currency\', \'commerce\', \'<i class=\"fa fa-usd\"></i>\' . $lang[\'menu.currency\'], $url . \'&type=currency\', $lang[\'menu.currency\'], \'\', \'exec_module\', \'main\', 0, 30, \'\'],\r\n        ]);\r\n\r\n        $modx->event->output(serialize($params[\'menu\']));\r\n        break;\r\n    }\r\n\r\n    case \'OnPageNotFound\': {\r\n        if (!empty($_GET[\'q\']) && is_scalar($_GET[\'q\']) && strpos($_GET[\'q\'], \'commerce\') === 0) {\r\n            $modx->commerce->processRoute($_GET[\'q\']);\r\n        }\r\n        break;\r\n    }\r\n\r\n    case \'OnSiteRefresh\': {\r\n        ci()->cache->clean();\r\n        break;\r\n    }\r\n}\r\n', 0, '{\r\n  \"payment_success_page_id\": [\r\n    {\r\n      \"label\": \"Page ID for redirect after successfull payment\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"payment_failed_page_id\": [\r\n    {\r\n      \"label\": \"Page ID for redirect after payment error\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"cart_page_id\": [\r\n    {\r\n      \"label\": \"Cart page ID\",\r\n      \"type\": \"text\",\r\n      \"value\": \"3\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"order_page_id\": [\r\n    {\r\n      \"label\": \"Order page ID\",\r\n      \"type\": \"text\",\r\n      \"value\": \"10\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"status_id_after_payment\": [\r\n    {\r\n      \"label\": \"Status ID after payment\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"product_templates\": [\r\n    {\r\n      \"label\": \"Product templates IDs\",\r\n      \"type\": \"text\",\r\n      \"value\": \"3\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"title_field\": [\r\n    {\r\n      \"label\": \"Product title field name\",\r\n      \"type\": \"text\",\r\n      \"value\": \"pagetitle\",\r\n      \"default\": \"pagetitle\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"price_field\": [\r\n    {\r\n      \"label\": \"Product price field name\",\r\n      \"type\": \"text\",\r\n      \"value\": \"price\",\r\n      \"default\": \"price\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"status_notification\": [\r\n    {\r\n      \"label\": \"Chunk name for status change notification\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"order_paid\": [\r\n    {\r\n      \"label\": \"Chunk name for order paid notification\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"order_changed\": [\r\n    {\r\n      \"label\": \"Chunk name for order changed notification\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"templates_path\": [\r\n    {\r\n      \"label\": \"Path to custom templates\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"email\": [\r\n    {\r\n      \"label\": \"Email notifications recipient\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"default_payment\": [\r\n    {\r\n      \"label\": \"Default payment code\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"default_delivery\": [\r\n    {\r\n      \"label\": \"Default delivery code\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"instant_redirect_to_payment\": [\r\n    {\r\n      \"label\": \"Redirect to payment after order process\",\r\n      \"type\": \"list\",\r\n      \"value\": \"1\",\r\n      \"options\": \"Instant==1||Show prepare text==0\",\r\n      \"default\": \"1\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"redirect_to_payment_tpl\": [\r\n    {\r\n      \"label\": \"Chunk name for redirect prepare text\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"payment_wait_time\": [\r\n    {\r\n      \"label\": \"Waiting time for order payment, days\",\r\n      \"type\": \"text\",\r\n      \"value\": \"3\",\r\n      \"default\": \"3\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"cart_controller\": [\r\n    {\r\n      \"label\": \"Class to use as a cart controller\",\r\n      \"type\": \"text\",\r\n      \"value\": \"CartDocLister\",\r\n      \"default\": \"CartDocLister\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"orders_display\": [\r\n    {\r\n      \"label\": \"The number of orders per page\",\r\n      \"type\": \"text\",\r\n      \"value\": \"10\",\r\n      \"default\": \"10\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"module_id\": [\r\n    {\r\n      \"label\": \"Commerce module ID (if renamed)\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ]\r\n}', 0, '', 1728751154, 1729714299),
(12, 'TinyMCE4', '<strong>4.9.11</strong> Javascript rich text editor', 0, 1, 0, 'if (!defined(\'MODX_BASE_PATH\')) { die(\'What are you doing? Get out of here!\'); }\n\nrequire(MODX_BASE_PATH.\"assets/plugins/tinymce4/plugin.tinymce.inc.php\");', 0, '{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}', 0, '', 1728753254, 1728753254),
(14, 'eFilterHelper', '<strong>0.1</strong> plugin for convinient work with eFilter', 0, 10, 0, '/*использует общие параметры модуля eLists - не забудьте их подключить в модуле и плагине */\n /*\n предназначен для скрытия/показа только нужных tv из заданных категорий \"параметры товара\" в зависимости\n от настроек родительской категории по фильтрам и используемым параметрам товара\n  а также для установки нужных направлений сортировки на событии onWebPageInit\n */\n\nif(!defined(\'MODX_BASE_PATH\')) die(\'What are you doing? Get out of here!\');\n\n\n$output = \'\';\n//массив разрешеннных ТВ (id)\n$allowedParams = array();\n//массив запрещенных ТВ (id) - будем их скрывать\n$disallowedParams = array();\n//массив всех ТВ из категорий \"параметры для товара\" - $param_cat_id\n$tv_list = array();\n\nif($modx->event->name == \'OnDocFormRender\') {\n    global $content;\n    global $tvsArray;\n    $product_template_array = explode(\',\', $product_templates_id);\n    if ((isset($content[\'template\']) && in_array($content[\'template\'], $product_template_array)) || !empty($tvsArray[\'tovarparams\'])) {\n        \n        include_once(MODX_BASE_PATH . \'assets/snippets/eFilter/eFilter.class.php\');\n        $eFltr = new eFilter($modx, $params);\n\n        //получаем все возможные ТВ\n        $sql = \"SELECT `id`,`name`,`caption` FROM \" . $modx->getFullTableName(\'site_tmplvars\') . \" WHERE `category` IN (\" . $param_cat_id . \") ORDER BY `rank` ASC, `caption` ASC\";\n        $q = $modx->db->query($sql);\n        while($row = $modx->db->getRow($q)){\n            $tv_list[$row[\'id\']]= $row[\'name\'];\n        }\n        \n        //узнаем родителя, чтобы грузить конфиг tovarparams\n        //приоритет у прямых родителей товара, по ним сначала и пройдемся\n        $pid = \'\';\n        $allowedParams = array();\n        if (isset($_GET[\'pid\'])) {\n             $pid = $_GET[\'pid\'];\n        }\n        if (isset($content[\'parent\'])) {\n            $pid = $content[\'parent\'];\n        }\n        if (isset($_POST[\'pid\'])) {\n            $pid = $_POST[\'pid\'];\n        }\n        if ($pid == \'\') {$pid = \'1\';}\n        if (!empty($tvsArray[\'tovarparams\']) && !empty($content[\'id\'])) {\n            $pid = $content[\'id\'];\n        }\n        $eFltr->docid = $pid;\n        //разрешенные для данного типа товара параметры\n        $allowedTmp = $eFltr->getFilterParam ($eFltr->param_tv_name);\n        \n        //если параметров не обнаружено, пройдемся по первой тегованной категории\n        //возможно, они есть там\n        if (empty($allowedTmp) && isset($_GET[\'id\']) && (int)$_GET[\'id\'] != \'0\' && isset($tv_category_tag) && $tv_category_tag != \'\') {\n            //определяем родителя по первой прикрепленной категории\n            $category = $modx->db->getValue(\"SELECT value FROM\" . $modx->getFullTableName(\'site_tmplvar_contentvalues\') . \" WHERE tmplvarid={$tv_category_tag} AND contentid=\" . (int)$_GET[\'id\'] . \" LIMIT 0,1\");\n            if ($category) {//категория есть\n                $tmp = explode(\',\', $category);\n                $pid = $tmp[0];\n                if ($pid) {\n                    $eFltr->docid = $pid;\n                    //разрешенные для данного типа товара параметры\n                    $allowedTmp = $eFltr->getFilterParam ($eFltr->param_tv_name);\n                }\n            }\n        }\n        \n        //строим итоговый массив разрешенных для данного вида товара параметров\n        if (isset($allowedTmp[\'fieldValue\'])) {\n            foreach ($allowedTmp[\'fieldValue\'] as $k => $v) {\n                $allowedParams[$v[\'param_id\']] = \'1\';\n            }\n        }\n\n        //строим массив запрещенных ТВ (на основе перечня всех ТВ и списка разрешенных)\n        foreach ($tv_list as $k => $v){\n            if (!isset($allowedParams[$k])) {\n                $disallowedParams[$k] = \'1\';\n            }\n        }\n        \n        //скрипт скрытия всех \"запрещенных ТВ\"\n        //т.к. managermanager почти у всех и он уже подключил jquery, то обращаемся смело к нему\n        if (!empty($disallowedParams)) {\n            $output .= \'<script type=\"text/javascript\">jQuery(document).ready(function(){\';\n            foreach ($disallowedParams as $k => $v) {\n                $output .= \'jQuery(\".sectionBody\").find(\"#tv\' . $k . \'\").parents(\"tr\").addClass(\"hide_next\");\';\n                //select\n                $output .= \'jQuery(\".sectionBody\").find(\"select[name=\\\'tv\' . $k . \'\\\']\").parents(\"tr\").addClass(\"hide_next\");\';\n                //multiselect\n                $output .= \'jQuery(\".sectionBody\").find(\"select[name=\\\'tv\' . $k . \'[]\\\']\").parents(\"tr\").addClass(\"hide_next\");\';\n                //фикс чекбоксов\n                $output .= \'jQuery(\".sectionBody\").find(\"input[name=\\\'tv\' . $k . \'[]\\\']\").parents(\"tr\").addClass(\"hide_next\");\';\n                //фикс радио\n                $output .= \'jQuery(\".sectionBody\").find(\"input[name=\\\'tv\' . $k . \'\\\']\").parents(\"tr\").addClass(\"hide_next\");\';\n\n                //фикс templatesEdit3\n                $output .= \'jQuery(\".sectionBody\").find(\"input[name=\\\'tv\' . $k . \'\\\']\").closest(\".row.form-row\").hide();\';\n                //select\n                $output .= \'jQuery(\".sectionBody\").find(\"select[name=\\\'tv\' . $k . \'\\\']\").closest(\".row.form-row\").hide();\';\n                //checkbox\n                $output .= \'jQuery(\".sectionBody\").find(\"input[name=\\\'tv\' . $k . \'[]\\\']\").closest(\".row.form-row\").hide();\';\n                //multiselect\n                $output .= \'jQuery(\".sectionBody\").find(\"select[name=\\\'tv\' . $k . \'[]\\\']\").closest(\".row.form-row\").hide();\';\n            }\n            $output .= \'})</script>\';\n            $output .= \'<style>tr.hide_next,tr.hide_next + tr{display:none;}</style>\' . \"\\n\";\n        }\n    }\n    $isTovarParams = $modx->db->getValue(\"SELECT COUNT(*) FROM \" . $modx->getFullTableName(\"site_tmplvar_templates\") . \" WHERE tmplvarid={$param_tv_id} AND templateid={$template}\");\n    if (!empty($isTovarParams)) {\n        //есть tv tovarparams - будем его стилизовать\n        $style = file_get_contents(MODX_BASE_PATH . \'assets/snippets/eFilter/html/tovarparams_style.tpl\');\n        $output .= $modx->parseText($style, array(\'param_tv_id\' => $param_tv_id));\n    }\n    $modx->event->output($output);\n}\n\nif ($modx->event->name == \'OnWebPageInit\') {\n    $docid = $modx->documentIdentifier;    \n    if (isset($_POST[\'action\'])) {\n        $action = $modx->db->escape($_POST[\'action\']);\n        switch ($action) {\n            case \'changesortBy\':\n                //ставим в сессию параметры сортировки и вывода\n                $sortBy = ($_POST[\'sortBy\'] && !empty($_POST[\'sortBy\'])) ? $modx->db->escape($_POST[\'sortBy\']) : \'\';\n                $sortOrder = ($_POST[\'sortOrder\'] && !empty($_POST[\'sortOrder\'])) ? $modx->db->escape($_POST[\'sortOrder\']) : \'\';\n                $sortDisplay = ($_POST[\'sortDisplay\'] && !empty($_POST[\'sortDisplay\'])) ? $modx->db->escape($_POST[\'sortDisplay\']) : \'\';\n                if (!empty($sortBy)) {\n                    $_SESSION[\'sortBy\'] = $sortBy;\n                }\n                if (!empty($sortOrder)) {\n                    $_SESSION[\'sortOrder\'] = $sortOrder;\n                }\n                if (!empty($sortDisplay)) {\n                    $_SESSION[\'sortDisplay\'] = $sortDisplay;\n                }\n                $_SESSION[\'sortDocument\'] = $docid;\n                break;\n\n            default:\n                break;\n            \n        }\n    }\n    //срасываем установки сортировки при уходе на другую страницу\n    if (isset($_SESSION[\'sortDocument\']) && $_SESSION[\'sortDocument\'] != $docid) {\n        unset($_SESSION[\'sortDocument\']);\n        unset($_SESSION[\'sortOrder\']);\n        unset($_SESSION[\'sortBy\']);\n        unset($_SESSION[\'sortDisplay\']);\n    }\n    \n}\n', 0, '', 0, 'eFilters', 1730404150, 1730404150);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_plugin_events`
--

CREATE TABLE `adkq_site_plugin_events` (
  `pluginid` int(11) NOT NULL,
  `evtid` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0 COMMENT 'determines plugin run order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_plugin_events`
--

INSERT INTO `adkq_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 83, 0),
(2, 39, 0),
(2, 45, 0),
(2, 89, 0),
(2, 97, 0),
(2, 99, 0),
(2, 106, 0),
(2, 111, 0),
(2, 115, 0),
(3, 83, 1),
(4, 108, 0),
(5, 83, 2),
(5, 91, 0),
(5, 102, 0),
(6, 91, 1),
(6, 117, 0),
(6, 123, 0),
(6, 125, 0),
(6, 128, 0),
(7, 74, 0),
(10, 64, 0),
(10, 74, 1),
(10, 77, 0),
(10, 91, 2),
(10, 102, 1),
(10, 128, 1),
(10, 129, 0),
(12, 61, 0),
(12, 64, 1),
(12, 65, 0),
(12, 93, 0),
(12, 99, 1),
(12, 100, 0),
(12, 129, 1),
(14, 45, 1),
(14, 128, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_snippets`
--

CREATE TABLE `adkq_site_snippets` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `cache_type` int(11) NOT NULL DEFAULT 0 COMMENT 'Cache option',
  `snippet` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Default Properties',
  `moduleguid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Disables the snippet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_snippets`
--

INSERT INTO `adkq_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'DDocInfo', '<strong>1</strong> DDocInfo', 0, 2, 0, '$id = isset($id) ? (int)$id : $modx->documentObject[\'id\'];\n$field = isset($field) ? (string)$field : \'id\';\nif($field == \'id\'){\n    $out = $id;\n}else{\n    if($modx->documentObject[\'id\'] == $id){\n        $out = isset($modx->documentObject[$field]) ? $modx->documentObject[$field] : \'\';\n        if(is_array($out)){\n           $out = isset($out[1]) ? $out[1] : \'\';\n        }\n    }else{\n        $out = $modx->doc->edit($id)->get($field);\n    }\n}\nreturn (string)$out;', 0, '', '', 0, 0, 0),
(2, 'DLBeforeAfter', '<strong>1</strong> Navigation between post and upcoming events relative to the current date.', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLBeforeAfter.php\';', 0, '', '', 0, 0, 0),
(3, 'DLCrumbs', '<strong>1.2</strong> DLCrumbs', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLCrumbs.php\';\n', 0, '', '', 0, 0, 0),
(4, 'DLGlossary', '<strong>0.1</strong> Filtering documents by the first character', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLGlossary.php\';', 0, '', '', 0, 0, 0),
(5, 'DLMenu', '<strong>1.4.2</strong> Snippet to build menu with DocLister', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLMenu.php\';\n', 0, '', '', 0, 0, 0),
(6, 'DLPrevNext', '<strong>1.2</strong> DLPrevNext', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLPrevNext.php\';\n', 0, '', '', 0, 0, 0),
(7, 'DLReflect', '<strong>2</strong> Building a list of dates to filter documents', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLReflect.php\';', 0, '', '', 0, 0, 0),
(8, 'DLReflectFilter', '<strong>2</strong> Filtering documents by dates provided by DLReflect snippet', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLReflectFilter.php\';', 0, '', '', 0, 0, 0),
(9, 'DLSitemap', '<strong>1.0.2</strong> Snippet to build XML sitemap', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLSitemap.php\';\n', 0, '', '', 0, 0, 0),
(10, 'DLTemplate', '<strong>1</strong> DLTemplate', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLTemplate.php\';', 0, '', '', 0, 0, 0),
(11, 'DLValuelist', '<strong>1.1</strong> DLValuelist', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLValuelist.php\';', 0, '', '', 0, 0, 0),
(12, 'DocLister', '<strong>2.7.8</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';\n', 0, '', '', 0, 0, 0),
(13, 'summary', '<strong>2.0.2</strong> Truncates the string to the specified length', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';', 0, '', '', 0, 0, 0),
(14, 'FormLister', '<strong>1.21.1</strong> Form processor', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/FormLister/snippet.FormLister.php\';\n', 0, '', '', 0, 0, 0),
(15, 'Cart', '<strong>0.13.1</strong> Cart contents, DocLister based', 0, 5, 0, '\r\nif (defined(\'COMMERCE_INITIALIZED\')) {\r\n    $instance = isset($instance) ? $instance : \'products\';\r\n    $theme    = !empty($theme) ? $theme : \'\';\r\n     $cart     = ci()->carts->getCart($instance);\r\n    if (!is_null($cart)) {\r\n        return $modx->runSnippet(\'DocLister\', array_merge([\r\n            \'controller\'        => $modx->commerce->getSetting(\'cart_controller\'),\r\n            \'tpl\'               => \'@FILE:\' . $theme . \'cart_row\',\r\n            \'optionsTpl\'        => \'@FILE:\' . $theme . \'cart_row_options_row\',\r\n            \'ownerTPL\'          => \'@FILE:\' . $theme . \'cart_wrap\',\r\n            \'subtotalsRowTpl\'   => \'@FILE:\' . $theme . \'cart_subtotals_row\',\r\n            \'subtotalsTpl\'      => \'@FILE:\' . $theme . \'cart_subtotals\',\r\n            \'noneTPL\'           => \'@FILE:\' . $theme . \'cart_empty\',\r\n            \'langDir\'           => \'assets/plugins/commerce/lang/\',\r\n            \'customLang\'        => \'cart\',\r\n            \'noneWrapOuter\'     => 0,\r\n        ], $params, [\r\n            \'idType\'     => \'documents\',\r\n            \'documents\'  => array_column($cart->getItems(), \'id\'),\r\n            \'instance\'   => $instance,\r\n            \'hash\'       => ci()->commerce->storeParams($params),\r\n            \'cart\'       => $cart,\r\n            \'tree\'       => 0,\r\n        ]));\r\n    }\r\n}', 0, '', '', 0, 1728805872, 0),
(16, 'Comparison', '<strong>0.13.1</strong> Comparison snippet, DocLister based', 0, 5, 0, '/**\n * [!Comparison\n *      &showCategories=`1`\n *      &tvCategory=`10`\n *      &excludeTV=`category`\n *      &includeTV=`best`\n *      &checkBoundingList=`0`\n *      &categoryItemClass=`btn-secondary`\n *      &categoryActiveClass=`btn-primary`\n * !]\n */\n\nif (!defined(\'COMMERCE_INITIALIZED\')) {\n    return;\n}\n\nif (isset($ids)) {\n    if (!is_array($ids)) {\n        $ids = array_map(\'trim\', explode(\',\', $ids));\n    }\n    $items = $ids;\n} else {\n    $items = array_map(function($item) {\n        return $item[\'id\'];\n    }, ci()->carts->getCart(\'comparison\')->getItems());\n}\n\n$showCategories = isset($params[\'showCategories\']) ? $params[\'showCategories\'] : 1;\n$categories = \'\';\n\nif (!empty($items) && $showCategories) {\n    $table   = $modx->getFullTablename(\'site_content\');\n    $parents = $modx->db->getColumn(\'parent\', $modx->db->select(\'parent\', $table, \"`id` IN (\" . implode(\',\', $items) . \")\"));\n    $parents = array_unique($parents);\n\n    $categoryParams = [];\n\n    foreach ($params as $key => $value) {\n        if (strpos($key, \'category\') === 0) {\n            unset($params[$key]);\n            $key = preg_replace(\'/^category/\', \'\', $key);\n            $key = lcfirst($key);\n            $categoryParams[$key] = $value;\n        }\n    }\n\n    if (isset($_GET[\'category\']) && is_scalar($_GET[\'category\']) && in_array($_GET[\'category\'], $parents)) {\n        $currentCategory = $_GET[\'category\'];\n    }\n\n    if (empty($currentCategory)) {\n        $currentCategory = reset($parents);\n    }\n\n    if (count($parents) > 1) {\n        $categoryParams = array_merge([\n            \'tpl\'               => \'@FILE:comparison_category\',\n            \'ownerTPL\'          => \'@FILE:comparison_categories\',\n            \'itemClass\'         => \'btn-secondary\',\n            \'activeClass\'       => \'btn-primary\',\n            \'prepare\'           => function($data, $modx, $DL, $eDL) {\n                $data[\'class\'] = $DL->getCFGDef(\'currentId\') == $data[\'id\'] ? $DL->getCFGDef(\'activeClass\') : $DL->getCFGDef(\'itemClass\');\n                return $data;\n            },\n        ], $categoryParams, [\n            \'controller\' => \'CustomLang\',\n            \'dir\'        => \'assets/plugins/commerce/src/Controllers/\',\n            \'currentId\'  => $currentCategory,\n            \'idType\'     => \'documents\',\n            \'documents\'  => $parents,\n            \'sortType\'   => \'doclist\',\n        ]);\n\n        $categories = $modx->runSnippet(\'DocLister\', $categoryParams);\n    }\n\n    $ids = $modx->db->getColumn(\'id\', $modx->db->select(\'id\', $table, \"`parent` = \'$currentCategory\' AND `id` IN (\'\" . implode(\"\',\'\", array_unique($items)) . \"\')\"));\n} else {\n    $ids = array_values(array_unique($items));\n    $currentCategory = 0;\n}\n\n$params = array_merge([\n    \'ownerTPL\'          => \'@FILE:comparison_table\',\n    \'headerTpl\'         => \'@FILE:comparison_table_header_cell\',\n    \'footerTpl\'         => \'@FILE:comparison_table_footer_cell\',\n    \'keyTpl\'            => \'@FILE:comparison_table_key_cell\',\n    \'valueTpl\'          => \'@FILE:comparison_table_value_cell\',\n    \'rowTpl\'            => \'@FILE:comparison_table_row\',\n    \'customLang\'        => \'common,cart\',\n], $params, [\n    \'controller\' => \'Comparison\',\n    \'dir\'        => \'assets/plugins/commerce/src/Controllers/\',\n    \'idType\'     => \'documents\',\n    \'sortType\'   => \'doclist\',\n    \'documents\'  => $ids,\n    \'category\'   => $currentCategory,\n    \'rows\'       => array_flip($items),\n]);\n\n$docs = $modx->runSnippet(\'DocLister\', $params);\nreturn $categories . $docs;\n', 0, '', '', 0, 1728759352, 0),
(17, 'CurrencySelect', '<strong>0.13.1</strong> Shows currency select', 0, 5, 0, 'if (defined(\'COMMERCE_INITIALIZED\')) {\n    $tpl = ci()->tpl;\n\n    $params = array_merge([\n        \'templatePath\'      => \'assets/plugins/commerce/templates/front/\',\n        \'templateExtension\' => \'tpl\',\n        \'tpl\'               => \'@FILE:currency_select_row\',\n        \'activeTpl\'         => \'@FILE:currency_select_active_row\',\n        \'outerTpl\'          => \'@FILE:currency_select_wrap\',\n    ], $params);\n\n    $currency = ci()->currency;\n    $rows     = $currency->getCurrencies();\n    $active   = $currency->getCurrencyCode();\n\n    $out = \'\';\n\n    $tpl->setTemplatePath($params[\'templatePath\']);\n    $tpl->setTemplateExtension($params[\'templateExtension\']);\n\n    foreach ($rows as $row) {\n        $chunk = $row[\'code\'] == $active ? $params[\'activeTpl\'] : $params[\'tpl\'];\n        $out  .= $tpl->parseChunk($chunk, $row);\n    }\n\n    return $tpl->parseChunk($params[\'outerTpl\'], [\'wrap\' => $out]);\n}\n', 0, '', '', 0, 1728759352, 0),
(18, 'Order', '<strong>0.13.1</strong> Order form, FormLister based', 0, 5, 0, 'if (defined(\'COMMERCE_INITIALIZED\')) {\n    $commerce    = ci()->commerce;\n    $userLang    = $commerce->getUserLanguage(\'order\');\n    $adminLang   = $commerce->getUserLanguage(\'order\', true);\n    $theme       = !empty($theme) ? $theme : \'\';\n    $storeParams = !empty($storeParams) ? $storeParams : 1;\n\n    $params = array_merge([\n        \'controller\'            => \'Order\',\n        \'dir\'                   => \'assets/plugins/commerce/src/Controllers/\',\n        \'formid\'                => \'order\',\n        \'parseDocumentSource\'   => 1,\n        \'langDir\'               => \'assets/plugins/commerce/lang/\',\n        \'lexicon\'               => \'common,delivery,payments,order\',\n        \'formTpl\'               => \'@FILE:\' . $theme . \'order_form\',\n        \'deliveryTpl\'           => \'@FILE:\' . $theme . \'order_form_delivery\',\n        \'deliveryRowTpl\'        => \'@FILE:\' . $theme . \'order_form_delivery_row\',\n        \'paymentsTpl\'           => \'@FILE:\' . $theme . \'order_form_payments\',\n        \'paymentsRowTpl\'        => \'@FILE:\' . $theme . \'order_form_payments_row\',\n        \'reportTpl\'             => $commerce->getUserLanguageTemplate(\'order_report\', true),\n        \'to\'                    => $commerce->getSetting(\'email\', $modx->getConfig(\'emailsender\')),\n        \'ccSender\'              => \'1\',\n        \'ccSenderField\'         => \'email\',\n        \'ccSenderTpl\'           => $commerce->getUserLanguageTemplate(\'order_reportback\'),\n        \'subjectTpl\'            => $adminLang[\'order.subject\'],\n        \'ccSubjectTpl\'          => $adminLang[\'order.subject\'],\n        \'successTpl\'            => $userLang[\'order.success\'],\n        \'rules\'                 => [\n            \'name\' => [\n                \'required\' => $userLang[\'order.error.name_required\'],\n            ],\n            \'email\' => [\n                \'required\' => $userLang[\'order.error.email_required\'],\n                \'email\'    => $userLang[\'order.error.email_incorrect\'],\n            ],\n            \'phone\' => [\n                \'required\' => $userLang[\'order.error.phone_required\'],\n            ],\n        ],\n    ], $params);\n\n    $params[\'form_hash\'] = $storeParams ? $commerce->storeParams($params) : \'\';\n\n    return $modx->runSnippet(\'FormLister\', $params);\n}\n', 0, '', '', 0, 1728759352, 0),
(19, 'PriceConvert', '<strong>0.13.1</strong> Convert price using predefined settings', 0, 5, 0, 'if (empty($modx->commerce) && !defined(\'COMMERCE_INITIALIZED\')) {\n    return $params[\'price\'];\n}\n\n$currency = ci()->currency;\nreturn $currency->convertFromDefault($params[\'price\'], !empty($params[\'currency\']) ? $params[\'currency\'] : null);\n', 0, '', '', 0, 1728759352, 0),
(20, 'PriceFormat', '<strong>0.13.1</strong> Format price using predefined settings', 0, 5, 0, 'if (defined(\'COMMERCE_INITIALIZED\')) {\n    $currency = ci()->currency;\n\n    $params = array_merge([\n        \'price\'   => 0,\n        \'convert\' => 1,\n    ], $params);\n\n    if ($params[\'convert\']) {\n        $params[\'price\'] = $currency->convertToActive($params[\'price\']);\n    }\n\n    return $currency->format($params[\'price\']);\n}\n\nreturn array_shift($params);\n', 0, '', '', 0, 1728759352, 0),
(21, 'Wishlist', '<strong>0.13.1</strong> Wishlist contents, DocLister based', 0, 5, 0, 'if (defined(\'COMMERCE_INITIALIZED\')) {\n    return $modx->runSnippet(\'Cart\', array_merge([\n        \'controller\'        => \'Wishlist\',\n        \'instance\'          => \'wishlist\',\n        \'tpl\'               => \'@FILE:wishlist_row\',\n        \'ownerTPL\'          => \'@FILE:wishlist_wrap\',\n        \'customLang\'        => \'common,cart\',\n    ], $params));\n}\n', 0, '', '', 0, 1728759352, 0),
(23, 'editDocsPrepareExample', '<strong>0.1</strong> Пример-заготовка Prepare-сниппета для модуля editDocs', 0, 6, 0, '//Не используйте данный сниппет как боевой, скопируйте как новый и пропишите его в настройках, иначе при обновление данный сниппет перезапишется на дефолтный example! \n\n$process = isset($process) ? $process : \'\';\n$mode = isset($mode) ? $mode : \'\';\nswitch ($process) {\n    case \'import\':\n        //обработчик импорта\n        switch ($mode) {\n            case \'upd\':\n                //обновляем ресурс\n                //$data[\'pagetitle\'] = \'import upd \' .  $data[\'pagetitle\'];\n                break;\n            case \'new\':\n                //добавляем новый ресурс\n                //$data[\'pagetitle\'] = \'import new \' .  $data[\'pagetitle\'];\n                break;\n            default:\n                break;\n        }\n        break;\n    case \'export\':\n        //обработчик экспорта\n        //$data[\'pagetitle\'] = \'export \' .  $data[\'pagetitle\'];\n        break;\n    default:\n        break;\n}\nreturn $data;', 0, '', '', 0, 0, 0),
(24, 'phpthumb', '<strong>1.4.5</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 2, 0, 'return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\n', 0, '', '', 0, 0, 0),
(25, 'multiTV', '<strong>2.0.16</strong> Custom Template Variabe containing a sortable multi item list or a datatable', 0, 2, 0, 'return require MODX_BASE_PATH . \'assets/tvs/multitv/multitv.snippet.php\';\n', 0, '', '', 0, 0, 0),
(26, 'eFilter', '<strong>0.1</strong> Вывод фильтра', 0, 10, 0, '//импортировать общие параметры из модуля eLists\n \n //устанавливает нужные плейсхолдеры для вывода формы и результатов поиска\n //вызов [!eFilter!]\n //в результате формируется плейсхолдер [+eFilter_form+] для показа формы поиска\n //а также [+eFilter_ids+] - список подходящих id для вставки в DocLister и ряд других\n //\n // дополнительные параметры вызова\n // &removeDisabled=`1` - удалять варианты с нулевым результатом из списка возможных (по умолчанию - 0 - варианты в списке остаются с атрибутом disabled)\n // &ajax=`1` - режим ajax - подгрузка формы и результатов поиска после сабмита формы поиска без перезагрузки страницы (по умолчанию - отключен)\n //\n //это центральный сниппет для фильтрации\n //работает совместно с DocLister, multiTV и DocInfo - они должны быть установлены\n\nrequire MODX_BASE_PATH . \'assets/snippets/eFilter/snippet.eFilter.php\';\n', 0, '', 'eFilters', 0, 0, 0),
(27, 'eFilterResult', '<strong>0.1</strong> Вывод отфильтрованных товаров', 0, 10, 0, '//импортировать общие параметры из модуля eLists\n //использует для работы сниппет DocLister и выводит список товаров, при этом заменяя плейсхолдер [+params+] на список параметров товара, отмеченных для вывода в список\n //использует общие параметры из модуля eLists, также параметры $paramRow и $paramOuter для вывода параметров товара\n //доп.информация черпается из плейсхолдеров, установленных сниппетом [!eFilter!] который должен вызываться раньше\n //пример вызова [!eFilterResult? &tpl=`tovarDL` &addWhereList=`c.template=9` &parents=`[*id*]` &depth=`3` &paginate=`pages` &display=`15` &tvList=`image,price`!] [+pages+]\n //все параметры аналогичны параметрам вызова DocLister + доп.параметры $paramRow и $paramOuter для вывода параметров товара\n\n \n//получаем из плейсхолдера список документов для documents\n$ids = $modx->getPlaceholder(\'eFilter_ids\');\n\n//фиксим DocLister - при пустом списке documents и пустом фильтре - отдавать все\n//при пустом списке documents и НЕ пустом фильтре - ничего не отдавать\nif(empty($ids) && (isset($_GET))) {\n    $ids = $modx->config[\'site_start\'];\n    $f = $_GET;\n    foreach($f as $k => $val){\n        if (preg_match(\"/^f(\\d+)/i\", $k, $matches)) {\n            if ($val != \'0\' && $val != \'\') {$ids = \'4294967295\';}\n        }\n    }\n    if ($ids == $modx->config[\'site_start\']) {$ids = \'\';}    \n}\nif(empty($ids) && (isset($_GET[\'f\']))) {\n    $ids = $modx->config[\'site_start\'];\n    $f = $_GET[\'f\'];\n    foreach($f as $k=>$v){\n        foreach ($v as $val) {\n            if ($val != \'0\' && $val != \'\') {$ids = \'4294967295\';}\n        }\n    }\n    if ($ids == $modx->config[\'site_start\']) {$ids = \'\';}    \n}\n\n//получаем из плейсхолдера список ТВ для вывода в список\n$tv_list = $modx->getPlaceholder(\'eFilter_tv_list\') ?: [];\n//..и их имена из кэпшн\n$tv_names = $modx->getPlaceholder(\'eFilter_tv_names\') ?: [];\n\n// удаляеи из списка общие исключенные ТВ (в настройках модуля) -\n// (например цена и т.п., которая выводится отдельно и есть у всех\nif (isset($exclude_tvs_from_list) && $exclude_tvs_from_list != \'\') {\n    $exclude_tvs = explode(\',\', $exclude_tvs_from_list);\n    foreach($exclude_tvs as $k => $v){\n        if (isset($tv_names[$v])) {\n            unset($tv_names[$v]);\n        }\n        if (isset($tv_list[$v])) {\n            unset($tv_list[$v]);\n        }\n    }\n}\n///////\n\n\n\n//заменяем плейсхолдер [+params+] в чанке вывода товаров \n//на нужный вывод параметров товаров\n//шаблоны вывода параметра в списке по умолчанию\n$paramRow = isset($paramRow) ? $paramRow : \'<div class=\"eFilter_list_param eFilter_list_param[+param_id+]\"><span class=\"eFilter_list_title\">[+param_title+]: </span><span class=\"eFilter_list_value eFilter_list_value[+param_id+]\">[+param_value+]</span></div>\';\n$paramOuter = isset($paramOuter) ? $paramOuter : \'<div class=\"eFilter_list_params\">[+wrapper+]</div>\';\n\n\n$tovar_params_tpl = \'\';\nforeach($tv_names as $tv_id=>$tv_name) {\n    $param_value = \'[+tv.\' . $tv_list[$tv_id] . \'+]\';\n    $tovar_params_tpl .= str_replace(\n        array(\'[+param_title+]\', \'[+param_value+]\', \'[+param_id+]\'),\n        array($tv_name, $param_value, $tv_id),\n        $paramRow\n    );\n}\n\n$tovar_params_wrapper = str_replace(\n    array(\'[+wrapper+]\'),\n    array($tovar_params_tpl),\n    $paramOuter\n);\n\n$tovarChunkName = $params[\'tpl\'] ?? ($tovarChunkName ?? \'\');\nif(!empty($tovarChunkName)) {\n	$tovarChunk = $modx->getChunk($tovarChunkName);\n	$tovarChunk = \'@CODE:\' . str_replace(\'[+params+]\', $tovar_params_wrapper, $tovarChunk);\n} else {\n	$tovarChunk = \'@CODE:[+pagetitle+]\';\n}\n$params[\'tpl\'] = $tovarChunk;\n///////конец замены чанка вывода товаров\n\n\n$out = \'\';\n$pid = isset($pid) ? $pid : $modx->documentIdentifier;\n$params[\'ownerTPL\'] = isset($ownerTPL) ? $ownerTPL :\'@CODE: <div id=\"eFiltr_results_wrapper\"><div class=\"eFiltr_loader\"></div><div id=\"eFiltr_results\">[+dl.wrap+][+pages+]</div></div>\';\n\n//параметры сортировки и вывода из сессии\n$docid = isset($docid) ? (int)$docid : $modx->documentIdentifier;\n$display = isset($_SESSION[\'sortDisplay\']) ? $modx->db->escape($_SESSION[\'sortDisplay\']) : ($params[\'display\'] ?? 12);\n$sortBy = isset($_SESSION[\'sortBy\']) ? $modx->db->escape($_SESSION[\'sortBy\']) : ($params[\'sortBy\'] ?? \'menuindex\');\n$sortOrder = isset($_SESSION[\'sortOrder\']) ? $modx->db->escape($_SESSION[\'sortOrder\']) : ($params[\'sortOrder\'] ?? \'DESC\');\n$params[\'orderBy\'] = (!empty($params[\'orderByBefore\']) ? $params[\'orderByBefore\'] : \'\') . $sortBy . \' \' . $sortOrder . (!empty($params[\'orderByAfter\']) ? $params[\'orderByAfter\'] : \'\');\nunset($params[\'sortBy\']);\nunset($params[\'sortOrder\']);\n$params[\'display\'] = $display;\nif ($display == \'all\') unset($params[\'display\']);\n\nif (!empty($ids)) {\n    $params[\'documents\'] = $ids;\n    unset($params[\'parents\']);\n    unset($params[\'depth\']);\n} else {\n    $params[\'parents\'] = $pid;\n}\n$params[\'addWhereList\'] = \'c.template IN(\' . $product_templates_id . \')\';\nif (!empty($tv_list)) {\n    $params[\'tvList\'] = $params[\'tvList\'] == \'\' ? implode(\',\', $tv_list) : $params[\'tvList\'] . \',\' . implode(\',\', $tv_list);\n	if(!empty($params[\'renderTV\'])) {\n		$params[\'renderTV\'] .= \',\' . implode(\',\', $tv_list);\n	} else {\n		$params[\'renderTV\'] = implode(\',\', $tv_list);\n	}\n}\n$params[\'tvSortType\'] = !empty($params[\'tvSortType\']) ? $params[\'tvSortType\'] : \'UNSIGNED\';\nif (!empty($params)) {\n    $out .= $modx->runSnippet(\"DocLister\", $params);\n}\n//Найдено [+count+], показано с [+eFRes_from+] по [+eFRes_to+]\n$DL_id = isset($params[\'id\']) && !empty($params[\'id\']) ? $params[\'id\'] . \'.\' : \'\';\nif (!isset($count) || $count == \'0\') { \n    $from = $to = 0;\n} else {\n    $display = $modx->getPlaceholder($DL_id . \'display\');\n    $current = $modx->getPlaceholder($DL_id . \'current\');\n    $from = ($current - 1) * $params[\'display\'] + 1;\n    $to = $from - 1 + $display;\n}\n$modx->setPlaceholder(\"eFRes_from\", $from);\n$modx->setPlaceholder(\"eFRes_to\", $to);\n\nreturn $out;', 0, '', 'eFilters', 0, 0, 0),
(28, 'getSortBlock', '<strong>0.1</strong> Формируем блок сортировки в каталог', 0, 10, 0, '// вызываем в нужном месте getSortBlock\n // требует подключенного к странице jquery версии не ниже 1.9\n // дополнительные параметры (опционально)\n // &sortBy - по умолчанию menuindex (может быть как поле из site_content, так и любое ТВ, которое выводится в списке через DocLister и, соответветственно указано в его параметре tvList\n // &sortOrder - ASC | DESC (по умолчанию DESC)\n // &config_sort - конфиг параметров сортировки (первая часть до || - заголовок, остальные - варианты. Может быть как поле site_content , так и приемлемый для DocLister TV). По умолчанию - Сортировать по:||pagetitle==Названию||price==Цене (по названию и цене)\n // &config_display - настройка селекта \"показывать по\". По умолчанию - Показывать по:||==--не выбрано--||10||20||30||40||all\n // &sortRow\n // &sortOuter\n // &displayRow\n // &displayOuter\n // &classActiveName\n // &classUpName\n // &classDownName\n // &classSelectedName\n \n$param = $modx->event->params;\n \n$sortBy = isset($_SESSION[\'sortBy\']) ? $_SESSION[\'sortBy\'] : (isset($param[\'sortBy\']) ? $param[\'sortBy\'] : \'menuindex\');\n$sortOrder = isset($_SESSION[\'sortOrder\']) ? $_SESSION[\'sortOrder\'] : (isset($param[\'sortOrder\']) ? $param[\'sortOrder\'] : \'DESC\');\n$sortDisplay = isset($_SESSION[\'sortDisplay\']) ? $_SESSION[\'sortDisplay\'] : (isset($param[\'display\']) ? $param[\'display\'] : \'12\');\n$config_sort = isset($param[\'config_sort\']) ? $param[\'config_sort\'] : \'Сортировать по:||pagetitle==Названию||price==Цене\';\n$config_display = isset($param[\'config_display\']) ? $param[\'config_display\'] : \'Показывать по:||==--не выбрано--||10||20||30||40||all==все\';\n$sortRow = isset($param[\'sortRow\']) ? $param[\'sortRow\'] : \'<a href=\"#\" class=\"sorter sort_vid sort_pic [+classActive+] [+classUpDown+]\" data-sort-by=\"[+sortBy+]\" data-sort-order=\"[+sortOrder+]\">[+title+]</a>\';\n$sortOuter = isset($param[\'sortOuter\']) ? $param[\'sortOuter\'] : \'<div class=\"eFilter_sort_block\"><span class=\"eFilter_sort_title\">[+title+]</span><span class=\"eFilter_sort_options\">[+rows+]</span></div>\';\n$displayRow = isset($param[\'displayRow\']) ? $param[\'displayRow\'] : \'<option value=\"[+value+]\" [+selected+]>[+title+]</option>\';\n$displayOuter = isset($param[\'displayOuter\']) ? $param[\'displayOuter\'] : \'\n    <div class=\"eFilter_display_block\">\n        <span class=\"eFilter_display_title\">[+title+]</span>\n        <span class=\"eFilter_display_options\"><select name=\"sortDisplay\" class=\"eFilter_display_select\">[+rows+]</select></span>\n    </div>\';\n$classActiveName = isset($param[\'classActiveName\']) ? $param[\'classActiveName\'] : \'active\';\n$classUpName = isset($param[\'classUpName\']) ? $param[\'classUpName\'] : \'up\';\n$classDownName = isset($param[\'classDownName\']) ? $param[\'classDownName\'] : \'down\';\n$classSelectedName = isset($param[\'classSelectedName\']) ? $param[\'classSelectedName\'] : \'selected\';\n$action_uri = $_SERVER[\'REQUEST_URI\'];\n$jsFileName = isset($jsFileName) && !empty($jsFileName) ? $jsFileName : \'eFSortBlock\';\n\n//разбираем конфиг\n$cfg = array();\n$tmp = explode(\"||\", $config_sort);\nforeach ($tmp as $k => $v) {\n    if ($k == \'0\') {\n        $cfg[\'sort\'][\'title\'] = $v;\n    } else {\n        $_tmp = explode(\"==\", $v);\n        $cfg[\'sort\'][\'values\'][$_tmp[0]] = (isset($_tmp[1]) && !empty($_tmp[1])) ? $_tmp[1] : $_tmp[0];\n    }\n}\n$tmp = explode(\"||\", $config_display);\nforeach ($tmp as $k => $v) {\n    if ($k == \'0\') {\n        $cfg[\'display\'][\'title\'] = $v;\n    } else {\n        $_tmp = explode(\"==\", $v);\n        $cfg[\'display\'][\'values\'][$_tmp[0]] = (isset($_tmp[1]) && !empty($_tmp[1])) ? $_tmp[1] : $_tmp[0];\n    }\n}\n\n\n$out = \'\';\n\n//блок сортировки\n$sortBlock = \'\';\n$sortRows = \'\';\nforeach ($cfg[\'sort\'][\'values\'] as $k => $v) {\n    $classActive = $sortBy == $k ? \' \' . $classActiveName . \' \' : \'\';\n    $classUpDown = !empty($classActive) ? (($sortOrder == \'ASC\' ? \' \' . $classUpName. \' \' : \' \' . $classDownName. \' \')) : \'\';\n    $sortOrderDirection = $sortOrder == \'ASC\' ? \'DESC\' : \'ASC\';\n    $sortRows .= str_replace(\n        array(\'[+classActive+]\', \'[+classUpDown+]\', \'[+sortBy+]\', \'[+sortOrder+]\', \'[+title+]\'),\n        array($classActive, $classUpDown, $k, $sortOrderDirection, $v),\n        $sortRow\n    );\n}\n$sortBlock .= str_replace(\n    array(\'[+title+]\', \'[+rows+]\'),\n    array($cfg[\'sort\'][\'title\'], $sortRows),\n    $sortOuter\n);\n\n//блок \"показать по\"\n$displayBlock = \'\';\n$displayRows = \'\';\nforeach ($cfg[\'display\'][\'values\'] as $k => $v) {\n    $selected = $sortDisplay == $k ? \' \' . $classSelectedName : \'\';\n    $displayRows .= str_replace(\n        array(\'[+value+]\', \'[+selected+]\', \'[+title+]\'),\n        array($k, $selected, $v),\n        $displayRow\n    );\n}\n$displayBlock .= str_replace(\n    array(\'[+title+]\', \'[+rows+]\'),\n    array($cfg[\'display\'][\'title\'], $displayRows),\n    $displayOuter\n);\n\n\n//итоговая форма\n$out .= <<<HTML\n<div id=\"eFilter_sort_block\">\n    <form action=\"{$action_uri}\" method=\"post\" id=\"changesortBy\">\n        {$sortBlock}\n        {$displayBlock}\n        <input type=\"hidden\" name=\"action\" value=\"changesortBy\">\n        <input type=\"hidden\" name=\"sortBy\" value=\"{$sortBy}\">\n        <input type=\"hidden\" name=\"sortOrder\" value=\"{$sortOrder}\">\n    </form>\n</div>\nHTML;\n$modx->regClientScript(\"assets/snippets/eFilter/html/js/\" . $jsFileName . \".js\");\nreturn $out;\n', 0, '', '', 0, 0, 0),
(29, 'multiParams', '<strong>0.1</strong> Параметры товара для категории', 0, 10, 0, '//импортировать общие параметры из модуля eLists\n \n //служебный сниппет для формирования возможных значений из списков из модуля, дерева либо нужных категорий TV\n\n // использование\n // если вы храните списки возможных значений в модуле eLists, то просто скопируйте соответствующую строку в поле \"возможные значения\" нужного TV \n // (тип выставляете который требуется - селект, чекбоксы, радио и т.п.)\n // @EVAL return $modx->runSnippet(\"multiParams\", array(\"parent\"=>\"2\")); - выглядит это примерно так в модуле\n // где 2 - это id родителя нужного списка в отдельной таблице (он формируется автоматом)\n // \n // если вам не нужно первое пустое значение в tv (например, у вас тип ввода - чекбокс- вызывайте multiParams с дополнительным параметром \"firstEmpty\" => \"0\"\n //\n // если же вы предпочитаете хранить списки возможных значений TV в дереве, то добавляйте к вызову в поле \"возможные значения\" дополнительный параметр \'action\'=>\'getParamsFromTree\'\n // т.е. итоговый вызов в поле \"возможные значения\" для TV будет выглядеть так\n // @EVAL return $modx->runSnippet(\"multiParams\", array(\"parent\"=>\"25\", \"action\"=>\"getParamsFromTree\"));\n // где 25 - это id ресурса-родителя нужного списка в дереве, его подставляем самостоятельно\n // \n // @EVAL return $modx->runSnippet(\"multiParams\", array(\"field\"=>\"template\", \"value\"=>\"15\", \"action\"=>\"getParamsFromTree\"));\n // позволяет в выпадающий список вывести все ресурсы с template=15 (для фильтрации можно использовать любое поле из таблицы site_content\n //\n // @EVAL return $modx->runSnippet(\"multiParams\", array(\"field\"=>\"description\",\"value\"=>\"58\", \"action\"=>\"getParamsFromTree\", \"order\" => \"menuindex ASC\", \"firstEmpty\" => \"0\"));\n // выбираем в выпадающий список все ресурсы у которых в поле description значение 58, сортируем по menuindex с возрастанием, первый пустой не показываем (важно для вывода в виде чекбоксов)\n // сортировка по умолчанию - сначала по pagetitle по возрастанию, потом по menuindex по возрастанию\n //\n \n$out = \'\';\n$firstEmpty = isset($firstEmpty) && (int)$firstEmpty == 0 ? false : true;\n$order = $order ?? \"pagetitle ASC, menuindex ASC\";\nif ($firstEmpty) {\n    $out .= \'||\';\n}\nswitch ($action ?? \'\'){\n    case \'getParamsToMultiTV\' :\n        $tmp = array_merge(array_map(\'trim\', explode(\',\', $param_cat_id)), array_map(\'trim\', explode(\',\', $param_cat_id_common)));\n        $tmp = array_diff($tmp, array(\'\'));\n        $sql = \"SELECT `id`,`caption` FROM \" . $modx->getFullTableName(\'site_tmplvars\') . \" WHERE `category` IN (\" . implode(\',\', $tmp) . \") ORDER BY `rank` ASC, `caption` ASC\";\n        $q = $modx->db->query($sql);\n        while($row = $modx->db->getRow($q)){\n            $out .= $row[\'caption\'] . \'==\' . $row[\'id\'] . \'||\';\n        }\n        break;\n    \n    case \'getParamsFromTree\' :\n        if (isset($field) && isset($value)) {\n            $sql = \"SELECT pagetitle, id FROM \" . $modx->getFullTableName(\'site_content\') . \" WHERE `\" . $field . \"`=\'\" . $value . \"\' ORDER BY \" . $order;\n        } else {\n            $sql = \"SELECT pagetitle, id FROM \" . $modx->getFullTableName(\'site_content\') . \" WHERE parent IN(\" . $parent . \") ORDER BY \" . $order;\n        }\n        $q = $modx->db->query($sql);\n        while ($row = $modx->db->getRow($q)) {\n            //в выпадающем списке админки показываем вместе с id ресурса\n            $out .= $row[\'pagetitle\'] . (strpos($_SERVER[\'REQUEST_URI\'], MGR_DIR) !== FALSE ? \' (\' . $row[\'id\'] . \')\' : \'\') . \'==\' . $row[\'id\'] . \'||\';\n        }\n        break;\n\n    case \'showParamsFromTree\':\n        $ids = $params[\'ids\'] ?? \'\';\n        $no_href = isset($nohref) ? true : false;\n        $arr = [];\n        if ($ids != \'\') {\n            $ids = str_replace(\'||\', \',\', $ids);\n            $q = $modx->db->query(\"SELECT id,pagetitle FROM \" . $modx->getFullTableName(\"site_content\") . \" WHERE id IN (\" . $ids . \") AND published=1 AND deleted=0\");\n            while ($row = $modx->db->getRow($q)) {\n                if (!$no_href) {\n                    $arr[] = \'<a href=\"\' . $modx->makeUrl($row[\'id\']) . \'\">\' . $row[\'pagetitle\'] . \'</a>\';\n                } else {\n                    $arr[] = $row[\'pagetitle\'];\n                }\n            }\n        }\n        $out = implode(\', \', $arr) . \'  \';\n        break;\n    \n    default:\n        $sql = \"SELECT title, id FROM \" . $modx->getFullTableName(\'list_value_table\') . \" WHERE parent={$parent} ORDER BY sort ASC, title ASC\";\n        $q = $modx->db->query($sql);\n        while ($row = $modx->db->getRow($q)) {\n            $out .= $row[\'title\'] . \'||\';\n        }\n        break;\n}\n$out = substr($out, 0, -2);\nreturn $out;\n', 0, '', 'eFilters', 0, 0, 0),
(30, 'tovarParams', '<strong>0.1</strong> Параметры товара в шаблон товара', 0, 10, 0, '// импортировать общие параметры из модуля eLists\n// предназначен для вывода параметров товара в нужном месте шаблона товара\n// пример вызова [[tovarParams]] - в нужном месте шаблона \"Товар\"\n// доп.параметры - большинство импортируется из модуля, для вывода списка параметров $paramRow и $paramOuter\n\n\n//массив id тв, разрешенных для данного типа товаров в конфиге родителя\n$allowedParams = array();\n\n//заменяем плейсхолдер [+params+] в чанке вывода товаров \n//на нужный вывод параметров товаров\n//шаблоны вывода параметра в списке по умолчанию\n$paramRow = isset($paramRow) ? $paramRow : \'<div class=\"eFilter_list_param eFilter_list_param[+param_id+]\"><span class=\"eFilter_list_title\">[+param_title+]: </span><span class=\"eFilter_list_value eFilter_list_value[+param_id+]\">[+param_value+]</span></div>\';\n$paramOuter = isset($paramOuter) ? $paramOuter : \'<div class=\"eFilter_item_params\">[+wrapper+]</div>\';\n\n$out = \'\';\n$tovar_params_tpl = \'\';\n\ninclude_once(MODX_BASE_PATH . \'assets/snippets/eFilter/eFilter.class.php\');\n$eFltr = new eFilter($modx, $params);\n$eFltr->docid = $modx->documentObject[\'parent\'];\n\n\n//получаем общий список тв-параметров из категорий \"параметры для товара\" - $param_cat_id\n$tv_list = array();\n$sql = \"SELECT a.`id`,a.`name`,a.`caption`,a.`elements` FROM \" . $modx->getFullTableName(\'site_tmplvars\') . \" as a, \" . $modx->getFullTableName(\'site_tmplvar_templates\') . \" as b WHERE a.`category` IN (\" . $param_cat_id . \") AND `a`.`id` = `b`.`tmplvarid` AND `b`.`templateid` IN(\" . $params[\'product_templates_id\'] . \")  ORDER BY b.`rank` ASC, a.`caption` ASC\";\n\n$q = $modx->db->query($sql);\nwhile($row = $modx->db->getRow($q)){\n    if (!isset($tv_list[$row[\'id\']])) {\n        $tv_list[$row[\'id\']][\'name\'] = $row[\'name\'];\n        $tv_list[$row[\'id\']][\'caption\'] = $row[\'caption\'];\n        $tv_list[$row[\'id\']][\'elements\'] = $row[\'elements\'];\n    }\n}\n\n//находим разрешенные для данного товара параметры\n//сначала ищем в родителе\n$allowedParams = array();\n$doc = $modx->documentIdentifier;\n$allowedTmp = $eFltr->getFilterParam ($eFltr->param_tv_name);\n\n//если тут пусто, проверим первую тегованную категорию из параметра tv_category_tag\nif (isset($tv_category_tag) && $tv_category_tag != \'\' && empty($allowedTmp)) {\n    $q = $modx->db->getValue(\"SELECT value FROM \" . $modx->getFullTableName(\'site_tmplvar_contentvalues\') . \" WHERE tmplvarid={$tv_category_tag} AND contentid=\" . $modx->documentIdentifier);\n    if ($q) {\n        $cats = explode(\',\', $q);\n        if (isset($cats[0]) && (int)$cats[0] > 0) {\n            $allowedTmp = $eFltr->getFilterParam ( $eFltr->param_tv_name, (int)$cats[0]);\n        }\n    }\n}\n\n//итоговый массив разрешенных для данного товара параметров\nif (isset($allowedTmp[\'fieldValue\'])) {\n    foreach ($allowedTmp[\'fieldValue\'] as $k=>$v) {\n        $allowedParams[$v[\'param_id\']] = \'1\';\n    }\n}\n\n\n//оставляем только разрешенные для данного товара параметры в списке\nforeach ($tv_list as $k => $v) {\n    if (!isset($allowedParams[$k])) {\n        unset($tv_list[$k]);\n    }\n}\n\n// удаляем из списка общие исключенные ТВ (в настройках модуля) -\n// (например цена и т.п., которая выводится отдельно и есть у всех\nif (isset($exclude_tvs_from_list) && $exclude_tvs_from_list != \'\') {\n    $exclude_tvs = explode(\',\', $exclude_tvs_from_list);\n    foreach($exclude_tvs as $k=>$v){\n        if (isset($tv_list[$v])) {\n            unset($tv_list[$v]);\n        }\n    }\n}\n///////\n\n\nforeach($tv_list as $tv_id=>$v) {\n    $param_title = $v[\'caption\'];\n    $param_value = \'[*\' . $v[\'name\'] . \'*]\';\n    $param_value = stristr($v[\'elements\'], \'getParamsFromTree\') === FALSE ? \'[*\' . $v[\'name\'] . \'*]\' : \'[[if? &is=`[*\' . $v[\'name\'] . \'*]:!empty` &then=`[[multiParams? &action=`showParamsFromTree` &ids=`[*\' . $v[\'name\'] . \'*]`]]`]]\';\n\n    $tovar_params_tpl .= $eFltr->parseTpl(\n        array(\'[+param_title+]\', \'[+param_value+]\', \'[+param_id+]\'),\n        array($param_title, $param_value, $tv_id),\n        $paramRow\n    );\n}\n\n$out = $eFltr->parseTpl(\n    array(\'[+wrapper+]\'),\n    array($tovar_params_tpl),\n    $paramOuter\n);\n\nreturn $out;\n', 0, '', 'eFilters', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_templates`
--

CREATE TABLE `adkq_site_templates` (
  `id` int(11) NOT NULL,
  `templatename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `templatealias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `templatecontroller` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-page,1-content',
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `selectable` tinyint(1) NOT NULL DEFAULT 1,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_templates`
--

INSERT INTO `adkq_site_templates` (`id`, `templatename`, `templatealias`, `templatecontroller`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`, `createdon`, `editedon`) VALUES
(1, 'Главная', 'pages.main', 'Pages\\Main', '', 0, 7, '', 0, '', 0, 1, 0, 1728752741),
(2, 'Catalog', 'pages.catalog', 'Pages\\Catalog', '', 0, 7, '', 0, '', 0, 1, 1728752751, 1728752775),
(3, 'Product', 'pages.product', 'Pages\\Product', '', 0, 7, '', 0, '', 0, 1, 1728752778, 1728752797),
(4, 'Cart', 'pages.cart', 'Shop\\Cart', '', 0, 7, '', 0, '', 0, 1, 1728752982, 1728752982),
(5, 'CatalogSection', 'pages.catalog_section', 'Pages\\CatalogSection', '', 0, 0, '', 0, '', 0, 1, 1729711763, 1729711763),
(6, 'Articles', 'pages.articles', 'Pages\\Articles', '', 0, 7, '', 0, '', 0, 1, 1729713947, 1729713988),
(7, 'Article', 'pages.article', 'Pages\\Article', '', 0, 7, '', 0, '', 0, 1, 1729714651, 1729714665),
(8, '404', 'pages.404', 'Pages\\Text', '', 0, 7, '', 0, '', 0, 1, 1729885626, 1729885858),
(9, 'Text', 'pages.text', 'Pages\\Text', '', 0, 7, '', 0, '', 0, 1, 1729885899, 1729885918),
(10, 'Contacts', 'pages.contacts', 'Pages\\Text', '', 0, 7, '', 0, '', 0, 1, 1729889114, 1729889217),
(11, 'Sitemap', 'pages.sitemap', 'Seo\\Sitemap', '', 0, 7, '', 0, '', 0, 1, 1730402002, 1730402024);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_tmplvars`
--

CREATE TABLE `adkq_site_tmplvars` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `caption` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `elements` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT 0,
  `display` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Display Control',
  `display_params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display Control Properties',
  `default_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_tmplvars`
--

INSERT INTO `adkq_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`, `createdon`, `editedon`, `properties`) VALUES
(1, 'textareamini', 'metadescription', 'Meta description', 'Описание для поисковых машин', 0, 4, 0, '', 0, '', '', '', 1728749440, 1728751396, NULL),
(2, 'text', 'metatitle', 'Содержимое в теге title', 'Тег title', 0, 4, 0, '', 0, '', '', '', 1728749440, 1728751396, NULL),
(3, 'checkbox', 'noIndex', 'Индексировать страницу?', 'Если выбрать, добавит noindex, nofollow в секцию head', 0, 4, 0, 'Нет, не индексировать==1', 0, '', '', '0', 1728749440, 1728751396, NULL),
(4, 'image', 'ogImage', 'Изображение для соцсетей', 'Рекомендуется фото 1200:630', 0, 4, 0, '', 0, '', '', 'assets/images/ogdefault.png', 1728749440, 1730402726, '[]'),
(5, 'dropdown', 'ogType', 'Тип страницы', 'Og:type', 0, 4, 0, 'статья, публикация==article||товар, услуга==product||обычная страница==website||видео==video.movie||профайл==profile||сингл-песня==music.song||альбом==music.album||плейлист==music.playlist||радиостанция==music.radio_station||эпизод из видео==video.episode||ТВ-шоу==video.tv_show||другая категория видеоматериала==video.other||книга==book', 0, '', '', 'website', 1728749440, 1728751396, NULL),
(6, 'dropdown', 'sitemap_changefreq', 'Период обновления', 'Для карты сайта', 0, 4, 0, 'always||hourly||daily||weekly||monthly||yearly||never', 0, '', '', 'weekly', 1728749440, 1728751396, NULL),
(7, 'checkbox', 'sitemap_exclude', 'Отображение в sitemap', 'Для карты сайта', 0, 4, 0, 'Скрыть==1', 0, '', '', '0', 1728749440, 1728751396, NULL),
(8, 'dropdown', 'sitemap_priority', 'Приоритет страницы', 'Для карты сайта', 0, 4, 0, '0.1||0.2||0.3||0.4||0.5||0.6||0.7||0.8||0.9||1', 0, '', '', '0.9', 1728749440, 1728751396, NULL),
(9, 'text', 'price', 'Цена товара', 'Сумма, например 998.30', 0, 9, 0, '', 0, '', '', '', 1728751299, 1730408215, '[]'),
(14, 'image', 'product_photo', 'Главное фото товара', '', 0, 8, 0, '', 0, '', '', '', 1728754900, 1728754900, '[]'),
(15, 'checkbox', 'in_stock', 'Наличие товара', 'Если товара нет, ставь галочку', 0, 8, 0, 'Нет в наличии==0', 0, '', '', '1', 1728754940, 1728849678, '[]'),
(16, 'image', 'article_photo', 'Main photo', '', 0, 2, 0, '', 0, '', '', '', 1729751382, 1729751402, '[]'),
(17, 'option', 'product_brand', 'Brand', '', 0, 9, 0, '@EVAL return $modx->runSnippet(\"multiParams\", array(\"parent\"=>\"1\",\"firstEmpty\" => \"0\"));	', 0, '', '', '', 1730403828, 1730404413, '[]'),
(18, 'checkbox', 'product_color', 'Colors', '', 0, 9, 0, '@EVAL return $modx->runSnippet(\"multiParams\", array(\"parent\"=>\"2\",\"firstEmpty\" => \"0\"));	', 0, '', '', '', 1730403841, 1730404406, '[]'),
(19, 'custom_tv', 'tovarparams', 'Настройка фильтра', 'tovarparams', 0, 10, 1, '@INCLUDE assets/tvs/multitv/multitv.customtv.php', 0, '', '', '', 1730404150, 1730404187, '[]');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_tmplvar_access`
--

CREATE TABLE `adkq_site_tmplvar_access` (
  `id` int(11) NOT NULL,
  `tmplvarid` int(11) NOT NULL DEFAULT 0,
  `documentgroup` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_tmplvar_contentvalues`
--

CREATE TABLE `adkq_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL,
  `tmplvarid` int(11) NOT NULL DEFAULT 0 COMMENT 'Template Variable id',
  `contentid` int(11) NOT NULL DEFAULT 0 COMMENT 'Site Content Id',
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_tmplvar_contentvalues`
--

INSERT INTO `adkq_site_tmplvar_contentvalues` (`id`, `tmplvarid`, `contentid`, `value`) VALUES
(1, 3, 1, NULL),
(2, 7, 1, NULL),
(3, 3, 2, NULL),
(4, 7, 2, NULL),
(5, 3, 3, NULL),
(6, 7, 3, NULL),
(7, 9, 4, '2211'),
(8, 9, 5, '2002'),
(9, 9, 6, '3300'),
(10, 9, 7, '1000.52'),
(11, 9, 8, '2369'),
(12, 15, 8, '0'),
(13, 9, 9, '2650'),
(14, 9, 10, '3061'),
(15, 9, 11, '3311'),
(16, 9, 12, '3307'),
(17, 9, 13, '2935'),
(18, 9, 14, '3063'),
(19, 9, 15, '2987'),
(20, 9, 16, '2338'),
(21, 9, 17, '3047'),
(22, 9, 18, '1940'),
(23, 15, 18, '0'),
(24, 9, 19, '1875'),
(25, 9, 20, '2035'),
(26, 9, 21, '2768'),
(27, 9, 22, '1310'),
(28, 9, 23, '2730'),
(29, 9, 24, '2972'),
(30, 9, 25, '2626'),
(31, 9, 26, '1660'),
(32, 9, 27, '1694'),
(33, 9, 28, '2435'),
(34, 9, 29, '2395'),
(35, 9, 30, '1689'),
(36, 9, 31, '1682'),
(37, 9, 32, '1298'),
(38, 9, 33, '1492'),
(39, 9, 34, '2426'),
(40, 9, 35, '2619'),
(41, 9, 36, '3193'),
(42, 9, 37, '1849'),
(43, 9, 38, '1373'),
(44, 9, 39, '1298'),
(45, 15, 39, '0'),
(46, 9, 40, '2422'),
(47, 9, 41, '3007'),
(48, 9, 42, '2964'),
(49, 9, 43, '2543'),
(50, 9, 44, '2685'),
(51, 9, 45, '1386'),
(52, 9, 46, '2555'),
(53, 9, 47, '2467'),
(54, 9, 48, '2251'),
(55, 9, 49, '1859'),
(56, 9, 50, '1849'),
(57, 9, 51, '1845'),
(58, 9, 52, '2048'),
(59, 9, 53, '2201'),
(60, 9, 54, '3211'),
(61, 9, 55, '2563'),
(62, 9, 56, '2541'),
(63, 9, 57, '3153'),
(64, 9, 58, '2689'),
(65, 9, 59, '3244'),
(66, 9, 60, '1542'),
(67, 9, 61, '1950'),
(68, 9, 62, '2434'),
(69, 9, 63, '2443'),
(70, 15, 63, '0'),
(71, 9, 64, '2092'),
(72, 9, 65, '3225'),
(73, 9, 66, '2494'),
(74, 9, 67, '2307'),
(75, 9, 68, '2807'),
(76, 9, 69, '1602'),
(77, 9, 70, '2386'),
(78, 9, 71, '2988'),
(79, 9, 72, '1629'),
(80, 9, 73, '2876'),
(81, 9, 74, '1696'),
(82, 9, 75, '1621'),
(83, 9, 76, '3182'),
(84, 9, 77, '1479'),
(85, 9, 78, '1540'),
(86, 9, 79, '2865'),
(87, 9, 80, '3087'),
(88, 9, 81, '2224'),
(89, 9, 82, '2631'),
(90, 9, 83, '1998'),
(91, 9, 84, '2416'),
(92, 9, 85, '3055'),
(93, 9, 86, '1556'),
(94, 9, 87, '3133'),
(95, 9, 88, '1670'),
(96, 9, 89, '2278'),
(97, 9, 90, '3181'),
(98, 9, 91, '1559'),
(99, 9, 92, '1432'),
(100, 9, 93, '2836'),
(101, 15, 93, '0'),
(102, 9, 94, '1686'),
(103, 9, 95, '1857'),
(104, 9, 96, '2554'),
(105, 9, 97, '1992'),
(106, 9, 98, '2390'),
(107, 9, 99, '1779'),
(108, 9, 100, '2921'),
(109, 9, 101, '3034'),
(110, 14, 4, 'assets/images/fc7fcd4769e1a2314b2abd94bebba4e5.png'),
(111, 14, 5, 'assets/images/8bfd5e86f70a280abfa16d813b9dbedf.png'),
(112, 14, 6, 'assets/images/c7878fca83750e094795197fec15a24c.png'),
(113, 14, 7, 'assets/images/cd2b8fedae4eda6777dca9e7b43e2e57.png'),
(114, 14, 8, 'assets/images/c6a337b3ff9bf4811f92bda6963dffa2.png'),
(115, 14, 9, 'assets/images/c72de98ebb9aeb1b1a8e0bf36f0ec370.png'),
(116, 14, 10, 'assets/images/9b00988a694dbcbffa56ea17a6f6cd51.png'),
(117, 14, 11, 'assets/images/8e906b364f81d014409f50ecd92e119c.png'),
(118, 14, 12, 'assets/images/c56615453b7185875cb9d2dfea37b0c8.png'),
(119, 14, 13, 'assets/images/5cb2cfd9f08cffa8c59f795f67673f7d.png'),
(120, 14, 14, 'assets/images/d3e3bd46f35aa9967aec15d65abccca6.png'),
(121, 14, 15, 'assets/images/6d28d83e8cfb91e6973a23d44e0e6f9e.png'),
(122, 14, 16, 'assets/images/59ed030597b2e4532cf5c2d07ef04f6f.png'),
(123, 14, 17, 'assets/images/fa55c1ee6b5aa6f09726142a2323ab79.png'),
(124, 14, 18, 'assets/images/7bd596d5f07a4722da9e91a042bedf3b.png'),
(125, 14, 19, 'assets/images/c952572503259aea8bff8f18d7c33a70.png'),
(126, 14, 20, 'assets/images/10ae2f1d18312bbc4c7c288ceb276d33.png'),
(127, 14, 21, 'assets/images/cc0ce483b39060419a6eb16312e9b9cc.png'),
(128, 14, 22, 'assets/images/9a2fc0579ddb4ba425eb519d8aca31b3.png'),
(129, 14, 23, 'assets/images/eda1123b54625ecd88604d3ac4ef773a.png'),
(130, 14, 24, 'assets/images/0356b42c5695017555f8c16a30be6aa2.png'),
(131, 14, 25, 'assets/images/9664a2f3a285d1dbacb7f8ed4f80a10d.png'),
(132, 14, 26, 'assets/images/6f8a2816669aab3df09a23855c7663ea.png'),
(133, 14, 27, 'assets/images/da5e7403fb9fbb616f89d17a5e77ced5.png'),
(134, 14, 28, 'assets/images/dfdc4077b51dd561ae1a234db93ab0d3.png'),
(135, 14, 29, 'assets/images/ed64bd8630ee24af4b586d20f47eff33.png'),
(136, 14, 30, 'assets/images/58e957c177a3ebfac397e5d97826242a.png'),
(137, 14, 31, 'assets/images/004611ec530d2bb92768e3984113633d.png'),
(138, 14, 32, 'assets/images/ba45f525021ae9110853caa2b713d451.png'),
(139, 14, 33, 'assets/images/a6468e21d36d554f5035e501f05d725e.png'),
(140, 14, 34, 'assets/images/7512696dad8304d493df7f4ac6f566a4.png'),
(141, 14, 35, 'assets/images/ee81980671c6d326b10e5cf317d405a9.png'),
(142, 14, 36, 'assets/images/0d96a8aa8c19cd0323f1bd3852199e54.png'),
(143, 14, 37, 'assets/images/2ecd54bd6d73c858d2ff06852c5a07cd.png'),
(144, 14, 38, 'assets/images/166ef20df739a51fc0dd01b67bd50abf.png'),
(145, 14, 39, 'assets/images/c23f0e9e9ec8a50eb9db0674c6898bc1.png'),
(146, 14, 40, 'assets/images/95c5252eb29ff79b11031f87de1d2583.png'),
(147, 14, 41, 'assets/images/b17e36bb1a81cd0ec9bf50ad41614297.png'),
(148, 14, 42, 'assets/images/13da3ec925cb587c9292a09af5fe152d.png'),
(149, 14, 43, 'assets/images/d49b6de95c9d2a608e0fdc95317a276f.png'),
(150, 14, 44, 'assets/images/57cf48487d7c0c139be79289cc943685.png'),
(151, 14, 45, 'assets/images/fd46fa3811aa0fd45601f01552755387.png'),
(152, 14, 46, 'assets/images/3158a72591eca19bd85b06e1bc2b0436.png'),
(153, 14, 47, 'assets/images/b5616a9b34e8948316d82ee37f5d0ef9.png'),
(154, 14, 48, 'assets/images/f49773aa89bb53258117ca59fec88f73.png'),
(155, 14, 49, 'assets/images/c2522369f9edc93a1a14d5d832d6ff12.png'),
(156, 14, 50, 'assets/images/44960d8ebb7be0db26ccea28fa1df2d4.png'),
(157, 14, 51, 'assets/images/7d70c390c23ee6213802eab3cc4f15cb.png'),
(158, 14, 52, 'assets/images/b1a0041926d8df108364f3ee053badb8.png'),
(159, 14, 53, 'assets/images/03df78c702cbd5240396070bd32a74d2.png'),
(160, 14, 54, 'assets/images/8b78e769bb454857ed411dcff6f42448.png'),
(161, 14, 55, 'assets/images/83f2a122f0f97465bcfc9107063d1b9f.png'),
(162, 14, 56, 'assets/images/fe5068a22070806c9e55796d549842f5.png'),
(163, 14, 57, 'assets/images/b6c77326c854e7817503dde0a4cae718.png'),
(164, 14, 58, 'assets/images/aa8bb5ab53375187000ca53ca642688d.png'),
(165, 14, 59, 'assets/images/460965ad60f71b48347d406ef292c417.png'),
(166, 14, 60, 'assets/images/8aefc747e1b9f8419495ad539f1ff08e.png'),
(167, 14, 61, 'assets/images/e49670f0f949ade9ddc9570de1e965fd.png'),
(168, 14, 62, 'assets/images/0be3c6bb81630aacee34a8ea4bf6a91f.png'),
(169, 14, 63, 'assets/images/578d9f7c3cc1dee431aa6037a065f8af.png'),
(170, 14, 64, 'assets/images/e2365877ef7394c4cb82906ad480ff0a.png'),
(171, 14, 65, 'assets/images/14d6867815bc0ad7b19365ef4abe3305.png'),
(172, 14, 66, 'assets/images/3a2595437432cd9506bcc734f5845552.png'),
(173, 14, 67, 'assets/images/427a1a08964a0f39f6eed6dfde9c5771.png'),
(174, 14, 68, 'assets/images/ba1eedb7e5a683f5220ad49d111e545d.png'),
(175, 14, 69, 'assets/images/3ad1bc1c10fc7b80ed578c1e96bfb455.png'),
(176, 14, 70, 'assets/images/19a92c97206b3705ed6989eca930b2fe.png'),
(177, 14, 71, 'assets/images/e79ac780efe25b3548f9a0475ceb7579.png'),
(178, 14, 72, 'assets/images/793c7d9cd0e2ea17804668b4785a29ac.png'),
(179, 14, 73, 'assets/images/ad48fe30acff115fe4b32ef082547537.png'),
(180, 14, 74, 'assets/images/6abb182d2ab2c3421684dadc08fd860a.png'),
(181, 14, 75, 'assets/images/ab95ccc843838142932d5c89ff16a25e.png'),
(182, 14, 76, 'assets/images/e39f1f7c8a4fbb176cbba9729d4a69fa.png'),
(183, 14, 77, 'assets/images/38dea2fbff3e31f1e9346e66e57a3e77.png'),
(184, 14, 78, 'assets/images/4619f35b9dfb636147cd1fd73a0229dc.png'),
(185, 14, 79, 'assets/images/3831d69c0e4f60926544059c1fe6d957.png'),
(186, 14, 80, 'assets/images/8458d6ecd7756d7fa5e529deefc71a96.png'),
(187, 14, 81, 'assets/images/271704de30c057efdc112f6af0fa1af1.png'),
(188, 14, 82, 'assets/images/86ce4e55828c58096a93294df2479fb3.png'),
(189, 14, 83, 'assets/images/feacb0d4ebe56725d13d2f69ecccc5a2.png'),
(190, 14, 84, 'assets/images/b76cb0492c8aec32b791326f97c8e282.png'),
(191, 14, 85, 'assets/images/28862808ef0b4154e39d0a959cfaedb2.png'),
(192, 14, 86, 'assets/images/3c2aec1d9c06b190a37756eee4f4e21f.png'),
(193, 14, 87, 'assets/images/60786496a5d4d36fe609787282a03020.png'),
(194, 14, 88, 'assets/images/c7623bbd8cdb6a9a90c8cb7cf30a85e3.png'),
(195, 14, 89, 'assets/images/d6c85d2acdadb94873bedca1db53fcba.png'),
(196, 14, 90, 'assets/images/de08f369a4e2c9482e9c220c1be3fd51.png'),
(197, 14, 91, 'assets/images/649d0ec1efb893a0c77d6a482b09ab41.png'),
(198, 14, 92, 'assets/images/abdde5e221ec775d7beaea4bed4f52e8.png'),
(199, 14, 93, 'assets/images/4833a0611cdcb4f1af35c011a54a02d8.png'),
(200, 14, 94, 'assets/images/dfe322eed42d28c33614f4c6929456f8.png'),
(201, 14, 95, 'assets/images/176ed9c884016de1404130513d9bfcd4.png'),
(202, 14, 96, 'assets/images/888bac1600b148dc90eab12faacea55b.png'),
(203, 14, 97, 'assets/images/fb90406134500aadfe4690f09e8a41fb.png'),
(204, 14, 98, 'assets/images/d971fd51684c11652a276a8789631089.png'),
(205, 14, 99, 'assets/images/38d5838493e011268a0b169335cebb75.png'),
(206, 14, 100, 'assets/images/c34014d0f95fe073f30f7d0323269c18.png'),
(207, 14, 101, 'assets/images/b63088b70f1c661366f40165998bb23f.png'),
(212, 3, 4, NULL),
(213, 7, 4, NULL),
(214, 3, 6, NULL),
(215, 7, 6, NULL),
(216, 3, 5, NULL),
(217, 7, 5, NULL),
(218, 3, 7, NULL),
(219, 7, 7, NULL),
(220, 3, 8, NULL),
(221, 7, 8, NULL),
(222, 3, 9, NULL),
(223, 7, 9, NULL),
(224, 15, 9, NULL),
(225, 3, 10, NULL),
(226, 7, 10, NULL),
(227, 15, 10, NULL),
(228, 3, 21, NULL),
(229, 7, 21, NULL),
(230, 3, 17, NULL),
(231, 7, 17, NULL),
(232, 3, 20, NULL),
(233, 7, 20, NULL),
(234, 3, 16, NULL),
(235, 7, 16, NULL),
(236, 3, 11, '1'),
(237, 7, 11, '1'),
(238, 15, 11, NULL),
(239, 6, 11, 'never'),
(240, 8, 11, '0.1'),
(241, 3, 12, NULL),
(242, 7, 12, NULL),
(243, 16, 21, 'assets/images/2024-10-31_21-25-15.png'),
(244, 16, 17, 'assets/images/2024-10-31_21-25-15.png'),
(245, 16, 20, 'assets/images/2024-10-31_21-25-15.png'),
(246, 16, 16, 'assets/images/2024-10-31_21-25-15.png'),
(247, 3, 13, NULL),
(248, 7, 13, NULL),
(249, 15, 13, NULL),
(250, 3, 104, '1'),
(251, 7, 104, '1'),
(252, 19, 2, '{\"fieldValue\":[{\"param_id\":\"9\",\"cat_name\":\"\",\"list_yes\":\"\",\"fltr_yes\":\"1\",\"fltr_type\":\"6\",\"fltr_name\":\"Price\",\"fltr_many\":\"\",\"fltr_href\":\"\"},{\"param_id\":\"17\",\"cat_name\":\"\",\"list_yes\":\"1\",\"fltr_yes\":\"1\",\"fltr_type\":\"4\",\"fltr_name\":\"Brand\",\"fltr_many\":\"\",\"fltr_href\":\"\"},{\"param_id\":\"18\",\"cat_name\":\"\",\"list_yes\":\"1\",\"fltr_yes\":\"1\",\"fltr_type\":\"1\",\"fltr_name\":\"Color\",\"fltr_many\":\"1\",\"fltr_href\":\"\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
(256, 17, 27, '1'),
(257, 18, 27, '3'),
(258, 18, 15, '2'),
(259, 17, 15, '1'),
(260, 18, 18, '1'),
(261, 17, 18, '3'),
(262, 18, 19, '1'),
(263, 17, 19, '3'),
(264, 18, 22, '3'),
(265, 17, 22, '2'),
(266, 18, 23, '1'),
(267, 17, 23, '3'),
(268, 18, 24, '2'),
(269, 17, 24, '2'),
(270, 18, 25, '2'),
(271, 17, 25, '1'),
(272, 18, 26, '3'),
(273, 17, 26, '1'),
(276, 18, 28, '2'),
(277, 17, 28, '3'),
(278, 18, 29, '1'),
(279, 17, 29, '2'),
(280, 18, 30, '3'),
(281, 17, 30, '1'),
(282, 18, 31, '2'),
(283, 17, 31, '1'),
(284, 18, 32, '3'),
(285, 17, 32, '1'),
(286, 18, 33, '2'),
(287, 17, 33, '2'),
(288, 18, 34, '1'),
(289, 17, 34, '2'),
(290, 18, 35, '3'),
(291, 17, 35, '3'),
(292, 18, 36, '3'),
(293, 17, 36, '3'),
(294, 18, 37, '3'),
(295, 17, 37, '2'),
(296, 18, 38, '1'),
(297, 17, 38, '2'),
(298, 18, 39, '2'),
(299, 17, 39, '2'),
(300, 18, 40, '3'),
(301, 17, 40, '3'),
(302, 18, 41, '2'),
(303, 17, 41, '1'),
(304, 18, 42, '3'),
(305, 17, 42, '3'),
(306, 18, 43, '2'),
(307, 17, 43, '3'),
(308, 18, 44, '3'),
(309, 17, 44, '1'),
(310, 18, 45, '3'),
(311, 17, 45, '1'),
(312, 18, 46, '1'),
(313, 17, 46, '1'),
(314, 18, 47, '3'),
(315, 17, 47, '2'),
(316, 18, 48, '1'),
(317, 17, 48, '1'),
(318, 18, 49, '3'),
(319, 17, 49, '1'),
(320, 18, 50, '3'),
(321, 17, 50, '3'),
(322, 18, 51, '2'),
(323, 17, 51, '3'),
(324, 18, 52, '1'),
(325, 17, 52, '2'),
(326, 18, 53, '1'),
(327, 17, 53, '1'),
(328, 18, 54, '2'),
(329, 17, 54, '3'),
(330, 18, 55, '1'),
(331, 17, 55, '3'),
(332, 18, 56, '2'),
(333, 17, 56, '1'),
(334, 18, 57, '2'),
(335, 17, 57, '3'),
(336, 18, 58, '2'),
(337, 17, 58, '2'),
(338, 18, 59, '3'),
(339, 17, 59, '1'),
(340, 18, 60, '3'),
(341, 17, 60, '2'),
(342, 18, 61, '3'),
(343, 17, 61, '3'),
(344, 18, 62, '3'),
(345, 17, 62, '2'),
(346, 18, 63, '3'),
(347, 17, 63, '1'),
(348, 18, 64, '1'),
(349, 17, 64, '3'),
(350, 18, 65, '1'),
(351, 17, 65, '2'),
(352, 18, 66, '3'),
(353, 17, 66, '2'),
(354, 18, 67, '3'),
(355, 17, 67, '1'),
(356, 18, 68, '2'),
(357, 17, 68, '1'),
(358, 18, 69, '1'),
(359, 17, 69, '3'),
(360, 18, 70, '1'),
(361, 17, 70, '1'),
(362, 18, 71, '2'),
(363, 17, 71, '2'),
(364, 18, 72, '2'),
(365, 17, 72, '3'),
(366, 18, 73, '3'),
(367, 17, 73, '3'),
(368, 18, 74, '2'),
(369, 17, 74, '2'),
(370, 18, 75, '3'),
(371, 17, 75, '2'),
(372, 18, 76, '3'),
(373, 17, 76, '3'),
(374, 18, 77, '1'),
(375, 17, 77, '1'),
(376, 18, 78, '2'),
(377, 17, 78, '3'),
(378, 18, 79, '3'),
(379, 17, 79, '3'),
(380, 18, 80, '1'),
(381, 17, 80, '3'),
(382, 18, 81, '1'),
(383, 17, 81, '2'),
(384, 18, 82, '2'),
(385, 17, 82, '2'),
(386, 18, 83, '2'),
(387, 17, 83, '1'),
(388, 18, 84, '2'),
(389, 17, 84, '3'),
(390, 18, 85, '3'),
(391, 17, 85, '1'),
(392, 18, 86, '1'),
(393, 17, 86, '1'),
(394, 18, 87, '3'),
(395, 17, 87, '2'),
(396, 18, 88, '1'),
(397, 17, 88, '2'),
(398, 18, 89, '1'),
(399, 17, 89, '3'),
(400, 18, 90, '2'),
(401, 17, 90, '2'),
(402, 18, 91, '2'),
(403, 17, 91, '1'),
(404, 18, 92, '2'),
(405, 17, 92, '2'),
(406, 18, 93, '3'),
(407, 17, 93, '3'),
(408, 18, 94, '3'),
(409, 17, 94, '1'),
(410, 18, 95, '1'),
(411, 17, 95, '2'),
(412, 18, 96, '1'),
(413, 17, 96, '1'),
(414, 18, 97, '2'),
(415, 17, 97, '1'),
(416, 18, 98, '3'),
(417, 17, 98, '2'),
(418, 18, 99, '1'),
(419, 17, 99, '3'),
(420, 18, 100, '3'),
(421, 17, 100, '3'),
(422, 18, 101, '2'),
(423, 17, 101, '2'),
(424, 3, 57, NULL),
(425, 7, 57, NULL),
(426, 15, 57, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_site_tmplvar_templates`
--

CREATE TABLE `adkq_site_tmplvar_templates` (
  `tmplvarid` int(11) NOT NULL DEFAULT 0 COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_site_tmplvar_templates`
--

INSERT INTO `adkq_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 5),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(1, 8, 1),
(1, 9, 1),
(1, 10, 1),
(1, 11, 1),
(2, 1, 0),
(2, 2, 0),
(2, 3, 4),
(2, 4, 2),
(2, 5, 2),
(2, 6, 0),
(2, 7, 2),
(2, 8, 2),
(2, 9, 2),
(2, 10, 2),
(2, 11, 2),
(3, 1, 2),
(3, 2, 2),
(3, 3, 3),
(3, 4, 3),
(3, 5, 3),
(3, 6, 2),
(3, 7, 3),
(3, 8, 3),
(3, 9, 3),
(3, 10, 3),
(3, 11, 3),
(4, 1, 3),
(4, 2, 3),
(4, 3, 6),
(4, 4, 4),
(4, 5, 4),
(4, 6, 3),
(4, 7, 4),
(4, 8, 4),
(4, 9, 4),
(4, 10, 4),
(4, 11, 4),
(5, 1, 4),
(5, 2, 4),
(5, 3, 7),
(5, 4, 5),
(5, 5, 5),
(5, 6, 4),
(5, 7, 5),
(5, 8, 5),
(5, 9, 5),
(5, 10, 5),
(5, 11, 5),
(6, 1, 5),
(6, 2, 5),
(6, 3, 9),
(6, 4, 6),
(6, 5, 6),
(6, 6, 5),
(6, 7, 6),
(6, 8, 6),
(6, 9, 6),
(6, 10, 6),
(6, 11, 6),
(7, 1, 6),
(7, 2, 6),
(7, 3, 8),
(7, 4, 7),
(7, 5, 7),
(7, 6, 6),
(7, 7, 7),
(7, 8, 7),
(7, 9, 7),
(7, 10, 7),
(7, 11, 7),
(8, 1, 7),
(8, 2, 7),
(8, 3, 10),
(8, 4, 8),
(8, 5, 8),
(8, 6, 7),
(8, 7, 8),
(8, 8, 8),
(8, 9, 8),
(8, 10, 8),
(8, 11, 8),
(9, 3, 1),
(14, 3, 0),
(15, 3, 2),
(16, 7, 0),
(17, 3, 0),
(18, 3, 0),
(19, 2, 0),
(19, 5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_system_eventnames`
--

CREATE TABLE `adkq_system_eventnames` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `service` int(11) NOT NULL DEFAULT 0 COMMENT 'System Service number',
  `groupname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_system_eventnames`
--

INSERT INTO `adkq_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnAfterLoadDocumentObject', 5, ''),
(2, 'OnAfterMoveDocument', 1, 'Documents'),
(3, 'OnBeforeCacheUpdate', 4, ''),
(4, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(5, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(6, 'OnBeforeDocDuplicate', 1, 'Documents'),
(7, 'OnBeforeDocFormDelete', 1, 'Documents'),
(8, 'OnBeforeDocFormSave', 1, 'Documents'),
(9, 'OnBeforeEmptyTrash', 1, 'Documents'),
(10, 'OnBeforeFileBrowserCopy', 1, 'File Browser Events'),
(11, 'OnBeforeFileBrowserDelete', 1, 'File Browser Events'),
(12, 'OnBeforeFileBrowserMove', 1, 'File Browser Events'),
(13, 'OnBeforeFileBrowserRename', 1, 'File Browser Events'),
(14, 'OnBeforeFileBrowserUpload', 1, 'File Browser Events'),
(15, 'OnBeforeLoadDocumentObject', 5, ''),
(16, 'OnBeforeLoadExtension', 5, ''),
(17, 'OnBeforeManagerPageInit', 2, ''),
(18, 'OnBeforeMinifyCss', 1, ''),
(19, 'OnBeforeModFormDelete', 1, 'Modules'),
(20, 'OnBeforeModFormSave', 1, 'Modules'),
(21, 'OnBeforeMoveDocument', 1, 'Documents'),
(22, 'OnBeforeParseParams', 5, ''),
(23, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(24, 'OnBeforePluginFormSave', 1, 'Plugins'),
(25, 'OnBeforeSaveWebPageCache', 4, ''),
(26, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(27, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(28, 'OnBeforeTempFormDelete', 1, 'Templates'),
(29, 'OnBeforeTempFormSave', 1, 'Templates'),
(30, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(31, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(32, 'OnBeforeUserDelete', 1, 'Users'),
(33, 'OnBeforeUserLogin', 1, 'Users'),
(34, 'OnBeforeUserLogout', 1, 'Users'),
(35, 'OnBeforeUserSave', 1, 'Users'),
(36, 'OnCacheUpdate', 4, ''),
(37, 'OnChunkFormDelete', 1, 'Chunks'),
(38, 'OnChunkFormPrerender', 1, 'Chunks'),
(39, 'OnChunkFormRender', 1, 'Chunks'),
(40, 'OnChunkFormSave', 1, 'Chunks'),
(41, 'OnCreateDocGroup', 1, 'Documents'),
(42, 'OnDocDuplicate', 1, 'Documents'),
(43, 'OnDocFormDelete', 1, 'Documents'),
(44, 'OnDocFormPrerender', 1, 'Documents'),
(45, 'OnDocFormRender', 1, 'Documents'),
(46, 'OnDocFormSave', 1, 'Documents'),
(47, 'OnDocFormTemplateRender', 1, 'Documents'),
(48, 'OnDocFormUnDelete', 1, 'Documents'),
(49, 'OnDocPublished', 5, ''),
(50, 'OnDocUnPublished', 5, ''),
(51, 'OnEmptyTrash', 1, 'Documents'),
(52, 'OnFileBrowserCopy', 1, 'File Browser Events'),
(53, 'OnFileBrowserDelete', 1, 'File Browser Events'),
(54, 'OnFileBrowserInit', 1, 'File Browser Events'),
(55, 'OnFileBrowserMove', 1, 'File Browser Events'),
(56, 'OnFileBrowserRename', 1, 'File Browser Events'),
(57, 'OnFileBrowserUpload', 1, 'File Browser Events'),
(58, 'OnFileManagerSettingsRender', 1, 'System Settings'),
(59, 'OnFileManagerUpload', 1, ''),
(60, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(61, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(62, 'OnLoadDocumentObject', 5, ''),
(63, 'OnLoadSettings', 1, 'System Settings'),
(64, 'OnLoadWebDocument', 5, ''),
(65, 'OnLoadWebPageCache', 4, ''),
(66, 'OnLogEvent', 1, 'Log Event'),
(67, 'OnLogPageHit', 5, ''),
(68, 'OnMakeDocUrl', 5, ''),
(69, 'OnMakePageCacheKey', 4, ''),
(70, 'OnManagerFrameLoader', 2, ''),
(71, 'OnManagerLoginFormPrerender', 2, ''),
(72, 'OnManagerLoginFormRender', 2, ''),
(73, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(74, 'OnManagerMenuPrerender', 2, ''),
(75, 'OnManagerNodePrerender', 2, ''),
(76, 'OnManagerNodeRender', 2, ''),
(77, 'OnManagerPageInit', 2, ''),
(78, 'OnManagerPreFrameLoader', 2, ''),
(79, 'OnManagerTopPrerender', 2, ''),
(80, 'OnManagerTreeInit', 2, ''),
(81, 'OnManagerTreePrerender', 2, ''),
(82, 'OnManagerTreeRender', 2, ''),
(83, 'OnManagerWelcomeHome', 2, ''),
(84, 'OnManagerWelcomePrerender', 2, ''),
(85, 'OnManagerWelcomeRender', 2, ''),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnModFormDelete', 1, 'Modules'),
(88, 'OnModFormPrerender', 1, 'Modules'),
(89, 'OnModFormRender', 1, 'Modules'),
(90, 'OnModFormSave', 1, 'Modules'),
(91, 'OnPageNotFound', 1, ''),
(92, 'OnPageUnauthorized', 1, ''),
(93, 'OnParseDocument', 5, ''),
(94, 'OnParseProperties', 5, ''),
(95, 'OnPluginFormDelete', 1, 'Plugins'),
(96, 'OnPluginFormPrerender', 1, 'Plugins'),
(97, 'OnPluginFormRender', 1, 'Plugins'),
(98, 'OnPluginFormSave', 1, 'Plugins'),
(99, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(100, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(101, 'OnSecuritySettingsRender', 1, 'System Settings'),
(102, 'OnSiteRefresh', 1, ''),
(103, 'OnSiteSettingsRender', 1, 'System Settings'),
(104, 'OnSnipFormDelete', 1, 'Snippets'),
(105, 'OnSnipFormPrerender', 1, 'Snippets'),
(106, 'OnSnipFormRender', 1, 'Snippets'),
(107, 'OnSnipFormSave', 1, 'Snippets'),
(108, 'OnStripAlias', 1, 'Documents'),
(109, 'OnTempFormDelete', 1, 'Templates'),
(110, 'OnTempFormPrerender', 1, 'Templates'),
(111, 'OnTempFormRender', 1, 'Templates'),
(112, 'OnTempFormSave', 1, 'Templates'),
(113, 'OnTVFormDelete', 1, 'Template Variables'),
(114, 'OnTVFormPrerender', 1, 'Template Variables'),
(115, 'OnTVFormRender', 1, 'Template Variables'),
(116, 'OnTVFormSave', 1, 'Template Variables'),
(117, 'OnUserAuthentication', 1, 'Users'),
(118, 'OnUserChangePassword', 1, 'Users'),
(119, 'OnUserCreateGroup', 1, 'Users'),
(120, 'OnUserDelete', 1, 'Users'),
(121, 'OnUserFormPrerender', 1, 'Users'),
(122, 'OnUserFormRender', 1, 'Users'),
(123, 'OnUserLogin', 1, 'Users'),
(124, 'OnUserLogout', 1, 'Users'),
(125, 'OnUserSave', 1, 'Users'),
(126, 'OnUserSettingsRender', 1, 'System Settings'),
(127, 'OnWebPageComplete', 5, ''),
(128, 'OnWebPageInit', 5, ''),
(129, 'OnWebPagePrerender', 5, ''),
(130, 'OnBeforeMailSend', 1, ''),
(131, 'OnBeforeClientSettingsSave', 6, 'ClientSettings'),
(132, 'OnClientSettingsSave', 6, 'ClientSettings'),
(133, 'OnInitializeCommerce', 6, 'Commerce'),
(134, 'OnCommerceInitialized', 6, 'Commerce'),
(135, 'OnInitializeOrderProcessor', 6, 'Commerce'),
(136, 'OnInitializeOrderForm', 6, 'Commerce'),
(137, 'OnCollectSubtotals', 6, 'Commerce'),
(138, 'OnRegisterDelivery', 6, 'Commerce'),
(139, 'OnRegisterPayments', 6, 'Commerce'),
(140, 'OnBeforeOrderAddonsRender', 6, 'Commerce'),
(141, 'OnBeforeCartItemAdding', 6, 'Commerce'),
(142, 'OnBeforeCartItemUpdating', 6, 'Commerce'),
(143, 'OnBeforeCartItemRemoving', 6, 'Commerce'),
(144, 'OnBeforeCartCleaning', 6, 'Commerce'),
(145, 'OnCartChanged', 6, 'Commerce'),
(146, 'OnOrderRawDataChanged', 6, 'Commerce'),
(147, 'OnBeforeOrderProcessing', 6, 'Commerce'),
(148, 'OnBeforePaymentProcess', 6, 'Commerce'),
(149, 'OnBeforePaymentCreate', 6, 'Commerce'),
(150, 'OnBeforeOrderSaving', 6, 'Commerce'),
(151, 'OnBeforeOrderDeleting', 6, 'Commerce'),
(152, 'OnBeforeOrderSending', 6, 'Commerce'),
(153, 'OnOrderSaved', 6, 'Commerce'),
(154, 'OnOrderDeleted', 6, 'Commerce'),
(155, 'OnOrderPaid', 6, 'Commerce'),
(156, 'OnOrderProcessed', 6, 'Commerce'),
(157, 'OnBeforeOrderHistoryUpdate', 6, 'Commerce'),
(158, 'OnBeforeCustomerNotifySending', 6, 'Commerce'),
(159, 'OnManagerBeforeOrdersListRender', 6, 'Commerce'),
(160, 'OnManagerOrdersListRender', 6, 'Commerce'),
(161, 'OnManagerBeforeOrderRender', 6, 'Commerce'),
(162, 'OnManagerOrderRender', 6, 'Commerce'),
(163, 'OnManagerBeforeOrderEditRender', 6, 'Commerce'),
(164, 'OnManagerOrderEditRender', 6, 'Commerce'),
(165, 'OnManagerBeforeOrderValidating', 6, 'Commerce'),
(166, 'OnManagerOrderValidated', 6, 'Commerce'),
(167, 'OnManagerStatusesListRender', 6, 'Commerce'),
(168, 'OnManagerStatusRender', 6, 'Commerce'),
(169, 'OnManagerCurrencyListRender', 6, 'Commerce'),
(170, 'OnManagerCurrencyRender', 6, 'Commerce'),
(171, 'OnManagerBeforeDefaultCurrencyChange', 6, 'Commerce'),
(172, 'OnManagerRegisterCommerceController', 6, 'Commerce'),
(173, 'OnBeforeCurrencyChange', 6, 'Commerce'),
(174, 'OnCommerceAjaxResponse', 6, 'Commerce'),
(175, 'OnOrderPlaceholdersPopulated', 6, 'Commerce');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_system_settings`
--

CREATE TABLE `adkq_system_settings` (
  `setting_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `setting_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_system_settings`
--

INSERT INTO `adkq_system_settings` (`setting_name`, `setting_value`) VALUES
('_token', '1Qu9qYXJIDhQegh0Loe5gntJN6bEjLV9K2Pbwl26'),
('a', '30'),
('alias_listing', '1'),
('allow_duplicate_alias', '0'),
('allow_eval', 'with_scan'),
('allow_multiple_emails', '0'),
('auto_menuindex', '1'),
('auto_template_logic', 'sibling'),
('automatic_alias', '1'),
('blocked_minutes', '60'),
('cache_default', '0'),
('cache_type', '2'),
('captcha_words', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('captcha_words_default', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('check_files_onlogin', 'index.php\n.htaccess\nmanager/index.php\n/core/config/database/connections/default.php'),
('chunk_processor', 'DLTemplate'),
('clean_uploaded_filename', '1'),
('client_company_address', 'ул. Добрых Строителей, 29'),
('client_company_city', 'Магадан'),
('client_company_email', 'example@example.com'),
('client_company_name', 'Наш магазинчик'),
('client_company_phone', '+7987-654-32-10'),
('client_company_zip', '16000'),
('clientResize', '0'),
('ControllerNamespace', ''),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('datepicker_offset', '-10'),
('datetime_format', 'dd-mm-YYYY'),
('default_template', '1'),
('denyExtensionRename', '0'),
('denyZipDownload', '0'),
('disable_chunk_cache', '0'),
('disable_plugins_cache', '0'),
('disable_snippet_cache', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('email_method', 'mail'),
('email_sender_method', '1'),
('emailsender', 'admin@local.local'),
('emailsubject', 'Данные для авторизации'),
('emailsubject_default', 'Данные для авторизации'),
('enable_bindings', '1'),
('enable_cache', '1'),
('error_page', '1'),
('error_reporting', '1'),
('failed_login_attempts', '3'),
('fck_editor_autolang', '0'),
('fck_editor_toolbar', 'standard'),
('fe_editor_lang', 'ru'),
('filemanager_path', 'D:/OSPanel/domains/demoshop.localhost/'),
('friendly_alias_urls', '1'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('friendly_urls', '1'),
('global_tabs', '1'),
('group_tvs', '1'),
('jpegQuality', '90'),
('lang_code', 'ru'),
('login_bg', ''),
('login_form_position', 'left'),
('login_form_style', 'dark'),
('login_logo', ''),
('make_folders', '0'),
('manager_direction', 'ltr'),
('manager_language', 'ru'),
('manager_layout', '4'),
('manager_menu_position', 'top'),
('manager_theme', 'default'),
('manager_theme_mode', '3'),
('maxImageHeight', '2200'),
('maxImageWidth', '2600'),
('minifyphp_incache', '0'),
('modx_charset', 'UTF-8'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('noThumbnailsRecreation', '0'),
('number_of_logs', '100'),
('number_of_results', '30'),
('old_template', '1'),
('publish_default', '1'),
('rb_base_dir', 'D:/OSPanel/domains/demoshop.localhost/assets/'),
('rb_base_url', 'assets/'),
('rb_webuser', '0'),
('reload_captcha_words', ''),
('reload_emailsubject', ''),
('reload_site_unavailable', ''),
('reload_system_email_webreminder_message', ''),
('reload_websignupemail_message', ''),
('remember_last_tab', '1'),
('resource_tree_node_name', 'pagetitle'),
('rss_url_news', 'https://github.com/evocms-community/evolution/releases.atom'),
('rss_url_security', 'https://github.com/extras-evolution/security-fix/releases.atom'),
('safe_functions_at_eval', 'time,date,strtotime,strftime'),
('search_default', '1'),
('send_errormail', '0'),
('seostrict', '1'),
('server_offset_time', '0'),
('server_protocol', 'http'),
('session_timeout', '15'),
('session.cookie.lifetime', '604800'),
('settings_version', '3.1.29'),
('show_fullscreen_btn', '0'),
('show_newresource_btn', '0'),
('show_picker', '0'),
('showHiddenFiles', '0'),
('site_id', '670a8e3b371b8'),
('site_name', 'DemoShop'),
('site_start', '1'),
('site_status', '1'),
('site_unavailable_message', 'В настоящее время сайт недоступен.'),
('site_unavailable_page', ''),
('siteunavailable_message_default', 'ru'),
('smtp_auth', '0'),
('smtp_autotls', '0'),
('smtp_host', 'smtp.example.com'),
('smtp_port', '25'),
('smtp_secure', 'none'),
('smtp_username', 'emailsender'),
('strip_image_paths', '1'),
('sys_files_checksum', 'a:4:{s:47:\"D:/OSPanel/domains/demoshop.localhost/index.php\";s:32:\"599511a98673763d066ea76b9e50fbb0\";s:47:\"D:/OSPanel/domains/demoshop.localhost/.htaccess\";s:32:\"4d525766cb6232034562a1732ec06a9c\";s:55:\"D:/OSPanel/domains/demoshop.localhost/manager/index.php\";s:32:\"19c60de055d5efeb3fdd9debde124cb7\";s:83:\"D:/OSPanel/domains/demoshop.localhost//core/config/database/connections/default.php\";s:32:\"2a1d4462d1d3ac6fc9a08388011510fa\";}'),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация'),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
('theme_refresher', ''),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('thumbWidth', '150'),
('tinymce4_blockFormats', 'Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
('tinymce4_custom_buttons1', 'undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
('tinymce4_custom_buttons2', 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect'),
('tinymce4_custom_buttons3', ''),
('tinymce4_custom_buttons4', ''),
('tinymce4_custom_plugins', 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
('tinymce4_element_format', 'xhtml'),
('tinymce4_entermode', 'p'),
('tinymce4_schema', 'html5'),
('tinymce4_skin', 'lightgray'),
('tinymce4_skintheme', 'inlite'),
('tinymce4_template_chunks', ''),
('tinymce4_template_docs', ''),
('tinymce4_theme', 'custom'),
('track_visitors', '0'),
('tree_page_click', '27'),
('tree_show_protected', '0'),
('udperms_allowroot', '0'),
('unauthorized_page', '1'),
('UpgradeRepository', ''),
('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,webp,tpl'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg,webp'),
('upload_maxsize', '10485760'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('use_alias_path', '1'),
('use_breadcrumbs', '0'),
('use_browser', '1'),
('use_captcha', '0'),
('use_editor', '1'),
('use_udperms', '1'),
('validate_referer', '1'),
('warning_visibility', '0'),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация'),
('websignupemail_message', 'Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация'),
('which_browser', 'mcpuk'),
('which_editor', 'none'),
('xhtml_urls', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_users`
--

CREATE TABLE `adkq_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cachepwd` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_to` timestamp NULL DEFAULT NULL,
  `verified_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_users`
--

INSERT INTO `adkq_users` (`id`, `username`, `password`, `cachepwd`, `refresh_token`, `access_token`, `valid_to`, `verified_key`) VALUES
(1, 'admin', '$P$BhxwuOxPF0Hm1XIl7uHldIOLU4eyGu0', '', '40b8961a57ab94c6359418798e2cbb2338d809a91723904d10613c8417029d57', 'fa05191e48fe07b6f9ac9b695b30f2a1ba34bcc2a05a869b42775e0827c41017', '2024-11-01 05:23:14', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_user_attributes`
--

CREATE TABLE `adkq_user_attributes` (
  `id` int(11) NOT NULL,
  `internalKey` int(11) NOT NULL DEFAULT 0,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 0,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobilephone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `blocked` int(11) NOT NULL DEFAULT 0,
  `blockeduntil` int(11) NOT NULL DEFAULT 0,
  `blockedafter` int(11) NOT NULL DEFAULT 0,
  `logincount` int(11) NOT NULL DEFAULT 0,
  `lastlogin` int(11) NOT NULL DEFAULT 0,
  `thislogin` int(11) NOT NULL DEFAULT 0,
  `failedlogincount` int(11) NOT NULL DEFAULT 0,
  `sessionid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dob` int(11) DEFAULT 0,
  `gender` int(11) NOT NULL DEFAULT 0 COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `verified` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_user_attributes`
--

INSERT INTO `adkq_user_attributes` (`id`, `internalKey`, `fullname`, `first_name`, `last_name`, `middle_name`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`, `verified`) VALUES
(1, 1, '', NULL, NULL, NULL, 1, 'admin@local.local', '', '', 0, 0, 0, 5, 1730398993, 1730398993, 0, '1', 0, 0, '', '', '', '', '', '', '', NULL, 1728745019, 1730398994, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_user_roles`
--

CREATE TABLE `adkq_user_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adkq_user_roles`
--

INSERT INTO `adkq_user_roles` (`id`, `name`, `description`) VALUES
(1, 'Administrator', 'Site administrators have full access to all functions'),
(2, 'Editor', 'Limited to managing content'),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings');

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_user_role_vars`
--

CREATE TABLE `adkq_user_role_vars` (
  `tmplvarid` int(11) NOT NULL DEFAULT 0,
  `roleid` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_user_settings`
--

CREATE TABLE `adkq_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `setting_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `adkq_user_values`
--

CREATE TABLE `adkq_user_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tmplvarid` int(11) NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL DEFAULT 0,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adkq_active_users`
--
ALTER TABLE `adkq_active_users`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `adkq_active_user_locks`
--
ALTER TABLE `adkq_active_user_locks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`);

--
-- Индексы таблицы `adkq_active_user_sessions`
--
ALTER TABLE `adkq_active_user_sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `adkq_categories`
--
ALTER TABLE `adkq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_commerce_currency`
--
ALTER TABLE `adkq_commerce_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `adkq_commerce_orders`
--
ALTER TABLE `adkq_commerce_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `adkq_commerce_order_history`
--
ALTER TABLE `adkq_commerce_order_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`status_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `adkq_commerce_order_payments`
--
ALTER TABLE `adkq_commerce_order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `original_order_id` (`original_order_id`),
  ADD KEY `original_order_id_2` (`original_order_id`);

--
-- Индексы таблицы `adkq_commerce_order_products`
--
ALTER TABLE `adkq_commerce_order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`product_id`);

--
-- Индексы таблицы `adkq_commerce_order_statuses`
--
ALTER TABLE `adkq_commerce_order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_documentgroup_names`
--
ALTER TABLE `adkq_documentgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `adkq_document_groups`
--
ALTER TABLE `adkq_document_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  ADD KEY `document_group` (`document_group`),
  ADD KEY `document` (`document`);

--
-- Индексы таблицы `adkq_event_log`
--
ALTER TABLE `adkq_event_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_log_user_index` (`user`);

--
-- Индексы таблицы `adkq_list_catagory_table`
--
ALTER TABLE `adkq_list_catagory_table`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_list_value_table`
--
ALTER TABLE `adkq_list_value_table`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_manager_log`
--
ALTER TABLE `adkq_manager_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager_log_internalkey_index` (`internalKey`),
  ADD KEY `manager_log_action_index` (`action`),
  ADD KEY `manager_log_itemid_index` (`itemid`),
  ADD KEY `manager_log_itemname_index` (`itemname`),
  ADD KEY `manager_log_message_index` (`message`),
  ADD KEY `manager_log_timestamp_index` (`timestamp`);

--
-- Индексы таблицы `adkq_membergroup_access`
--
ALTER TABLE `adkq_membergroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_membergroup_names`
--
ALTER TABLE `adkq_membergroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `membergroup_names_name_unique` (`name`);

--
-- Индексы таблицы `adkq_member_groups`
--
ALTER TABLE `adkq_member_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_member` (`user_group`,`member`);

--
-- Индексы таблицы `adkq_migrations_install`
--
ALTER TABLE `adkq_migrations_install`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_permissions`
--
ALTER TABLE `adkq_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_permissions_groups`
--
ALTER TABLE `adkq_permissions_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_role_permissions`
--
ALTER TABLE `adkq_role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_site_content`
--
ALTER TABLE `adkq_site_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `typeidx` (`type`),
  ADD KEY `aliasidx` (`alias`),
  ADD KEY `parent` (`parent`),
  ADD KEY `pub_unpub_published` (`pub_date`,`unpub_date`,`published`),
  ADD KEY `pub_unpub` (`pub_date`,`unpub_date`),
  ADD KEY `unpub` (`unpub_date`),
  ADD KEY `pub` (`pub_date`);
ALTER TABLE `adkq_site_content` ADD FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`);

--
-- Индексы таблицы `adkq_site_content_categories`
--
ALTER TABLE `adkq_site_content_categories`
  ADD UNIQUE KEY `link` (`doc`,`category`) USING BTREE,
  ADD KEY `doc` (`doc`),
  ADD KEY `category` (`category`);

--
-- Индексы таблицы `adkq_site_content_closure`
--
ALTER TABLE `adkq_site_content_closure`
  ADD PRIMARY KEY (`closure_id`);

--
-- Индексы таблицы `adkq_site_htmlsnippets`
--
ALTER TABLE `adkq_site_htmlsnippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_site_modules`
--
ALTER TABLE `adkq_site_modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_site_module_access`
--
ALTER TABLE `adkq_site_module_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_site_module_depobj`
--
ALTER TABLE `adkq_site_module_depobj`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_site_plugins`
--
ALTER TABLE `adkq_site_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_site_plugin_events`
--
ALTER TABLE `adkq_site_plugin_events`
  ADD PRIMARY KEY (`pluginid`,`evtid`);

--
-- Индексы таблицы `adkq_site_snippets`
--
ALTER TABLE `adkq_site_snippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_site_templates`
--
ALTER TABLE `adkq_site_templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_site_tmplvars`
--
ALTER TABLE `adkq_site_tmplvars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indx_rank` (`rank`);

--
-- Индексы таблицы `adkq_site_tmplvar_access`
--
ALTER TABLE `adkq_site_tmplvar_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_site_tmplvar_contentvalues`
--
ALTER TABLE `adkq_site_tmplvar_contentvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  ADD KEY `idx_tmplvarid` (`tmplvarid`),
  ADD KEY `idx_id` (`contentid`);
ALTER TABLE `adkq_site_tmplvar_contentvalues` ADD FULLTEXT KEY `content_ft_idx` (`value`);

--
-- Индексы таблицы `adkq_site_tmplvar_templates`
--
ALTER TABLE `adkq_site_tmplvar_templates`
  ADD PRIMARY KEY (`tmplvarid`,`templateid`);

--
-- Индексы таблицы `adkq_system_eventnames`
--
ALTER TABLE `adkq_system_eventnames`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_eventnames_name_unique` (`name`);

--
-- Индексы таблицы `adkq_system_settings`
--
ALTER TABLE `adkq_system_settings`
  ADD PRIMARY KEY (`setting_name`);

--
-- Индексы таблицы `adkq_users`
--
ALTER TABLE `adkq_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `web_users_username_unique` (`username`);

--
-- Индексы таблицы `adkq_user_attributes`
--
ALTER TABLE `adkq_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_user_attributes_internalkey_index` (`internalKey`);

--
-- Индексы таблицы `adkq_user_roles`
--
ALTER TABLE `adkq_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `adkq_user_role_vars`
--
ALTER TABLE `adkq_user_role_vars`
  ADD PRIMARY KEY (`tmplvarid`,`roleid`);

--
-- Индексы таблицы `adkq_user_settings`
--
ALTER TABLE `adkq_user_settings`
  ADD PRIMARY KEY (`user`,`setting_name`),
  ADD KEY `user_settings_user_index` (`user`),
  ADD KEY `setting_name` (`setting_name`);

--
-- Индексы таблицы `adkq_user_values`
--
ALTER TABLE `adkq_user_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_values_tmplvarid_userid_unique` (`tmplvarid`,`userid`),
  ADD KEY `user_values_tmplvarid_index` (`tmplvarid`),
  ADD KEY `user_values_userid_index` (`userid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `adkq_active_user_locks`
--
ALTER TABLE `adkq_active_user_locks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT для таблицы `adkq_categories`
--
ALTER TABLE `adkq_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `adkq_commerce_currency`
--
ALTER TABLE `adkq_commerce_currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `adkq_commerce_orders`
--
ALTER TABLE `adkq_commerce_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `adkq_commerce_order_history`
--
ALTER TABLE `adkq_commerce_order_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `adkq_commerce_order_payments`
--
ALTER TABLE `adkq_commerce_order_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `adkq_commerce_order_products`
--
ALTER TABLE `adkq_commerce_order_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `adkq_commerce_order_statuses`
--
ALTER TABLE `adkq_commerce_order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `adkq_documentgroup_names`
--
ALTER TABLE `adkq_documentgroup_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `adkq_document_groups`
--
ALTER TABLE `adkq_document_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `adkq_event_log`
--
ALTER TABLE `adkq_event_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT для таблицы `adkq_list_catagory_table`
--
ALTER TABLE `adkq_list_catagory_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `adkq_list_value_table`
--
ALTER TABLE `adkq_list_value_table`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `adkq_manager_log`
--
ALTER TABLE `adkq_manager_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT для таблицы `adkq_membergroup_access`
--
ALTER TABLE `adkq_membergroup_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `adkq_membergroup_names`
--
ALTER TABLE `adkq_membergroup_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `adkq_member_groups`
--
ALTER TABLE `adkq_member_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `adkq_migrations_install`
--
ALTER TABLE `adkq_migrations_install`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT для таблицы `adkq_permissions`
--
ALTER TABLE `adkq_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблицы `adkq_permissions_groups`
--
ALTER TABLE `adkq_permissions_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `adkq_role_permissions`
--
ALTER TABLE `adkq_role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT для таблицы `adkq_site_content`
--
ALTER TABLE `adkq_site_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT для таблицы `adkq_site_content_closure`
--
ALTER TABLE `adkq_site_content_closure`
  MODIFY `closure_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `adkq_site_htmlsnippets`
--
ALTER TABLE `adkq_site_htmlsnippets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `adkq_site_modules`
--
ALTER TABLE `adkq_site_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `adkq_site_module_access`
--
ALTER TABLE `adkq_site_module_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `adkq_site_module_depobj`
--
ALTER TABLE `adkq_site_module_depobj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `adkq_site_plugins`
--
ALTER TABLE `adkq_site_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `adkq_site_snippets`
--
ALTER TABLE `adkq_site_snippets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `adkq_site_templates`
--
ALTER TABLE `adkq_site_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `adkq_site_tmplvars`
--
ALTER TABLE `adkq_site_tmplvars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `adkq_site_tmplvar_access`
--
ALTER TABLE `adkq_site_tmplvar_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `adkq_site_tmplvar_contentvalues`
--
ALTER TABLE `adkq_site_tmplvar_contentvalues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=427;

--
-- AUTO_INCREMENT для таблицы `adkq_system_eventnames`
--
ALTER TABLE `adkq_system_eventnames`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT для таблицы `adkq_users`
--
ALTER TABLE `adkq_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `adkq_user_attributes`
--
ALTER TABLE `adkq_user_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `adkq_user_roles`
--
ALTER TABLE `adkq_user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `adkq_user_values`
--
ALTER TABLE `adkq_user_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `adkq_commerce_order_history`
--
ALTER TABLE `adkq_commerce_order_history`
  ADD CONSTRAINT `commerce_order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `adkq_commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `adkq_commerce_order_payments`
--
ALTER TABLE `adkq_commerce_order_payments`
  ADD CONSTRAINT `commerce_order_payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `adkq_commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `adkq_commerce_order_products`
--
ALTER TABLE `adkq_commerce_order_products`
  ADD CONSTRAINT `commerce_order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `adkq_commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
