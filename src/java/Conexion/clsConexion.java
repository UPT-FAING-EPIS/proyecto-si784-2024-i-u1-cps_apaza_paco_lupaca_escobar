/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;
/**
 *
 * @author Jhonatan
 */
public class clsConexion {
    String BD = "bdparqueadero";
    String URL = "jdbc:mysql://localhost:3306/";
    String USERNAME = "root";
    String PASSWORD = "";
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    Connection cx;
    
public clsConexion(){
        
    }
    
    public Connection Conectar(){
        try{
            Class.forName(DRIVER);
            cx = DriverManager.getConnection(URL + BD, USERNAME, PASSWORD);
            System.out.println("SE CONECTO A LA BD " + BD);
        } catch (ClassNotFoundException | SQLException ex){
            System.out.println("NO SE CONECTO A LA BD "+ BD);
            Logger.getLogger(clsConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cx;
    }
    
    public void Desconectar(){
        try{
            cx.close();
        } catch (SQLException ex){
            Logger.getLogger(clsConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args){
        clsConexion conexion = new clsConexion();
        conexion.Conectar();
    }
}
