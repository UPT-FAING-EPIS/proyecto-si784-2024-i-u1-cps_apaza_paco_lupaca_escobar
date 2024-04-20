<!-- Empezado por Aurelia Japura Herminia -->
<!doctype html> 
<html> 
<head> 
<meta charset="utf-8"> 
<title> Inicio</title> 
<link href="../../resources/css/estilos.css" rel="stylesheet" type="text/css">
<link href="../../resources/css/estiloform.css" rel="stylesheet">  
<meta name="viewport" content="width=device-width"> 
<link rel="stylesheet" href="css/estilos.css">
</head> 
<body>
<div id="container"> 
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<?php 
/* Incluimos la conexion, encabezado y lateral*/ 
include("../../conexion.php"); 
include("./encabezado.php"); 
$link = conectarse(); 
?>
<style>
  .ren
{
    text-align: center;
}
.img
{
  width: 90%;
  height: 250px;
  text-align: left;
}
</style>
<br><br>
<center>
<h1 class="label">Bienvenido Alumno - Agenda Jobs</h1><br>
<div class="col-md-8">
    <div class="text-center">
    <section>

    <div class="container-card">
    <div class="card">

        <aside id="div2" class="ren">
      <figure>
        <img src="../../resources/img/logoo2.jpg" alt="Agenda virtual" class="img">
      </figure>
      <div class="contenido-card">
      <h2>Nuestra Vision</h2>
            <p>Ser una comunidad educativa, comprometida con una 
                formación integral. <br>Caracterizado por la exigencia académica;
                <span id="texto-oculto3" style="display: none;"> 
                formando junto con las familias, niños y jóvenes íntegros, 
                reflexivos con disciplina académica, tomando como modelo a Jesucristo y 
                los principios bíblicos como regla de vida.
                </span></p>
                <a href="#" id="enlace-leer-mas3">Leer Más</a>
                <script>
              document.addEventListener("DOMContentLoaded", function() {
                const enlaceLeerMas = document.getElementById("enlace-leer-mas3");
                const textoOculto = document.getElementById("texto-oculto3");

                enlaceLeerMas.addEventListener("click", function(event) {
                event.preventDefault();

                if (textoOculto.style.display === "none") {
                    textoOculto.style.display = "inline";
                    enlaceLeerMas.textContent = "Leer Menos";
                } else {
                    textoOculto.style.display = "none";
                    enlaceLeerMas.textContent = "Leer Más";
                }
                });
                });
            </script>
            </div>
          </div>
          </div>
        </aside>
  </section>
    <section>
        <br>
        <div class="container-card">
        <div class="card">
        <aside id="div2" class="ren">
        <div class="contenido-card">
        <figure>
        <img src="../../resources/img/banner2.jpg" alt="Agenda virtual" class="img">
        </figure>
        <h2 >Nuestra Mision</h2>
        <p>Ser una Institución Educativa posicionada en nuestra región,
            referentes de exigencia y calidad académica.
            <span id="texto-oculto" style="display: none;">
                Desarrollar en nuestros estudiantes una formación integral, científica y tecnológica,
                enriquecida con los principios bíblicos.
            </span>
        </p>
        <a href="#" id="enlace-leer-mas">Leer Más</a>
        <script>
        document.addEventListener("DOMContentLoaded", function() {
            const enlaceLeerMas = document.getElementById("enlace-leer-mas");
            const textoOculto = document.getElementById("texto-oculto");

            enlaceLeerMas.addEventListener("click", function(event) {
                event.preventDefault();

                if (textoOculto.style.display === "none") {
                    textoOculto.style.display = "inline";
                    enlaceLeerMas.textContent = "Leer Menos";
                } else {
                    textoOculto.style.display = "none";
                    enlaceLeerMas.textContent = "Leer Más";
                }
            });
        });
        </script>
        </div>
          </div>
          </div>
    </aside>
    </section>


    <section>
        <br>
        <div class="container-card">
        <div class="card">
        <aside id="div2" class="ren">
        <div class="contenido-card">
        <figure>
        <img src="../../resources/img/banner3.jpg" alt="Agenda virtual" class="img">
        </figure>
        <h2>Historia</h2>
            <p>En el año 2016 nace y opera en el 2017 bajo resolución RD 03780-30 DIC 2016 
              el Colegio Steve Jobs, con proyectos innovadores de excelencia académica,desarrollo de 
              competencias y capacidades de todos 
              <span id="texto-oculto1" style="display: none;">
                los alumnos, enfocado en influenciar los valores con 
                enfoque bíblico práctico como parte del estilo de vida de la comunidad educativa, orientado 
                al ingreso de los alumnos directo a la universidad; por ello, el Colegio visiona ser un referente
               de excelencia en la educación peruana, comprometidos con los padres de familia y 
               alumnos como el motor de la institución.
               </span>
              </p>
               <a href="#" id="enlace-leer-mas1">Leer Más</a>
            <script>
              document.addEventListener("DOMContentLoaded", function() {
                const enlaceLeerMas = document.getElementById("enlace-leer-mas1");
                const textoOculto = document.getElementById("texto-oculto1");

                enlaceLeerMas.addEventListener("click", function(event) {
                event.preventDefault();

                if (textoOculto.style.display === "none") {
                    textoOculto.style.display = "inline";
                    enlaceLeerMas.textContent = "Leer Menos";
                } else {
                    textoOculto.style.display = "none";
                    enlaceLeerMas.textContent = "Leer Más";
                }
                });
                });
            </script>
               </div>
          </div>
          </div>
    </aside>
    </section>
    <section>
        <br>
        <div class="container-card">
        <div class="card">
        <aside id="div2" class="ren">
        <div class="contenido-card">
        <figure>
        <img src="../../resources/img/banner4.jpg" alt="Agenda virtual" class="img">
        </figure>
        <h2 >Infraestructura</h2>
            <p>El Colegio Steve Jobs cuenta con una moderna infraestructura, rampas seguras, amplias aulas y bien  
              implementadas para el correcto desarrollo 
              <span id="texto-oculto2" style="display: none;">
              de las actividades, espacios de juegos por niveles,
              lozas deportivas y grass sintético exclusivo para el uso de los alumnos en sus diferentes actividades.
              </span></p>
              <a href="#" id="enlace-leer-mas2">Leer Más</a>
              <script>
              document.addEventListener("DOMContentLoaded", function() {
                const enlaceLeerMas = document.getElementById("enlace-leer-mas2");
                const textoOculto = document.getElementById("texto-oculto2");

                enlaceLeerMas.addEventListener("click", function(event) {
                event.preventDefault();

                if (textoOculto.style.display === "none") {
                    textoOculto.style.display = "inline";
                    enlaceLeerMas.textContent = "Leer Menos";
                } else {
                    textoOculto.style.display = "none";
                    enlaceLeerMas.textContent = "Leer Más";
                }
                });
                });
            </script>
               </div>
          </div>
          </div>
    </aside>
    </section>
      <h2 class="label">Nos puedes ubicar en...</h2>
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d948.5279777089953!2d-70.252331447409!3d-18.02000926309623!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x915acf8317f1972f%3A0x98908cf4d06de2b!2sSteve%20Jobs%20College!5e0!3m2!1ses-419!2spe!4v1687790524457!5m2!1ses-419!2spe" width="370" height="370" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe><br>
        <img src="../../resources/img/bienvenido_alumno.svg" alt="login" class="img-fluid p-5">
    </div> 
</div>
</center>
<df-messenger
  chat-icon="https:&#x2F;&#x2F;media.istockphoto.com&#x2F;id&#x2F;1010001882&#x2F;vector&#x2F;%C3%B0%C3%B0%C2%B5%C3%B1%C3%B0%C3%B1%C3%B1.jpg?s=612x612&ampw=0&ampk=20&ampc=1jeAr9KSx3sG7SKxUPR_j8WPSZq_NIKL0P-MA4F1xRw="
  intent="WELCOME"
  chat-title="SteveBot"
  agent-id="1379af8f-0cd0-4d86-8f5a-38a2470bbea1"
  language-code="es"
></df-messenger>
<style>
  df-messenger {
    --df-messenger-bot-message: #FFA500; 
    --df-messenger-button-titlebar-color: #9c27b0; 
    --df-messenger-chat-background-color: #fafafa;
    --df-messenger-font-color: white;
    --df-messenger-send-icon: #9c27b0; 
    --df-messenger-user-message: #FFA500; 
    
  }
</style>
</div> 
</body> 
</html>
<!-- Terminado por Aurelia Japura Herminia -->
