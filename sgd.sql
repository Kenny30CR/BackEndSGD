-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-07-2021 a las 17:25:15
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sgd`
--
CREATE DATABASE IF NOT EXISTS `sgd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sgd`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `buscarBalances`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarBalances` (IN `_idbalance` INT(11))  begin
    select * from Balances where idBalance = _idbalance;
end$$

DROP PROCEDURE IF EXISTS `buscarClientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarClientes` (IN `_idCliente` INT(11))  begin
    select * from Clientes where idCliente = _idCliente;
end$$

DROP PROCEDURE IF EXISTS `buscarChoferes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarChoferes` (IN `_idChofer` INT(11))  begin
    select * from choferes where idChofer = _idChofer;
end$$

DROP PROCEDURE IF EXISTS `buscarDespacho`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarDespacho` (IN `_ordenDesp` INT(11))  begin
    select * from despacho where ordenDesp = _ordenDesp;
end$$

DROP PROCEDURE IF EXISTS `buscarDestinos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarDestinos` (IN `_idDestino` INT(11))  begin
    select * from destinos where idDestino = _idDestino;
end$$

DROP PROCEDURE IF EXISTS `buscarDiesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarDiesel` (IN `_idOrden` INT(11))  begin
    select * from diesel where idOrden = _idOrden;
end$$

DROP PROCEDURE IF EXISTS `buscarEstacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarEstacion` (IN `_idEstacion` INT(11))  begin
    select * from estacion where idEstacion = _idEstacion;
end$$

DROP PROCEDURE IF EXISTS `buscarFacturacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarFacturacion` (IN `_idFactura` INT(11))  begin
    select * from facturacion where idFactura = _idFactura;
end$$

DROP PROCEDURE IF EXISTS `buscarFACTURADIESEL`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarFACTURADIESEL` (IN `_idFactura` INT(11))  begin
    select * from FACTURADIESEL where idFactura = _idFactura;
end$$

DROP PROCEDURE IF EXISTS `buscarPlanilla`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarPlanilla` (IN `_idPlanilla` INT(11))  begin
    select * from planilla where idPlanilla = _idPlanilla;
end$$

DROP PROCEDURE IF EXISTS `buscarTenant`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarTenant` (IN `_idTenant` INT(11))  begin
    select * from tenant where idTenant = _idTenant;
end$$

DROP PROCEDURE IF EXISTS `buscarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarUsuario` (`_id` VARCHAR(100))  begin
    select * from usuario where id = _id;
end$$

DROP PROCEDURE IF EXISTS `todosBalances`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosBalances` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from balances order by fechaBalance limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosClientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosClientes` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from clientes order by idCliente limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosChoferes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosChoferes` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from choferes order by nombreChofer limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosDespacho`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosDespacho` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from despacho order by fechDesp limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosDestinos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosDestinos` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from destinos order by rutaDest limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosDiesel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosDiesel` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from diesel order by estacionServicio1 limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosEstacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosEstacion` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from estacion order by nombreEstacion limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosFacturacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosFacturacion` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from facturacion order by fechaFactura limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosFACTURADIESEL`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosFACTURADIESEL` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from FACTURADIESEL order by fecha limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosPlanilla`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosPlanilla` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from planilla order by nombre limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosTenant`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosTenant` (IN `_pagina` TINYINT, IN `_cantRegs` TINYINT)  begin
    select * from tenant order by nombreTenant limit _pagina, _cantRegs;
end$$

DROP PROCEDURE IF EXISTS `todosUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `todosUsuario` (`_pagina` TINYINT, `_cantRegs` TINYINT)  begin
    select * from usuario order by nombre limit _pagina, _cantRegs;
end$$

