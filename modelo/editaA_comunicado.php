<?php 
include("../conexion.php");

// Asegúrate de que conectarse() devuelve un objeto mysqli válido.
$link = conectarse();

// Comprobar si se enviaron los datos requeridos por el formulario.
if (isset($_POST['id'], $_POST['observa'])) {
    $id = $_POST['id'];
    $observa = $_POST['observa'];

    // Preparar la consulta SQL para evitar inyección SQL.
    $stmt = $link->prepare("UPDATE alumno SET observa = ? WHERE codalumno = ?");

    // Comprobar si la preparación fue exitosa.
    if ($stmt === false) {
        die('Error al preparar la consulta: ' . htmlspecialchars($link->error));
    }

    // Vincular los parámetros a la sentencia preparada.
    $stmt->bind_param("ss", $observa, $id);

    // Ejecutar la sentencia.
    $stmt->execute();

    // Comprobar si hubo errores durante la ejecución.
    if ($stmt->error) {
        die('Error al ejecutar la sentencia: ' . htmlspecialchars($stmt->error));
    }

    // Cerrar la sentencia y la conexión.
    $stmt->close();
    $link->close();

    $mensaje = 'El registro del comunicado fue realizado con éxito';
    $btnMensaje = 'Retornar';
    $btnHref = '../vista/docente/formA_agregarcomunicado.php';
} else {
    $mensaje = 'Error al insertar el registro de comunicado';
    $btnMensaje = 'Retornar';
    $btnHref = '../vista/docente/formA_agregarcomunicado.php';
}
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
                <div class="alert <?php echo ($stmt->affected_rows > 0) ? 'alert-success' : 'alert-danger'; ?>" role="alert">
                    <?php echo $mensaje; ?>
                </div>
                <a class="btn btn-primary font-weight-bold" href="<?php echo $btnHref; ?>"><?php echo $btnMensaje; ?></a>
            </div>    
        </div>
    </body>
</html>