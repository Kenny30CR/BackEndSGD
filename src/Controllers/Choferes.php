<?php
namespace App\Controllers;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class Choferes extends BaseBD{

    public function consultarTodos(Request $request, Response $response, array $args){
        $indice= $args ['indice'];
        $limite= $args ['limite'];
        $this->iniciar('Choferes','idChofer');
        $datos= $this->todos($indice,$limite);
        $status= sizeof($datos) > 0 ? 200 : 204;
        $response->getBody()->write(json_encode($datos));
        return $response->withHeader('Content-Type','application/json')->withStatus($status);
    }

    public function buscarCodigo(Request $request, Response $response, $args) {
        $codigo = $args['codigo'];
        $this->iniciar('Choferes','idChofer');
        $datos= $this->buscar($codigo);
        $status= sizeof($datos) > 0 ? 200 : 404;
        $response->getBody()->write(json_encode($datos));
        return $response->withHeader('Content-Type','application/json')->withStatus($status);
    }

    
    public function nuevo(Request $request, Response $response, $args) {
        $this->iniciar('Choferes','idChofer');
        $body= json_decode($request->getBody());
        $datos= $this->guardar($body);
        $status= $datos[0] > 0 ? 409 : 201;
        $response->getBody()->write(json_encode($body));
        return $response
        ->withHeader('Content-Type','application/json')->withStatus($status);
    }
    
    public function filtro(Request $request, Response $response, $args) {
        $campos = explode('&',$args['campos']);
        $valores = explode('&',$args['valores']);
        $this->iniciar('Choferes','idChofer');
        $datos= $this->filtrar($campos,$valores);
        $status= sizeof($datos) > 0 ? 200 : 404;
        $response->getBody()->write(json_encode($datos));
        return $response->withHeader('Content-Type','application/json')->withStatus($status);
    
    }
    
    public function modificar(Request $request, Response $response, $args) {
        $this->iniciar('Choferes','idChofer');
        $body= json_decode($request->getBody());
        $codigo= $args['codigo'];
        $datos= $this->guardar($body, $codigo);
        switch($datos[0]){
            case 0: $status= 404;break;
            case 1: $status= 200;break;
            case 2: $status= 409;break;
        }
        //$status= $datos[0] == 0 ? 404 : 200;
        $response->getBody()->write(json_encode($body));
        return $response
        ->withHeader('Content-Type','application/json')->withStatus($status);
    }
    
    public function eliminar(Request $request, Response $response, $args) {
        $this->iniciar('Choferes','idChofer');
        $codigo=$args['codigo'];
        $datos= $this->eliminarbd($codigo);
        $status= $datos[0] == 0 ? 404 : 200;
        $response->getBody()->write(json_encode($body));
        return $response
        ->withHeader('Content-Type','application/json')->withStatus($status);
    }

}