<%-- 
    Document   : EliminarUsuario
    Created on : 19 feb. 2024, 01:04:45
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

    String codigo = request.getParameter("usuario");
    new clsNegocioUsuario(conexion).eliminarUsuario(codigo);

    response.sendRedirect("ListarUsuario.jsp");
%>