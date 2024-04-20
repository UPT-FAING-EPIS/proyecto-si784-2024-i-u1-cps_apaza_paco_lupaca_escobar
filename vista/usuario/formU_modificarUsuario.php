<!-- Empezado por Rene Poma Manchego -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Mantenimiento Usuarios</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .form-control {
            width: 100%;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #545b62;
            border-color: #545b62;
        }
    </style>
</head>
<body>
    <div class="container">
        <article>
            <?php
            include("../../conexion.php");
            $link = conectarse();
            $id = $_GET['cod'];
            $nombre = $_GET['nombre'];
            $apellido = $_GET['apellido'];
            $telefono = $_GET['tel'];
            $contrasenia = $_GET['contra'];
            $correo = $_GET['email'];
            $idrol = $_GET['idrol'];
            ?>
            <form method="post" action="../../modelo/editaU_usuarios.php" enctype="multipart/form-data">
                <h3 class="mb-4">EDITAR USUARIOS</h3>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" value="<?php echo $nombre ?>" />
                </div>
                <div class="form-group">
                    <label for="apellido">Apellidos:</label>
                    <input type="text" class="form-control" name="apellido" id="apellido" value="<?php echo $apellido ?>" />
                </div>
                <div class="form-group">
                    <label for="telefono">Telefono:</label>
                    <input type="text" class="form-control" name="telefono" id="telefono" value="<?php echo $telefono ?>" />
                </div>
                <div class="form-group">
                    <label for="correo">Correo Electronico:</label>
                    <input type="text" class="form-control" name="correo" id="correo" value="<?php echo $correo ?>" />
                </div>
                <div class="form-group">
                    <label for="contra">Contraseña:</label>
                    <input type="text" class="form-control" name="contra" id="contra" value="<?php echo $contrasenia ?>" />
                </div>
                <div class="form-group">
                    <label for="idrol">Rol:</label>
                    <select class="form-control" name="idrol">
                        <option value="1" <?php if ($idrol == 1) echo 'selected'; ?>>Adminitrador</option>
                        <option value="2" <?php if ($idrol == 2) echo 'selected'; ?>>Docente</option>
                    </select>
                </div>
                <input type="submit" class="btn btn-primary" value="Actualizar Usuario" />
                <input type="hidden" value="<?= $id ?>" name="id">
            </form>
            <a class="btn btn-secondary mt-3" href="./formU_menu_usuario.php">Volver</a>
        </article>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

<!-- Terminado por Rene Poma Manchego -->