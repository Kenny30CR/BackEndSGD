<?php
use Slim\Factory\AppFactory;

require __DIR__ . '/../../vendor/autoload.php';


$auxiliar = new \DI\Container;
AppFactory::setContainer($auxiliar);

$app = AppFactory::create();
$app->addErrorMiddleware(true,true,true);
$app->add(new Tuupola\Middleware\JwtAuthentication([
    "secure" => false,
    "secret" => 'jdfnvojefnvoenfvekjnvkjefnekjfnvjkefnvjefnvenfj',
    "ignore" => ["/auth"]
    //"ignore" => ["/"]
]));

$container = $app->getContainer();

require 'Routes.php';
require 'Config.php';
require 'Conexion.php';

$app->run();

