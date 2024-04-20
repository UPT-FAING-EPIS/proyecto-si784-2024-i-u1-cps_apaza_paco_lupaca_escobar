<!-- Empezado por Rene Poma Manchego -->
<!DOCTYPE html> 
<html> 
<head> 
  <meta charset="utf-8"> 
  <title>Mantenimiento Usuarios - Agenda Jobs</title>   
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .container {
      margin-top: 20px;
    }
    .card-header {
      background-color: #9c27b0;
      color: white;
    }
    .btn-primary {
      background-color: #9c27b0;
      border-color: #9c27b0;
    }
    .btn-primary:hover {
      background-color: #7b1fa2;
      border-color: #7b1fa2;
    }
    .btn-secondary {
      background-color: #ccc;
      border-color: #ccc;
    }
    .btn-secondary:hover {
      background-color: #bbb;
      border-color: #bbb;
    }
  </style>
</head> 
<body> 
<div class="container"> 
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<section> 
<article> 
<?php  
include("../../conexion.php"); 
$link = conectarse(); 
$instruccion= "SELECT usuarios.codusuario, usuarios.nombre, usuarios.apellido, usuarios.correo, usuarios.telefono, usuarios.contraseña , usuarios.fk_idrol
FROM usuarios";
?>
<center><h1>Mantenimiento de Usuarios</h1></center>
<div class="card">
  <div class="card-header">
    <h4>Usuarios</h4>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Código</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Teléfono</th>
            <th>Contraseña</th>
            <th>Rol</th>
            <th>Operación</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $rs = mysqli_query($link, $instruccion) or die("Fallo en la Consulta");
          $n = mysqli_num_rows($rs);
          while ($campo = mysqli_fetch_array($rs)) {
            ?>
            <tr>
              <td><?php echo $campo["codusuario"]; ?></td>
              <td><?php echo $campo["nombre"]; ?></td>
              <td><?php echo $campo["apellido"]; ?></td>
              <td><?php echo $campo["correo"]; ?></td>
              <td><?php echo $campo["telefono"]; ?></td>
              <td><?php echo $campo["contraseña"]; ?></td>
              <td><?php echo $campo["fk_idrol"]; ?></td>
              <td>
                <a class="btn btn-primary" href="./formU_modificarUsuario.php?cod=<?= $campo['codusuario'] ?>&nombre=<?= $campo['nombre'] ?>&apellido=<?= $campo['apellido'] ?>&tel=<?= $campo['telefono'] ?>&contra=<?= $campo['contraseña'] ?>&email=<?= $campo['correo'] ?>&idrol=<?= $campo['fk_idrol'] ?>">Modificar</a>
              </td>
            </tr>
          <?php
          }
          mysqli_close($link);
          ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
</article> 
</section> 
<a class="btn btn-warning btn-lg mt-3" href="./formU_menu_usuario.php">
  <i class="fas fa-arrow-left"></i> Volver</a>

</div> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body> 
</html>
<!-- Terminado por Rene Poma Manchego -->