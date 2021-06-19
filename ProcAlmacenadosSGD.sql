-- Usuarios------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosUsuarios`(_pagina TINYINT, _cantRegs TINYINT)
begin
    select * from usuarios order by correo limit _pagina, _cantRegs;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarUsuarios`(`_id` int(11), `_correo` VARCHAR(50), `_rol` TINYINT) RETURNS int(1)
begin
    declare _cant int;
    select count(idUsuario) into _cant from usuarios where idUsuario = _id;
    if _cant > 0 then
        update usuarios set
			correo = _nombre,
            tipoUsuario = _rol
        where id = _id;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarUsuarios`(IN `_id` int(11))
begin
    select * from usuarios where idUsuario = _id;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `cambiarPasswUsuarios`(`_id` int(11), `_passw` VARCHAR(255)) RETURNS int(1)
begin
    declare _cant int;
    select count(idUsuario) into _cant from usuarios where idUsuario = _id;
    if _cant > 0 then
        update usuarios set
			contraseña = _passw
        where idUsuario = _id;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarUsuarios`(_id int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idUsuario) into _cant from usuarios where idUsuario = _id;
    if _cant > 0 then
        delete from usuarios where idUsuario = _id;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `modificarToken`(`_id` int(11), `_rfT` TEXT) RETURNS int(1)
begin
    declare _cant int;
    select count(idUsuario) into _cant from usuarios where idUsuario = _id;
    if _cant > 0 then
        update usuarios set
                rfT = _rfT
                where idUsuario = _id;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoUsuarios`(`_id` int(11), `_correo` VARCHAR(50), `_tipo` TINYINT, `_passw` VARCHAR(255), `_idtenant` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idUsuario) into _cant from usuarios where idUsuario = _id;
    if _cant < 1 then
        insert into usuarios(idUsuario, correo, contraseña, tipoUsuario, idTenant1) 
			values (_id, _correo, _passw, _tipo, _idtenant);
    end if;
    return _cant;
end$$
DELIMITER ;

-- Balances------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoBalances`(`_idtenant` int(11),`_idbalance` int(11), `_fecha` VARCHAR(20), `_detalles` VARCHAR(50)) RETURNS int(1)
begin
    declare _cant int;
    select count(idBalance) into _cant from balances where idBalance = _idbalance;
    if _cant < 1 then
        insert into balances(idTenant1,idBalance,fechaBalance,detalles) 
			values (_idtenant,_idbalance,_fecha,_detalles);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosBalances`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from balances order by fechaBalance limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarBalances`(IN `_idbalance` int(11))
begin
    select * from Balances where idBalance = _idbalance;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarBalances`(`_idtenant` int(11),`_idbalance` int(11), `_fecha` VARCHAR(20), `_detalles` VARCHAR(50)) RETURNS int(1)
begin
    declare _cant int;
    select count(idBalance) into _cant from Balances where idBalance = _idbalance;
    if _cant > 0 then
		select count(idBalance) into _cant from Balances where idBalance <> _idbalance;
        if _cant = 0 then
        update balances set
			      idTenant1 = _idtenant,
            fechaBalance = _fecha,
            detalles= _detalles
        where idBalance = _idbalance;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarBalances`(`_idbalance` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idBalance) into _cant from balances where idBalance = _idbalance;
    if _cant > 0 then
        delete from balances where idBalance = _idbalance;
    end if;
    return _cant;
end$$
DELIMITER ;

-- Choferes------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoChoferes`(`_idtenant` int(11),`_idChofer` int(11), `_nombre` VARCHAR(255), `_apellido1` VARCHAR(255), `_apellido2` VARCHAR(255), `_cedula` VARCHAR(50)) RETURNS int(1)
begin
    declare _cant int;
    select count(idChofer) into _cant from choferes where idChofer = _idChofer;
    if _cant < 1 then
        insert into choferes(idTenant1,idChofer,nombreChofer,apellido1Chofer,apellido2Chofer,cedulaChofer) 
			values (_idtenant,_idChofer,_nombre,_apellido1,_apellido2,_cedula);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosChoferes`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from choferes order by nombreChofer limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarChoferes`(IN `_idChofer` int(11))
begin
    select * from choferes where idChofer = _idChofer;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarChoferes`(`_idtenant` int(11),`_idChofer` int(11), `_nombre` VARCHAR(255), `_apellido1` VARCHAR(255), `_apellido2` VARCHAR(255), `_cedula` VARCHAR(50)) RETURNS int(1)
