<?php
    date_default_timezone_set("America/Lima");
    setlocale(LC_ALL,"es_ES");

    require('../../config.php');
    if ($con->connect_error) {
        die("La conexión falló: " . $con->connect_error);
    }
      
                            
    $idEvento = $_POST['idEvento'];

    $evento = ucwords($_REQUEST['evento']);
    $f_inicio = $_REQUEST['fecha_inicio'];
    $fecha_inicio = date('Y-m-d', strtotime($f_inicio)); 

    $f_fin = $_REQUEST['fecha_fin']; 
    $seteando_f_final = date('Y-m-d', strtotime($f_fin));  
    $fecha_fin1 = strtotime($seteando_f_final . " + 1 days");
    $fecha_fin = date('Y-m-d', $fecha_fin1);  
    $color_evento = $_REQUEST['color_evento'];

    // Preparar la consulta SQL
    $stmt = $con->prepare("UPDATE eventoscalendar SET evento = ?, fecha_inicio = ?, fecha_fin = ?, color_evento = ? WHERE id = ?");
    $stmt->bind_param("ssssi", $evento, $fecha_inicio, $fecha_fin, $color_evento, $idEvento);

    // Ejecutar la consulta
    $stmt->execute();
    // Cerrar la sentencia y la conexión
    $stmt->close();
    $con->close();

    // Redirigir al usuario
    header("Location: ./Vindex.php?ea=1");
    exit();
?>
