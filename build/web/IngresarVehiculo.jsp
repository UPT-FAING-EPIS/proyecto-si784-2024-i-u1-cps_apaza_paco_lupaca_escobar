<%-- 
    Document   : IngresarVehiculo
    Created on : 17 feb 2024, 22:55:35
    Author     : Edward
--%>    


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Conexion.clsConexion"%>
<%@page import="Entidad.clsEntidadEspacioV"%>
<%@page import="Negocio.clsNegocioEspacioV"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>   
<%@page import="Entidad.clsEntidadVehiculo"%>
<%@page import="Negocio.clsNegocioVehiculo"%>
<%@page import="Conexion.clsConexion" %>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    clsConexion conexion = new clsConexion();
    Connection conn = conexion.Conectar();

    clsNegocioEspacioV negocioVehiculo = new clsNegocioEspacioV(conn);
    List<clsEntidadEspacioV> espacios = negocioVehiculo.obtenerEspacios();

    clsNegocioVehiculo entidadVehiculo = new clsNegocioVehiculo(conn);
    List<clsEntidadVehiculo> vehiculos = entidadVehiculo.ListarVehiculos();


%>

<%    String placa = request.getParameter("txtPlaca");
    String propietario = request.getParameter("txtPropietario");
    String tipoVehiculo = request.getParameter("tipoVehiculo");
    String fechaHora = ""; // Opcional, puedes obtener la fecha actual aquí si lo necesitas

    // Lógica para establecer la conexión y registrar el vehículo
    //session.setAttribute("Placa", placa);
    try {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        Date date = cal.getTime();
        fechaHora = dateFormat.format(date);

        // Obtener el id del espacio correspondiente desde el formulario
        int id_posicion = Integer.parseInt(request.getParameter("idPosicion"));

        // Instanciar las clases de negocio
        clsNegocioEspacioV espacio = new clsNegocioEspacioV(conn);
        clsNegocioVehiculo vehiculo = new clsNegocioVehiculo(conn);

        // Insertar datos del vehículo y actualizar el estado de los espacios
        vehiculo.insertarDatosVehiculo(placa, propietario, tipoVehiculo, fechaHora, id_posicion);
        espacio.actualizarEstadoEspacios(id_posicion);
        espacio.insertarTipoVehiculoEnEspacios(id_posicion, tipoVehiculo);

        // Redireccionar a donde desees después del registro exitoso
        //response.sendRedirect("index.jsp");
    } catch (Exception ex) {
        // Manejo de excepciones
        ex.printStackTrace();
        response.setStatus(500); // Indica un error interno del servidor
    }

