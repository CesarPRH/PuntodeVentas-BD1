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
    public ResultSet rsAux2;
    public ResultSet rsAux3;
    public ResultSet rsAux4;
    public PreparedStatement ps;
   // public Connection conn;
    //Esta es el URL que debería tener el JBDC.
           //orcl es para la version enterprise y xe es para Express
           //No ponemos el nombre de la base de datos en el URL,
           //A comparacion de MySQL y SQL Manager
    public static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    public static String username = "adminproyecto";
    public static String password = "secreto";
    
    //Utilizado para utilizar más de un ResultSet en un solo JSP
    private int getRsStatus() {
        if (rs != null) {
    // Use rs
    rs = null;
}
        
    if (rs == null) {
        return 1;
    } else if (rsAux == null) {
        return 2;
    } else if (rsAux2 == null) {
        return 3;
    } else if (rsAux3 == null) {
        return 4;
    } else {
        return 0;
    }
}
   
       
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
                   
      ps = conectar().prepareStatement("Select * from vista_clientes_activos");
      rs = ps.executeQuery();
      conectar().close();
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
      conectar().close();
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
     conectar().close();
      
      
  }catch(SQLException ex) {
        Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, "SQL statement: EXECUTE insertar_cliente(?,?,?,?,SYSDATE,'s')", ex);
        throw ex;
    }
  }
  
  public void conseguirInfoCliente(String id){
      try{
          ps = conectar().prepareStatement("Select * from vista_clientes where id_clientes="+id);
          rs = ps.executeQuery();
          conectar().close();
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
      conectar().close();
  }
  
  public void eliminarCliente(int id_clientes)throws SQLException{
      try{ps = conectar().prepareStatement("{call eliminar_cliente(?,'s')}");
      ps.setInt(1, id_clientes);
      ps.executeUpdate();
      conectar().close();
  }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  //Utilizamos el mismo procedimiento de eliminar_cliente, ya que esto solo cambia el estado.
  public void recuperarCliente(int id_clientes) throws SQLException{
      try{
      ps = conectar().prepareStatement("{call eliminar_cliente(?,'A')}");
      ps.setInt(1, id_clientes);
      ps.executeUpdate();
      conectar().close();
  }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    
  }
  
  //-----------------------------CATEGORIAS---------------------------------------
  
  public void mostrarCategorias(){
      try{
          ps = conectar().prepareStatement("Select * from vista_categorias_activos");
          
         // int rsEstado = getRsStatus();
          
          int rsStatus = getRsStatus();

        switch (rsStatus) {
            case 1:
                rs = ps.executeQuery();
                System.out.println("estoy usando esta vaina");
                break;
            case 2:
                rsAux = ps.executeQuery();
                System.out.println("estoy usando esta vaina 2");
                break;
            case 3:
                rsAux2 = ps.executeQuery();
                System.out.println("estoy usando esta vaina 3");
                break;
            case 4:
                rsAux3 = ps.executeQuery();
                System.out.println("estoy usando esta vaina 4");
                break;
            default:
                System.out.println("All rs variables are already used");
                break;
        }
          conectar().close();
  }catch (SQLException e){
      System.err.println("SQLException: "+ e.getMessage());
      e.printStackTrace();
  }
  
}
  public void mostrarCategoriasDesactivadas()throws SQLException{
      ps = conectar().prepareStatement("Select * from vista_categorias_inactivos");
      rs = ps.executeQuery();
      conectar().close();
  }
  public void anadirCategorias(String nombre, String descripcion) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertar_categoria(?,?,'A')}");
          ps.setString(1, nombre);
          ps.setString(2, descripcion);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
         System.err.println("SQLException: " + e.getMessage());
         e.printStackTrace();
      }
  }
  
  public void conseguirInfoCategorias(String id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_categorias where id_categorias="+id);
         rs =  ps.executeQuery();
         conectar().close();
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
          conectar().close();
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
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: " + e.getMessage());
             e.printStackTrace();
      }
  }
  
  public void RecuperarCategoria(int id) throws  SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_categoria(?,'A')}");
          ps.setInt(1, id);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: " + e.getMessage());
             e.printStackTrace();
      }
      }
  
  
 //-----------------------------MARCAS--------------------------------------------
  public void mostrarMarcas(){
      try{
          ps = conectar().prepareStatement("Select * from vista_marcas_activos");
          if (rs == null){
          
          rs = ps.executeQuery();}
          else{
          rsAux = ps.executeQuery();
          }
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void mostrarMarcasDesactivadas()throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_marcas_inactivos");
          rs = ps.executeQuery();
          conectar().close();
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
      conectar().close();
  }
  
  public void ConseguirInfoMarcas(String id) throws SQLException{
    try{
        ps = conectar().prepareStatement("Select * from vista_marcas where id_marcas="+id);
        rs = ps.executeQuery();
        conectar().close();
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
      conectar().close();
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
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void RecuperarMarcas(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_marca(?,'A')}");
          ps.setInt(1, id);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  //-----------------------------------------PROVEEDORES---------------------------------------------
  
  public void mostrarProveedores() throws SQLException{
      try{
          ps = conectar().prepareStatement("select * from vista_proveedores_activos");
          if (rs == null){
          
          rs = ps.executeQuery();}
          else{
          rsAux2 = ps.executeQuery();
          }
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void mostrarProveedoresDesactivados() throws SQLException{
      try{
          ps = conectar().prepareStatement("select * from vista_proveedores_inactivos");
          rs = ps.executeQuery();
          conectar().close();
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
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void conseguirInfoProveedores(String id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_proveedores where id_proveedores="+id);
          rs = ps.executeQuery();
          conectar().close();
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
          conectar().close();
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
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void RecuperarProveedores (int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_proveedor(?,'A')}");
          ps.setInt(1, id);
          ps.executeUpdate();
          conectar().close();
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
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void MostrarEmpleadosDesactivados() throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_empleados_inactivos");
          rs = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void ConseguirInfoEmpleados(String id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_empleados_activos where id_empleados="+id+"");
          rs = ps.executeQuery();
          conectar().close();
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
          conectar().close();
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
          conectar().close();
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
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void RecuperarEmpleado(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_empleado(?,'A')}");
          ps.setInt(1, id);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  //----------------------------------------------USUARIOS-----------------------------------------------
  public void MostrarUsuario() throws SQLException{
      ps = conectar().prepareStatement("Select * from vista_empleados_activos");
      rs = ps.executeQuery();
      conectar().close();
  }
  public void MostrarUsuarioFull(int id) throws SQLException{
      ps = conectar().prepareStatement("Select * from vista_usuario where empleados_id="+id);
      rs = ps.executeQuery();
      conectar().close();
  }
  
  public void AnadirUsuario( String usuario, String contraseña, int Id_Empleados)throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertar_usuario('Empleado',?,?,?,'A')}");
          //ps.setString(1, tipoUsuario);
          ps.setString(1, usuario);
          ps.setString(2, contraseña);
          ps.setInt(3, Id_Empleados);
          ps.executeUpdate();
          conectar().close();
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
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void MostrarUsuarioEmpleado(){
      try{
          ps = conectar().prepareStatement("Select * from vista_usuario_empleado");
          rs = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void ConseguirInfoUsuario(String id)throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_usuario_empleado where id_empleado="+id);
          rsAux = ps.executeQuery();
          conectar().close();
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
          conectar().close();
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
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void RecuperarUsuario(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call eliminar_usuario(?,'A')}");
          ps.setInt(1, id);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  //----------------------------------ADMINISTRADORES---------------------------------------

  public void MostrarAdministradores() throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vistaadministradoresactivos");
          if (rs == null){
          
          rs = ps.executeQuery();}
          else{
          rsAux = ps.executeQuery();
          }
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void MostrarAdministradoresInactivos() throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from VistaEmpleadosAdministradores where Estado !='A'");
          rs = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  
  public void MostrarEmpleadosAdministradores() throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from VistaEmpleadosAdministradores where estado='A'");
          rs = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void AnadirAdministrador(int id, String usuario, String contraseña) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertarAdministrador(?,?,?,'A')}");
          ps.setInt(1, id);
          ps.setString(2, usuario);
          ps.setString(3, contraseña);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void ConseguirInfoAdmin(String id)throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from VistaEmpleadosAdministradores where id_empleados="+id);
          rsAux = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void ActualizarAdmin(int id, int empleadoId, String usuario, String contraseña) throws SQLException{
      try{
      ps.setInt(1, id);
      ps.setInt(2, empleadoId);
      ps.setString(3, usuario);
      ps.setString(4, contraseña);
      ps.executeQuery();
      conectar().close();
      }
      catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void MostrarAdminFull(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from VistaAdministradoresActivos where empleados_id="+id);
          rs = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void MostrarAdminFullInactivo(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from VistaAdministradoresInactivos where empleados_id="+id);
          rs = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void EliminarAdministrador (int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call EliminarAdministrador(?,'s')}");
          ps.setInt(1, id);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void RecuperarAdministrador (int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call EliminarAdministrador(?,'A')}");
          ps.setInt(1, id);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
 
  
  /*
  
  Aqui viene lo dificil :(
  */
  
  //-------------------------------------------------PRODUCTOS----------------------------------------------------
  
  public void mostrarProductos(){
      try{
          ps = conectar().prepareStatement("Select * from vista_productos_activos");
          rsAux3 = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void mostrarProductosInactivos() throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_productos_inactivos");
          rs = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void conseguirProductoId(String producto) throws SQLException{
      try{
      ps = conectar().prepareStatement("Select * from vista_productos_activos where producto ='"+producto+"'");
      rs = ps.executeQuery();
      conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void conseguirInfoProducto(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("Select * from vista_productos_activos where id_productos="+id);
          rsAux3 = ps.executeQuery();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void insertarProducto( int idCategoria, int idMarca, String nombre, String descripcion, float precio, int stock)throws SQLException{
      
      try{
      ps= conectar().prepareStatement("{call insertar_producto(?,?,?,?,?,?,'A')}");
      ps.setInt(1, idCategoria);
      ps.setInt(2, idMarca);
      ps.setString(3, nombre);
      ps.setString(4, descripcion);
      ps.setFloat(5, precio);
      ps.setInt(6, stock);
      ps.executeUpdate();
      conectar().close();
  }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  public void actualizarProducto(int id, int categoriaId, int marcaId, String nombre, String descripcion, float precio, int stock) throws SQLException{
      try{
          ps = conectar().prepareStatement(" {call actualizar_producto(?,?,?,?,?,?,?,'A')}");
          ps.setInt(1, id);
          ps.setInt(2, categoriaId);
          ps.setInt(3, marcaId);
          ps.setString(4, nombre);
          ps.setString(5, descripcion);
          ps.setFloat(6, precio);
          ps.setInt(7, stock);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
    public void EliminarProducto(int id) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call actualizar_estado_producto(?,'s')}");
          ps.setInt(1, id);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void RecuperarProducto(int id) throws SQLException{
  try{
      ps = conectar().prepareStatement("{call actualizar_estado_producto(?,'A')}");
      ps.setInt(1, id);
      ps.executeUpdate();
      conectar().close();
  }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
  
  //--------------------------------------PROMOCION---------------------------------------
  public void insertarPromocion(String nombre, String descripcion, float porcentajeDescuento, Date fechaFin) throws SQLException{
     
      try{
      ps = conectar().prepareStatement("{call insertar_promocion(?,?,?,SYSDATE,?,'A')}");
      ps.setString(1, nombre);
      ps.setString(2, descripcion);
      ps.setFloat(3, porcentajeDescuento);
      ps.setDate(4, fechaFin);
      ps.executeUpdate();
      conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  public void conseguirPromocionId (String nombre) throws SQLException{
      try{
      ps = conectar().prepareStatement("select * from vista_promociones_activas where nombre='"+nombre+"'");
      rsAux = ps.executeQuery();
      conectar().close();
  }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
}
  public void AnadirProductoEnPromocion(int idProducto, int idPromocion) throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertar_producto_en_promocion(?,?)}");
          ps.setInt(1, idProducto);
          ps.setInt(2, idPromocion);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  

  //----------------------------------------------ORDENES-------------------------------------------------
  public void AnadirOrdenDetalles(int productoId, int cantidad)throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertar_detalle_orden(?,?)}");
          ps.setInt(1, productoId);
          ps.setInt(2, cantidad);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
  
    public void AnadirOrden(int clienteId, int ordenDetalle)throws SQLException{
      try{
          ps = conectar().prepareStatement("{call insertar_orden(?,?,SYSDATE,'A')}");
          ps.setInt(1, clienteId);
          ps.setInt(2, ordenDetalle);
          ps.executeUpdate();
          conectar().close();
      }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
  }
    public  void ConseguirInfoDetalleOrden(int productoId, int Cantidad) throws SQLException{
       try{
        ps = conectar().prepareStatement("Select * from vista_orden_detalles where productos_id=? and cantidad=? order by id_detalles_orden desc");
        ps.setInt(1,productoId);
        ps.setInt(2, Cantidad);
        rs = ps.executeQuery();
        conectar().close();
    }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    
}
    
    public void AsignarPseudoIdDetalleOrden() throws SQLException{
        try{
            ps = conectar().prepareStatement("Select Max(Id_Detalles_orden)+1 as id_detalles_orden from vista_orden_detalles");
            rsAux4 = ps.executeQuery();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    //Hay muchos metodos que basicamente hacen la misma cosa, pero que se quede asi.
    public void mostrarOrdenInfo() throws SQLException{
        try{
            ps = conectar().prepareStatement("Select * from vista_orden_info");
            rs = ps.executeQuery();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    public void conseguirInfoOrdenOrdenado(int clienteId, int detallesOrdenId) throws SQLException{
        try{
            ps = conectar().prepareStatement("Select * from vista_orden where cliente_id=? and detalles_ordenes_id=? order by id_ordenes desc");
            ps.setInt(1, clienteId);
            ps.setInt(2, detallesOrdenId);
            rs = ps.executeQuery();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    public void conseguirInfoOrdenConId(int id) throws SQLException{
        try{
            ps = conectar().prepareStatement("Select * from vista_orden where id_ordenes="+id);
            rs = ps.executeQuery();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
//------------------------------------------METODOS DE ENVIO-----------------------------------
    
    public void ConseguirMetodosEnvio() throws SQLException{
try{
    ps = conectar().prepareStatement("Select * from vista_metodos_envio_activos");
    rsAux2 = ps.executeQuery();
    conectar().close();
    }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    public void ConseguirMetodosEnvioInactivos() throws SQLException{
        try{
            ps = conectar().prepareStatement("Select * from vista_metodos_envio_inactivos");
            rs = ps.executeQuery();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    public void AnadirMetodosEnvio(String nombre, String descripcion, float costo) throws SQLException{
        try{
            ps = conectar().prepareStatement("{call insertar_metodo_envio(?,?,?,'A')}");
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setFloat(3, costo);
            ps.executeUpdate();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    public void ConseguirInfoMetodosEnvio(String id) throws SQLException{
        try{
            ps = conectar().prepareStatement("Select * from vista_metodos_envio_activos where id_metodos_envio="+id);
            rs = ps.executeQuery();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    
    public void ActualizarMetodosEnvio(int id, String nombre, String descripcion, float costo) throws SQLException{
        try{
            ps = conectar().prepareStatement("{call actualizar_metodo_envio(?,?,?,?,'A')}");
            ps.setInt(1, id);
            ps.setString(2, nombre);
            ps.setString(3, descripcion);
            ps.setFloat(4, costo);
            ps.executeUpdate();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    
    public void EliminarMetodoEnvio(int id) throws SQLException{
        try{
            ps = conectar().prepareStatement("{call eliminar_metodo_envio(?,'s')}");
            ps.setInt(1, id);
            ps.executeUpdate();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    public void RecuperarMetodoEnvio(int id) throws SQLException{
        try{
            ps = conectar().prepareStatement("{call eliminar_metodo_envio(?,'A')}");
            ps.setInt(1, id);
            ps.executeUpdate();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    //----------------------------------COMPRAS--------------------------
    
    public void AnadirDetalleCompra(int productoId, int cantidad, float precio) throws SQLException{
        try{
            ps = conectar().prepareStatement("{call insertar_detalle_compra(?,?,?)}");
            ps.setInt(1, productoId);
            ps.setInt(2, cantidad);
            ps.setFloat(3, precio);
            ps.executeUpdate();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
    
    public void AnadirCompra( int proveedorId, int detalleCompraId)throws SQLException{
        try{
            ps = conectar().prepareStatement("{call insertar_compra(?,?,SYSDATE)}");
            ps.setInt(2, proveedorId);
            ps.setInt(1, detalleCompraId);
            ps.executeUpdate();
            conectar().close();
        }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
    }
     public  void ConseguirInfoDetalleCompra(int productoId, int Cantidad) throws SQLException{
       try{
        ps = conectar().prepareStatement("Select * from vista_detalles_compras where productos_id="+productoId+" order by id_detalles_compras desc");
        
        
        rs = ps.executeQuery();
        conectar().close();
    }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
     }
     
     public void ConseguirInformacionGeneralCompras() throws SQLException{
         try{
             ps = conectar().prepareStatement("Select * from vista_informacion_compras");
             rs = ps.executeQuery();
             conectar().close();
         }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
     }
     
     
     //----------------ENVIO Y DIRECCIONES----------------------------------
     
     public void AnadirDireccionesEnvio(int clienteId, String direccion, String ciudad, String referencia) throws SQLException{
         try{
             ps = conectar().prepareStatement("{call insertar_direccion_envio(?,?,?,?)}");
             ps.setInt(1, clienteId);
             ps.setString(2, direccion);
             ps.setString(3, ciudad);
             ps.setString(4, referencia);
             ps.executeUpdate();
             conectar().close();
         }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
     }
     
     
     
     public void AnadirDetallesEnvio(int ordenesId, int metodoEnvioId)throws SQLException{
         try{
             ps = conectar().prepareStatement("{ call insertar_detalle_envio(?,?,SYSDATE)}");
             ps.setInt(1, ordenesId);
             ps.setInt(2, metodoEnvioId);
             ps.executeUpdate();
             conectar().close();
         }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
     }
     
     public void ConseguirInfoCompleto(int ordenes_id) throws SQLException{
         try{
             ps = conectar().prepareStatement("select * from vista_informacion_completa where ordenes_id=?");
             ps.setInt(1, ordenes_id);
             rs = ps.executeQuery();
             conectar().close();
             
         }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
     }
     //------------------------------DEVOLUCIONES (ULTIMA COSA Y ME DUERMO)------------------------
     public void MostrarDevoluciones() throws SQLException{
         try{
             ps = conectar().prepareStatement("select * from vista_informacion_devoluciones_activas");
             rsAux2 = ps.executeQuery();
             conectar().close();
         }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
     }
     
     public void AnadirDevolucion(int ordenId, String motivo) throws SQLException{
         try{
             ps= conectar().prepareStatement("{call insertar_devolucion(?,?,SYSDATE,'A')}");
         ps.setInt(1, ordenId);
         ps.setString(2, motivo);
         ps.executeUpdate();
         conectar().close();
         
     }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
     }
}



