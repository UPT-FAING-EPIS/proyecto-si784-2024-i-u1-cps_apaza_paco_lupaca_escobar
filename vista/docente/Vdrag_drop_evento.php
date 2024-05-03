<?php
    date_default_timezone_set("America/Lima");
    setlocale(LC_ALL,"es_ES");

    require('../../config.php');
                            
    $idEvento = $_POST['idEvento'];
    $start = $_REQUEST['start'];
    $fecha_inicio = date('Y-m-d', strtotime($start)); 
    $end = $_REQUEST['end']; 
    $fecha_fin = date('Y-m-d', strtotime($end));

    // Preparar la sentencia SQL
    $stmt = $con->prepare("UPDATE eventoscalendar SET fecha_inicio = ?, fecha_fin = ? WHERE id = ?");
    
    // Verificar si la preparación de la sentencia fue correcta
    if ($stmt === false) {
        // Manejo de error de preparación
        die('Error de preparación: ' . $con->error);
    }

    // Vincular parámetros
    $stmt->bind_param("ssi", $fecha_inicio, $fecha_fin, $idEvento);

    // Ejecutar la sentencia
    $stmt->execute();

    // Verificar si hubo errores en la ejecución
    if ($stmt->error) {
        // Manejo de error de ejecución
        die('Error de ejecución: ' . $stmt->error);
    }

    // Cerrar la sentencia y la conexión
    $stmt->close();
    $con->close();

    // Redirección o manejo post-actualización
    header("Location: ./Vindex.php?ea=1");
    exit();
?>