begin
    declare _cant int;
    select count(idChofer) into _cant from choferes where idChofer = _idChofer;
    if _cant > 0 then
		select count(idChofer) into _cant from choferes where idChofer <> _idChofer;
        if _cant = 0 then
        update choferes set
			      idTenant1 = _idtenant,
            nombreChofer = _nombre,
            apellido1Chofer= _apellido1,
            apellido2Chofer= _apellido2,
            cedulaChofer= _cedula
        where idChofer = _idChofer;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarChoferes`(`_idChofer` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idChofer) into _cant from choferes where idChofer = _idChofer;
    if _cant > 0 then
        delete from choferes where idChofer = _idChofer;
    end if;
    return _cant;
end$$
DELIMITER ;

-- Despacho------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoDespacho`(`_idtenant` int(11),`_ordenDesp` int(11), `_idCliente` int(11), `_fechaDesp` VARCHAR(255), `_idDestinoDesp` int(11), `_retiroDesp` VARCHAR(255), `_entregaDesp` VARCHAR(255), `_fechColoc` VARCHAR(50), `_choferEncargado` int(11), `_placa` int(11), `_tipoEquipo` int(11), `_ejes` int(11), `_dieselTransp` int(11), `_dieselGenset` int(11), `_contenedor` VARCHAR(50), `_pesoCont` int(11),  `_duaobkn` VARCHAR(50)) RETURNS int(1)
begin
    declare _cant int;
    select count(ordenDesp) into _cant from despacho where ordenDesp = _ordenDesp;
    if _cant < 1 then
        insert into despacho(idTenant1,
            ordenDesp,
            idCliente,
            fechaDesp,
            idDestinoDesp,
            retiroDesp,
            entregaDesp,
            fechColoc,
            choferEncargado,
            placa,
            tipoEquipo,
            ejes,
            dieselTransp,
            dieselGenset,
            contenedor,
            pesoCont,
            duaobkn) 
			values (_idtenant,
            _ordenDesp,
            _idCliente,
            _fechaDesp,
            _idDestinoDesp,
            _retiroDesp,
            _entregaDesp,
            _fechColoc,
            _choferEncargado,
            _placa,
            _tipoEquipo,
            _ejes,
            _dieselTransp,
            _dieselGenset,
            _contenedor,
            _pesoCont,
            _duaobkn);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosDespacho`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from despacho order by fechDesp limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarDespacho`(IN `_ordenDesp` int(11))
