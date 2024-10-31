<?php

namespace EvolutionCMS\Main\Controllers\Pages;

use Carbon\Carbon;
use EvolutionCMS\Main\Controllers\BaseController;
use EvolutionCMS\Main\Traits\CatalogTrait;

class CatalogSection extends BaseController
{

    use CatalogTrait;
    public function setPageData()
    {
        $this->getCatalogSections(evo()->documentIdentifier);
        $this->getCatalogItems(evo()->documentIdentifier);
    }
}
