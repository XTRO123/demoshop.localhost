[![CMS Evolution](https://img.shields.io/badge/CMS-Evolution-brightgreen.svg)](https://github.com/evocms-community/evolution)  ![PHP version](https://img.shields.io/badge/PHP->=v8.1-green.svg?php=7.4)

Демонстрационный магазин, сделанный на Evolution CMS 3.x.

Демо: [demoshop.kazunin.ru](https://demoshop.kazunin.ru/)

Функционал:
* каталог
* фасетная фильтрация товаров
* добавление в корзину
* оформление заказа
* капча Яндекс



## Установка:
* скачать дамп или клонировать репозиторий
* создать БД, импортировать в неё `demoshop.sql`.
* удалить `demoshop.sql`
* настроить окружение в файле `/core/custom/.env` (пример в `.env.example`)
* создать файл `core\config\database\connections\default.php` и в нём  продублировать настройки (пример `core/config/database/connections/default.example`). В будущем этот файл будет не нужен.
* получить ключи для [капчи Яндекс](https://community.evocms.ru/blog/docs/yandexcaptcha-i-formlister-s-ajaxjson.html)
* задать настройки сайта в файле `/core/custom/config/cms/settings.php`  (пример  в `settings.php.example`)
* переименовать `ht.access` в `.htaccess`
* сделать `robots.txt` на основе `sample-robots.txt`
* сделать `composer update` в папке `core`.
* удалить `demoshop.sql`

Логин/пароль для админки - `admin/admin`.