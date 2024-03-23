<%-- 
    Document   : DashboardEmpleado.jsp
    Created on : 26 feb 2024, 1:34:28
    Author     : Jhonatan
--%>
<%@page import="java.util.List"%>
<%@page import="Conexion.clsConexion"%>
<%@page import="Entidad.clsEntidadEspacioV"%>
<%@page import="Negocio.clsNegocioEspacioV"%>
<%@page import="Entidad.clsEntidadVehiculo"%>
<%@page import="Negocio.clsNegocioVehiculo"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    clsConexion conexion = new clsConexion();
    clsNegocioEspacioV negocioEspacioV = new clsNegocioEspacioV(conexion.Conectar());
    List<Integer> cantidadEspacios = negocioEspacioV.obtenerCantidadEspaciosDisponibles();
    String data_string = "";

    for (int cantidad : cantidadEspacios) {
        data_string += cantidad + ",";
    }

    if (!data_string.isEmpty()) {
        data_string = data_string.substring(0, data_string.length() - 1);
    }

    //2do grafico
    clsNegocioVehiculo negocioVehiculo = new clsNegocioVehiculo(conexion.Conectar());
    List<Integer> tipoVehiculo = negocioVehiculo.consultaTipoVehiculo();
    //3er grafico
    clsNegocioVehiculo negocioVehiculo2 = new clsNegocioVehiculo(conexion.Conectar());
    List<Integer> tipoVehiculo2 = negocioVehiculo2.consultaTipoVehiculoActual();

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
        <%--highchart js--%>
        <script src="Highcharts/highcharts.js" type="text/javascript"></script>
        <script src="Highcharts/highcharts-3d.js" type="text/javascript"></script>
        <script src="Highcharts/highcharts-more.js" type="text/javascript"></script>

        <script src="Highcharts/modules/exporting.js" type="text/javascript"></script>
        <script src="Highcharts/modules/offline-exporting.js" type="text/javascript"></script>
        <style>
            .containergraf {
                display: flex;
            }

            .box {
                width: 700px;
            }

        </style>
    </head>

    <body>
        <div class="wrapper">
            <aside id="sidebar">
                <div class="d-flex">
                    <button class="toggle-btn" type="button">
                        <i class="lni lni-grid-alt"></i>
                    </button>
                    <div class="sidebar-logo">
                        <a href="DashboardEmpleado.jsp">ParkAssist</a>
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
                    <h1 style="font-size: 40px;">
                        Bienvenido a ParkAssist<br>
                        <%=session.getAttribute("nombre")%> <%=session.getAttribute("apellido")%>:
                    </h1>
                    <br>
                    <div id="container2"></div>
                    <div class="containergraf">
                        <div id="container3" class="box" style="width: 700px; margin-left: 60px;"></div>
                        <div id="container4" class="box" style="width: 700px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <footer style="background-color: #424242;" class="footer py-3">
            <div class="container text-center">
                <span style="color: white;">Todos los derechos reservados &copy; 2024</span>
            </div>
        </footer>
    </body>
</html>
<script type="text/javascript">
    Highcharts.chart('container2', {
    chart: {
    type: 'pie',
            options3d: {
            enabled: true,
                    alpha: 45
            }
    },
            title: {
            text: 'Grafico de disponibilidad en cochera',
                    align: 'center'
            },
            subtitle: {
            text: 'Gráfico N1',
                    align: 'center'
            },
            plotOptions: {
            pie: {
            innerSize: 100,
                    depth: 45,
                    dataLabels: {
                    enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                    },
                    colors: ['#5353ec', '#c51d34']
            }
            },
            series: [{
            name: 'Disponibilidad',
                    data: [
                    {name: 'Disponibles', y: <%=cantidadEspacios.get(0)%>},
                    {name: 'No Disponibles', y: <%=cantidadEspacios.get(1)%>}
                    ]
            }]
    });
    Highcharts.chart('container3', {
    chart: {
    type: 'packedbubble',
            height: '100%'
    },
            title: {
            text: 'Cantidad de vehiculos totales',
                    align: 'center'
            },
            tooltip: {
            useHTML: true,
                    pointFormat: '<b>{point.name}:</b> {point.value}'
            },
            plotOptions: {
            packedbubble: {
            minSize: '5%',
                    maxSize: '500%',
                    zMin: 0,
                    zMax: 1000,
                    layoutAlgorithm: {
                    gravitationalConstant: 0.05,
                            splitSeries: true,
                            seriesInteraction: false,
                            dragBetweenSeries: true,
                            parentNodeLimit: true
                    },
                    dataLabels: {
                    enabled: true,
                            format: '{point.name}',
                            style: {
                            color: 'black',
                                    textOutline: 'none',
                                    fontWeight: 'normal',
                                    fontSize: '16px'
                            }
                    }
            }
            },
            series: [{
            name: 'Motocicleta',
                    data: [{
                    name: 'Motocicleta',
                            value: <%= tipoVehiculo.get(0)%>,
                            z: <%= tipoVehiculo.get(0)%>
                    }]
            },
            {
            name: 'Automóvil',
                    data: [{
                    name: 'Automóvil',
                            value: <%= tipoVehiculo.get(1)%>,
                            z: <%= tipoVehiculo.get(1)%>
                    }]
            }]
    });
    Highcharts.chart('container4', {
    chart: {
    type: 'packedbubble',
            height: '100%'
    },
            title: {
            text: 'Cantidad de vehículos actual',
                    align: 'center'
            },
            tooltip: {
            useHTML: true,
                    pointFormat: '<b>{point.name}:</b> {point.value} vehículos'
            },
            plotOptions: {
            packedbubble: {
            minSize: '5%',
                    maxSize: '500%',
                    zMin: 0,
                    zMax: 1000,
                    layoutAlgorithm: {
                    splitSeries: false,
                            gravitationalConstant: 0.02
                    },
                    dataLabels: {
                    enabled: true,
                            format: '{point.name}',
                            style: {
                            color: 'black',
                                    textOutline: 'none',
                                    fontWeight: 'normal',
                                    fontSize: '16px'
                            }
                    }
            }
            },
            series: [{
            name: 'Cantidad',
                    data: [
    <% if (tipoVehiculo2.get(0) > 0) {%>
                    { name: 'Motocicleta', value: <%= tipoVehiculo2.get(0)%>, color:'#2CAFFE'},
    <% } %>
    <% if (tipoVehiculo2.get(1) > 0) {%>
                    { name: 'Automóvil', value: <%= tipoVehiculo2.get(1)%>, color:'#5353ec' },
    <% }%>
                    ]
            }]
    });
</script>