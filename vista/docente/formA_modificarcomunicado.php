<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Mantenimiento Comunicados</title>
    <meta name="viewport" content="width=device-width">
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
            // Asegurarse de que todas las variables GET son escapadas adecuadamente
            $id = isset($_GET['cod']) ? htmlspecialchars($_GET['cod'], ENT_QUOTES, 'UTF-8') : '';
            $nombre = isset($_GET['nombre']) ? htmlspecialchars($_GET['nombre'], ENT_QUOTES, 'UTF-8') : '';
            $apellido = isset($_GET['apellido']) ? htmlspecialchars($_GET['apellido'], ENT_QUOTES, 'UTF-8') : '';
            $telefono = isset($_GET['telefono']) ? htmlspecialchars($_GET['telefono'], ENT_QUOTES, 'UTF-8') : '';
            $correo = isset($_GET['email']) ? htmlspecialchars($_GET['email'], ENT_QUOTES, 'UTF-8') : '';
            $observacion = isset($_GET['observa']) ? htmlspecialchars($_GET['observa'], ENT_QUOTES, 'UTF-8') : '';
            ?>
               <form method="post" action="../../modelo/editaA_comunicado.php" enctype="multipart/form-data">
               <h3 class="mb-4">EDITAR COMUNICADO</h3><br>
                    <div class="form-group">                  
                        <label for="nombre"> Nombre:</label>
                        <input type="text" class="form-control" name="nombre" id="nombre" value="<?php echo htmlspecialchars($nombre, ENT_QUOTES, 'UTF-8')?>" size="35" disabled/>
                    </div>
                    <div class="form-group">
                        <label for="apellido"> Apellidos:</label>
                        <input type="text" class="form-control" name="apellido" id="apellido" value="<?php echo htmlspecialchars($apellido, ENT_QUOTES, 'UTF-8')?>" size="35" disabled/>
                    </div>
                    <div class="form-group">
                        <label for="telefono"> Telefono:</label>
                        <input type="text" class="form-control" name="telefono" id="telefono" value="<?php echo htmlspecialchars($telefono, ENT_QUOTES, 'UTF-8')?>" size="35" disabled/>
                    </div>
                    <div class="form-group">
                        <label for="correo"> Correo Electronico:</label>
                        <input type="text" class="form-control" name="correo" id="correo" value="<?php echo htmlspecialchars($correo, ENT_QUOTES, 'UTF-8')?>" size="35" disabled/>
                    </div>
                    <div class="form-group">
                        <label for="observa"> Comunicado:</label>
                        <textarea id="observa" class="form-control" name="observa"><?php echo htmlspecialchars($observacion, ENT_QUOTES, 'UTF-8')?></textarea>
                    <div>
                    <br>               
                    <input type="submit" class="btn btn-primary" value="Actualizar Comunicado"/>
                <input type="hidden" value="<?php echo $id; ?>" name="id">
            </form>
            <br>
            <a class="btn btn-secondary mt-3" href="./index.php">Volver</a> <!--para salir al index principal-->
        </article>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

