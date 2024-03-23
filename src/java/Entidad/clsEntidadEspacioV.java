/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

/**
 *
 * @author Jhonatan
 */
public class clsEntidadEspacioV {

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getTipoVehiculo() {
        return tipoVehiculo;
    }

    public void setTipoVehiculo(String tipoVehiculo) {
        this.tipoVehiculo = tipoVehiculo;
    }

    public clsEntidadEspacioV(int id, int posicion, String estado, String tipoVehiculo) {
        this.id = id;
        this.posicion = posicion;
        this.estado = estado;
        this.tipoVehiculo = tipoVehiculo;
    }

      
    
    private int id;
    private int posicion;
    private String estado;
    private String tipoVehiculo;
       

    


}
