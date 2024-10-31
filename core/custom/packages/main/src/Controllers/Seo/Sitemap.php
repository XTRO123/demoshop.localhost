<?php

namespace EvolutionCMS\Main\Controllers\Seo;

use EvolutionCMS\Main\Controllers\BaseController;

/**
 * Просто делаем сайтмап
 */
class Sitemap extends BaseController
{
    public function setPageData()
    {
        $this->data['sitemap'] =
            evo()->runSnippet('DLSitemap', [
                'filters' => 'AND(tvd:sitemap_exclude:isnot:1)'
            ]);
    }
}
