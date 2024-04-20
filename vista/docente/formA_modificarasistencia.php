<!-- Empezado por Farley Viveros Blanco -->
<!doctype html>
<hmtl>
<head>
    <meta charset="utf-8">
    <title>Mantenimiento de asistencia - Agenda Jobs</title>
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
                $id=$_GET['cod'];
                $nombre=$_GET['nombre'];
                $apellido=$_GET['apellido'];      
                $estado=" ";
                ?>                
                <form method="post" action="../../modelo/editaA_asistencia.php" enctype="multipart/form-data">
                    <h3 class="mb-4">EDITAR ASISTENCIA</h3>
                    <div class="form-group">                   
                        <label for="nombre"> Nombre:</label>
                        <input type="text" class="form-control" name="nombre" id="nombre" value="<?php echo $nombre?>" size="35" />
                    </div>
                    <div class="form-group">
                        <label for="apellido"> Apellidos:</label>
                        <input type="text" class="form-control" name="apellido" id="apellido" value="<?php echo $apellido?>" size="35" />
                    </div>
                    <div class="form-group">
                        <label for="fecha">  Día: DD/MM/YYYY </label><br>
                        <input for="fecha" class="form-control" type="date" name="fecha" value=" ">
                    </div>
                    <div class="form-group">
                    <label for="asistencia">Asistencia:</label>
                        <select name="estado" class="form-control" id="">
                        <option value="">Seleccione asistencia</option>
                        <option value="Asiste" <?php if($estado == "Asiste") echo "selected" ?> >Asiste</option>
                        <option value="Tarde" <?php if($estado == "Tarde") echo "selected" ?>>Tarde</option>
                        <option value="Falta" <?php if($estado == "Falta") echo "selected" ?>>Falta</option>
                    </select>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Actualizar Asistencia"/>
                    <input type="hidden" value="<?=$id?>" name="id">                    
                </form>
                <a class="btn btn-secondary mt-3" href="./index.php">Volver</a> <!--para salir al index principal-->
            </article>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</hmtl>

<!-- Terminado por Farley Viveros Blanco -->