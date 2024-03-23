/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;
import Entidad.clsEntidadUsuario;
import java.util.List;
/**
 *
 * @author Jhonatan
 */
public interface clsInterfaceUsuario {
    clsEntidadUsuario validarInicioSesion(String usuario, String contraseña);
    List<clsEntidadUsuario> obtenerUsuarios(String nombre, String apellido, String usuario, String rol);
    boolean registrarUsuario(clsEntidadUsuario usuario);
    void eliminarUsuario(String codigo);
    void modificarUsuario(String codigo,clsEntidadUsuario usuario);
}
