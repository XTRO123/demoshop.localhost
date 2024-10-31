<?php

namespace EvolutionCMS\Main\Controllers\Pages;

use Carbon\Carbon;
use EvolutionCMS\Main\Controllers\BaseController;
use EvolutionCMS\Main\Traits\CatalogTrait;
use EvolutionCMS\Main\Traits\FilterTrait;

class Catalog extends BaseController
{

    use CatalogTrait, FilterTrait;
    public function setPageData()
    {
        /*
        Если без фильтров
        $this->getCatalogSections();
        $this->getCatalogItems();
        */

        /**
         * Если нужны фильтры
         */
        $this->makeFilter();
        $this->getFilteredCatalog();
    }
}
