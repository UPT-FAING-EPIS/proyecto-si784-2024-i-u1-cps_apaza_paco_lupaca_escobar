<?php
  date_default_timezone_set("America/Lima");
  setlocale(LC_ALL,"es_ES");
  //$hora = date("g:i:A");

  require("../config.php");
// Asegúrate de que la variable $con es una instancia de conexión de mysqli que se crea en config.php

$evento = ucwords($_REQUEST['evento']);
$f_inicio = $_REQUEST['fecha_inicio'];
$fecha_inicio = date('Y-m-d', strtotime($f_inicio)); 

$f_fin = $_REQUEST['fecha_fin']; 
$seteando_f_final = date('Y-m-d', strtotime($f_fin));  
$fecha_fin1 = strtotime($seteando_f_final . " + 1 days");
$fecha_fin = date('Y-m-d', $fecha_fin1);  
$color_evento = $_REQUEST['color_evento'];

// Preparar la sentencia SQL
$stmt = $con->prepare("INSERT INTO eventoscalendar (evento, fecha_inicio, fecha_fin, color_evento) VALUES (?, ?, ?, ?)");

// Verificar si la preparación de la sentencia fue exitosa
if ($stmt === false) {
    // Manejar el error aquí
    die('Error al preparar la sentencia: ' . htmlspecialchars($con->error));
}

// Vincular los parámetros a la sentencia
$stmt->bind_param("ssss", $evento, $fecha_inicio, $fecha_fin, $color_evento);

// Ejecutar la sentencia
$stmt->execute();

// Verificar si hubo errores durante la ejecución
if ($stmt->error) {
    // Manejar el error aquí
    die('Error al ejecutar la sentencia: ' . htmlspecialchars($stmt->error));
}

// Cerrar la sentencia y la conexión
$stmt->close();
$con->close();

// Redirigir al usuario
header("Location: ./Vindex.php?e=1");
exit();
?>