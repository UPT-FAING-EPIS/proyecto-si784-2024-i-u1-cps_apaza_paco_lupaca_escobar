-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bdparqueadero
CREATE DATABASE IF NOT EXISTS `bdparqueadero` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bdparqueadero`;

-- Volcando estructura para procedimiento bdparqueadero.actualizarEstadoEspacios
DELIMITER //
CREATE PROCEDURE `actualizarEstadoEspacios`(
    IN p_id_posicion INT
)
BEGIN
    UPDATE espacios SET estado = 'No Disponible' WHERE id = p_id_posicion;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.BuscarVehiculosPorCombo2
DELIMITER //
CREATE PROCEDURE `BuscarVehiculosPorCombo2`(
    IN p_placa VARCHAR(255),
    IN p_propietario VARCHAR(255),
    IN p_tipoVehiculo VARCHAR(255)
)
BEGIN
    IF p_placa = '' AND p_propietario = '' AND p_tipoVehiculo = '' THEN
        SELECT * FROM vehiculos;
    ELSE
        SELECT * FROM vehiculos 
        WHERE (placa LIKE CONCAT('%', p_placa, '%') OR p_placa = '')
        AND (propietario LIKE CONCAT('%', p_propietario, '%') OR p_propietario = '')
        AND (tipovehiculo = p_tipoVehiculo OR p_tipoVehiculo = '');
    END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.CalcularHorasDiasEstanciaConTotal
DELIMITER //
CREATE PROCEDURE `CalcularHorasDiasEstanciaConTotal`()
BEGIN
    -- Variable temporal para almacenar la diferencia de tiempo en días, horas, minutos y segundos
    DECLARE tiempo_estancia VARCHAR(100);

    -- Crear una tabla temporal para almacenar los resultados
    CREATE TEMPORARY TABLE IF NOT EXISTS estancia_reporte (
        placa VARCHAR(20),
        propietario VARCHAR(100),
        tipovehiculo VARCHAR(100),
        horaentrada DATETIME,
        horasalida DATETIME,
        valorpagado FLOAT,
        espacio INT,
        tiempo_estancia VARCHAR(100),
        total_valor_pagado FLOAT
    );

    -- Calcular la diferencia de tiempo en días, horas, minutos y segundos y insertar en la tabla temporal estancia_reporte
    INSERT INTO estancia_reporte (placa, propietario, tipovehiculo, horaentrada, horasalida, valorpagado, espacio, tiempo_estancia)
    SELECT placa,
           propietario,
           tipovehiculo,
           horaentrada,
           horasalida,
           valorpagado,
           espacio,
           CASE
               WHEN horaentrada IS NOT NULL AND horasalida IS NOT NULL THEN
                   CONCAT(
                       TIMESTAMPDIFF(DAY, horaentrada, horasalida), ' días, ',
                       HOUR(TIMEDIFF(horasalida, horaentrada)), ' horas, ',
                       MINUTE(TIMEDIFF(horasalida, horaentrada)), ' minutos, ',
                       SECOND(TIMEDIFF(horasalida, horaentrada)), ' segundos'
                   )
               ELSE 'Datos de tiempo no disponibles'
           END
    FROM vehiculos;

    -- Obtener la suma total de valorpagado
    SELECT SUM(valorpagado) INTO @total_valor_pagado FROM vehiculos;

    -- Actualizar la tabla temporal estancia_reporte con la suma total de valorpagado
    UPDATE estancia_reporte SET total_valor_pagado = @total_valor_pagado;

    -- Mostrar los resultados
    SELECT * FROM estancia_reporte;

    -- Limpiar la tabla temporal
    DROP TEMPORARY TABLE IF EXISTS estancia_reporte;
END//
DELIMITER ;

-- Volcando estructura para tabla bdparqueadero.cochera
CREATE TABLE IF NOT EXISTS `cochera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `espacios` int(11) NOT NULL,
  `id_vehiculo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cochera_vehiculos` (`id_vehiculo`),
  CONSTRAINT `FK_cochera_vehiculos` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla bdparqueadero.cochera: ~1 rows (aproximadamente)
DELETE FROM `cochera`;
INSERT INTO `cochera` (`id`, `espacios`, `id_vehiculo`) VALUES
	(1, 25, NULL);

-- Volcando estructura para procedimiento bdparqueadero.consultadeEspacios
DELIMITER //
CREATE PROCEDURE `consultadeEspacios`()
BEGIN
    DECLARE espacios_disponibles INT;
    DECLARE espacios_ocupados INT;
    
    -- Contar espacios disponibles
    SELECT COUNT(*) INTO espacios_disponibles FROM espacios WHERE estado = 'Disponible';

    -- Contar espacios ocupados
    SELECT COUNT(*) INTO espacios_ocupados FROM espacios WHERE estado = 'No disponible';

    -- Devolver los resultados
    SELECT espacios_disponibles AS Disponibles, espacios_ocupados AS Ocupados;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.consultaTipoVehiculo
