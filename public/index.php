<?php
header('Access-Control-Allow-Origin: *');
echo"fdds";
header('Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-with, Content-Type, Accept, Access-Control-Request-Method, Authorization');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Allow: GET, POST, OPTIONS, PUT, DELETE');
$method=$_SERVER['REQUEST_METHOD'];
if($method=="OPTIONS"){
    die();
}
require __DIR__ . '/../src/App/App.php';
