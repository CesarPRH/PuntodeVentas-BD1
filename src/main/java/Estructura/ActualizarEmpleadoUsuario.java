/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Estructura;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Set;
import java.util.HashSet;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
/**
 *
 * @author Cesar S
 */
public class ActualizarEmpleadoUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            ConexionBD c = new ConexionBD();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Integer i_idUsuario = null;
            
            String s_id = request.getParameter("txt_idEmpleado");
            String s_nombre = request.getParameter("txt_nombreEmpleado");
            String s_apellido = request.getParameter("txt_apellidoEmpleado");
            String s_dpi = request.getParameter("txt_DPIEmpleado");
            String s_telefono = request.getParameter("txt_telefonoEmpleado");
            String s_direccion = request.getParameter("txt_direccionEmpleado");
            String s_puesto = request.getParameter("txt_puestoEmpleado");
            String s_fecha = request.getParameter("txt_fechaContratacion");
            String s_usuario = request.getParameter("txt_usuario");
            String s_contraseña = request.getParameter("txt_contraseña");
            String s_tipo = request.getParameter("txt_tipoUsuario");
            //Conseguiremos un dato necesario para la actualizacion.
            int i_id = Integer.parseInt(s_id);
            try{
                
                c.MostrarUsuarioFull(i_id);
                while(c.rs.next()){
             i_idUsuario = c.rs.getInt("id_usuario");}
                System.out.println("Id del usuario: "+i_idUsuario);
            }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                out.println("</body></html>");
            }
            
            if(s_id!=null && s_nombre!= null && s_apellido!=null && s_dpi != null && s_telefono != null &&
                    s_direccion!=null && s_puesto != null && s_fecha != null && s_usuario!=null &&
                    s_contraseña!= null && s_tipo!= null && i_idUsuario != null){
                
            }try{
                
                java.util.Date utilDate = formatter.parse(s_fecha);
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                //RequestDispatcher dispatcher = request.getRequestDispatcher(s_tipo)
                try{
                    c.ActualizarEmpleado(i_id, s_nombre, s_apellido, s_dpi, s_telefono, s_direccion, s_puesto, sqlDate);
                    
                    
                    
                    c.ActualizarUsuario(i_idUsuario, s_tipo, s_usuario, s_contraseña);
                    response.sendRedirect("home.jsp");
                }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                out.println("</body></html>");
            }
            }catch(Exception e){
                e.getMessage();
                e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
