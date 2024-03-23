<%-- 
    Document   : Logout
    Created on : 17 feb. 2024, 02:59:04
    Author     : Jhonatan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    session.setAttribute("usuario", null);
    session.setAttribute("nombre", null);
    session.setAttribute("apellido", null);
    session.setAttribute("rol", null);
    response.sendRedirect("Login.jsp");

%>
