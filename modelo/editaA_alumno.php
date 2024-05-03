<!DOCTYPE html>
<html>
<head>
    <title>Registro de Alumno</title>
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
            // Incluir módulo de conexión
            include("../conexion.php");
            $link = conectarse();

            // Asumiendo que la contraseña se almacenará usando una función de hash segura como password_hash()
            $usuario = $_POST['usuario'];
            $nombre = $_POST['nombre'];
            $apellido = $_POST['apellido'];
            $email = $_POST['email'];
            $telefono = $_POST['telefono'];
            $clave = password_hash($_POST['clave'], PASSWORD_DEFAULT); // Utilizar password_hash()

            // Preparar la sentencia SQL para evitar inyección SQL
            $stmt = $link->prepare("INSERT INTO `alumno` (`codalumno`, `nombre`, `apellido`, `correo`, `telefono`, `contraseña`) VALUES (?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssssss", $usuario, $nombre, $apellido, $email, $telefono, $clave);
            $result = $stmt->execute();

            if ($result) {
                echo '<div class="h1 font-weight-bold" role="alert">';
                echo 'El registro del nuevo alumno fue insertado con éxito';
                echo '</div>';
                echo '<hr>';
                echo '<a class="btn btn-primary font-weight-bold" href="../vista/docente/menu_alumno.php">Retornar</a>';
            } else {
                echo '<div class="alert alert-danger" role="alert">';
                echo 'Error al insertar el registro de nuevo alumno: ' . htmlspecialchars($stmt->error);
                echo '</div>';
                echo '<a class="btn btn-primary font-weight-bold" href="../vista/docente/formA_agregaralumno.php">Retornar</a>';
            }

            $stmt->close();
            $link->close();
            ?>
        </div>
    </div>  
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
