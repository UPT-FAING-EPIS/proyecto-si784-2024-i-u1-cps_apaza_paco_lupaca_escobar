<%-- 
    Document   : RegistrarUsuario
    Created on : 17 feb. 2024, 01:58:16
    Author     : Jhonatan
--%>
<%@page import="Conexion.clsConexion"%>
<%@page import="Entidad.clsEntidadUsuario"%>
<%@page import="Negocio.clsNegocioUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.Connection" %>

<%
    if (request.getParameter("Enviar") != null) {
        String nombre = request.getParameter("txtNombre");
        String apellido = request.getParameter("txtApellido");
        String usuario = request.getParameter("txtUsuario");
        String contrasena = request.getParameter("txtContrasena");
        String rol = request.getParameter("cmbRol");

        clsEntidadUsuario nuevoUsuario = new clsEntidadUsuario();
        nuevoUsuario.setNombre(nombre);
        nuevoUsuario.setApellido(apellido);
        nuevoUsuario.setUsuario(usuario);
        nuevoUsuario.setContraseña(contrasena);
        nuevoUsuario.setRol(rol);

        clsConexion conexionBD = new clsConexion();
        Connection conexion = conexionBD.Conectar();

        clsNegocioUsuario negocioUsuario = new clsNegocioUsuario(conexion);
        negocioUsuario.registrarUsuario(nuevoUsuario);

        response.sendRedirect("RegistrarUsuario.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--boostrap --%>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <%--jquery --%>
        <script src="js/jquery-3.7.1.min.js" type="text/javascript"></script>
        <title>Sistema Web - Parqueadero</title>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="wrapper">
            <aside id="sidebar">
                <div class="d-flex">
                    <button class="toggle-btn" type="button">
                        <i class="lni lni-grid-alt"></i>
                    </button>
                    <div class="sidebar-logo">
                        <a href="DashboardAdministrador.jsp">ParkAssist</a>
                    </div>
                </div>
                <div class="d-flex">
                    <div class="sidebar-logo">
                        <img src="images/user22.png"
                             alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; margin-top: 20px; margin-left: 120px;" />
                        <h1 style="margin-left: 90px;color: white;"><center>
                                <%=session.getAttribute("usuario")%>&nbsp;
                                <br>
                                <br>
                                <%=session.getAttribute("rol")%></center></h1>

                    </div>
                </div>
                <ul class="sidebar-nav">
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                           data-bs-target="#user" aria-expanded="false" aria-controls="auth">
                            <i class="lni lni-user"></i>
                            <span>Usuarios</span>
                        </a>
                        <ul id="user" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="RegistrarUsuario.jsp" class="sidebar-link">Registrar Usuario</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="ListarUsuario.jsp" class="sidebar-link">Listar Usuario</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                           data-bs-target="#car" aria-expanded="false" aria-controls="auth">
                            <i class="lni lni-car"></i>
                            <span>Gestionar</span>
                        </a>
                        <ul id="car" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="IngresarVehiculo.jsp" class="sidebar-link">Ingresar Vehiculo</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="ListarVehiculos.jsp" class="sidebar-link">Listar Vehiculo</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                           data-bs-target="#report" aria-expanded="false" aria-controls="auth">
                            <i class="lni lni-empty-file"></i>
                            <span>Reportes</span>
                        </a>
                        <ul id="report" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="ReporteGanancias.jsp" target="_blank" class="sidebar-link">Ganancias</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="#" class="sidebar-link">Disponibilidad</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="sidebar-footer">
                    <a href="Login.jsp" class="sidebar-link">
                        <i class="lni lni-exit"></i>
                        <span>Cerrar Sesion</span>
                    </a>
                </div>
            </aside>
            <div class="main p-3">
                <div class="text-center">
                    <h1 style="font-size: 40px;">Registrar Usuario:</h1>
                    <section class="d-flex justify-content-center align-items-center">
                        <div class="card shadow col-xs-12 col-sm-6 col-md-6 col-lg-4 p-4">
                            <div class="mb-4 d-flex justify-content-start align-items-center">
                            </div>
                            <div class="mb-1">
                                <form id="registroUsuarioForm" method="post" action="RegistrarUsuario.jsp">
                                    <div class="mb-4 d-flex justify-content-between">
                                        <div>
                                            <label for="nombre"><i class="bi bi-person-fill"></i> Nombre</label>
                                            <input type="text" class="form-control" name="txtNombre" id="nombre" placeholder="ej: Gabriel" required>
                                            <div class="nombre text-danger"></div>
                                        </div>
                                        <div>
                                            <label for="apellido"><i class="bi bi-person-bounding-box"></i> Apellido</label>
                                            <input type="text" class="form-control" name="txtApellido" id="apellido" placeholder="ej: Pacheco" required>
                                            <div class="apellido text-danger"></div>
                                        </div>
                                    </div>
                                    <div class="mb-4">
                                        <label for="usuario"><i class="bi bi-person-circle"></i> Usuario</label>
                                        <input type="text" class="form-control" name="txtUsuario" id="usuario" placeholder="Ingrese su usuario" required>
                                        <div class="usuario text-danger"></div>
                                    </div>
                                    <div class="mb-4">
                                        <label for="contrasena"><i class="bi bi-lock-fill"></i> Contraseña</label>
                                        <input type="password" class="form-control" name="txtContrasena" id="contrasena" placeholder="Ingrese su contraseña" required>
                                        <div class="contrasena text-danger"></div>
                                    </div>
                                    <div class="mb-4">
                                        <label for="rol"><i class="bi bi-person-check-fill"></i> Rol</label>
                                        <select class="form-select" name="cmbRol" id="rol" required>
                                            <option value="">Seleccione un rol</option>
                                            <option value="administrador">Administrador</option>
                                            <option value="empleado">Empleado</option>
                                        </select>
                                        <div class="rol text-danger"></div>
                                    </div>
                                    <div class="mb-2">
                                        <button type="submit" name="Enviar" style="background-color: #6666FF; color:white " value="Enviar" class="col-12 btn btn-primary d-flex justify-content-between" id="btnRegistrar">
                                            <span>Registrar</span><i class="bi bi-cursor-fill"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>
