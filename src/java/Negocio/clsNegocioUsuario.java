/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.clsEntidadUsuario;
import Interface.clsInterfaceUsuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;

/**
 *
 * @author Jhonatan
 */
public class clsNegocioUsuario implements clsInterfaceUsuario {

    private Connection conexion;

    public clsNegocioUsuario(Connection conexion) {
        this.conexion = conexion;
    }

    @Override
    public clsEntidadUsuario validarInicioSesion(String usuario, String contraseña) {
        try {
            String query = "{CALL validarInicioSesion(?, ?)}";
            try (CallableStatement statement = conexion.prepareCall(query)) {
                statement.setString(1, usuario);
                statement.setString(2, contraseña);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        clsEntidadUsuario entidadUsuario = new clsEntidadUsuario();
                        entidadUsuario.setUsuario(resultSet.getString("usuario"));
                        entidadUsuario.setContraseña(resultSet.getString("contrasena"));
                        entidadUsuario.setRol(resultSet.getString("rol"));
                        entidadUsuario.setNombre(resultSet.getString("nombre"));
                        entidadUsuario.setApellido(resultSet.getString("apellido"));
                        return entidadUsuario;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<clsEntidadUsuario> obtenerUsuarios(String nombre, String apellido, String usuario, String rol) {
        List<clsEntidadUsuario> usuarios = new ArrayList<>();

        try {
            String query = "{CALL obtenerUsuarios(?, ?, ?, ?)}";
            try (CallableStatement statement = conexion.prepareCall(query)) {
                statement.setString(1, nombre);
                statement.setString(2, apellido);
                statement.setString(3, usuario);
                statement.setString(4, rol);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        clsEntidadUsuario usuarioEntity = new clsEntidadUsuario();
                        usuarioEntity.setNombre(resultSet.getString("nombre"));
                        usuarioEntity.setApellido(resultSet.getString("apellido"));
                        usuarioEntity.setUsuario(resultSet.getString("usuario"));
                        usuarioEntity.setContraseña(resultSet.getString("contrasena"));
                        usuarioEntity.setRol(resultSet.getString("rol"));
                        usuarios.add(usuarioEntity);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuarios;
    }

    @Override
    public boolean registrarUsuario(clsEntidadUsuario usuario) {
        try {
            String query = "{CALL registrarUsuario(?, ?, ?, ?, ?)}";
            try (CallableStatement statement = conexion.prepareCall(query)) {
                statement.setString(1, usuario.getNombre());
                statement.setString(2, usuario.getApellido());
                statement.setString(3, usuario.getUsuario());
                statement.setString(4, usuario.getContraseña());
                statement.setString(5, usuario.getRol());

                int filasAfectadas = statement.executeUpdate();

                if (filasAfectadas > 0) {
                    System.out.println("Usuario registrado correctamente");
                    return true;
                } else {
                    System.out.println("Error al registrar el usuario");
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al registrar el usuario");
            return false;
        }
    }

    @Override
    public void eliminarUsuario(String codigo) {
        try {
            String query = "{CALL eliminarUsuario(?)}";
            try (CallableStatement statement = conexion.prepareCall(query)) {
                statement.setString(1, codigo);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void modificarUsuario(String codigo, clsEntidadUsuario usuario) {
        try {
            CallableStatement cst = conexion.prepareCall("{call SP_Usuarios_U(?, ?, ?, ?, ?, ?)}");
            cst.setString(1, codigo);
            cst.setString(2, usuario.getNombre());
            cst.setString(3, usuario.getApellido());
            cst.setString(4, usuario.getUsuario());
            cst.setString(5, usuario.getContraseña());
            cst.setString(6, usuario.getRol());
            cst.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error al modificar usuario: " + ex.getMessage());
        }
    }

}
