<?php
    date_default_timezone_set("America/Lima");
    setlocale(LC_ALL,"es_ES");

    include('../config.php');
                            
    $idEvento         = $_POST['idEvento'];
    $start            = $_REQUEST['start'];
    $fecha_inicio     = date('Y-m-d', strtotime($start)); 
    $end              = $_REQUEST['end']; 
    $fecha_fin        = date('Y-m-d', strtotime($end));  


    // Prepara la sentencia SQL utilizando sentencias preparadas para prevenir inyección SQL
    $stmt = $con->prepare("UPDATE eventoscalendar SET fecha_inicio = ?, fecha_fin = ? WHERE id = ?");
    if ($stmt === false) {
        die('Error al preparar la sentencia: ' . $con->error);
    }

    // Vincula los parámetros a la sentencia
    $stmt->bind_param("ssi", $fecha_inicio, $fecha_fin, $idEvento);

    // Ejecuta la sentencia
    $stmt->execute();

    // Verifica si hay errores durante la ejecución de la sentencia
    if ($stmt->error) {
        die('Error al ejecutar la sentencia: ' . $stmt->error);
    }

    // Cierra la sentencia y la conexión
    $stmt->close();
    $con->close();

    // Redirige al usuario a una página de confirmación o donde necesites
    header("Location: ./Vindex.php?ea=1");
    exit();
?>