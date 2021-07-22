CREATE TABLE FACTURACION(
    idTenant1 int,
    FOREIGN KEY (idTenant1) REFERENCES TENANT(idTenant),
    idFactura int PRIMARY KEY,
    subcontratados varchar(20),   -- indica el subcontratado a facturar
    fechaFactura date not null,
    facturaPagada int,
    Descripcion varchar(20),
    subTotal int NOT NULL,
    montoTotal int not null, -- +IVA
    indicaciónExtra VARCHAR(20),-- Si fuera el caso de una indicación adjunta a la factura
    montoExtra double -- Si fuera el caso de un extra
)ENGINE=InnoDB CHARACTER SET utf8;


CREATE TABLE FACTURACIONXORDENDESP(
    idTenant1 int,
    idFactura int,
    ordenDesp int,
    FOREIGN KEY (idTenant1) REFERENCES TENANT(idTenant),
    FOREIGN KEY (idFactura) REFERENCES FACTURACION(idFactura),
    FOREIGN KEY (ordenDesp) REFERENCES DESPACHO(ordenDesp)
)ENGINE=InnoDB CHARACTER SET utf8;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosOrdenesDespxFactura`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from facturacionxordendesp order by idFactura limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarOrdenesDespxFactura`(IN `_id` int(11))
begin
    select * from facturacionxordendesp where idFactura = _idFactura;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscaridOrdenesDespxFactura`(IN `_id` int(11))
begin
    select * from facturacionxordendesp where id = _id;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoOrdenesDespxFactura`(`_id` int(11),`_idTenant` int(11),  `_idFactura` int(11), `_ordenDesp` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(id) into _cant from facturacionxordendesp where id = _id;
    if _cant < 1 then
        insert into facturacionxordendesp
        (id,idTenant1,idFactura,ordenDesp) 
			values (_id,_idTenant,_idFactura,_ordenDesp);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarOrdenesDespxFactura`(`_id` int(11),  `_ordenDesp` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(id) into _cant from tenant where id = _id;
    if _cant = 1 then
		
        update facturacionxordendesp set   
                ordenDesp=_ordenDesp
        where id = _id;
        set _cant=1;
        else 
        set _cant=2;
 
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarOrdenesDespxFactura`(`_id` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(id) into _cant from tenant where id = _id;
    if _cant > 0 then
        delete from facturacionxordendesp where id = _id;
    end if;
    return _cant;
end$$
DELIMITER ;