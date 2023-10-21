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
    public ResultSet rsAux;
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
          ps = conectar().prepareStatement("Select * from vista_clientes where id_clientes="+id);
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
          ps = conectar().prepareStatement("Select * from vista_categorias_activos");
          rs = ps.executeQuery();
  }catch (SQLException e){
      System.err.println("SQLException: "+ e.getMessage());
      e.printStackTrace();
  }
  
}
  public void mostrarCategoriasDesactivadas()throws SQLException{
      ps = conectar().prepareStatement("Select * from vista_categorias_inactivos");
      rs = ps.executeQuery();
  }
  public void anadirCategorias(String nombre, String descripcion) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertar_categoria(?,?,'A')}");
          ps.setString(1, nombre);
          ps.setString(2, descripcion);
          ps.executeUpdate();
      }catch(SQLException e){
         System.err.println("SQLException: " + e.getMessage());
         e.printStackTrace();
      }
  }
  
  public void conseguirInfoCategorias(String id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_categorias where id_categorias="+id);
         rs =  ps.executeQuery();
      }catch(SQLException e){
         System.err.println("SQLException: " + e.getMessage());
         e.printStackTrace();
      }
  }
  
  public void actualizarCategorias(int id, String nombre, String descripcion)throws SQLException{
      try{
          ps = conectar().prepareStatement("{Call actualizar_categoria(?,?,?,'A')}");
          ps.setInt(1, id);
          ps.setString(2, nombre);
          ps.setString(3, descripcion);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: " + e.getMessage());
             e.printStackTrace();
      }
  }
  public void EliminarCategorias(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_categoria(?,'s')}");
          ps.setInt(1, id);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: " + e.getMessage());
             e.printStackTrace();
      }
  }
  
  
 //-----------------------------MARCAS--------------------------------------------
  public void mostrarMarcas(){
      try{
          ps = conectar().prepareStatement("Select * from vista_marcas_activos");
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void mostrarMarcasDesactivadas()throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_marcas_inactivos");
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void anadirMarca(String nombre, String pais_origen) throws SQLException{
      ps = conectar().prepareStatement("{call insertar_marca(?,?,'A')}");
      ps.setString(1, nombre);
      ps.setString(2, pais_origen);
      ps.executeUpdate();
  }
  
  public void ConseguirInfoMarcas(String id) throws SQLException{
    try{
        ps = conectar().prepareStatement("Select * from vista_marcas where id_marcas="+id);
        rs = ps.executeQuery();
    }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
}
          
          
  public void ActualizarMarcas(int id, String nombre, String paisOrigen) throws SQLException{
      try{
      ps = conectar().prepareStatement("{call actualizar_marca(?,?,?,'A')}");
      ps.setInt(1, id);
      ps.setString(2, nombre);
      ps.setString(3, paisOrigen);
      ps.executeUpdate();
  } catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
}
  public void EliminarMarcas(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_marca(?,'s')}");
          ps.setInt(1, id);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void RecuperarMarcas(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Update marcas set estado='A' where estado!='A'");
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  //-----------------------------------------PROVEEDORES---------------------------------------------
  
  public void mostrarProveedores() throws SQLException{
      try{
          ps = conectar().prepareStatement("select * from vista_proveedores_activos");
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void mostrarProveedoresDesactivados() throws SQLException{
      try{
          ps = conectar().prepareStatement("select * from vista_proveedores_inactivos");
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void AnadirProveedor(String nombreEmpresa,String nombreContacto, String emailContacto, String telefonoContacto) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertar_proveedor(?,?,?,?,'A')}");
          ps.setString(1, nombreEmpresa);
          ps.setString(2, nombreContacto);
          ps.setString(3, emailContacto);
          ps.setString(4, telefonoContacto);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void conseguirInfoProveedores(String id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_proveedores where id_proveedores="+id);
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void ActualizarProveedores(int id,String nombre, String nombreContacto, String emailContacto, String telefonoContacto) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call actualizar_proveedor(?,?,?,?,?,'A')}");
          ps.setInt(1, id);
          ps.setString(2, nombre);
          ps.setString(3, nombreContacto);
          ps.setString(4, emailContacto);
          ps.setString(5, telefonoContacto);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
 
  public void EliminarProveedores (int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_proveedor(?,'s')}");
          ps.setInt(1, id);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  //-------------------------------------------------EMPLEADOS----------------------------------------------
  
  
  public void MostrarEmpleados() throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_empleados_activos");
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void MostrarEmpleadosDesactivados() throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_empleados_inactivos");
          rs = ps.executeQuery();
          
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void ConseguirInfoEmpleados(String id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_empleados_activos where id_empleados="+id+"");
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  
  public void AnadirEmpleado(String nombre, String apellido, String dpi, String telefono, String direccion, String puesto, Date fechaContratacion) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertar_empleado(?,?,?,?,?,?,?,'A')}");
          ps.setString(1, nombre);
          ps.setString(2, apellido);
          ps.setString(3, dpi);
          ps.setString(4, telefono);
          ps.setString(5, direccion);
          ps.setString(6, puesto);
          ps.setDate(7, fechaContratacion);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void ActualizarEmpleado(int id, String nombre, String apellido, String dpi, String telefono, String direccion, String puesto, Date fecha) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call actualizar_empleado(?,?,?,?,?,?,?,?,'A')}");
          ps.setInt(1, id);
          ps.setString(2, nombre);
          ps.setString(3, apellido);
          ps.setString(4, dpi);
          ps.setString(5, telefono);
          ps.setString(6, direccion);
          ps.setString(7, puesto);
          ps.setDate(8, fecha);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void EliminarEmpleado(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_empleado(?,'s')}");
          ps.setInt(1, id);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  
  //----------------------------------------------USUARIOS-----------------------------------------------
  public void MostrarUsuario() throws SQLException{
      ps = conectar().prepareStatement("Select * from vista_empleados_activos");
      rs = ps.executeQuery();
  }
  public void MostrarUsuarioFull(int id) throws SQLException{
      ps = conectar().prepareStatement("Select * from vista_usuario where empleados_id="+id);
      rs = ps.executeQuery();
  }
  
  public void AnadirUsuario( String usuario, String contraseña, int Id_Empleados){
      try{
          ps = conectar().prepareStatement("{call insertar_usuario('Empleado',?,?,?,'A')}");
          //ps.setString(1, tipoUsuario);
          ps.setString(1, usuario);
          ps.setString(2, contraseña);
          ps.setInt(3, Id_Empleados);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  //Nombre incorrecto, esta consigue dpi y no id.
  public void ConseguirUsuarioId(String dpi){
      try{
          ps = conectar().prepareStatement("Select * from vista_empleados where dpi=?");
          ps.setString(1, dpi);
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void MostrarUsuarioEmpleado(){
      try{
          ps = conectar().prepareStatement("Select * from vista_usuario_empleado");
          rs = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void ConseguirInfoUsuario(String id)throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_usuario_empleado where id_empleado="+id);
          rsAux = ps.executeQuery();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void ActualizarUsuario( int id, String tipoUsuario, String usuario, String contraseña) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call actualizar_usuario(?,?,?,?,'A')}");
          ps.setInt(1, id);
          ps.setString(2, tipoUsuario);
          ps.setString(3, usuario);
          ps.setString(4, contraseña);
        //  ps.setInt(5, empleadoId);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void EliminarUsuario(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_usuario(?,'s')}");
          ps.setInt(1, id);
          ps.executeUpdate();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  
}

       
