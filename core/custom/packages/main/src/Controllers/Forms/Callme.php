<?php

namespace EvolutionCMS\Main\Controllers\Forms;

class Callme
{
    public function send()
    {
        $result = evo()->runSnippet('FormLister', array(
            'formid' => 'form_callme',
            'api' => 2,
            'rules' => [
                "name" => [
                    "required" => "Введите имя",
                    "minLength" => [
                        "params" => 3,
                        "message" => "Имя не короче 3-х символов",
                    ],
                ],

                "phone" => [
                    "required" => "Введите телефон",
                    'phone' => "Номер неверный"
                ],
            ],

            'to' => 'xxx@xxx.xx',
            'captcha' => 'yandexCaptcha',
            'captchaField' => 'smart-token',
            'captchaParams' => [
                'secretKey' => evo()->getConfig('y-captcha-secret'),
                'siteKey' => evo()->getConfig('y-captcha-sitekey'),
            ],
        ));
        return $result;
    }
}
