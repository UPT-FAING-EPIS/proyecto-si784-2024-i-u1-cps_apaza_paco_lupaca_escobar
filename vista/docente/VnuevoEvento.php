<?php
  date_default_timezone_set("America/Lima");
  setlocale(LC_ALL,"es_ES");
  //$hora = date("g:i:A");

  require("../../config.php");
  $evento = ucwords($_REQUEST['evento']);
  $f_inicio = $_REQUEST['fecha_inicio'];
  $fecha_inicio = date('Y-m-d', strtotime($f_inicio)); 

  $f_fin = $_REQUEST['fecha_fin']; 
  $seteando_f_final = date('Y-m-d', strtotime($f_fin));  
  $fecha_fin1 = strtotime($seteando_f_final . "+ 1 days");
  $fecha_fin = date('Y-m-d', $fecha_fin1);  
  $color_evento = $_REQUEST['color_evento'];

  // Prepara la sentencia SQL para evitar inyección SQL
  $stmt = $con->prepare("INSERT INTO eventoscalendar (evento, fecha_inicio, fecha_fin, color_evento) VALUES (?, ?, ?, ?)");
  
  // Verificar si la preparación de la sentencia fue correcta
  if ($stmt === false) {
      die('Error al preparar la sentencia: ' . $con->error);
  }

  // Vincula los parámetros a la sentencia
  $stmt->bind_param("ssss", $evento, $fecha_inicio, $fecha_fin, $color_evento);

  // Ejecuta la sentencia
  $stmt->execute();

  // Verifica si hubo errores durante la ejecución de la sentencia
  if ($stmt->error) {
      die('Error al ejecutar la sentencia: ' . $stmt->error);
  }

  // Cierra la sentencia y la conexión
  $stmt->close();
  $con->close();

  // Redirige al usuario a la página indicada
  header("Location: ./Vindex.php?e=1");
  exit();
?>