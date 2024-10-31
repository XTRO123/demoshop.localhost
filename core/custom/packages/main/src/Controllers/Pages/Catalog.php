<?php

namespace EvolutionCMS\Main\Controllers\Pages;

use Carbon\Carbon;
use EvolutionCMS\Main\Controllers\BaseController;
use EvolutionCMS\Main\Traits\CatalogTrait;

class Catalog extends BaseController
{

    use CatalogTrait;
    public function setPageData()
    {
        $this->getCatalogSections();
        $this->getCatalogItems();
    }
}
