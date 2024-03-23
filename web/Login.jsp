<%-- 
    Document   : Login
    Created on : 16 feb. 2024, 22:59:14
    Author     : Jhonatan
--%>
<%@page import="Entidad.clsEntidadVehiculo"%>
<%@page import="java.util.List"%>
<%@page import="Negocio.clsNegocioVehiculo"%>
<%@page import="Conexion.clsConexion"%>
<%@page import="Entidad.clsEntidadUsuario"%>
<%@page import="Negocio.clsNegocioUsuario"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuario = request.getParameter("usuario");
    String contraseña = request.getParameter("contrasena");
    String mensajeError = null;
    boolean inicioSesionExitoso = false;

    if (usuario != null && contraseña != null) {
        clsConexion conexionBD = new clsConexion();
        Connection conexion = conexionBD.Conectar();

        clsNegocioUsuario negocioUsuario = new clsNegocioUsuario(conexion);
        clsEntidadUsuario usuarioValidado = negocioUsuario.validarInicioSesion(usuario, contraseña);

        if (usuarioValidado != null) {
            session.setAttribute("usuario", usuarioValidado.getUsuario());
            session.setAttribute("nombre", usuarioValidado.getNombre());
            session.setAttribute("apellido", usuarioValidado.getApellido());
            session.setAttribute("rol", usuarioValidado.getRol());

            if ("administrador".equals(usuarioValidado.getRol())) {
                response.sendRedirect("DashboardAdministrador.jsp");
            } else if ("empleado".equals(usuarioValidado.getRol())) {
                response.sendRedirect("DashboardEmpleado.jsp");
                inicioSesionExitoso = true;
            }
        } else {
            mensajeError = "Usuario o contraseña incorrectos";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--boostrap --%>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <%--jquery --%>
        <script src="js/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>

        <title>Sistema Web - Parqueadero</title>
    </head>
    <body>
        <section class="vh-100 background-section" style="background-color: #9999FF;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem; background-color: #333333;" >
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block align-items-center" style="display: flex; align-items: center;">
                                    <img src="images/LogoProgra3Png.png"
                                         alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; margin-top: 80px;" />
                                </div>


                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">

                                        <form id="loginForm" method="POST" onsubmit="return validarFormulario()">

                                            <div class="d-flex align-items-center mb-3 pb-1">
                                                <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                                <span class="h1 fw-bold mb-0" style="color:#9999FF">Bienvenido:</span>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="text" name="usuario" id="usuario" class="form-control form-control-lg" placeholder="Ingrese usuario" />
                                            </div>
                                            <div class="form-outline mb-4">
                                                <input type="password" name="contrasena" id="contrasena" class="form-control form-control-lg" placeholder="Ingrese contraseña"/>
                                            </div>
                                            <div id="mensajeError" class="alert alert-danger" role="alert" style="display: <%= (mensajeError != null) ? "block" : "none"%>;">
                                                <%= mensajeError%>
                                            </div>
                                            <div id="mensajeExito" class="alert alert-success" role="alert" style="display: <%= (inicioSesionExitoso) ? "block" : "none"%>;">
                                                Inicio de sesión exitoso
                                            </div>
                                            <div class="pt-1 mb-4">
                                                <button class="btn btn-lg btn-block" style="background-color: #6666FF; color:white " type="submit">Iniciar Sesión</button>
                                            </div>
                                            <a href="#!" class="small text-muted">Términos de uso</a>
                                            <a href="#!" class="small text-muted">Política de privacidad</a>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script type="text/javascript">
            document.addEventListener("DOMContentLoaded", function () {
                // Obtener el elemento del mensaje de error
                var mensajeErrorDiv = document.getElementById('mensajeError');

                // Verificar si el mensaje de error existe y luego ocultarlo después de 2 segundos
                if (mensajeErrorDiv) {
                    setTimeout(function () {
                        mensajeErrorDiv.style.display = 'none';
                    }, 3000); // 3000 milisegundos = 3 segundos
                }

                // Verificar si el inicio de sesión fue exitoso y mostrar la alerta
                var inicioSesionExitosoDiv = document.getElementById('mensajeExito');
                if (inicioSesionExitosoDiv && inicioSesionExitosoDiv.style.display === 'block') {
                    console.log('Valor de inicioSesionExitoso:', inicioSesionExitoso);
                    if (inicioSesionExitoso) {
                        mostrarAlertaInicioSesionExitoso();
                    }
                    setTimeout(function () {
                        inicioSesionExitosoDiv.style.display = 'none';
                    }, 3000);
                }
            });

            function validarFormulario() {
                var usuario = document.getElementById("usuario").value;
                var contraseña = document.getElementById("contrasena").value;
                var mensajeErrorDiv = document.getElementById('mensajeError');

                if (usuario.trim() === '' || contraseña.trim() === '') {
                    // El mensaje de error se mostrará automáticamente si está vacío
                    return false; // Evitar el envío del formulario
                }

                return true; // Permitir el envío del formulario
            }
            function mostrarAlertaInicioSesionExitoso() {
                console.log('Mostrando mensaje de inicio de sesión exitoso');
                // Resto del código de la función...
            }
        </script>

    </body>
</html>
