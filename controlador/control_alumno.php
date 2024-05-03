<?php
session_start();
include("../conexion.php");

if (isset($_POST['usuario']) && isset($_POST['password'])) {
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];

    $link = Conectarse();
    
    // Preparar la consulta SQL para evitar inyección SQL
    $stmt = $link->prepare("SELECT * FROM alumno WHERE codalumno = ?");
    if ($stmt === false) {
        die('Error al preparar la consulta: ' . htmlspecialchars($link->error));
    }

    // Vincular los parámetros a la sentencia
    $stmt->bind_param("s", $usuario);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener los resultados
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        $campo = $result->fetch_assoc();
        if (password_verify($password, $campo['contraseña'])) {
            // La contraseña es correcta, redirigir a la página de comprobación de alumno
            header("Location: comprobacion_alumno.php");
        } else {
            // La contraseña no es correcta, redirigir al login con un mensaje de error
            header("Location: ../loginalumno.php?errorusuario=si");
        }
    } else {
        // Usuario no encontrado, redirigir al login con un mensaje de error
        header("Location: ../loginalumno.php?errorusuario=si");
    }

    // Cerrar la sentencia y la conexión
    $stmt->close();
    $link->close();
}
exit(); // Colocar exit() aquí para asegurar que la ejecución del script se detiene después de la redirección
?>