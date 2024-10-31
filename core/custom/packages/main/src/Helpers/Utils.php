<?php

namespace EvolutionCMS\Main\Helpers;

class Utils
{
    public static function formatPrice($price, $convert = 0)
    {
        return evo()->runSnippet('PriceFormat', [
            'price' => $price,
            'convert' => $convert
        ]);
    }
    /**
     * даём на вход имя тв, получаем
     * массив в блейд
     */
    public static function mtv($tvname)
    {
        $value = json_decode(evo()->documentObject[$tvname][1], true) ?? [];
        if (isset($value['fieldValue'])) {
            $value = $value['fieldValue'];
        } else {
            $value = [];
        }

        return $value;
    }

    /**
     * Делаем галерею
     */
    public static function makeGallery($parent = 0, $crop = 'w=310&h=310&zc=1', $id = 'gallery')
    {
        return  json_decode(EvolutionCMS()->runSnippet('sgLister', [
            'thumbSnippet' => 'phpthumb',
            'thumbOptions' => $crop,
            'id' => $id,
            'parents' => $parent,
            'orderBy' => 'c.sg_index ASC',
            'api' => 1
        ]), 1);
    }

    /**
     * Получить содержимое 
     * PageBuilder на странице
     */
    public function pb($container)
    {
        $res =
            evolutionCMS()->runSnippet('PageBuilder', [
                'container' => $container,
                'renderTo' => 'array'
            ]);
        return $res[0];
    }
}
