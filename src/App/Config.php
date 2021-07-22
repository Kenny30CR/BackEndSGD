<?php
$container->set('Config_bd',function(){
    return(object)[
        "host" => "localhost",
        "bd" => "sgd",
        "usr" =>  "root",
        "pass" => "", //root
        "charset" => "utf8",
        'collation' => 'utf8_general_ci',
    ];
});
