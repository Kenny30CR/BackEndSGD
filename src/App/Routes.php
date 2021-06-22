<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use slim\Routing\RouteCollectorProxy;
//require __DIR__.'/../Controllers/Curso.php';
//use App\Controllers\Curso;
$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Conectado al BackEnd Sistema Gestor Despacho");
    return $response;
});
//*********************RUTAS DE FILTROS*****************
$app->get('/codigo/{tabla}',  'App\Controllers\codigo:siguienteCodigo');
$app->group('/filtrar/{tabla}',function(RouteCollectorProxy $filtro){
    $filtro->get('/numregs','App\Controllers\Filtro:cantRegs');
    $filtro->get('/{pag}/{lim}','App\Controllers\Filtro:ejecutar');
});

$app->get('/filtrar', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Controlador de filtro");
    return $response;
});

//*****************************RUTAS DE USUARIOS*******************
$app->group('/usuario',function(RouteCollectorProxy $usuario){

    $usuario->get('/{indice}/{limite}', 'App\Controllers\Usuario:consultarTodos');
    $usuario->get('/{codigo}', 'App\Controllers\Usuario:buscarCodigo');
    $usuario->get('/filtrado/{campos}/{valores}', 'App\Controllers\Usuario:filtro');
    $usuario->post('', 'App\Controllers\Usuario:nuevo');
    $usuario->put('/{codigo}', 'App\Controllers\Usuario:modificar');
    $usuario->delete('/{codigo}', 'App\Controllers\Usuario:eliminar');
});
//*****************************RUTAS DE SEGURIDAD*******************
$app->group('/auth',function(RouteCollectorProxy $seguridad){

    $seguridad->post('/iniciar', 'App\Controllers\Seguridad:iniciarSesion');
    $seguridad->post('/cerrar', 'App\Controllers\Seguridad:cerrarSesion');
    $seguridad->post('/cambioContraseña', 'App\Controllers\Seguridad:cambioContraseña');
    $seguridad->post('/resetpass', 'App\Controllers\Seguridad:resetPass');
    $seguridad->post('/refresh', 'App\Controllers\Seguridad:refrescarToken');
});

//*****************************RUTAS DE BALANCES*******************
$app->group('/balances',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\Balances:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\Balances:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\Balances:filtro');
    $balances->post('', 'App\Controllers\Balances:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\Balances:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\Balances:eliminar');
});

//*****************************RUTAS DE CHOFERES*******************
$app->group('/choferes',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\Choferes:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\Choferes:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\Choferes:filtro');
    $balances->post('', 'App\Controllers\Choferes:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\Choferes:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\Choferes:eliminar');
});

//*****************************RUTAS DE DESPACHO*******************
$app->group('/despacho',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\Despacho:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\Despacho:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\Despacho:filtro');
    $balances->post('', 'App\Controllers\Despacho:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\Despacho:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\Despacho:eliminar');
});

//*****************************RUTAS DE DESTINOS*******************
$app->group('/destinos',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\Destinos:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\Destinos:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\Destinos:filtro');
    $balances->post('', 'App\Controllers\Destinos:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\Destinos:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\Destinos:eliminar');
});

//*****************************RUTAS DE DIESEL*******************
$app->group('/diesel',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\Diesel:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\Diesel:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\Diesel:filtro');
    $balances->post('', 'App\Controllers\Diesel:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\Diesel:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\Diesel:eliminar');
});

//*****************************RUTAS DE ESTACION*******************
$app->group('/estacion',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\Estacion:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\Estacion:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\Estacion:filtro');
    $balances->post('', 'App\Controllers\Estacion:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\Estacion:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\Estacion:eliminar');
});

//*****************************RUTAS DE FACTURACION*******************
$app->group('/facturacion',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\Facturacion:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\Facturacion:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\Facturacion:filtro');
    $balances->post('', 'App\Controllers\Facturacion:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\Facturacion:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\Facturacion:eliminar');
});

//*****************************RUTAS DE FACTURACIONDIESEL*******************
$app->group('/facturaciondiesel',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\FacturacionDiesel:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\FacturacionDiesel:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\FacturacionDiesel:filtro'); 
    $balances->post('', 'App\Controllers\FacturacionDiesel:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\FacturacionDiesel:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\FacturacionDiesel:eliminar');
});

//*****************************RUTAS DE PLANILLA*******************
$app->group('/planilla',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\Planilla:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\Planilla:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\Planilla:filtro');
    $balances->post('', 'App\Controllers\Planilla:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\Planilla:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\Planilla:eliminar');
});

//*****************************RUTAS DE TENANT*******************
$app->group('/tenant',function(RouteCollectorProxy $balances){

    $balances->get('/{indice}/{limite}', 'App\Controllers\Tenant:consultarTodos');
    $balances->get('/{codigo}', 'App\Controllers\Tenant:buscarCodigo');
    $balances->get('/filtrado/{campos}/{valores}', 'App\Controllers\Tenant:filtro');
    $balances->post('', 'App\Controllers\Tenant:nuevo');
    $balances->put('/{codigo}', 'App\Controllers\Tenant:modificar');
    $balances->delete('/{codigo}', 'App\Controllers\Tenant:eliminar');
});