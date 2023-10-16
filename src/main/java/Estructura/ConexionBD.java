/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Estructura;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Cesar S
 */
public class ConexionBD {
    //La conexion no cambia en muchos lugares.
    public ResultSet rs;
    public PreparedStatement ps;
   // public Connection conn;
    //Esta es el URL que debería tener el JBDC.
           //orcl es para la version enterprise y xe es para Express
           //No ponemos el nombre de la base de datos en el URL,
           //A comparacion de MySQL y SQL Manager
    public static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    public static String username = "adminproyecto";
    public static String password = "secreto";
   
       
       public static Connection conectar(){
       Connection conexion = null;
       try{
       
        Class.forName("oracle.jdbc.driver.OracleDriver");
       conexion = (Connection) DriverManager.getConnection(url,username,password);
       System.out.println("Conexion Establecida...");
       }catch(ClassNotFoundException | SQLException e){
           System.out.println(e);
       }
       return conexion;
   }
       public ResultSet ejecutarConsulta (String SQL) throws Exception{
           Statement st = null;
           st = conectar().createStatement();
           ResultSet rs = st.executeQuery(SQL);
           return rs;
       }
       public void desconectar() throws SQLException{
           conectar().close();
       }
       
       public void mostrarEmpleado() {
               try{
                   //Utilizamos la siguiente syntax para cualquier transaccion:
                   // usuario.tabla
                   //SQL developer es raro :(
      ps = conectar().prepareStatement("Select * from adminproyecto.clientes");
      rs = ps.executeQuery();
      //System.out.println("Hola mundo");
       }catch (SQLException e) {
       System.err.println("SQLException: " + e.getMessage());
       e.printStackTrace();
   }
       }
       //Metodo que consigue el numero de filas de una tabla. Usado para sacar un numerito.
  public int contarFilas(String nombreTabla) throws SQLException{
     String consulta = "SELECT COUNT(*) FROM adminproyecto."+nombreTabla;
     int numFilas;
     try{
         ps = conectar().prepareStatement(consulta);
         rs = ps.executeQuery();
         if(rs.next()){
         return rs.getInt(1);}
         else{
             //Se utiliza -1 para demostrar que hay un error. Tomen esto en cuenta.
             return -1;
         }
     }catch(SQLException e){
         System.err.println("SQLException:" + e.getMessage());
         return -1;
     }
     
  }
  
  //---------------------CLIENTES-----------------------------------------
  
  public void anadirCliente(String nombre, String email, String nit, int numTelefono) throws SQLException{
      try{
      ps=conectar().prepareStatement("{call insertar_cliente(?,?,?,?,SYSDATE,'s')}");
      ps.setString(1, nombre);
      ps.setString(2,email);
      ps.setString(3, nit);
      ps.setInt(4, numTelefono);
      ps.executeUpdate();
     
      
      
  }catch(SQLException ex) {
        Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, "SQL statement: EXECUTE insertar_cliente(?,?,?,?,SYSDATE,'s')", ex);
        throw ex;
    }
  }
  
}
       