DELIMITER //
CREATE PROCEDURE `consultaTipoVehiculo`()
BEGIN
    DECLARE motocicleta_count INT;
    DECLARE automovil_count INT;

    -- Contar el número de motocicletas
    SELECT COUNT(*) INTO motocicleta_count FROM vehiculos WHERE tipovehiculo = 'Motocicleta';

    -- Contar el número de automóviles
    SELECT COUNT(*) INTO automovil_count FROM vehiculos WHERE tipovehiculo = 'Automovil';

    -- Mostrar los resultados
    SELECT 'Motocicletas' AS Tipo, motocicleta_count AS Cantidad
    UNION ALL
    SELECT 'Automóviles' AS Tipo, automovil_count AS Cantidad;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.consultaTipoVehiculoActual
DELIMITER //
CREATE PROCEDURE `consultaTipoVehiculoActual`()
BEGIN
    DECLARE motocicleta_count INT;
    DECLARE automovil_count INT;

    -- Contar el número de motocicletas no retiradas
    SELECT COUNT(*) INTO motocicleta_count FROM vehiculos WHERE tipovehiculo = 'Motocicleta' AND horasalida IS NULL;

    -- Contar el número de automóviles no retirados
    SELECT COUNT(*) INTO automovil_count FROM vehiculos WHERE tipovehiculo = 'Automovil' AND horasalida IS NULL;

    -- Mostrar los resultados
    SELECT 'Motocicletas' AS Tipo, motocicleta_count AS Cantidad
    UNION ALL
    SELECT 'Automóviles' AS Tipo, automovil_count AS Cantidad;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.eliminarUsuario
DELIMITER //
CREATE PROCEDURE `eliminarUsuario`(
    IN p_codigo VARCHAR(255)
)
BEGIN
    DELETE FROM usuarios WHERE usuario = p_codigo;
END//
DELIMITER ;

