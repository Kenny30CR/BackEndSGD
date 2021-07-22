<?php
namespace App\Controllers;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class Facturacion extends BaseBD{


    public function cantFacturas(Request $request, Response $response) {
        //$this->iniciar('Facturas','idFactura');
        $body= json_decode($request->getBody());
        $datos= $this->cantFacturas();
        $status= $datos[0] > 0 ? 409 : 201;
        $response->getBody()->write(json_encode($body));
        return $response
        ->withHeader('Content-Type','application/json')->withStatus($status);
    }

    public function buscarCodigo(Request $request, Response $response, $args) {
        $codigo = $args['codigo'];
        $this->iniciar('Facturacion','idFactura');
        $datos= $this->buscar($codigo);
        $status= sizeof($datos) > 0 ? 200 : 404;
        $response->getBody()->write(json_encode($datos));
        return $response->withHeader('Content-Type','application/json')->withStatus($status);
    }

    public function consultarTodos(Request $request, Response $response, array $args){
        $indice= $args ['indice'];
        $limite= $args ['limite'];
        $this->iniciar('cantFacturas','idFactura');
        $datos= $this->cantFacturas($indice,$limite);
        $status= sizeof($datos) > 0 ? 200 : 204;
        $response->getBody()->write(json_encode($datos));
        return $response->withHeader('Content-Type','application/json')->withStatus($status);
    }

    public function consulta(Request $request, Response $response){
        $datos= $this->validarSincronismo();
        $status= sizeof($datos) > 0 ? 200 : 204;
        $response->getBody()->write(json_encode($datos));
        return $response->withHeader('Content-Type','application/json')->withStatus($status);
    }


    
}