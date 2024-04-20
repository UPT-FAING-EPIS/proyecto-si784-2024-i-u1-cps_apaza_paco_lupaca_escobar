<!-- Empezado por Renato Chambilla Mardinez -->
<!DOCTYPE html>
<html>
<head>
  <title>Bienvenido alumno - Agenda Jobs</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f2f2f2;
      padding-top: 100px;
    }
    
    .card {
      max-width: 500px;
      margin: 0 auto;
      text-align: center;
      padding: 20px;
    }
    
    h1 {
      color: #333333;
      margin-bottom: 30px;
    }
    
    .btn-start {
      font-size: 18px;
    }
  </style>
  <script>
    function redireccionar() {
      var contador = 3;
      var elementoContador = document.getElementById('contador');
      
      var intervalo = setInterval(function() {
        elementoContador.innerHTML = contador;
        contador--;
        
        if (contador < 0) {
          clearInterval(intervalo);
          window.location.href = '../vista/alumno/index.php';
        }
      }, 1000);
    }
  </script>
</head>
<body onload="redireccionar()">
  <div class="container">
    <div class="card">
      <div class="card-body">
        <h1 class="card-title">Bienvenido, te has autenticado como Alumno</h1>
        <p>Redireccionando en <span id="contador">3</span> segundos...</p>
        <a href="../vista/alumno/index.php" class="btn btn-success btn-lg btn-start">Comienza aquí</a>
      </div>
    </div>
  </div>  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
<!-- Terminado por Renato Chambilla Mardinez -->
