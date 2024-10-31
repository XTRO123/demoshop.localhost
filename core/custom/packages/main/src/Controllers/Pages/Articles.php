<?php

namespace EvolutionCMS\Main\Controllers\Pages;

use Carbon\Carbon;
use EvolutionCMS\Main\Controllers\BaseController;

class Articles extends BaseController
{

    public function setPageData()
    {

        $_json  = evo()->runSnippet('DocLister', [
            'parents' => evo()->getConfig('articles_id'),
            'tvPrefix' => '',
            'tvList' => 'article_photo',
            'display' => 10,
            'paginate' => 'pages',
            'config' => 'paginate:custom',
            'orderBy' => 'menuindex ASC',
            'depth' => 1,
            'addWhereList' => 'c.template = ' . evo()->getConfig('articles_template_id'),    //  only articles
            'api' => 1,
        ]);

        if (!empty($_json)) {
            $_result = json_decode($_json, 1);
        }
        $this->data['articles'] = $_result;
        $this->data['pages'] = evo()->getPlaceholder('pages');
    }
}
