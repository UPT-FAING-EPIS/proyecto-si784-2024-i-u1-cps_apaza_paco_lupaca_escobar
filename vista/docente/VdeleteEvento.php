<?php
  require_once('../../config.php');
  // Obtener el ID del evento de manera segura
  $id = $_REQUEST['id']; 

  // Preparar la consulta SQL para evitar inyección SQL
  $stmt = $con->prepare("DELETE FROM eventoscalendar WHERE id = ?");
  
  // Vincular el parámetro al valor de la variable $id
  $stmt->bind_param("i", $id);
  
  // Ejecutar la sentencia
  $stmt->execute();

  // Chequear por errores
  if ($stmt->error) {
    // Manejar el error aquí
  } else {
    // Redirigir o realizar alguna acción si la eliminación fue exitosa
  }

  // Cerrar la sentencia y la conexión
  $stmt->close();
  $con->close();
?>