<?php
    date_default_timezone_set("America/Lima");
    setlocale(LC_ALL,"es_ES");

    include('../config.php');
                            
    // Obtener los datos del formulario
    $idEvento = $_POST['idEvento'];
    $evento = ucwords($_REQUEST['evento']);
    $f_inicio = $_REQUEST['fecha_inicio'];
    $fecha_inicio = date('Y-m-d', strtotime($f_inicio)); 

    $f_fin = $_REQUEST['fecha_fin']; 
    $seteando_f_final = date('Y-m-d', strtotime($f_fin));  
    $fecha_fin1 = strtotime($seteando_f_final . " + 1 days");
    $fecha_fin = date('Y-m-d', $fecha_fin1);  
    $color_evento = $_REQUEST['color_evento'];

    // Preparar la consulta
    $stmt = $con->prepare("UPDATE eventoscalendar SET evento = ?, fecha_inicio = ?, fecha_fin = ?, color_evento = ? WHERE id = ?");
    if ($stmt === false) {
        // Manejar error aquí
    }

    // Vincular parámetros a la consulta
    $stmt->bind_param("ssssi", $evento, $fecha_inicio, $fecha_fin, $color_evento, $idEvento);

    // Ejecutar la consulta
    $stmt->execute();

    // Chequear por errores en la ejecución
    if ($stmt->error) {
        // Manejar error aquí
    }

    // Cerrar la sentencia y la conexión
    $stmt->close();
    $con->close();

    // Redireccionar a la página de índice
    header("Location: ./Vindex.php?ea=1");
    exit();
?>