-- Volcando estructura para tabla bdparqueadero.espacios
CREATE TABLE IF NOT EXISTS `espacios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posicion` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `tipovehiculo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla bdparqueadero.espacios: ~25 rows (aproximadamente)
DELETE FROM `espacios`;
INSERT INTO `espacios` (`id`, `posicion`, `estado`, `tipovehiculo`) VALUES
	(1, 1, 'Disponible', ''),
	(2, 2, 'Disponible', ''),
	(3, 3, 'Disponible', ''),
	(4, 4, 'Disponible', ''),
	(5, 5, 'Disponible', ''),
	(6, 6, 'Disponible', ''),
	(7, 7, 'Disponible', ''),
	(8, 8, 'Disponible', ''),
	(9, 9, 'Disponible', ''),
	(10, 10, 'Disponible', ''),
	(11, 11, 'Disponible', ''),
	(12, 12, 'Disponible', ''),
	(13, 13, 'Disponible', ''),
	(14, 14, 'Disponible', ''),
	(15, 15, 'Disponible', ''),
	(16, 16, 'Disponible', ''),
	(17, 17, 'Disponible', ''),
	(18, 18, 'Disponible', ''),
	(19, 19, 'Disponible', ''),
	(20, 20, 'Disponible', ''),
	(21, 21, 'Disponible', ''),
	(22, 22, 'Disponible', ''),
	(23, 23, 'Disponible', ''),
	(24, 24, 'Disponible', ''),
	(25, 25, 'Disponible', '');

-- Volcando estructura para procedimiento bdparqueadero.insertarDatosVehiculo
DELIMITER //
CREATE PROCEDURE `insertarDatosVehiculo`(
    IN p_placa VARCHAR(255),
    IN p_propietario VARCHAR(255),
    IN p_clasevehiculo VARCHAR(255),
    IN p_fechaHora VARCHAR(255),
    IN p_id_posicion INT
)
BEGIN
    INSERT INTO vehiculos (placa, propietario, tipovehiculo, horaentrada, horasalida, valorpagado, espacio, estado)
    VALUES (p_placa, p_propietario, p_clasevehiculo, p_fechaHora, null, null, p_id_posicion, 'No Disponible');
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.insertarTipoVehiculoEnEspacios
DELIMITER //
CREATE PROCEDURE `insertarTipoVehiculoEnEspacios`(
    IN p_id_posicion INT,
    IN p_tipovehiculo VARCHAR(255)
)
BEGIN
    UPDATE espacios
    SET tipovehiculo = p_tipovehiculo
    WHERE id = p_id_posicion;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.ListarAutomoviles
DELIMITER //
CREATE PROCEDURE `ListarAutomoviles`()
BEGIN
    SELECT placa, propietario, tipovehiculo, horaentrada, horasalida, valorpagado
    FROM vehiculos; -- Reemplaza "nombre_de_tu_tabla" con el nombre real de tu tabla
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.obtenerEspacios
DELIMITER //
CREATE PROCEDURE `obtenerEspacios`()
BEGIN
    SELECT id, posicion, estado, tipovehiculo FROM espacios;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.ObtenerEstadoVehiculos
DELIMITER //
CREATE PROCEDURE `ObtenerEstadoVehiculos`()
BEGIN
    -- Obtener información de vehículos disponibles
    SELECT * FROM espacios WHERE estado LIKE '%Disponible%';

    -- Obtener información de vehículos no disponibles
    SELECT * FROM espacios WHERE estado LIKE '%No Disponible%';
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.ObtenerInfoVehiculosConTotal
DELIMITER //
CREATE PROCEDURE `ObtenerInfoVehiculosConTotal`()
BEGIN
    -- Variable para almacenar la suma total de valorpagado
    DECLARE total_valorpagado FLOAT;

    -- Obtener la suma total de valorpagado
    SELECT SUM(valorpagado) INTO total_valorpagado FROM vehiculos;

    -- Mostrar las columnas específicas y la suma total (agregando la suma a cada fila)
    SELECT placa, propietario, tipovehiculo, horaentrada, horasalida, valorpagado, espacio, total_valorpagado AS total_valor_pagado 
    FROM vehiculos,
    (SELECT total_valorpagado) AS total;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.obtenerPlacaPorPosicion
DELIMITER //
CREATE PROCEDURE `obtenerPlacaPorPosicion`(
    IN p_id_posicion INT
)
BEGIN
    SELECT placa FROM vehiculos WHERE espacio = p_id_posicion;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.obtenerPlacaPorPosicion2
DELIMITER //
CREATE PROCEDURE `obtenerPlacaPorPosicion2`(
    IN p_id_posicion INT,
    IN p_hora_entrada DATETIME -- Cambiado a DATETIME para mayor compatibilidad
)
BEGIN
    SELECT placa FROM vehiculos WHERE espacio = p_id_posicion AND horaentrada = p_hora_entrada;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.obtenerUsuarios
DELIMITER //
CREATE PROCEDURE `obtenerUsuarios`(
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_usuario VARCHAR(255),
    IN p_rol VARCHAR(255)
)
BEGIN
    SELECT * FROM usuarios 
    WHERE nombre LIKE CONCAT('%', p_nombre, '%') 
    AND apellido LIKE CONCAT('%', p_apellido, '%') 
    AND usuario LIKE CONCAT('%', p_usuario, '%') 
    AND rol LIKE CONCAT('%', p_rol, '%');
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdparqueadero.registrarUsuario
DELIMITER //
CREATE PROCEDURE `registrarUsuario`(
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_usuario VARCHAR(255),
    IN p_contrasena VARCHAR(255),
    IN p_rol VARCHAR(255)
)
BEGIN
    INSERT INTO usuarios (nombre, apellido, usuario, contrasena, rol) VALUES (p_nombre, p_apellido, p_usuario, p_contrasena, p_rol);
END//
DELIMITER ;

-- Volcando estructura para tabla bdparqueadero.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla bdparqueadero.usuarios: ~7 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`Id`, `nombre`, `apellido`, `usuario`, `contrasena`, `rol`) VALUES
	(1, 'josue', 'villanueva', 'josue', '123456', 'administrador'),
	(2, 'edward', 'apaza', 'edward', '123456', 'empleado'),
	(4, 'fabian', 'chavez', 'fabian', '123456', 'administrador'),
	(5, 'anthony', 'chata', 'chata', '123456', 'administrador'),
	(6, 'jonathan', 'villanueva', 'villa', '123456', 'administrador'),
	(8, 'marcelo', 're', 'marce', NULL, 'administrador'),
	(9, 'marcelo', 'dasd', 'as', NULL, 'administrador');

-- Volcando estructura para procedimiento bdparqueadero.validarInicioSesion
DELIMITER //
CREATE PROCEDURE `validarInicioSesion`(IN p_usuario VARCHAR(255), IN p_contrasena VARCHAR(255))
BEGIN
    SELECT * FROM usuarios WHERE usuario = p_usuario AND contrasena = p_contrasena;
END//
DELIMITER ;

-- Volcando estructura para tabla bdparqueadero.vehiculos
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(255) NOT NULL,
  `propietario` varchar(255) NOT NULL,
  `tipovehiculo` varchar(255) NOT NULL,
  `horaentrada` datetime NOT NULL,
  `horasalida` datetime DEFAULT NULL,
  `valorpagado` float DEFAULT NULL,
  `espacio` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla bdparqueadero.vehiculos: ~0 rows (aproximadamente)
DELETE FROM `vehiculos`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
