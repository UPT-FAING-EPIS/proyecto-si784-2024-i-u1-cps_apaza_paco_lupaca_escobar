/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Conexion.clsConexion;
import Entidad.clsEntidadEspacioV;
import Entidad.clsEntidadVehiculo;
import Interface.clsInterfaceEspacioV;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.CallableStatement;
import java.sql.Timestamp;

/**
 *
 * @author Jhonatan
 */
public class clsNegocioEspacioV implements clsInterfaceEspacioV {

    private Connection conexion;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    clsConexion cn = new clsConexion();

    public clsNegocioEspacioV(Connection conexion) {
        this.conexion = conexion;
    }

    @Override
    public String obtenerPlacaPorPosicion(int id_posicion) throws SQLException {
        String placa = null;

        String query = "{CALL obtenerPlacaPorPosicion2(?,?)}";

        try (CallableStatement statement = conexion.prepareCall(query)) {
            statement.setInt(1, id_posicion);
            statement.setTimestamp(2, obtenerHoraEntradaPorPosicion(id_posicion));
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    placa = resultSet.getString("placa");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
        }

        return placa;
    }
    
    
    // Nuevo método para obtener la hora de entrada por posición
    private Timestamp obtenerHoraEntradaPorPosicion(int id_posicion) throws SQLException {
        Timestamp horaEntrada = null;

        String query = "SELECT horaentrada FROM vehiculos WHERE espacio = ? ORDER BY horaentrada DESC LIMIT 1";

        try (PreparedStatement statement = conexion.prepareStatement(query)) {
            statement.setInt(1, id_posicion);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    horaEntrada = resultSet.getTimestamp("horaentrada");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción de manera apropiada
        }

        return horaEntrada;
    }

    
    @Override
    public List<clsEntidadEspacioV> obtenerEspacios() {
        List<clsEntidadEspacioV> espacios = new ArrayList<>();

        String query = "{CALL obtenerEspacios()}";

        try (CallableStatement statement = conexion.prepareCall(query); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                clsEntidadEspacioV esp = new clsEntidadEspacioV(resultSet.getInt("id"), resultSet.getInt("posicion"), resultSet.getString("estado"), resultSet.getString("tipovehiculo"));
                espacios.add(esp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción de manera apropiada
        }

        System.out.println("Número de registros obtenidos: " + espacios.size());
        return espacios;
    }

    @Override
    public void actualizarEstadoEspacios(int id_posicion) {
        String query = "{CALL actualizarEstadoEspacios(?)}";

        try (CallableStatement statement = conexion.prepareCall(query)) {
            statement.setInt(1, id_posicion);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

  
    @Override
    public void insertarTipoVehiculoEnEspacios(int id_posicion, String tipoVehiculo) {
        String query = "{CALL insertarTipoVehiculoEnEspacios(?,?)}";

        try (CallableStatement statement = conexion.prepareCall(query)) {
            statement.setInt(1, id_posicion);
            statement.setString(2, tipoVehiculo);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Integer> obtenerCantidadEspaciosDisponibles() {
        List<Integer> cantidadEspacios = new ArrayList<>();
        try {
            CallableStatement cst = conexion.prepareCall("{call consultadeEspacios()}");
            ResultSet rs = cst.executeQuery();

            while (rs.next()) {
                cantidadEspacios.add(rs.getInt("Disponibles"));
                cantidadEspacios.add(rs.getInt("Ocupados"));
            }

            return cantidadEspacios;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }


    
}
    
