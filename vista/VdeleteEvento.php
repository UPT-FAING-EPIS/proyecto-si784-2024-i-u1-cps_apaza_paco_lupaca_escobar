<?php
  require_once('../config.php');
// Recuperar el 'id' del evento de manera segura
$id = $_REQUEST['id'];

// Preparar la sentencia SQL para prevenir inyección SQL
if ($stmt = $con->prepare("DELETE FROM eventoscalendar WHERE id = ?")) {
    // Vincular el parámetro 'id' a la variable $id
    $stmt->bind_param("i", $id);

    // Ejecutar la sentencia
    $stmt->execute();

    // Cerrar la sentencia
    $stmt->close();
} else {
    // Manejar el error de preparación aquí
    error_log('Error al preparar la sentencia: ' . $con->error);
}

// Cerrar la conexión a la base de datos
$con->close();

// Redireccionar al usuario a la página deseada
header("Location: ./Vindex.php?ea=1");
exit();
?>