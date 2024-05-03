<?php
include("../conexion.php");
$link = conectarse();

// Comprobación de seguridad: Asegúrate de que todas las variables POST necesarias estén establecidas.
if (isset($_POST['usuario'], $_POST['nombre'], $_POST['apellido'], $_POST['email'], $_POST['telefono'], $_POST['clave'], $_POST['idrol'])) {
    $usuario = $_POST['usuario'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $clave = $_POST['clave'];
    $idrol = $_POST['idrol'];

    // Preparar la consulta para evitar la inyección de SQL.
    $stmt = $link->prepare("INSERT INTO `usuarios` (`codusuario`, `nombre`, `apellido`, `correo`, `telefono`, `contraseña`, `fk_idrol`) VALUES (?, ?, ?, ?, ?, ?, ?)");

    // Comprobar si la preparación fue exitosa.
    if ($stmt === false) {
        die('Error al preparar la consulta: ' . htmlspecialchars($link->error));
    }

    // Vincular los parámetros y ejecutar la sentencia.
    $stmt->bind_param("sssssss", $usuario, $nombre, $apellido, $email, $telefono, $clave, $idrol);
    $stmt->execute();

    // Verificar si se realizó la inserción y cerrar la sentencia y la conexión.
    if ($stmt->affected_rows > 0) {
        $mensaje = 'El registro del usuario fue realizado con éxito';
    } else {
        $mensaje = 'Error al registrar el usuario';
    }
    $stmt->close();
} else {
    $mensaje = 'Error: No se proporcionaron todos los datos requeridos.';
}

$link->close();
?>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Edita Usuarios</title>
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f2f2f2;
                padding-top: 0px;
            }
            
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            
            .card {
                max-width: 500px;
                text-align: center;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }
            
            .btn-primary {
                margin-top: 20px;
                background-color: #ff6600; 
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="<?php echo ($mensaje === 'El registro del usuario fue realizado con éxito') ? 'alert alert-success' : 'alert alert-danger'; ?>" role="alert">
                    <?php echo $mensaje; ?>
                </div>
                <a class="btn btn-primary font-weight-bold" href="<?php echo ($mensaje === 'El registro del usuario fue realizado con éxito') ? '../vista/usuario/formU_menu_usuario.php' : '../vista/usuario/formU_agregarUsuario.php'; ?>">Retornar</a>
            </div>
        </div>
    </body>
</html>