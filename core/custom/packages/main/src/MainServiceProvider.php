<?php namespace EvolutionCMS\Main;

use EvolutionCMS\ServiceProvider;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\Route;

class MainServiceProvider extends ServiceProvider
{
    protected $namespace = 'main';

    public function boot(){
        Blade::directive('price', function ($params) {
            return '<?php echo EvolutionCMS\Main\Helpers\Utils::formatPrice(' . $params . '); ?>';
        });
        
    }
    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        Route::group(['middleware' => 'bindings'], function () {
            $this->loadRoutesFrom(__DIR__ . '/../routes.php');
        });
        $this->loadPluginsFrom(
            dirname(__DIR__) . '/plugins/'
        );
        //use this code for each module what you want add
        /*$this->app->registerModule(
            'module from file',
            dirname(__DIR__).'/modules/module.php'
        );*/
    }
}