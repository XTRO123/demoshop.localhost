<?php

use Illuminate\Support\Facades\Event;

/**
 * Плагин на смену статусов заказа
 * Если изменил статус в админке, юзеру идёт нотис 
 * с шаблоном блейда
 * Можно устроить switch по $params['status_id'], 
 * чтобы делать разные шаблоны и тексты уведомлений
 */
/*
Event::listen(
    ['evolution.OnBeforeCustomerNotifySending'],
    function ($params) {
        if ($params['status_id']) {
            $params['subject'] = '@CODE: У вашего заказа новый статус';
        }
        $params['data']['newkey'] = 'newvalue';
        $params['body'] = '@B_FILE: cart.notify.order_changed';
    }
);
*/