--
-- Funciones
--
DROP FUNCTION IF EXISTS `cambiarPasswUsuario`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `cambiarPasswUsuario` (`_id` VARCHAR(100), `_passw` TINYINT) RETURNS INT(1) begin
    declare _cant int;
    select count(id) into _cant from usuario where id = _id;
    if _cant > 0 then
        update usuario set
			passw = _passw
        where id = _id;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarBalances`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarBalances` (`_idbalance` INT(11), `_idtenant` INT(11), `_fecha` VARCHAR(20), `_detalles` VARCHAR(50)) RETURNS INT(1) begin
    declare _cant int;
    select count(idBalance) into _cant from Balances where idBalance = _idbalance;
    if _cant = 1 then
        update balances set
			    idTenant1 = _idtenant,
            fechaBalance = _fecha,
            detalles= _detalles
        where idBalance = _idbalance;
        set _cant=1;
        else 
        set _cant=2;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarChoferes`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarChoferes` (`_idChofer` INT(11), `_idtenant` INT(11), `_nombre` VARCHAR(255), `_apellido1` VARCHAR(255), `_apellido2` VARCHAR(255), `_cedula` VARCHAR(50)) RETURNS INT(1) begin
    declare _cant int;
    select count(idChofer) into _cant from choferes where idChofer = _idChofer;
    if _cant = 1 then
		
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
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarDespacho`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarDespacho` (`_ordenDesp` INT(11), `_idtenant` INT(11), `_idCliente` INT(11),
 `_fechaDesp` datetime, `_idDestinoDesp` INT(11), `_retiroDesp` VARCHAR(255), `_entregaDesp` datetime, `_fechColoc` VARCHAR(50),
  `_choferEncargado` INT(11), `_placa` INT(11), `_tipoEquipo` INT(11), `_ejes` INT(11), `_dieselTransp` INT(11), `_dieselGenset` INT(11), `_contenedor` VARCHAR(50), `_pesoCont` INT(11), `_duaobkn` VARCHAR(50)) RETURNS INT(1) begin
    declare _cant int;
    select count(ordenDesp) into _cant from despacho where ordenDesp = _ordenDesp;
    if _cant = 1 then
	
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
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarDestinos`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarDestinos` (`_idDestino` INT(11), `_idtenant` INT(11), `_nombreDest` VARCHAR(255), `_rutaDest` VARCHAR(255), `_dieselEstimado` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idDestino) into _cant from destinos where idDestino = _idDestino;
    if _cant = 1 then
		
        update destinos set
			      idTenant1 = _idtenant,
            nombreDest = _nombreDest,
            rutaDest = _rutaDest,
            dieselEstimado= _dieselEstimado
        where idDestino = _idDestino;
        set _cant=1;
        else 
        set _cant=2;
 
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarDiesel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarDiesel` (`_idOrden` INT(11), `_idtenant` INT(11), `_estacionServicio1` INT(11), `_idChofer` INT(11), `_placa` INT(11), `_destino` VARCHAR(255), `_observacion` VARCHAR(255)) RETURNS INT(1) begin  
    declare _cant int;
    select count(idOrden) into _cant from diesel where idOrden = _idOrden;
    if _cant = 1 then
		
        update diesel set
			      idTenant1 = _idtenant,
            estacionServicio1=_estacionServicio1,
            idChofer=_idChofer,
            placa=_placa,
            destino=_destino,
            observacion=_observacion
        where idOrden = _idOrden;
        set _cant=1;
        else 
        set _cant=2;

    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarEstacion`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarEstacion` (`_idEstacion` INT(11), `_idtenant` INT(11), `_nombreEstacion` VARCHAR(255), `_telefonoEstacion` INT(11), `_correoEstacion` VARCHAR(255), `_direccionEstacion` VARCHAR(255)) RETURNS INT(1) begin
    declare _cant int;
    select count(idEstacion) into _cant from estacion where idEstacion = _idEstacion;
    if _cant = 1  then
		
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
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarFacturacion`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarFacturacion` (`_idFactura` INT(11), `_ordenDesp` INT(11), `_subcontratados` VARCHAR(255), `_fechaFactura` VARCHAR(255), `_facturaPagada` INT(11), `_descripcion` VARCHAR(255), `_subTotal` INT(11), `_montoTotal` INT(11), `_indicacionExtra` VARCHAR(255), `_montoExtra` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idFactura) into _cant from facturacion where idFactura = _idFactura;
    if _cant = 1 then
		
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
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarFACTURADIESEL`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarFACTURADIESEL` (`_idFactura` INT(11), `_idtenant` INT(11), `_fecha` VARCHAR(255), `_pagada` INT(1), `_beneficio` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idFactura) into _cant from FACTURADIESEL where idFactura = _idFactura;
    if _cant = 1 then
		
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
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarPlanilla`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarPlanilla` (`_idPlanilla` INT(11), `_idtenant` INT(11), `_nombre` VARCHAR(255), `_cedula` VARCHAR(255), `_salarioBase` INT(11), `_peajes` INT(11), `_patios` VARCHAR(255), `_bonificacion` INT(11), `_domingo` INT(1), `_feriados` VARCHAR(255), `_seguro` INT(1), `_estado` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idPlanilla) into _cant from planilla where idPlanilla = _idPlanilla;
    if _cant = 1 then
		
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
    return _cant;
end$$

DROP FUNCTION IF EXISTS `editarTenant`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarTenant` (`_idTenant` INT(11), `_nombreTenant` VARCHAR(255), `_estadoTenant` INT(1)) RETURNS INT(1) begin
    declare _cant int;
    select count(idTenant) into _cant from tenant where idTenant = _idTenant;
    if _cant = 1 then
		
        update tenant set   
                nombreTenant=_nombreTenant,
                estadoTenant=_estadoTenant
        where idTenant = _idTenant;
        set _cant=1;
        else 
        set _cant=2;
 
    end if;
    return _cant;
