<!-- Empezado por Renato Chambilla Mardinez -->
<?php 
include("../conexion.php");
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
        <?php         
        $link = conectarse();
        $id=$_POST['id'];
        $observa=$_POST['observa'];
        $query = "update alumno set  observa='$observa' where codalumno='$id'";
        $rs = mysqli_query($link,$query);
        mysqli_close($link);        
        if($rs==1)
        if ($rs == 1) {
            echo '<div class="h1 font-weight-bold" role="alert">';
            echo 'El registro del comunicado fue realizado con éxito';
            echo '</div>';
            echo '<hr>';
            echo '<a class="btn btn-primary font-weight-bold" href="../vista/docente/formA_agregarcomunicado.php">Retornar</a>';
        } else {
            echo '<div class="alert alert-danger" role="alert">';
            echo 'Error al insertar el registro de comunicado';
            echo '</div>';
            echo '<br>';
            echo '<br>';
            echo '<a class="btn btn-primary font-weight-bold" href="../vista/docente/formA_agregarcomunicado.php">Retornar</a>';
        }
        ?>
        </div>    
    </div>
</body>
</html>
<!-- Terminado por Renato Chambilla Mardinez -->
