<?php
// Utilizar la función 'getenv' para obtener las variables de entorno
$usuario = getenv("DB_USUARIO") ?: 'root'; // Asumiendo 'root' como valor predeterminado si no está establecido
$password = getenv("DB_PASSWORD") ?: ''; // Asumiendo vacío como valor predeterminado si no está establecido
$servidor = getenv("DB_SERVIDOR") ?: 'localhost'; // Asumiendo 'localhost' como valor predeterminado si no está establecido
$basededatos = getenv("DB_NOMBRE") ?: 'agenda_jobs'; // Asumiendo 'agenda_jobs' como valor predeterminado si no está establecido

$con = mysqli_connect($servidor, $usuario, $password) or die("No se ha podido conectar al Servidor");
$db = mysqli_select_db($con, $basededatos) or die("Upps! Error en conectar a la Base de Datos");
?>