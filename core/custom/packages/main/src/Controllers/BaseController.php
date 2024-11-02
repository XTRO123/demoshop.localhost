<?php

namespace EvolutionCMS\Main\Controllers;

use EvolutionCMS\Facades\AuthServices;
use EvolutionCMS\TemplateController;
use Carbon\Carbon;
use EvolutionCMS\Main\Controllers\Seo\Metatags;

abstract class BaseController extends TemplateController
{
    use Metatags;

    public $data = [];

    /**
     * Теперь она тут главная
     * вместо __construct
     */
    public function process()
    {
        $this->setGlobalData();
        $this->setPageData();
        $this->metatags();
        $this->addViewData($this->data);
    }

    /**
     * Данные текущей страницы
     * Переопределять в наследниках
     */
    abstract public  function setPageData();

    /**
     * Не переопределять,
     * Глобальные данные
     */
    final function setGlobalData()
    {
        Carbon::setLocale('ru_RU');
        if (empty(evo()->documentObject['pub_date'])) {
            $_date_field = Carbon::createFromFormat('Y-m-d\TH:i:s.uP', evo()->documentObject['createdon']);
        } else {
            $_date_field = Carbon::createFromTimestamp(evo()->documentObject['pub_date']);
        }

        $this->data['date_formatted'] = $_date_field->format('d.m.Y');
        $this->data['date_for_human'] = $_date_field->diffForHumans();

        $this->data['date_rfc'] = $_date_field->toIso8601String();
        $this->data['ControllerName'] = $this::class;
        $this->data['cart_instance'] = AuthServices::user() ? 'db_products_instance' : 'session_products_instance';
        $this->data['menu'] = $this->menu();
        $this->data['crumbs'] = $this->setCrumbs();
        $this->data['minicart'] = $this->renderCart('mini');
        $this->data['modalcart'] = $this->renderCart('modalcart');
    }

    /**
     * рисуем всякие корзины
     */
    public function renderCart($type = 'mini')
    {
        $globalParams = [
            'templatePath' => 'views/',
            'instance' => $this->data['cart_instance'],
            'tvPrefix' => '',
            'tvList' => ['product_photo'],
            'noneWrapOuter' => 1,
        ];
        $params = [];
        if ($type == 'mini') {
            $params = [
                'ownerTPL' => '@B_FILE:cart/header/wrapTpl',
                'tpl' => '@B_FILE:cart/header/rowTpl',
            ];
        }
        if ($type == 'modalcart') {
            $params = [
                'ownerTPL' => '@B_FILE: cart/modal/wrapTpl',
                'tpl' => '@B_FILE: cart/modal/rowTpl',
                'optionsTpl' => '@B_FILE: cart/modal/optionsTpl',
                'defaultOptionsRender' => 1,
                'tvList' => ['product_photo'],
            ];
        }
        return evo()->runSnippet('Cart', array_merge($params, $globalParams));
    }

    /**
     * Крошки. Конфиг кастом, лежит
     * в assets\snippets\DocLister\config\custom
     */
    public function setCrumbs()
    {
        $crumbs = evo()->runSnippet('DLCrumbs', [
            'showCurrent' => 1,
            'hideMain' => 0,
            'config' => 'crumbs:custom'
        ]);
        return  $crumbs;
    }

    /**
     * меню
     */
    public function menu()
    {
        /**
         * @var Object
         */
        $res = evo()->runSnippet('DLMenu', [
            'returnDLObject' => 1,
            'maxDepth' => 1,
            'parents' => 0
        ]);
        return $res->getMenu()[0];
    }
}
