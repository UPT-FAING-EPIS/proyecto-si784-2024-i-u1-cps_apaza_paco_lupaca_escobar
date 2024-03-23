/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

import java.util.Date;

/**
 *
 * @author Jhonatan
 */
public class clsEntidadVehiculo {

    public clsEntidadVehiculo() {
    // Constructor sin argumentos
    }
    public clsEntidadVehiculo(int Id, String Placa, String Propietario, String TipoVehiculo, Date HoraEntrada, Date HoraSalida, float ValorPagado, String Estado) {
        this.Id = Id;
        this.Placa = Placa;
        this.Propietario = Propietario;
        this.TipoVehiculo = TipoVehiculo;
        this.HoraEntrada = HoraEntrada;
        this.HoraSalida = HoraSalida;
        this.ValorPagado = ValorPagado;
        this.Estado = Estado;
    }
    
    private int Id;
    private String Placa;
    private String Propietario;
    private String TipoVehiculo;
    private Date HoraEntrada;
    private Date HoraSalida;
    private float ValorPagado;
    private String Estado;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getPlaca() {
        return Placa;
    }

    public void setPlaca(String Placa) {
        this.Placa = Placa;
    }

    public String getPropietario() {
        return Propietario;
    }

    public void setPropietario(String Propietario) {
        this.Propietario = Propietario;
    }

    public String getTipoVehiculo() {
        return TipoVehiculo;
    }

    public void setTipoVehiculo(String TipoVehiculo) {
        this.TipoVehiculo = TipoVehiculo;
    }

    public Date getHoraEntrada() {
        return HoraEntrada;
    }

    public void setHoraEntrada(Date HoraEntrada) {
        this.HoraEntrada = HoraEntrada;
    }

    public Date getHoraSalida() {
        return HoraSalida;
    }

    public void setHoraSalida(Date HoraSalida) {
        this.HoraSalida = HoraSalida;
    }

    public float getValorPagado() {
        return ValorPagado;
    }

    public void setValorPagado(float ValorPagado) {
        this.ValorPagado = ValorPagado;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

}
