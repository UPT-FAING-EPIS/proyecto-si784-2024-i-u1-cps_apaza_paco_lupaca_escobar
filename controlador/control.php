<!-- Empezado por Renato Chambilla Mardinez -->
<?php
session_start();
include("../conexion.php");

if (isset($_POST['usuario']) && isset($_POST['password'])) {
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];

    $link = Conectarse();
    $sql = "SELECT * FROM usuarios WHERE codusuario = '$usuario' AND contraseña = '$password'";
    $rs = mysqli_query($link, $sql);
    if (mysqli_num_rows($rs) > 0) {
        $campo = mysqli_fetch_assoc($rs) or die ("fallo en la consulta");
        $rol = $campo['fk_idrol']; // Suponiendo que el campo que almacena el rol se llama 'idrol'

        switch ($rol) {
            case 1:
                header('Location: ../controlador/comprobacion.php');
                break;
            case 2:
                header('Location: ../controlador/comprobacion_docente.php');
                break;
            default:
                // Rol no reconocido, redirigir a una página de error o mostrar un mensaje de error
                header('Location: ../index.php');
                break;
        }
    } else {
        header("Location: ../index.php?errorusuario=si");
    }
    mysqli_free_result($rs);
    mysqli_close($link);
}
//Terminado por Renato Chambilla Mardinez