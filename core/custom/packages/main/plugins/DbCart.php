<?php

use Illuminate\Support\Facades\Event;

use Commerce\Carts\ProductsCart;
use Commerce\Carts\SessionCartStore;
use Commerce\Currency;
use EvolutionCMS\Facades\AuthServices as Auth;
use EvolutionCMS\Main\Controllers\Shop\DbCartClass;


Event::listen(['evolution.OnInitializeCommerce'], function ($params) {
	ci()->commerce->currency = new Currency(evo());
	$carts = ci()->carts;

	$carts->registerStore('session', SessionCartStore::class);
	//$carts->registerStore('custom_db', DbCartClass::class);

	$cartSession = new ProductsCart(evo(),'session_products_instance','session');
	//$cartDb = new ProductsCart(evo(), 'db_products_instance', 'custom_db');
	$carts->addCart('session_products_instance', $cartSession);
	//$carts->addCart('db_products_instance', $cartDb);
});


Event::listen(['evolution.OnUserLogout'], function ($params) {

});

