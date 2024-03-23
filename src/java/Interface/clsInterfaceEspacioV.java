/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;
import Entidad.clsEntidadEspacioV;
import Entidad.clsEntidadVehiculo;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jhonatan
 */
public interface clsInterfaceEspacioV {
    String obtenerPlacaPorPosicion(int id_posicion) throws SQLException;
    List<clsEntidadEspacioV> obtenerEspacios();
    void actualizarEstadoEspacios(int id_posicion);
    //public ArrayList consultaEspacio();
    
    void insertarTipoVehiculoEnEspacios(int id_posicion, String tipoVehiculo);
    List<Integer> obtenerCantidadEspaciosDisponibles();
    //List<clsEntidadEspacioV> obtenerVehiculos();
    
    
}