%>



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
        <!-- Librería jQuery (necesaria para algunos componentes de Bootstrap) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Scripts de Bootstrap -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                    <h1>
                        Espacios disponibles
                    </h1>

                    <div class="container">
                        <h2>Ingresar Vehiculos</h2>


                        <div class="card">

                            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 row-cols-xl-5 g-2">
                                <%                                    for (clsEntidadEspacioV espacio : espacios) {
                                        String imagePath = espacio.getTipoVehiculo().equals("Automovil") || espacio.getTipoVehiculo().equals("") ? "images/coche.png" : "images/moto5.png";
                                        String btnColor = espacio.getEstado().equals("Disponible") ? "btn-primary" : "btn-danger";

                                        String placa2 = negocioVehiculo.obtenerPlacaPorPosicion(espacio.getId());

                                %>
                                <div class="col">
                                    <div class="p-3">
                                        <button id="btn_<%= espacio.getId()%>" class="btn btn-lg btn-block <%= btnColor%>" data-toggle="modal" 
                                                <% if (btnColor.equals("btn-danger")) {%>
                                                data-target="#retirarVehiculoModal"

                                                <% } else if (btnColor.equals("btn-primary")) { %>
                                                data-target="#registroVehiculoModal"
                                                <% }%>
                                                data-id="<%= espacio.getId()%>" onclick="obtenerPlaca('<%= placa2%>', '<%= espacio.getId()%>')">

                                            <img src="<%= request.getContextPath() + "/" + imagePath%>"> <br> Espacio <%= espacio.getId()%>
                                        </button>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>

                        </div>
                    </div>

                </div>
            </div>



        </div>
        <!-- REGISTRAR -->         
        <div class="modal fade" id="registroVehiculoModal" tabindex="-1" role="dialog" aria-labelledby="registroVehiculoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="registroVehiculoModalLabel">Registrar Vehículo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Formulario de registro de vehículo -->
                        <div class="form-group">
                            <label for="txtPlaca">Placa</label>
                            <input type="text" class="form-control" id="txtPlaca" name="txtPlaca">
                        </div>                           
                        <div class="form-group">
                            <label for="txtPropietario">Nombre propietario</label>
                            <input type="text" class="form-control" id="txtPropietario" name="txtPropietario">
                        </div>
                        <div class="form-group">
                            <label for="tipoVehiculo">Tipo de vehículo</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="tipoVehiculo" id="radioAutomovil" value="Automovil" checked>
                                <label class="form-check-label" for="radioAutomovil">
                                    Automóvil
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="tipoVehiculo" id="radioMotocicleta" value="Motocicleta">
                                <label class="form-check-label" for="radioMotocicleta">
                                    Motocicleta
                                </label>
                            </div>
                        </div>
                        <input type="hidden" id="idPosicion" name="idPosicion">
                    </div>
                    <div class="modal-footer">
                        <!-- Botón de tipo "button" para registrar el vehículo -->
                        <button type="button" class="btn btn-primary" id="btnRegistrarVehiculo">Registrar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- RETIRAR -->     

        <div class="modal fade" id="retirarVehiculoModal" tabindex="-1" role="dialog" aria-labelledby="retirarVehiculoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="retirarVehiculoModalLabel">Retirar Vehículo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Aquí mostramos la placa -->
                        <div class="form-group">
                            <label for="txtPlaca">Placa: </label>
                            <input type="text" class="form-control" id="txtPlaca" readonly>

                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btnRetirarVehiculo">Retirar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>

                    </div>
                </div>
            </div>
        </div>


        <script>

            function obtenerPlaca(placa, idPosicion) {//eee
                // Obtener la placa asociada a este espacio
                $('#retirarVehiculoModal #txtPlaca').val(placa);
                $('#idPosicion').val(idPosicion);

            }

            $(document).ready(function () {
                $('#btnRegistrarVehiculo').click(function () {
                    var placa = $('#txtPlaca').val();
                    var propietario = $('#txtPropietario').val();
                    var tipoVehiculo = $('input[name=tipoVehiculo]:checked').val();
                    var idPosicion = $('#idPosicion').val(); // Obtener el valor del campo oculto que contiene el ID de la posición

                    // Envío de datos mediante AJAX
                    $.ajax({
                        type: 'POST',
                        url: 'IngresarVehiculo.jsp',
                        data: {
                            txtPlaca: placa,
                            txtPropietario: propietario,
                            tipoVehiculo: tipoVehiculo,
                            idPosicion: idPosicion // Enviar el ID de la posición
                        },
                        success: function (response) {
                            // Manejar la respuesta del servidor
                            alert("El vehículo se registró exitosamente");
                            // Cerrar el modal después de registrar
                            $('#registroVehiculoModal').modal('hide');
                            // Recargar la página después de cerrar el modal
                            window.location.href = 'IngresarVehiculo.jsp';
                            //location.reload();
                        },
                        error: function (xhr, status, error) {
                            // Manejar errores
                            alert('Error al registrar el vehículo' + error);
                        }
                    });
                });
                $('#btnRetirarVehiculo').click(function () {
                    var placa = $('#retirarVehiculoModal #txtPlaca').val();
                    var idPosicion = $('#idPosicion').val(); // Obtener el valor del campo oculto que contiene el ID de la posición
                    var dataId = $(this).data('id');
                    $('#txtDataId').text(dataId);



                    // Envío de datos mediante AJAX
                    $.ajax({
                        type: 'POST',
                        url: 'RetirarVehiculo.jsp',
                        data: {
                            txtPlaca: placa,
                            idPosicion: idPosicion // Enviar el ID de la posición
                        },
                        success: function (response) {
                            // Manejar la respuesta del servidor
                            alert("El vehículo se retiró exitosamente");
                            // Cerrar el modal después de retirar
                            $('#retirarVehiculoModal').modal('hide');
                            // Recargar la página después de cerrar el modal
                            window.location.href = 'IngresarVehiculo.jsp';
                        },
                        error: function (xhr, status, error) {
                            // Manejar errores
                            alert('Error al retirar el vehículo: ' + error);
                        }
                    });
                });

            });


        </script>



    </body>
</html>