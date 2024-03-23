/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import Entidad.clsEntidadVehiculo;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Jhonatan
 */
public interface clsInterfaceVehiculo {
    void insertarDatosVehiculo(String placa, String propietario, String clasevehiculo, String fechaHora, int id_posicion);
    List<clsEntidadVehiculo> ListarVehiculos();
    List<clsEntidadVehiculo> BuscarVehiculos(String placa, String propietario, String tipovehiculo);
    List<Integer> consultaTipoVehiculo();
    List<Integer> consultaTipoVehiculoActual();
    
}
