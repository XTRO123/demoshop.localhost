<?php
namespace EvolutionCMS\Main\Controllers;

use EvolutionCMS\TemplateController;

/**
 * заставляем реализовать метод setPageData
 */
abstract class AbstractBase extends TemplateController{
    abstract  public function setPageData();
}