begin
    select * from despacho where ordenDesp = _ordenDesp;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarDespacho`(`_idtenant` int(11),`_ordenDesp` int(11), `_idCliente` int(11), `_fechaDesp` VARCHAR(255), `_idDestinoDesp` int(11), `_retiroDesp` VARCHAR(255), `_entregaDesp` VARCHAR(255), `_fechColoc` VARCHAR(50), `_choferEncargado` int(11), `_placa` int(11), `_tipoEquipo` int(11), `_ejes` int(11), `_dieselTransp` int(11), `_dieselGenset` int(11), `_contenedor` VARCHAR(50), `_pesoCont` int(11),  `_duaobkn` VARCHAR(50)) RETURNS int(1)
begin
    declare _cant int;
    select count(ordenDesp) into _cant from despacho where ordenDesp = _ordenDesp;
    if _cant > 0 then
		select count(ordenDesp) into _cant from despacho where ordenDesp <> _ordenDesp;
        if _cant = 0 then
        update despacho set
			      idTenant1 = _idtenant,
            idCliente = _idCliente,
            fechaDesp= _fechaDesp,
            idDestinoDesp= _idDestinoDesp,
            retiroDesp= _retiroDesp,
            entregaDesp=_entregaDesp,
            fechColoc= _fechColoc,
            choferEncargado=_choferEncargado,
            placa=_placa,
            tipoEquipo=_tipoEquipo,
            ejes=_ejes,
            dieselTransp=_dieselTransp,
            dieselGenset=_dieselGenset,
            contenedor=_contenedor,
            pesoCont=_pesoCont,
            duaobkn=_duaobkn
        where ordenDesp = _ordenDesp;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarDespacho`(`_ordenDesp` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(ordenDesp) into _cant from despacho where ordenDesp = _ordenDesp;
    if _cant > 0 then
        delete from despacho where ordenDesp = _ordenDesp;
    end if;
    return _cant;
end$$
DELIMITER ;

-- destinos------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoDestinos`(`_idtenant` int(11),`_idDestino` int(11), `_rutaDest` VARCHAR(255), `_dieselEstimado` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idDestino) into _cant from destinos where idDestino = _idDestino;
    if _cant < 1 then
        insert into destinos(idTenant1,idDestino,rutaDest,dieselEstimado) 
			values (_idtenant,_idDestino,_rutaDest,_dieselEstimado);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosDestinos`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from destinos order by rutaDest limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarDestinos`(IN `_idDestino` int(11))
begin
    select * from destinos where idDestino = _idDestino;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarDestinos`(`_idtenant` int(11),`_idDestino` int(11), `_rutaDest` VARCHAR(255), `_dieselEstimado` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idDestino) into _cant from destinos where idDestino = _idDestino;
    if _cant > 0 then
		select count(idDestino) into _cant from destinos where idDestino <> _idDestino;
        if _cant = 0 then
        update destinos set
			      idTenant1 = _idtenant,
            rutaDest = _rutaDest,
            dieselEstimado= _dieselEstimado
        where idDestino = _idDestino;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarDestinos`(`_idDestino` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idDestino) into _cant from destinos where idDestino = _idDestino;
    if _cant > 0 then
        delete from destinos where idDestino = _idDestino;
    end if;
    return _cant;
end$$
DELIMITER ;

-- Diesel------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoDiesel`(`_idOrden` int(11), `_idtenant` int(11), `_estacionServicio` int(11), `_idChofer` int(11), `_placa` int(11), `_destino` VARCHAR(255), `_observacion` VARCHAR(255)) RETURNS int(1)
begin
    declare _cant int;
    select count(idOrden) into _cant from diesel where idOrden = _idOrden;
    if _cant < 1 then
        insert into diesel(idOrden,idTenant1,estacionServicio,idChofer,placa,destino,observacion) 
			values (_idOrden,_idtenant,_estacionServicio,_idChofer,_placa,_destino,_observacion);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosDiesel`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from diesel order by estacionServicio1 limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarDiesel`(IN `_idOrden` int(11))
begin
    select * from diesel where idOrden = _idOrden;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarDiesel`(`_idOrden` int(11), `_idtenant` int(11), `_estacionServicio` int(11), `_idChofer` int(11), `_placa` int(11), `_destino` VARCHAR(255), `_observacion` VARCHAR(255)) RETURNS int(1)
begin
    declare _cant int;
    select count(idOrden) into _cant from diesel where idOrden = _idOrden;
    if _cant > 0 then
		select count(idOrden) into _cant from diesel where idOrden <> _idOrden;
        if _cant = 0 then
        update diesel set
			      idTenant1 = _idtenant,
            estacionServicio=_estacionServicio,
            idChofer=_idChofer,
            placa=_placa,
            destino=_destino,
            observacion=_observacion
        where idOrden = _idOrden;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarDiesel`(`_idOrden` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idOrden) into _cant from diesel where idOrden = _idOrden;
    if _cant > 0 then
        delete from diesel where idOrden = _idOrden;
    end if;
    return _cant;
end$$
DELIMITER ;

-- Estacion------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoEstacion`(`_idtenant` int(11),`_idEstacion` int(11), `_nombreEstacion` VARCHAR(255), `_telefonoEstacion` int(11), `_correoEstacion` VARCHAR(255), `_direccionEstacion` VARCHAR(255)) RETURNS int(1)
begin
    declare _cant int;
    select count(idEstacion) into _cant from estacion where idEstacion = _idEstacion;
    if _cant < 1 then
        insert into estacion(idTenant1,idEstacion,nombreEstacion,telefonoEstacion,correoEstacion,direccionEstacion) 
			values (_idtenant,_idEstacion,_nombreEstacion,_telefonoEstacion,_correoEstacion,_direccionEstacion);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosEstacion`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from estacion order by nombreEstacion limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarEstacion`(IN `_idEstacion` int(11))
begin
    select * from estacion where idEstacion = _idEstacion;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarEstacion`(`_idtenant` int(11),`_idEstacion` int(11), `_nombreEstacion` VARCHAR(255), `_telefonoEstacion` int(11), `_correoEstacion` VARCHAR(255), `_direccionEstacion` VARCHAR(255)) RETURNS int(1)
begin
    declare _cant int;
    select count(idEstacion) into _cant from estacion where idEstacion = _idEstacion;
    if _cant > 0 then
		select count(idEstacion) into _cant from estacion where idEstacion <> _idEstacion;
        if _cant = 0 then
        update estacion set
			      idTenant1 = _idtenant,
            nombreEstacion=_nombreEstacion,
            telefonoEstacion=_telefonoEstacion,
            telefonoEstacion=_correoEstacion,
            direccionEstacion=_direccionEstacion
        where idEstacion = _idEstacion;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarEstacion`(`_idEstacion` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idEstacion) into _cant from estacion where idEstacion = _idEstacion;
    if _cant > 0 then
        delete from estacion where idEstacion = _idEstacion;
    end if;
    return _cant;
end$$
DELIMITER ;

-- Facturacion------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoFacturacion`(`_idFactura` int(11), `_ordenDesp` int(11), `_subcontratados` VARCHAR(255), `_fechaFactura` VARCHAR(255), `_facturaPagada` int(11), `_descripcion` VARCHAR(255), `_subTotal` int(11), `_montoTotal` int(11), `_indicacionExtra` VARCHAR(255), `_montoExtra` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idFactura) into _cant from facturacion where idFactura = _idFactura;
    if _cant < 1 then
        insert into facturacion(idFactura,
        ordenDesp,
        subcontratados,
        fechaFactura,
        facturaPagada,
        Descripcion,
        subTotal,
        montoTotal,
        indicaciónExtra,
        montoExtra) 
			values (_idFactura,
        _ordenDesp,
        _subcontratados,
        _fechaFactura,
        _facturaPagada,
        _descripcion,
        _subTotal,
        _montoTotal,
        _indicacionExtra,
        _montoExtra);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosFacturacion`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from facturacion order by fechaFactura limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarFacturacion`(IN `_idFactura` int(11))
begin
    select * from facturacion where idFactura = _idFactura;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarFacturacion`(`_idFactura` int(11), `_ordenDesp` int(11), `_subcontratados` VARCHAR(255), `_fechaFactura` VARCHAR(255), `_facturaPagada` int(11), `_descripcion` VARCHAR(255), `_subTotal` int(11), `_montoTotal` int(11), `_indicacionExtra` VARCHAR(255), `_montoExtra` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idFactura) into _cant from facturacion where idFactura = _idFactura;
    if _cant > 0 then
		select count(idFactura) into _cant from facturacion where idFactura <> _idFactura;
        if _cant = 0 then
        update facturacion set  
            ordenDesp= _ordenDesp,
            subcontratados=_subcontratados,
            fechaFactura=_fechaFactura,
            facturaPagada=_facturaPagada,
            Descripcion=_descripcion,
            subTotal=_subTotal,
            montoTotal=_montoTotal,
            indicaciónExtra=_indicacionExtra,
            montoExtra=_montoExtra
        where idFactura = _idFactura;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarFacturacion`(`_idFactura` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idFactura) into _cant from facturacion where idFactura = _idFactura;
    if _cant > 0 then
        delete from facturacion where idFactura = _idFactura;
    end if;
    return _cant;
end$$
DELIMITER ;

-- FacturaDiesel------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoFACTURADIESEL`(`_idFactura` int(11),`_idtenant` int(11),`_fecha` varchar(255), `_pagada` int(1), `_beneficio` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idFactura) into _cant from FACTURADIESEL where idFactura = _idFactura;
    if _cant < 1 then
        insert into FACTURADIESEL(idFactura,idTenant1,fecha,pagada,beneficio) 
			values (_idFactura,_idtenant,_fecha,_pagada,_beneficio);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosFACTURADIESEL`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from FACTURADIESEL order by fecha limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarFACTURADIESEL`(IN `_idFactura` int(11))
begin
    select * from FACTURADIESEL where idFactura = _idFactura;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarFACTURADIESEL`(`_idFactura` int(11),`_idtenant` int(11),`_fecha` varchar(255), `_pagada` int(1), `_beneficio` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idFactura) into _cant from FACTURADIESEL where idFactura = _idFactura;
    if _cant > 0 then
		select count(idFactura) into _cant from FACTURADIESEL where idFactura <> _idFactura;
        if _cant = 0 then
        update FACTURADIESEL set
			      idTenant1 = _idtenant,
                fecha=_fecha,
                pagada=_pagada,
                beneficio=_benef
        where idFactura = _idFactura;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarFACTURADIESEL`(`_idFactura` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idFactura) into _cant from FACTURADIESEL where idFactura = _idFactura;
    if _cant > 0 then
        delete from FACTURADIESEL where idFactura = _idFactura;
    end if;
    return _cant;
end$$
DELIMITER ;

-- Planilla------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoPlanilla`(`_idtenant` int(11), `_idPlanilla` int(11),  `_nombre` VARCHAR(255), `_cedula` VARCHAR(255), `_salarioBase` int(11), `_peajes` int (11), `_patios` VARCHAR(255),`_bonificacion` int(11), `_domingo` int(1), `_feriados` VARCHAR(255), `_seguro` int(1), `_estado` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idPlanilla) into _cant from planilla where idPlanilla = _idPlanilla;
    if _cant < 1 then
        insert into planilla(idTenant1,
        idPlanilla,
        nombre,
        cédula,
        salarioBase,
        peajes,
        patios,
        bonificacion,
        domingo,
        feriados,
        seguro,
        estado) 
			values (_idtenant,
            _idPlanilla,
            _nombre,
            _cedula,
            _salarioBase,
            _peajes,
            _patios,
            _bonificacion,
            _domingo,
            _feriados,
            _seguro,
            _estado);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosPlanilla`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from planilla order by nombre limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarPlanilla`(IN `_idPlanilla` int(11))
begin
    select * from planilla where idPlanilla = _idPlanilla;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarPlanilla`(`_idtenant` int(11), `_idPlanilla` int(11),  `_nombre` VARCHAR(255), `_cedula` VARCHAR(255), `_salarioBase` int(11), `_peajes` int(11), `_patios` VARCHAR(255), `_bonificacion` int(11), `_domingo` int(1), `_feriados` VARCHAR(255), `_seguro` int(1), `_estado` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idPlanilla) into _cant from planilla where idPlanilla = _idPlanilla;
    if _cant > 0 then
		select count(idPlanilla) into _cant from planilla where idPlanilla <> _idPlanilla;
        if _cant = 0 then
        update planilla set
			      idTenant1 = _idtenant,
                nombre=_nombre,
                cédula=_cedula,
                salarioBase=_salarioBase,
                peajes=_peajes,
                patios=_patios,
                bonificacion=_bonificacion,
                domingo=_domingo,
                feriados=_feriados,
                seguro=_seguro,
                estado=_estado
        where idPlanilla = _idPlanilla;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarPlanilla`(`_idFactura` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idPlanilla) into _cant from planilla where idPlanilla = _idPlanilla;
    if _cant > 0 then
        delete from planilla where idPlanilla = _idPlanilla;
    end if;
    return _cant;
end$$
DELIMITER ;

-- Tenant------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoTenant`(`_idTenant` int(11),  `_nombreTenant` VARCHAR(255), `_estadoTenant` int(1)) RETURNS int(1)
begin
    declare _cant int;
    select count(idTenant) into _cant from tenant where idTenant = _idTenant;
    if _cant < 1 then
        insert into tenant(idTenant,nombreTenant,estadoTenant) 
			values (_idTenant,_nombreTenant,_estadoTenant);
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosTenant`(IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)
begin
    select * from tenant order by nombreTenant limit _pagina, _cantRegs;
end$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarTenant`(IN `_idTenant` int(11))
begin
    select * from tenant where idTenant = _idTenant;
end$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarTenant`(`_idTenant` int(11),  `_nombreTenant` VARCHAR(255), `_estadoTenant` int(1)) RETURNS int(1)
begin
    declare _cant int;
    select count(idTenant) into _cant from tenant where idTenant = _idTenant;
    if _cant > 0 then
		select count(idTenant) into _cant from tenant where idTenant <> _idTenant;
        if _cant = 0 then
        update tenant set   
                nombreTenant=_nombreTenant,
                estadoTenant=_estadoTenant
        where idTenant = _idTenant;
        set _cant=1;
        else 
        set _cant=2;
        end if;
    end if;
    return _cant;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarTenant`(`_idTenant` int(11)) RETURNS int(1)
begin
    declare _cant int;
    select count(idTenant) into _cant from tenant where idTenant = _idTenant;
    if _cant > 0 then
        delete from tenant where idTenant = _idTenant;
    end if;
    return _cant;
end$$
DELIMITER ;

-- ********------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `siguienteCodigo`(`tabla` VARCHAR(255) CHARSET utf8) RETURNS int(1)
begin
  declare _cant int;
  select AUTO_INCREMENT into _cant from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = 'SGD' and TABLE_NAME= tabla;
  return _cant;
  end$$
DELIMITER ;


