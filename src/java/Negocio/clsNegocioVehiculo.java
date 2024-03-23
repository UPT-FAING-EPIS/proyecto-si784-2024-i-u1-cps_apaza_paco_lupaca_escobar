/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Interface.clsInterfaceVehiculo;
import Conexion.clsConexion;
import Entidad.clsEntidadVehiculo;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.CallableStatement;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Jhonatan
 */
public class clsNegocioVehiculo implements clsInterfaceVehiculo {

    private Connection conexion;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    clsConexion cn = new clsConexion();

    public clsNegocioVehiculo(Connection conexion) {
        this.conexion = conexion;
    }

    @Override
    public void insertarDatosVehiculo(String placa, String propietario, String clasevehiculo, String fechaHora, int id_posicion) {
        String query = "{CALL insertarDatosVehiculo(?, ?, ?, ?, ?)}";

        try (CallableStatement statement = conexion.prepareCall(query)) {
            statement.setString(1, placa);
            statement.setString(2, propietario);
            statement.setString(3, clasevehiculo);
            statement.setString(4, fechaHora);
            statement.setInt(5, id_posicion);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<clsEntidadVehiculo> ListarVehiculos() {
        List<clsEntidadVehiculo> vehiculos = new ArrayList<>();

        try {
            String query = "{CALL ListarAutomoviles()}";
            try (CallableStatement statement = conexion.prepareCall(query)) {

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        clsEntidadVehiculo usuarioEntity = new clsEntidadVehiculo();
                        usuarioEntity.setPlaca(resultSet.getString("placa"));
                        usuarioEntity.setPropietario(resultSet.getString("propietario"));
                        usuarioEntity.setTipoVehiculo(resultSet.getString("tipovehiculo"));
                        usuarioEntity.setHoraEntrada(resultSet.getDate("horaentrada"));
                        usuarioEntity.setHoraSalida(resultSet.getDate("horasalida"));
                        usuarioEntity.setValorPagado(resultSet.getFloat("valorpagado"));
                        vehiculos.add(usuarioEntity);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehiculos;
    }

    @Override
    public List<clsEntidadVehiculo> BuscarVehiculos(String placa, String propietario, String tipovehiculo) {
        List<clsEntidadVehiculo> vehiculos = new ArrayList<>();

        try {
            String query = "{CALL BuscarVehiculosPorCombo2(?, ?, ?)}";
            try (CallableStatement statement = conexion.prepareCall(query)) {
                statement.setString(1, placa);
                statement.setString(2, propietario);
                statement.setString(3, tipovehiculo);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        clsEntidadVehiculo vehiculo = new clsEntidadVehiculo();
                        vehiculo.setPlaca(resultSet.getString("placa"));
                        vehiculo.setPropietario(resultSet.getString("propietario"));
                        vehiculo.setTipoVehiculo(resultSet.getString("tipovehiculo"));
                        vehiculo.setHoraEntrada(resultSet.getDate("horaentrada"));
                        vehiculo.setHoraSalida(resultSet.getDate("horasalida"));
                        vehiculo.setValorPagado(resultSet.getFloat("valorpagado"));
                        vehiculos.add(vehiculo);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehiculos;
    }

    @Override
    public List<Integer> consultaTipoVehiculo() {
        List<Integer> cantidadEspacios = new ArrayList<>();
        try {
            CallableStatement cst = conexion.prepareCall("{call consultaTipoVehiculo()}");
            ResultSet rs = cst.executeQuery();

            while (rs.next()) {
                cantidadEspacios.add(rs.getInt("Cantidad"));
            }
            rs.close();
            cst.close();

            return cantidadEspacios;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }

    }

    @Override
    public List<Integer> consultaTipoVehiculoActual() {
        List<Integer> cantidadEspacios = new ArrayList<>();
        try {
            CallableStatement cst = conexion.prepareCall("{call consultaTipoVehiculoActual()}");
            ResultSet rs = cst.executeQuery();

            while (rs.next()) {
                cantidadEspacios.add(rs.getInt("Cantidad"));
            }
            rs.close();
            cst.close();

            return cantidadEspacios;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

}
