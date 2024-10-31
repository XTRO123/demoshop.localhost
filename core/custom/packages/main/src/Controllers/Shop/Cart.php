<?php

namespace EvolutionCMS\Main\Controllers\Shop;

use Carbon\Carbon;
use EvolutionCMS\Main\Controllers\BaseController;

/**
 * Страница корзины
 */
class Cart extends BaseController
{

    public function setPageData()
    {
        $cart = evo()->runSnippet('Order', [
            'cartName' => $this->data['cart_instance'],
            'errorTpl' => '@CODE:<div class="invalid-feedback">[+message+]</div>',
            'errorClass' => 'is-invalid',
            'requiredClass' => 'is-invalid',
            'templatePath' => 'views/',
            'formTpl' => '@B_FILE: cart/sendpage/order',
            'deliveryTpl' => '@B_FILE:cart/sendpage/order_delivery',
            'deliveryRowTpl' => '@B_FILE:cart/sendpage/order_delivery_row',
            'paymentsTpl' => '@B_FILE:cart/sendpage/order_payments',
            'paymentsRowTpl' => '@B_FILE:cart/sendpage/order_payments_row',
            'reportTpl' => '@B_FILE:cart/sendpage/reports/order_report_admin',
            'ccSenderTpl' => '@B_FILE:cart/sendpage/reports/order_report_user',
            'subjectTpl' => '@B_FILE:cart/sendpage/reports/order_report_subject',
            'ccSubjectTpl' => '@B_FILE:cart/sendpage/reports/order_report_subject',
            'rules' => [
                'name' => [
                    'required' => 'Введите имя',
                ],
                'email' => [
                    'required' => 'Введите email',
                    'email' => 'Неверная почта',
                ],
                'phone' => [
                    'required' => 'Введите номер телефона',
                    'phone' => 'Неверный телефон',
                ],

            ],

            'protectSubmit' => 0,
            'submitLimit' => 0,
        ]);
        $this->data['cart'] = $cart;
  
    }
}
