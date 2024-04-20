-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para agenda_jobs
CREATE DATABASE IF NOT EXISTS `agenda_jobs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `agenda_jobs`;

-- Volcando estructura para tabla agenda_jobs.alumno
CREATE TABLE IF NOT EXISTS `alumno` (
  `codalumno` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  `observa` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codalumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla agenda_jobs.alumno: ~9 rows (aproximadamente)
INSERT INTO `alumno` (`codalumno`, `nombre`, `apellido`, `correo`, `telefono`, `contraseña`, `observa`) VALUES
	(111, 'Farley', 'Viberos Blanco            ', 'farley@upt.pe', 987654231, 'farley123', 'estuvo enfermo'),
	(222, 'Aurelia', 'Japura Quispe', 'aurelia@upt.pe', 987321654, 'aurelia123', 'no fue a clases'),
	(321, 'Ana', 'Guzman', 'hola@gmail.com', 98765423, 'ana123', NULL),
	(333, 'Jorfe', 'Luna Lunera', 'jorge@upt.pe', 987963852, 'jorge123', 'se portó muuuuy mal'),
	(444, 'Fabricio', 'Lipe Alva', 'fabri@upt.pe', 963852741, 'fabri123', 'se porto mal'),
	(555, 'Javier', 'Neyra Machaca', 'javier@upt.pe', 987416523, 'javier123', 'se porto mal'),
	(666, 'Sofia', 'Carmen', 'hola@gmail.com', 98765423, 'sofia123', NULL),
	(777, 'Renato', 'chambilla', 'hola@gmail.com', 12312214, 'renato123', NULL),
	(888, 'Maria', 'Chambilla', 'maria@gmail.com', 987654321, 'maria123', 'Maria se portó mal');

-- Volcando estructura para tabla agenda_jobs.asistencia
CREATE TABLE IF NOT EXISTS `asistencia` (
  `fkcodalumno` int(11) DEFAULT NULL,
  `fknomalumno` varchar(50) DEFAULT NULL,
  `fkapealumno` varchar(50) DEFAULT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  KEY `fkcodalumno` (`fkcodalumno`),
  CONSTRAINT `FK_asistencia_alumno` FOREIGN KEY (`fkcodalumno`) REFERENCES `alumno` (`codalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla agenda_jobs.asistencia: ~6 rows (aproximadamente)
INSERT INTO `asistencia` (`fkcodalumno`, `fknomalumno`, `fkapealumno`, `fecha`, `estado`) VALUES
	(111, 'Farley', 'Viberos Blanco', '2023-05-21', 'Asiste'),
	(222, 'Aurelia', 'Japura Quispe', '2023-05-21', 'Asiste'),
	(333, 'Jorge', 'Luna Lunera', '2023-05-21', 'Tarde'),
	(444, 'Fabricio', 'Lipe Alva', '2023-06-21', 'Falta'),
	(111, 'Farley', 'Viberos Blanco', '2023-06-23', 'Asiste'),
	(888, 'Maria', 'Chambilla', '2023-06-26', 'Tarde');

-- Volcando estructura para tabla agenda_jobs.eventoscalendar
CREATE TABLE IF NOT EXISTS `eventoscalendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(250) DEFAULT NULL,
  `color_evento` varchar(20) DEFAULT NULL,
  `fecha_inicio` varchar(20) DEFAULT NULL,
  `fecha_fin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla agenda_jobs.eventoscalendar: ~4 rows (aproximadamente)
INSERT INTO `eventoscalendar` (`id`, `evento`, `color_evento`, `fecha_inicio`, `fecha_fin`) VALUES
	(2, 'Reunion APAFA', 'amber', '2023-07-17', '2023-07-18'),
	(3, 'Juegos Deportivos', 'orange', '2023-08-03', '2023-08-12'),
	(19, 'Jincana Deportiva', '#FFC107', '2023-06-21', '2023-06-25'),
	(20, 'Reunion Antes De La Jincana', '#2196F3', '2023-06-07', '2023-06-10');

-- Volcando estructura para tabla agenda_jobs.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla agenda_jobs.rol: ~2 rows (aproximadamente)
INSERT INTO `rol` (`idrol`, `nombre`) VALUES
	(1, 'Administrador'),
	(2, 'Docente');

-- Volcando estructura para tabla agenda_jobs.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `codusuario` int(11) NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `apellido` varchar(250) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `contraseña` varchar(250) DEFAULT NULL,
  `fk_idrol` int(11) DEFAULT NULL,
  PRIMARY KEY (`codusuario`),
  KEY `fk_idrol` (`fk_idrol`),
  CONSTRAINT `FK_usuarios_rol` FOREIGN KEY (`fk_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla agenda_jobs.usuarios: ~9 rows (aproximadamente)
INSERT INTO `usuarios` (`codusuario`, `nombre`, `apellido`, `correo`, `telefono`, `contraseña`, `fk_idrol`) VALUES
	(111, 'Rene', 'Poma Manchego', 'rene@upt.pe', 987654321, 'rene123', 1),
	(222, 'Renato', 'Chambilla Mardinez', 'renato@upt.pe', 951236589, 'renato123', 2),
	(333, 'Carlos', 'Aguilar Soto', 'carlos@upt.pe', 975845621, 'carlos123', 1),
	(444, 'Raul', 'Aguilar Lopez', 'raul@upt.pe', 963258741, 'raul123', 2),
	(555, 'Farley', 'Viveros', 'hola@gmail.com', 98765423, 'farley123', 2),
	(666, 'richard', 'Guzman', 'hola@gmail.com', 98765423, 'richard123', 2),
	(777, 'richard', 'Guzman', 'hola@gmail.com', 98765423, '123', 2),
	(888, 'Emiliano', 'Martinez', 'hola@gmail.com', 98765423, 'emiliano123', 1),
	(999, 'Mario', 'Bros', 'mario123@gmail.com', 987654321, 'mario123', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
