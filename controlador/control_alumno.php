<!-- Empezado por Renato Chambilla Mardinez -->
<?php
session_start();
include("../conexion.php");

if (isset($_POST['usuario']) && isset($_POST['password'])) {
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];
    //$password = sha1(md5($_POST['passTxt']));
}

$link = Conectarse();
$sql = "SELECT * FROM alumno WHERE codalumno = '$usuario' AND contraseña = '$password'";
$rs = mysqli_query($link, $sql);

if ($rs && mysqli_num_rows($rs) > 0) {
    header("Location: comprobacion_alumno.php");
    exit(); // Agregamos exit() para detener la ejecución después de redirigir
} else {
    header("Location: ../loginalumno.php?errorusuario=si");
    exit(); // Agregamos exit() para detener la ejecución después de redirigir
}

mysqli_free_result($rs);
mysqli_close($link);
?>
<!-- Terminado por Renato Chambilla Mardinez -->
