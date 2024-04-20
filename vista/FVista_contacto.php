<!-- Empezado por Rene Poma Manchego -->
<!doctype html> 
<html> 
<head> 
<meta charset="utf-8"> 
<title>Inicio</title> 
<link href="../resources/css/estilos.css" rel="stylesheet" type="text/css">
<link href="../resources/css/estiloform.css" rel="stylesheet">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width"> 
</head> 
<body>
  <center>
  <div id="container">
  <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
  <style>
    .ren{text-align: center;}
    .img{width: 100%;height: 300px;text-align: left;}
  </style>
      <section>
          <aside id="div2" class="ren">
          <img src="../resources/img/banner4.jpg" alt="Agenda virtual" class="img">
          </aside>
  </section>
  <section>
      
      <h1 align ="center">Déjanos un mensaje, te contactaremos pronto</h1>
      <form align="center" action="../menu_admin.php" method="post">
          <p>Escribe tu nombre:</p>
          <input type="text" name="nom" id="nom" />
          <p>Escribe tu apellido:</p>
          <input type="text" name="ape" id="ape" />
          <p>Escribe tu teléfono:</p>
          <input type="text" name="telefono" id="telefono" />
          <p>Escribe tu correo:</p>
          <input type="text" name="correo" id="correo" />
          <p>Mensaje:</p>
          <textarea id="msj" name="msj"></textarea>
          <br><br>
          <input class="btn btn-success btn-lg" type="submit" value="Enviar Mensaje" name="enviar"> 
      </form>
      <br>
      <a class="btn btn-success btn-lg" href="../menu_admin.php">Volver</a> <!--para salir al índice principal--><br><br>
  </section>
  
  <df-messenger
    intent="WELCOME"
    chat-title="SteveJobsBot"
    agent-id="1379af8f-0cd0-4d86-8f5a-38a2470bbea1"
    language-code="es"
  ></df-messenger>
  </div> 
</center>
</body> 
</html>
<!-- Terminado por Rene Poma Manchego -->
