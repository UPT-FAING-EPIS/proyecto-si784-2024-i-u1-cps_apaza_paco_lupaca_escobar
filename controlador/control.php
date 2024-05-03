<?php
session_start();
include("../conexion.php");

if (isset($_POST['usuario']) && isset($_POST['password'])) {
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];

    $link = Conectarse();

    // Preparar la consulta SQL utilizando sentencias preparadas
    $stmt = $link->prepare("SELECT * FROM usuarios WHERE codusuario = ? AND contraseña = ?");
    if ($stmt === false) {
        die('Error al preparar la consulta: ' . htmlspecialchars($link->error));
    }

    // Vincular los parámetros
    $stmt->bind_param("ss", $usuario, $password);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener los resultados
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $campo = $result->fetch_assoc() or die ("Fallo en la consulta");
        $rol = $campo['fk_idrol']; // Asegúrate de que 'fk_idrol' es el nombre correcto del campo

        // Aquí tu lógica basada en el rol...
    } else {
        header("Location: ../index.php?errorusuario=si");
    }

    // Cerrar la sentencia y la conexión
    $stmt->close();
    $link->close();
}
?>