-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para agenda_jobs
CREATE DATABASE IF NOT EXISTS `agenda_jobs` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla agenda_jobs.alumno: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` (`codalumno`, `nombre`, `apellido`, `correo`, `telefono`, `contraseña`, `observa`) VALUES
	(111, 'Farley', 'Viberos Blanco', 'farley@upt.pe', 987654231, 'farley123', 'Llega tarde constantemente'),
	(222, 'Aurelia', 'Japura Quispe', 'aurelia@upt.pe', 987321654, 'aurelia123', 'No trae sus utiles escolares'),
	(333, 'Jorge', 'Luna Lunera', 'jorge@upt.pe', 987963852, 'jorge123', 'Se porta muy mal en clase'),
	(444, 'Fabricio', 'Lipe Alva', 'fabri@upt.pe', 963852741, 'fabri123', ''),
	(555, 'Javier', 'Neyra Machaca', 'javier@upt.pe', 987416523, 'javier123', 'No presta atención a clase'),
	(666, 'Carlos', 'Carrera Rodriguez', 'carlos@upt.pe', 951456123, 'carlos123', NULL),
	(777, 'Renato', 'Rodriguez', 'renato@upt.pe', 963852741, 'renato123', NULL),
	(888, 'Jose', 'Jimenez Carbajal', 'jose@upt.pe', 986598659, 'jose123', NULL),
	(999, 'Marco', 'Aurelio Denegri', 'marco@upt.pe', 987415263, 'marco123', NULL),
	(1010, 'Fiorella', 'Valdivia Guzman', 'fiorella@upt.pe', 963852741, 'fiorella123', NULL);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;

-- Volcando estructura para tabla agenda_jobs.asistencia
CREATE TABLE IF NOT EXISTS `asistencia` (
  `fkcodalumno` int(11) DEFAULT NULL,
  `fknomalumno` varchar(50) DEFAULT NULL,
  `fkapealumno` varchar(50) DEFAULT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  KEY `fkcodalumno` (`fkcodalumno`),
  CONSTRAINT `FK_asistencia_alumno` FOREIGN KEY (`fkcodalumno`) REFERENCES `alumno` (`codalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla agenda_jobs.asistencia: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` (`fkcodalumno`, `fknomalumno`, `fkapealumno`, `fecha`, `estado`) VALUES
	(222, 'Aurelia', 'Japura Quispe', '2023-06-21', 'Asiste'),
	(333, 'Jorge', 'Luna Lunera', '2023-06-21', 'Asiste'),
	(555, 'Javier', 'Neyra Machaca', '2023-06-21', 'Falta'),
	(111, 'Farley', 'Viberos Blanco', '2023-06-21', 'Asiste'),
	(777, 'Aurelia', 'Japura Quispe', '2023-06-21', 'Falta'),
	(888, 'Jose', 'Jimenez Carbajal', '2023-06-21', 'Asiste'),
	(999, 'Marco', 'Aurelio Denegri', '2023-06-21', 'Tarde'),
	(111, 'Farley', 'Viberos Blanco', '2023-06-23', 'Asiste'),
	(222, 'Aurelia', 'Japura Quispe', '2023-06-23', 'Tarde'),
	(333, 'Jorge', 'Luna Lunera', '2023-06-23', 'Asiste'),
	(444, 'Fabricio', 'Lipe Alva', '2023-06-23', 'Asiste'),
	(555, 'Javier', 'Neyra Machaca', '2023-06-23', 'Asiste'),
	(666, 'Carlos', 'Carrera Rodriguez', '2023-06-23', 'Asiste'),
	(777, 'Renato', 'Rodriguez', '2023-06-23', 'Asiste'),
	(888, 'Jose', 'Jimenez Carbajal', '2023-06-23', 'Asiste'),
	(999, 'Marco', 'Aurelio Denegri', '2023-06-23', 'Tarde');
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;

-- Volcando estructura para tabla agenda_jobs.eventoscalendar
CREATE TABLE IF NOT EXISTS `eventoscalendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(250) DEFAULT NULL,
  `color_evento` varchar(20) DEFAULT NULL,
  `fecha_inicio` varchar(20) DEFAULT NULL,
  `fecha_fin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla agenda_jobs.eventoscalendar: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `eventoscalendar` DISABLE KEYS */;
INSERT INTO `eventoscalendar` (`id`, `evento`, `color_evento`, `fecha_inicio`, `fecha_fin`) VALUES
	(2, 'Reunion APAFA', 'amber', '2023-07-17', '2023-07-18'),
	(3, 'Juegos Deportivos', 'orange', '2023-08-03', '2023-08-12'),
	(12, 'Dia Del Padre', '#9c27b0', '2023-06-22', '2023-06-25');
/*!40000 ALTER TABLE `eventoscalendar` ENABLE KEYS */;

-- Volcando estructura para tabla agenda_jobs.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla agenda_jobs.rol: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`idrol`, `nombre`) VALUES
	(1, 'Administrador'),
	(2, 'Docente');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla agenda_jobs.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `codusuario` int(11) NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `apellido` varchar(250) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `contraseña` varchar(250) DEFAULT NULL,
  `fk_idrol` int(11) DEFAULT NULL,
  PRIMARY KEY (`codusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla agenda_jobs.usuarios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`codusuario`, `nombre`, `apellido`, `correo`, `telefono`, `contraseña`, `fk_idrol`) VALUES
	(111, 'Rene', 'Poma Manchego', 'rene@upt.pe', 987654321, 'rene123', 1),
	(222, 'Renato', 'Chambilla Mardinez', 'renato@upt.pe', 951236589, 'renato123', 2),
	(333, 'Carlos', 'Aguilar Soto', 'carlos@upt.pe', 975845621, 'carlos123', 1),
	(444, 'Raul', 'Aguilar Lopez', 'raul@upt.pe', 963258741, 'Raul123', 2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