end$$


DROP FUNCTION IF EXISTS `editarClientes`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarClientes` (`_idTenant1` int(11), `_idCliente` int(11), `_nombreCliente` VARCHAR(50), `_tlfCliente` VARCHAR(50), `_correoCliente` VARCHAR(50)) RETURNS INT(1) begin
    declare _cant int;
    select count(idCliente) into _cant from clientes where idCliente = _idCliente;
    if _cant > 0 then
        update clientes set
			nombreCliente = _nombreCliente,
            tlfCliente = _tlfCliente,
            correoCliente= _correoCliente
        where idCliente = _idCliente;
    end if;
    return _cant;
end$$


DROP FUNCTION IF EXISTS `editarUsuario`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `editarUsuario` (`_id` VARCHAR(100), `_nombre` VARCHAR(50), `_rol` TINYINT, `_idtenant` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(id) into _cant from usuario where id = _id;
    if _cant > 0 then
        update usuario set
			nombre = _nombre,
            rol = _rol,
            idTenant1= _idtenant
        where id = _id;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarBalances`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarBalances` (`_idbalance` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idBalance) into _cant from balances where idBalance = _idbalance;
    if _cant > 0 then
        delete from balances where idBalance = _idbalance;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarChoferes`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarChoferes` (`_idChofer` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idChofer) into _cant from choferes where idChofer = _idChofer;
    if _cant > 0 then
        delete from choferes where idChofer = _idChofer;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarDespacho`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarDespacho` (`_ordenDesp` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(ordenDesp) into _cant from despacho where ordenDesp = _ordenDesp;
    if _cant > 0 then
        delete from despacho where ordenDesp = _ordenDesp;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarDestinos`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarDestinos` (`_idDestino` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idDestino) into _cant from destinos where idDestino = _idDestino;
    if _cant > 0 then
        delete from destinos where idDestino = _idDestino;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarDiesel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarDiesel` (`_idOrden` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idOrden) into _cant from diesel where idOrden = _idOrden;
    if _cant > 0 then
        delete from diesel where idOrden = _idOrden;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarEstacion`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarEstacion` (`_idEstacion` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idEstacion) into _cant from estacion where idEstacion = _idEstacion;
    if _cant > 0 then
        delete from estacion where idEstacion = _idEstacion;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarFacturacion`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarFacturacion` (`_idFactura` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idFactura) into _cant from facturacion where idFactura = _idFactura;
    if _cant > 0 then
        delete from facturacion where idFactura = _idFactura;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarFACTURADIESEL`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarFACTURADIESEL` (`_idFactura` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idFactura) into _cant from FACTURADIESEL where idFactura = _idFactura;
    if _cant > 0 then
        delete from FACTURADIESEL where idFactura = _idFactura;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarPlanilla`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarPlanilla` (`_idFactura` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idPlanilla) into _cant from planilla where idPlanilla = _idPlanilla;
    if _cant > 0 then
        delete from planilla where idPlanilla = _idPlanilla;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarTenant`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarTenant` (`_idTenant` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idTenant) into _cant from tenant where idTenant = _idTenant;
    if _cant > 0 then
        delete from tenant where idTenant = _idTenant;
    end if;
    return _cant;
end$$


