<!-- Empezado por Renato Chambilla Mardinez -->
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Edita Asistencia</title>
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
                <?php
                //incluir modulo de conexion 
                include("../conexion.php");

                $link=conectarse(); 
                $usuario=$_POST['id']; 
                $nombre=$_POST['nombre']; 
                $apellido=$_POST['apellido']; 
                $fecha=$_POST['fecha']; 
                if (isset($_POST['estado'])) {
                    $idestado = $_POST['estado'];
                }
                $orden="INSERT INTO `asistencia` (`fkcodalumno`, `fknomalumno`, `fkapealumno`, `fecha`, `estado`) VALUES ('$usuario', '$nombre', '$apellido', '$fecha', '$idestado')";
                $rs=mysqli_query($link, $orden) or die("Fallo en la consulta"); 
                if ($rs == 1) {
                    echo '<div class="h1 font-weight-bold" role="alert">';
                    echo 'La asistencia fue tomada con éxito';
                    echo '</div>';
                    echo '<hr>';
                    echo '<a class="btn btn-primary font-weight-bold" href="../vista/docente/formA_asistencia.php">Retornar</a>';
                } else {
                    echo '<div class="alert alert-danger" role="alert">';
                    echo 'Error al tomar asistencia';
                    echo '</div>';
                    echo '<br>';
                    echo '<br>';
                    echo '<a class="btn btn-primary font-weight-bold" href="../vista/docente/index.php">Retornar</a>';
                }
                mysqli_close($link); 
                ?>
            </div>    
    </div>
</body>
</html>
<!-- Terminado por Renato Chambilla Mardinez -->