<?php

use EvolutionCMS\Main\Controllers\Callme;
use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'ajax'], function () {
    Route::post('/callme', [Callme::class, 'send']);
});

Route::fallbackToParser();
