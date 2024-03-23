<%@page import="java.text.ParseException"%>
<%@page import="Conexion.clsConexion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Negocio.clsNegocioVehiculo"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retirar Vehículo</title>
    </head>
    <body>

        <%

            String placa = request.getParameter("txtPlaca");
            int idPosicion = Integer.parseInt(request.getParameter("idPosicion"));
            // Conexión a la base de datos
            clsConexion conexion = new clsConexion();
            Connection conn = conexion.Conectar();

            // Obtener la fecha y hora actual
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            String fechaHora = dateFormat.format(date);

            // Consultar información del vehículo
            String consultaVehiculo = "SELECT horaentrada, tipovehiculo FROM vehiculos WHERE placa=?";
            try (PreparedStatement stmtVehiculo = conn.prepareStatement(consultaVehiculo)) {
                stmtVehiculo.setString(1, placa);
                ResultSet rs = stmtVehiculo.executeQuery();

                if (rs.next()) {
                    String horaSalida = rs.getString("horaentrada");
                    Date horasalida = dateFormat.parse(horaSalida);

                    long tiempoTranscurridoMillis = date.getTime() - horasalida.getTime();
                    int minutosTranscurridos = (int) (tiempoTranscurridoMillis / (60 * 1000)); // Convertir a minutos

                    double horasTranscurridas = (double) tiempoTranscurridoMillis / (60 * 60 * 1000); // Convertir a horas

                    if (minutosTranscurridos % 60 != 0) {
                        horasTranscurridas++;
                    }
                    System.out.println("Horas transcurridas: " + horasTranscurridas);

                    Double valorAPagar = 4.0;

                    if (horasTranscurridas > 0 && horasTranscurridas < 1) {
                        horasTranscurridas = 1; // Mínimo de 1 hora
                    } else {
                        horasTranscurridas = Math.ceil(horasTranscurridas); // Redondear hacia arriba
                    }
                    if (rs.getString("tipovehiculo").equals("Automovil")) {
                        valorAPagar = 4.0 * horasTranscurridas;
                    } else if (rs.getString("tipovehiculo").equals("Motocicleta")) {
                        valorAPagar = 2.0 * horasTranscurridas;
                    }
                    System.out.println("Valor a pagar: " + valorAPagar);

                    // Actualizar información en la base de datos
                    String updateVehiculo = "UPDATE vehiculos SET horasalida=?, valorpagado=? WHERE placa=?";
                    try (PreparedStatement stmtUpdateVehiculo = conn.prepareStatement(updateVehiculo)) {
                        stmtUpdateVehiculo.setString(1, fechaHora);
                        stmtUpdateVehiculo.setDouble(2, valorAPagar);
                        stmtUpdateVehiculo.setString(3, placa);
                        stmtUpdateVehiculo.executeUpdate();

                    }

                    String updateEspacio = "UPDATE espacios SET estado='Disponible' WHERE id=?";
                    try (PreparedStatement stmtUpdateEspacio = conn.prepareCall(updateEspacio)) {
                        stmtUpdateEspacio.setInt(1, idPosicion);
                        stmtUpdateEspacio.executeUpdate();
                    }

                    // Mostrar mensaje y cerrar ventana si el vehículo se retiró correctamente
                    out.println("<script>alert('El vehículo se retiró exitosamente. Valor a pagar: S/." + valorAPagar + "'); window.close();</script>");
                } else {
                    // Mostrar mensaje si no se encontró el vehículo en la base de datos
                    out.println("<script>alert('El vehículo no se encuentra en el parqueadero, por favor revise la placa ingresada.'); window.close();</script>");
                }

            } catch (SQLException | ParseException ex) {
                // Manejar excepciones
                Logger.getLogger("FrmRetirarVehiculo").log(Level.SEVERE, null, ex);

            }
        %>


    </body>
</html>