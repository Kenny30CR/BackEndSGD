<?php
$container->set('Config_bd',function(){
    return(object)[
        "host" => "localhost",
        "bd" => "SGD",
        "usr" =>  "root",
        "pass" => "root", //root
        "charset" => "utf8",
        'collation' => 'utf8_spanish_ci',
    ];
});
