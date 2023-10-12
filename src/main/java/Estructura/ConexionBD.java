/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Estructura;
import java.sql.*;

/**
 *
 * @author Cesar S
 */
public class ConexionBD {
    //La conexion no cambia en muchos lugares.
    public ResultSet rs;
    public PreparedStatement ps;
    public Connection conn;
   public ConexionBD() throws ClassNotFoundException, SQLException{
       try{
           //Esta es el URL que debería tener el JBDC.
           //orcl es para la version enterprise y xe es para Express
           //No ponemos el nombre de la base de datos en el URL,
           //A comparacion de MySQL y SQL Manager
       String url = "jdbc:oracle:thin:@localhost:1521:orcl";
       
       //Cambiar los credenciales al usuario que se usara
       String username = "adminproyecto";
       String password = "secreto";
       
       
       Class.forName("oracle.jdbc.driver.OracleDriver");
       conn = DriverManager.getConnection(url,username,password);
       
     //  ps= conn.prepareStatement("Select * from Clientes");
       
       //rs=ps.executeQuery();
       
       } catch(SQLException e){
           
           //Aquí ya me estaba enojando, funciona mucho para ver errores
           System.out.println("Fuck this shit");
           System.err.println("SQLException: " + e.getMessage());
           e.printStackTrace();
          
       }

       
       
   }
       public void mostrar() {
               try{
                   //Utilizamos la siguiente syntax para cualquier transaccion:
                   // usuario.tabla
                   //SQL developer es raro :(
      ps = conn.prepareStatement("Select * from adminproyecto.clientes");
      rs = ps.executeQuery();
      System.out.println("Hola mundo");
       }catch (SQLException e) {
       System.err.println("SQLException: " + e.getMessage());
       e.printStackTrace();
   }}
       
  
}

