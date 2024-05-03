<?php 
include("../conexion.php");
// Asegúrate de que conectarse() devuelve un objeto mysqli válido.
$link = conectarse();

// Comprueba si los valores existen antes de asignarlos
$id = isset($_POST['id']) ? $_POST['id'] : '';
$nombre = isset($_POST['nombre']) ? $_POST['nombre'] : '';
$apellido = isset($_POST['apellido']) ? $_POST['apellido'] : '';
$telefono = isset($_POST['telefono']) ? $_POST['telefono'] : '';
$contrasenia = isset($_POST['contra']) ? $_POST['contra'] : ''; // Considera usar password_hash aquí si es una contraseña
$correo = isset($_POST['correo']) ? $_POST['correo'] : '';

// Prepara la sentencia SQL para evitar inyección SQL
$stmt = $link->prepare("UPDATE alumno SET nombre = ?, apellido = ?, correo = ?, telefono = ?, contraseña = ? WHERE codalumno = ?");

// Comprueba si la preparación fue exitosa
if ($stmt === false) {
    die('Error al preparar la consulta: ' . htmlspecialchars($link->error));
}

// Vincula los parámetros a la sentencia preparada
$stmt->bind_param("ssssss", $nombre, $apellido, $correo, $telefono, $contrasenia, $id);

// Ejecuta la sentencia
$stmt->execute();

// Comprueba si hubo errores durante la ejecución
if ($stmt->error) {
    die('Error al ejecutar la sentencia: ' . htmlspecialchars($stmt->error));
}

// Cerrar la sentencia y la conexión
$stmt->close();
$link->close();
?>
<!doctype html>
<html>
<head>
    <!-- El resto del head aquí -->
</head>
<body>
    <div class="container">
        <div class="card">
        <!-- El contenido de tu tarjeta aquí -->
        <?php 
        if ($stmt->affected_rows > 0) {
            echo '<div class="h1 font-weight-bold" role="alert">';
            echo 'El registro del alumno fue actualizado con éxito';
            echo '</div>';
            echo '<hr>';
            echo '<a class="btn btn-primary font-weight-bold" href="../vista/docente/menu_alumno.php">Retornar</a>';
        } else {
            echo '<div class="alert alert-danger" role="alert">';
            echo 'Error al actualizar el registro de alumno';
            echo '</div>';
            echo '<a class="btn btn-primary font-weight-bold" href="../vista/docente/formA_agregaralumno.php">Retornar</a>';
        }
        ?>
        </div>    
    </div>
</body>
</html>