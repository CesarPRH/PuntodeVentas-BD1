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
       
       
       //Metodo que consigue el numero de filas de una tabla. Usado para sacar un numerito.
  public int contarFilas(String nombreTabla) throws SQLException{
     String consulta = "SELECT COUNT(*) FROM adminproyecto."+nombreTabla+" where estado='A'";
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
  
  public int contarFilasDesactivados(String nombreTabla) throws SQLException{
     String consulta = "SELECT COUNT(*) FROM adminproyecto."+nombreTabla+" where estado!='A'";
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
  public void mostrarCliente() {
               try{
                   //Utilizamos la siguiente syntax para cualquier transaccion:
                   // usuario.tabla
                   //SQL developer es raro :(
      ps = conectar().prepareStatement("Select * from vista_clientes_activos");
      rs = ps.executeQuery();
      //System.out.println("Hola mundo");
       }catch (SQLException e) {
       System.err.println("SQLException: " + e.getMessage());
       e.printStackTrace();
   }
       }
  public void mostrarClienteDesactivado() {
               try{
                   //Utilizamos la siguiente syntax para cualquier transaccion:
                   // usuario.tabla
                   //SQL developer es raro :(
      ps = conectar().prepareStatement("Select * from adminproyecto.clientes where estado!='A'");
      rs = ps.executeQuery();
      //System.out.println("Hola mundo");
       }catch (SQLException e) {
       System.err.println("SQLException: " + e.getMessage());
       e.printStackTrace();
   }
       }
  public void anadirCliente(String nombre, String email, String nit, int numTelefono) throws SQLException{
      try{
      ps=conectar().prepareStatement("{call insertar_cliente(?,?,?,?,SYSDATE,'A')}");
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
  
  public void conseguirInfoCliente(String id){
      try{
          ps = conectar().prepareStatement("Select * from adminproyecto.clientes where id_clientes="+id);
          rs = ps.executeQuery();
          
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void actualizarCliente(int id_clientes, String nombre, String email, String nit, int numTelefono) throws SQLException{
      ps=conectar().prepareStatement("{call actualizar_cliente(?,?,?,?,?,SYSDATE,'A')}");
      //ps=conectar().prepareStatement("Update clientes set nombre=?, email=?, nit=?, telefono=? where id_clientes=? ");
      ps.setInt(1, id_clientes);
      ps.setString(2, nombre);
      ps.setString(3, email);
      ps.setString(4, nit);
      ps.setInt(5, numTelefono);
      
      ps.executeUpdate();
  }
  
  public void eliminarCliente(int id_clientes)throws SQLException{
      ps = conectar().prepareStatement("{call eliminar_cliente(?,'s')}");
      ps.setInt(1, id_clientes);
      ps.executeUpdate();
  }
  
  public void recuperarCliente(int id_clientes) throws SQLException{
      ps = conectar().prepareStatement("Update adminproyecto.clientes set estado = 'A' Where id_clientes="+id_clientes);
      ps.executeUpdate();
  }
  
  //-----------------------------CATEGORIAS---------------------------------------
  
  public void mostrarCategorias(){
      try{
          ps = conectar().prepareStatement("Select * from adminproyecto.categorias");
          rs = ps.executeQuery();
  }catch (SQLException e){
      System.err.println("SQLException: "+ e.getMessage());
      e.printStackTrace();
  }
  
}
  public void anadirCategorias(String nombre, String descripcion) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertar_categoria(?,?,'s')}");
          ps.setString(1, nombre);
          ps.setString(2, descripcion);
          ps.executeUpdate();
      }catch(SQLException e){
         System.err.println("SQLException: " + e.getMessage());
         e.printStackTrace();
      }
  }
  
  
  
 //-----------------------------MARCAS--------------------------------------------
  public void mostrarMarcas(){
      try{
          ps = conectar().prepareStatement("Select * from adminproyecto.marcas");
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void anadirMarca(String nombre, String pais_origen) throws SQLException{
      ps = conectar().prepareStatement("{call insertar_marca(?,?,'s')}");
      ps.setString(1, nombre);
      ps.setString(2, pais_origen);
      ps.executeQuery();
  }
}
       