DROP FUNCTION IF EXISTS `eliminarClientes`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarClientes` (`_idCliente` VARCHAR(100)) RETURNS INT(1) begin
    declare _cant int;
    select count(idCliente) into _cant from clientes where idCliente = _idCliente;
    if _cant > 0 then
        delete from clientes where idCliente = _idCliente;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `eliminarUsuario`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `eliminarUsuario` (`_id` VARCHAR(100)) RETURNS INT(1) begin
    declare _cant int;
    select count(id) into _cant from usuario where id = _id;
    if _cant > 0 then
        delete from usuario where id = _id;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `modificarToken`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `modificarToken` (`_id` VARCHAR(100), `_rfT` TEXT) RETURNS INT(1) begin
    declare _cant int;
    select count(id) into _cant from usuario where id = _id;
    if _cant > 0 then
        update usuario set
                rfT = _rfT
                where id = _id;
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `nuevoBalances`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoBalances` (`_idtenant` INT(11), `_idbalance` INT(11), `_fecha` VARCHAR(20), `_detalles` VARCHAR(50)) RETURNS INT(1) begin
    declare _cant int;
    select count(idBalance) into _cant from balances where idBalance = _idbalance;
    if _cant < 1 then
        insert into balances(idTenant1,idBalance,fechaBalance,detalles) 
			values (_idtenant,_idbalance,_fecha,_detalles);
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `nuevoChoferes`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoChoferes` (`_idtenant` INT(11), `_idChofer` INT(11), `_nombre` VARCHAR(255), `_apellido1` VARCHAR(255), `_apellido2` VARCHAR(255), `_cedula` VARCHAR(50)) RETURNS INT(1) begin
    declare _cant int;
    select count(idChofer) into _cant from choferes where idChofer = _idChofer;
    if _cant < 1 then
        insert into choferes(idTenant1,idChofer,nombreChofer,apellido1Chofer,apellido2Chofer,cedulaChofer) 
			values (_idtenant,_idChofer,_nombre,_apellido1,_apellido2,_cedula);
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `nuevoDespacho`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoDespacho` (`_idtenant` INT(11), `_ordenDesp` INT(11), `_idCliente` INT(11), `_fechaDesp` DATETIME,
 `_idDestinoDesp` INT(11), `_retiroDesp` VARCHAR(255), `_entregaDesp` VARCHAR(255), `_fechColoc` datetime,
  `_choferEncargado` INT(11), `_placa` INT(11), `_tipoEquipo` INT(11), `_ejes` INT(11), `_dieselTransp` INT(11), `_dieselGenset` INT(11), `_contenedor` VARCHAR(50), `_pesoCont` INT(11), `_duaobkn` VARCHAR(50)) RETURNS INT(1) begin
    declare _cant int;
    select count(ordenDesp) into _cant from despacho where ordenDesp = _ordenDesp;
    if _cant < 1 then
        insert into despacho(idTenant1,
            ordenDesp,
            idCliente,
            fechDesp,
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

DROP FUNCTION IF EXISTS `nuevoDestinos`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoDestinos` (`_idtenant` INT(11), `_idDestino` INT(11), `_nombreDest` VARCHAR(255), `_rutaDest` VARCHAR(255), `_dieselEstimado` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idDestino) into _cant from destinos where idDestino = _idDestino;
    if _cant < 1 then
        insert into destinos(idTenant1,idDestino,nombreDest,rutaDest,dieselEstimado) 
			values (_idtenant,_idDestino,_nombreDest,_rutaDest,_dieselEstimado);
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `nuevoDiesel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoDiesel` (`_idOrden` INT(11), `_idtenant` INT(11), `_estacionServicio1` INT(11), `_idChofer` INT(11), `_placa` INT(11), `_destino` VARCHAR(255), `_observacion` VARCHAR(255)) RETURNS INT(1) begin
    declare _cant int;
    select count(idOrden) into _cant from diesel where idOrden = _idOrden;
    if _cant < 1 then
        insert into diesel(idOrden,idTenant1,estacionServicio1,idChofer,placa,destino,observacion) 
			values (_idOrden,_idtenant,_estacionServicio1,_idChofer,_placa,_destino,_observacion);
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `nuevoEstacion`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoEstacion` (`_idtenant` INT(11), `_idEstacion` INT(11), `_nombreEstacion` VARCHAR(255), `_telefonoEstacion` INT(11), `_correoEstacion` VARCHAR(255), `_direccionEstacion` VARCHAR(255)) RETURNS INT(1) begin
    declare _cant int;
    select count(idEstacion) into _cant from estacion where idEstacion = _idEstacion;
    if _cant < 1 then
        insert into estacion(idTenant1,idEstacion,nombreEstacion,telefonoEstacion,correoEstacion,direccionEstacion) 
			values (_idtenant,_idEstacion,_nombreEstacion,_telefonoEstacion,_correoEstacion,_direccionEstacion);
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `nuevoFacturacion`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoFacturacion` (`_idFactura` INT(11), `_ordenDesp` INT(11), `_subcontratados` VARCHAR(255), `_fechaFactura` VARCHAR(255), `_facturaPagada` INT(11), `_descripcion` VARCHAR(255), `_subTotal` INT(11), `_montoTotal` INT(11), `_indicacionExtra` VARCHAR(255), `_montoExtra` INT(11)) RETURNS INT(1) begin
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

DROP FUNCTION IF EXISTS `nuevoFACTURADIESEL`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoFACTURADIESEL` (`_idFactura` INT(11), `_idtenant` INT(11), `_fecha` VARCHAR(255), `_pagada` INT(1), `_beneficio` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(idFactura) into _cant from FACTURADIESEL where idFactura = _idFactura;
    if _cant < 1 then
        insert into FACTURADIESEL(idFactura,idTenant1,fecha,pagada,beneficio) 
			values (_idFactura,_idtenant,_fecha,_pagada,_beneficio);
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `nuevoPlanilla`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoPlanilla` (`_idtenant` INT(11), `_idPlanilla` INT(11), `_nombre` VARCHAR(255), `_cedula` VARCHAR(255), `_salarioBase` INT(11), `_peajes` INT(11), `_patios` VARCHAR(255), `_bonificacion` INT(11), `_domingo` INT(1), `_feriados` VARCHAR(255), `_seguro` INT(1), `_estado` INT(11)) RETURNS INT(1) begin
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

DROP FUNCTION IF EXISTS `nuevoTenant`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoTenant` (`_idTenant` INT(11), `_nombreTenant` VARCHAR(255), `_estadoTenant` INT(1)) RETURNS INT(1) begin
    declare _cant int;
    select count(idTenant) into _cant from tenant where idTenant = _idTenant;
    if _cant < 1 then
        insert into tenant(idTenant,nombreTenant,estadoTenant) 
			values (_idTenant,_nombreTenant,_estadoTenant);
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `nuevoUsuario`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoUsuario` (`_id` VARCHAR(100), `_nombre` VARCHAR(50), `_rol` TINYINT, `_passw` VARCHAR(255), `_idtenant` INT(11)) RETURNS INT(1) begin
    declare _cant int;
    select count(_id) into _cant from usuario where id = _id;
    if _cant < 1 then
        insert into usuario(id, nombre, rol, passw, idTenant1) 
			values (_id, _nombre, _rol, _passw, _idtenant);
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `nuevoClientes`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nuevoClientes` (`_idTenant1` int(11),`_idCliente` int(11), `_nombreCliente` VARCHAR(50), `_tlfCliente` VARCHAR(50), `_correoCliente` VARCHAR(50)) RETURNS INT(1) begin
    declare _cant int;
    select count(_idCliente) into _cant from clientes where idCliente = _idCliente;
    if _cant < 1 then
        insert into clientes(idTenant1, idCliente,nombreCliente, tlfCliente, correoCliente) 
			values (_idTenant1, _idCliente, _nombreCliente, _tlfCliente, _correoCliente);
    end if;
    return _cant;
end$$

DROP FUNCTION IF EXISTS `siguienteCodigo`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `siguienteCodigo` (`tabla` VARCHAR(255) CHARSET utf8) RETURNS INT(1) begin
  declare _cant int;
  select AUTO_INCREMENT into _cant from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = 'SGD' and TABLE_NAME= tabla;
  return _cant;
  end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balances`
--

DROP TABLE IF EXISTS `balances`;
CREATE TABLE IF NOT EXISTS `balances` (
  `idTenant1` int(11) DEFAULT NULL,
  `idBalance` int(11) NOT NULL AUTO_INCREMENT,
  `fechaBalance` date DEFAULT NULL,
  `detalles` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idBalance`),
  KEY `idTenant1` (`idTenant1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choferes`
--

DROP TABLE IF EXISTS `choferes`;
CREATE TABLE IF NOT EXISTS `choferes` (
  `idTenant1` int(11) DEFAULT NULL,
  `idChofer` int(11) NOT NULL AUTO_INCREMENT,
  `nombreChofer` varchar(20) DEFAULT NULL,
  `apellido1Chofer` varchar(20) DEFAULT NULL,
  `apellido2Chofer` varchar(20) DEFAULT NULL,
  `cedulaChofer` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idChofer`),
  KEY `idTenant1` (`idTenant1`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `choferes`
--

INSERT INTO `choferes` (`idTenant1`, `idChofer`, `nombreChofer`, `apellido1Chofer`, `apellido2Chofer`, `cedulaChofer`) VALUES
(1, 1, 'Chaim', 'Ryan', 'Kennedy', '800328353-00001'),
(1, 2, 'Nathan', 'Orr', 'Bennett', '814677050-00001'),
(1, 3, 'Cameron', 'Whitley', 'Pena', '917937328-00008'),
(1, 4, 'Tanner', 'Oconnor', 'Mccormick', '221062375-00003'),
(1, 5, 'Jeremy', 'Hooper', 'Smith', '958673493-00002'),
(1, 6, 'Carson', 'Daugherty', 'Velasquez', '119982536-00003'),
(1, 7, 'Rogan', 'Massey', 'Lucas', '745753442-00003'),
(1, 8, 'Duncan', 'Ochoa', 'Burgess', '689744324-00005'),
(1, 9, 'Hammett', 'Schmidt', 'Myers', '790549562-00003'),
(1, 10, 'Brady', 'Knowles', 'England', '544629538-00007'),
(1, 11, 'Elmo', 'Mcdaniel', 'Robles', '641474184-00000'),
(1, 12, 'Keith', 'Pollard', 'Barrett', '519095426-00002'),
(1, 13, 'Isaiah', 'Berry', 'Long', '237571344-00009'),
(1, 14, 'Zeph', 'Sweet', 'Strong', '160311551-00008'),
(1, 15, 'Ulysses', 'Landry', 'Monroe', '749781050-00002'),
(1, 16, 'Lionel', 'Francis', 'Henry', '234656163-00008'),
(1, 17, 'Malachi', 'Jacobson', 'Owens', '917016776-00002'),
(1, 18, 'Felix', 'Lucas', 'Greer', '163363583-00002'),
(1, 19, 'Kelly', 'Austin', 'Trujillo', '467306049-00009'),
(1, 20, 'Raja', 'Dean', 'Levy', '241860584-00002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despacho`
--

DROP TABLE IF EXISTS `despacho`;
CREATE TABLE IF NOT EXISTS `despacho` (
  `idTenant1` int(11) DEFAULT NULL,
  `ordenDesp` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) DEFAULT NULL,
  `fechDesp` DATETIME DEFAULT NULL,
  `idDestinoDesp` int(11) DEFAULT NULL,
  `retiroDESP` varchar(15) DEFAULT NULL,
  `entregaDesp` varchar(15) DEFAULT NULL,
  `fechColoc` datetime DEFAULT NULL,
  `choferEncargado` int(11) DEFAULT NULL,
  `placa` int(11) DEFAULT NULL,
  `tipoEquipo` int(11) DEFAULT NULL,
  `ejes` int(11) DEFAULT NULL,
  `dieselTransp` int(11) DEFAULT NULL,
  `dieselGenset` int(11) DEFAULT NULL,
  `contenedor` varchar(11) DEFAULT NULL,
  `pesoCont` int(11) DEFAULT NULL,
  `duaobkn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ordenDesp`),
  KEY `idTenant1` (`idTenant1`),
  KEY `idDestinoDesp` (`idDestinoDesp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idTenant1` int(11) DEFAULT NULL,
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(25) DEFAULT NULL,
  `tlfCliente` varchar(25) DEFAULT NULL,
  `correoCliente` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

DROP TABLE IF EXISTS `destinos`;
CREATE TABLE IF NOT EXISTS `destinos` (
  `idTenant1` int(11) DEFAULT NULL,
  `idDestino` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDest` varchar(25) DEFAULT NULL,
  `rutaDest` varchar(100) DEFAULT NULL,
  `dieselEstimado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDestino`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`idTenant1`, `idDestino`, `nombreDest`, `rutaDest`, `dieselEstimado`) VALUES
(1, 1, 'Planta Frutera La Paz', 'Colocar en Muelle de San Carlos frente a Bomba Cerro Cortes', 140),
(1, 2, 'Destino de Prueba', 'Ruta de Prueba', 140),
(1, 3, '1111', '11111', 111),
(1, 6, '6666', '6666', 66);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diesel`
--

DROP TABLE IF EXISTS `diesel`;
CREATE TABLE IF NOT EXISTS `diesel` (
  `idOrden` int(11) NOT NULL,
  `idTenant1` int(11) DEFAULT NULL,
  `estacionServicio1` int(11) DEFAULT NULL,
  `idChofer` int(10) DEFAULT NULL,
  `placa` int(10) DEFAULT NULL,
  `destino` varchar(60) DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idOrden`),
  KEY `idTenant1` (`idTenant1`),
  KEY `estacionServicio1` (`estacionServicio1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacion`
--

DROP TABLE IF EXISTS `estacion`;
CREATE TABLE IF NOT EXISTS `estacion` (
  `idTenant1` int(11) DEFAULT NULL,
  `idEstacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstacion` varchar(30) DEFAULT NULL,
  `telefonoEstacion` int(11) DEFAULT NULL,
  `correoEstacion` varchar(30) DEFAULT NULL,
  `direccionEstacion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idEstacion`),
  KEY `idTenant1` (`idTenant1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
CREATE TABLE IF NOT EXISTS `facturacion` (
  `idFactura` int(11) NOT NULL,
  `ordenDesp` int(11) DEFAULT NULL,
  `subcontratados` varchar(20) DEFAULT NULL,
  `fechaFactura` date NOT NULL,
  `facturaPagada` int(11) DEFAULT NULL,
  `Descripcion` varchar(20) DEFAULT NULL,
  `subTotal` int(11) NOT NULL,
  `montoTotal` int(11) NOT NULL,
  `indicaciónExtra` varchar(20) DEFAULT NULL,
  `montoExtra` double DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `ordenDesp` (`ordenDesp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadiesel`
--

DROP TABLE IF EXISTS `facturadiesel`;
CREATE TABLE IF NOT EXISTS `facturadiesel` (
  `idFactura` int(11) NOT NULL,
  `idTenant1` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `pagada` tinyint(1) DEFAULT NULL,
  `beneficio` double DEFAULT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `idTenant1` (`idTenant1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturasdieselincluidas`
--

DROP TABLE IF EXISTS `facturasdieselincluidas`;
CREATE TABLE IF NOT EXISTS `facturasdieselincluidas` (
  `idTenant1` int(11) DEFAULT NULL,
  `idFacturaDiesel1` int(11) DEFAULT NULL,
  `idBalance1` int(11) DEFAULT NULL,
  KEY `idTenant1` (`idTenant1`),
  KEY `idBalance1` (`idBalance1`),
  KEY `idFacturaDiesel1` (`idFacturaDiesel1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturasincluidasbalance`
--

DROP TABLE IF EXISTS `facturasincluidasbalance`;
CREATE TABLE IF NOT EXISTS `facturasincluidasbalance` (
  `idTenant1` int(11) DEFAULT NULL,
  `idFactura1` int(11) DEFAULT NULL,
  `idBalance1` int(11) DEFAULT NULL,
  KEY `idTenant1` (`idTenant1`),
  KEY `idFactura1` (`idFactura1`),
  KEY `idBalance1` (`idBalance1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenesxfactura`
--

DROP TABLE IF EXISTS `ordenesxfactura`;
CREATE TABLE IF NOT EXISTS `ordenesxfactura` (
  `idTenant1` int(11) DEFAULT NULL,
  `idOrden1` int(11) DEFAULT NULL,
  `idFactura1` int(11) DEFAULT NULL,
  KEY `idTenant1` (`idTenant1`),
  KEY `idOrden1` (`idOrden1`),
  KEY `idFactura1` (`idFactura1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla`
--

DROP TABLE IF EXISTS `planilla`;
CREATE TABLE IF NOT EXISTS `planilla` (
  `idTenant1` int(11) DEFAULT NULL,
  `IdPlanilla` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `cédula` varchar(20) DEFAULT NULL,
  `salarioBase` double DEFAULT NULL,
  `peajes` double DEFAULT NULL,
  `patios` varchar(20) DEFAULT NULL,
  `bonificacion` double DEFAULT NULL,
  `domingo` int(11) DEFAULT NULL,
  `feriados` varchar(20) DEFAULT NULL,
  `seguro` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPlanilla`),
  KEY `idTenant1` (`idTenant1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias`
--

DROP TABLE IF EXISTS `preferencias`;
CREATE TABLE IF NOT EXISTS `preferencias` (
  `idTenant1` int(11) DEFAULT NULL,
  `diasPlazoFacturacion` int(11) DEFAULT NULL,
  `diasPlazoBalances` int(11) DEFAULT NULL,
  KEY `idTenant1` (`idTenant1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tenant`
--

DROP TABLE IF EXISTS `tenant`;
CREATE TABLE IF NOT EXISTS `tenant` (
  `idTenant` int(11) NOT NULL,
  `nombreTenant` varchar(20) DEFAULT NULL,
  `estadoTenant` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idTenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tenant`
--

INSERT INTO `tenant` (`idTenant`, `nombreTenant`, `estadoTenant`) VALUES
(1, 'AdminGroup', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `rol` tinyint(4) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `rfT` text,
  `idTenant1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idTenant1` (`idTenant1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `rol`, `passw`, `rfT`, `idTenant1`) VALUES
('admin', 'Iván', 1, '$2y$11$a0Z.g9h1syjD9gmQ.2xsw.ot5oYDp8.zfiL6XacErXHngHRP/zBYi', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MjY4ODgxNzMsImlzcyI6InNnZCIsInN1YiI6ImFkbWluIn0.vi1cytTZfSDOXlxRhCwKVTuLUqrkgB64SQpKBSBWu9c', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balances_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`);

--
-- Filtros para la tabla `choferes`
--
ALTER TABLE `choferes`
  ADD CONSTRAINT `choferes_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`);

--
-- Filtros para la tabla `despacho`
--
ALTER TABLE `despacho`
  ADD CONSTRAINT `despacho_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`),
  ADD CONSTRAINT `despacho_ibfk_2` FOREIGN KEY (`idDestinoDesp`) REFERENCES `destinos` (`idDestino`);

--
-- Filtros para la tabla `diesel`
--
ALTER TABLE `diesel`
  ADD CONSTRAINT `diesel_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`),
  ADD CONSTRAINT `diesel_ibfk_2` FOREIGN KEY (`estacionServicio1`) REFERENCES `estacion` (`idEstacion`);

--
-- Filtros para la tabla `estacion`
--
ALTER TABLE `estacion`
  ADD CONSTRAINT `estacion_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`ordenDesp`) REFERENCES `despacho` (`ordenDesp`);

--
-- Filtros para la tabla `facturadiesel`
--
ALTER TABLE `facturadiesel`
  ADD CONSTRAINT `facturadiesel_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`);

--
-- Filtros para la tabla `facturasdieselincluidas`
--
ALTER TABLE `facturasdieselincluidas`
  ADD CONSTRAINT `facturasdieselincluidas_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`),
  ADD CONSTRAINT `facturasdieselincluidas_ibfk_2` FOREIGN KEY (`idBalance1`) REFERENCES `balances` (`idBalance`),
  ADD CONSTRAINT `facturasdieselincluidas_ibfk_3` FOREIGN KEY (`idFacturaDiesel1`) REFERENCES `facturadiesel` (`idFactura`);

--
-- Filtros para la tabla `facturasincluidasbalance`
--
ALTER TABLE `facturasincluidasbalance`
  ADD CONSTRAINT `facturasincluidasbalance_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`),
  ADD CONSTRAINT `facturasincluidasbalance_ibfk_2` FOREIGN KEY (`idFactura1`) REFERENCES `facturacion` (`idFactura`),
  ADD CONSTRAINT `facturasincluidasbalance_ibfk_3` FOREIGN KEY (`idBalance1`) REFERENCES `balances` (`idBalance`);

--
-- Filtros para la tabla `ordenesxfactura`
--
ALTER TABLE `ordenesxfactura`
  ADD CONSTRAINT `ordenesxfactura_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`),
  ADD CONSTRAINT `ordenesxfactura_ibfk_2` FOREIGN KEY (`idOrden1`) REFERENCES `diesel` (`idOrden`),
  ADD CONSTRAINT `ordenesxfactura_ibfk_3` FOREIGN KEY (`idFactura1`) REFERENCES `facturadiesel` (`idFactura`);

--
-- Filtros para la tabla `planilla`
--
ALTER TABLE `planilla`
  ADD CONSTRAINT `planilla_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`);

--
-- Filtros para la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD CONSTRAINT `preferencias_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idTenant1`) REFERENCES `tenant` (`idTenant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
