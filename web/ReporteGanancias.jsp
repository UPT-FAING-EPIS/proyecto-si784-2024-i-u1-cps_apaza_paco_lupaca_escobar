<%-- 
    Document   : ReporteGanancias
    Created on : 17 feb. 2024, 15:38:31
    Author     : Jhonatan
--%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="Conexion.clsConexion"%>
<%@page import="java.sql.Connection"%>

<%
    Connection cnx = null;
    
    try{
    cnx= new clsConexion().Conectar();
    File f = new File(session.getServletContext().getRealPath("/Reportes/ReporteGanancias.jrxml"));
    
    FileInputStream input = new FileInputStream(f);
    response.setContentType("application/pdf");
    JasperReport report = JasperCompileManager.compileReport(input);
    JasperPrint print = JasperFillManager.fillReport(report,null,cnx);
    JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
    
    }catch(FileNotFoundException e){
        e.printStackTrace();
    }catch(JRException e){
        e.printStackTrace();
    }finally{
        if(cnx!= null){
        cnx.close();
    }
    }
%>