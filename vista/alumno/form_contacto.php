<!-- Empezado por Aurelia Japura Herminia -->
<!doctype html> 
<html> 
<head> 
<meta charset="utf-8"> 
<title> Inicio</title> 
<link href="../../resources/css/estilos.css" rel="stylesheet" type="text/css">
<link href="../../resources/css/estiloform.css" rel="stylesheet">  
<meta name="viewport" content="width=device-width"> 
</head> 
<body>
<div id="container">
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<style>
  .ren{text-align: center;}
  .img{width: 50%;height: 200px;text-align: left;}
</style>
    <section>
        <aside id="div2" class="ren">
        <img src="../resources/img/banner3.jpg" alt="Agenda virtual" class="img">
        </aside>
</section>
<section>
        <h1 align ="center">Contacto</h1>
        <form  align ="center" action="./index.php" method="post">
            <p>Escriba su nombre :</p>
            <input type="text" name="nom" id="nom" />
            <p>Escriba su Apellido :</p>
            <input type="text" name="ape" id="ape" />
            <p>Escriba su Telefono :</p>
            <input type="text" name="telefono" id="telefono" />
            <p>Escriba su Correo :</p>
            <input type="text" name="corro" id="correo" />
            <p>Mensaje:</p>
            <textarea id="msj" name="msj"></textarea>
            <br><br>
            <input type="submit" value="Enviar Mensaje" name="enviar"> 
        </form>
        <br>
        <br>
</section>
<a href="./index.php">Volver</a> <!--para salir al index principal-->
<df-messenger
  intent="WELCOME"
  chat-title="SteveJobsBot"
  agent-id="1379af8f-0cd0-4d86-8f5a-38a2470bbea1"
  language-code="es"
></df-messenger>
</div> 
</body> 
</html>
<!-- Terminado por Aurelia Japura Herminia -->