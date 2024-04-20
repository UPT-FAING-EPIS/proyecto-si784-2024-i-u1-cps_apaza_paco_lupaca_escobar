<!-- Empezado por Farley Viveros Blanco -->
<!doctype html> 
<html> 
<head> 
  <meta charset="utf-8"> 
  <title>Agregar alumno - Agenda Jobs</title>
  <meta name="viewport" content="width=device-width"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
      color: #9c27b0;
      margin-bottom: 30px;
    }

    .form-label {
      font-weight: bold;
      color: #9c27b0;
    }

    .form-control {
      border-radius: 5px;
    }

    .btn-primary {
      background-color: #9c27b0;
      border-color: #9c27b0;
    }

    .btn-primary:hover {
      background-color: #7b1fa2;
      border-color: #7b1fa2;
    }

    .btn-back {
      color: #9c27b0;
      text-decoration: none;
      font-size: 14px;
    }

    .btn-back:hover {
      text-decoration: underline;
    }
  </style>
  </head> 
<body> 
<div class="container">
<?php include("../../conexion.php"); ?>
</div>
  <div class="container">
  <h2>Steve Jobs - Agenda Virtual</h2>
  <form method="post" action="../../modelo/editaA_alumno.php" enctype="multipart/form-data">
    <div class="form-group"> 
      <label for="usuario" class="form-label">Cod-Alumno:</label> 
      <input type="number" name="usuario" id="usuario" class="form-control" placeholder="Usuario" required><br>
    </div>
    <div class="form-group">
      <label for="nombre" class="form-label">Nombre:</label> 
      <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Nombre" required><br>
    </div>
    <div class="form-group">
      <label for="apellido" class="form-label">Apellidos:</label> 
      <input type="text" name="apellido" id="apellido" class="form-control" placeholder="Apellido" required><br>
    </div>
    <div class="form-group">
      <label for="email" class="form-label">Email:</label> 
      <input type="email" name="email" id="email" class="form-control" placeholder="email@.gmail" required><br>
    </div>
    <div class="form-group">
      <label for="telefono" class="form-label">Telefono:</label> 
      <input type="tel" name="telefono" id="telefono" class="form-control" placeholder="xxx-xxx-xxx" required><br>
    </div>
    <div class="form-group">
      <label for="clave" class="form-label">Contraseña:</label> 
      <input type="password" name="clave" id="clave" class="form-control" placeholder="Contraseña" maxlength="20" required><br>
    </div>
    <div class="form-group text-center">
      <input type="submit" value="Registrar" name="enviar" class="btn btn-primary">
    </div> 
    </form>
    <div class="text-center">  
      <a href="./menu_alumno.php">Volver</a> <!--para salir al index principal-->
    </div>
  </div>
  </aside>
<df-messenger intent="WELCOME" chat-title="SteveJobsBot" agent-id="1379af8f-0cd0-4d86-8f5a-38a2470bbea1" language-code="es"></df-messenger>
</div> 
</body> 
</html>

<!-- Terminado por Farley Viveros Blanco -->