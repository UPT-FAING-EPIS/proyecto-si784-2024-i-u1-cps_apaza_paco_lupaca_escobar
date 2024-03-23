<%-- 
    Document   : ListarUsuario
    Created on : 19 feb. 2024, 00:37:15
    Author     : Jhonatan
--%>
<%@page import="java.util.List"%>
<%@page import="Conexion.clsConexion"%>
<%@page import="Entidad.clsEntidadUsuario"%>
<%@page import="Negocio.clsNegocioUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.Connection" %>
<%
    Connection conexion = new clsConexion().Conectar();

    if (conexion == null) {
        throw new RuntimeException("No se pudo establecer la conexión a la base de datos");
    }

    List<clsEntidadUsuario> usuarios = new clsNegocioUsuario(conexion).obtenerUsuarios("", "", "", "");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--boostrap --%>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <%--datatables --%>
        <link href="datatables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="datatables/DataTables-2.0.0/css/dataTables.semanticui.css" rel="stylesheet" type="text/css"/>
        <link href="datatables/DataTables-2.0.0/css/dataTables.foundation.min.css" rel="stylesheet" type="text/css"/>
        <%--jquery --%>
        <script src="js/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="datatables/datatables.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#DataDefault').DataTable({

                });
                //data configuracion
                $("#DataConfig").DataTable({

                    "aLengthMenu": [[5, 10, 15, 25, 50, 100, 200, -1], [5, 10, 15, 25, 50, 100, 200, "Todos"]],
                    "bDestroy": true,
                    "language": {
                        "sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "No se encontraron resultados",
                        "sEmptyTable": "Ning?n dato disponible en esta tabla",
                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sSearch": "Buscar:",
                        "sUrl": "",
                        "sInfoThousands": ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "ultimo",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        }
                    }
                });

                $('#DataConfig2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false,
                    "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "Todos"]]
                });


            });
        </script>
        <title>Sistema Web - Parqueadero</title>
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
                                <a href="RegistrarUsuario.jsp" style="background-color: #6666FF; color:white " class="sidebar-link">Registrar Usuario</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="ListarUsuario.jsp" class="sidebar-link" >Listar Usuario</a>
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
                <h1 style="font-size: 40px;"><center>Lista de Usuarios</center></h1>
                <br>
                <div class="container" style="margin-right: 20px;" align="right">
                    <h2 class="card-header">
                        <a href="RegistrarUsuario.jsp" class="btn btn-success">Nuevo Usuario</a>
                    </h2>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered" id="DataConfig">
                        <thead class="thead-dark">
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Usuario</th>
                                <th>Rol</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (clsEntidadUsuario usuario : usuarios) {%>
                            <tr>
                                <td><%= usuario.getNombre()%></td>
                                <td><%= usuario.getApellido()%></td>
                                <td><%= usuario.getUsuario()%></td>
                                <td><%= usuario.getRol()%></td>
                                <td>
                                    <form action="EliminarUsuario.jsp" method="post">
                                        <input type="hidden" name="usuario" value="<%= usuario.getUsuario()%>">
                                        <button type="submit" class="btn btn-primary btn-sm">Modificar</button>
                                        <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
    </body>
</html>
