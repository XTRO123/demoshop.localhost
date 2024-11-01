<?php

namespace EvolutionCMS\Main\Controllers\Pages;

use Carbon\Carbon;
use EvolutionCMS\Main\Controllers\BaseController;

use function PHPSTORM_META\map;

class Product  extends BaseController
{

    public function setPageData()
    {

        $brands = evo()->runSnippet("multiParams", array("parent" => "1"));
        $brands = $this->strToArray($brands);
        $colors = evo()->runSnippet("multiParams", array("parent" => "2"));
        $colors = $this->strToArray($colors);

        $brand = evo()->documentObject['product_brand'][1] ?? '';
        $color = evo()->documentObject['product_color'][1] ?? '';

        $this->data['brand_value'] = array_key_exists($brand, $brands) ? $brands[$brand] : '';
        $this->data['color_value'] = array_key_exists($color, $colors) ? $colors[$color] : '';

        $this->data['relative'] = $this->getRelativeProducts();
    }

    private function strToArray($str)
    {
        $matches = [];
        preg_match_all('/\|\|([^=]+)==(\d+)/', $str, $matches);

        $result = [];
        foreach ($matches[2] as $index => $key) {
            $result[$key] = $matches[1][$index];
        }
        return $result;
    }
    private function getRelativeProducts()
    {
        /**
         * @var Object
         */
        $result = evo()->runSnippet('DocLister', [
            'parents' => evo()->documentObject['parent'],
            'orderBy' => 'RAND()',
            'depth' => 1,
            'tvPrefix' => '',
            'tvList' => 'price,product_photo,in_stock',
            'returnDLObject' => 1,
            'addWhereList' => 'c.template = ' . evo()->getConfig('product_template_id'),    //  only products
            'display' => 6,
        ]);
        return $result->getDocs();
    }
}
