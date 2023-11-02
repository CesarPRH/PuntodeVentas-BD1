/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Estructura;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Cesar S
 */
public class AnadirEmpleadoUsuario extends HttpServlet {

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
            
            String s_nombre = request.getParameter("txt_nombreEmpleado");
            String s_apellido = request.getParameter("txt_apellidoEmpleado");
            String s_dpi = request.getParameter("txt_DPIEmpleado");
            String s_telefono = request.getParameter("txt_telefonoEmpleado");
            String s_direccion = request.getParameter("txt_direccionEmpleado");
            String s_puesto = request.getParameter("txt_puestoEmpleado");
            String s_fechaContratacion =request.getParameter("txt_fechaContratacion");
            String s_usuario = request.getParameter("txt_usuario");
            String s_contraseña = request.getParameter("txt_contraseña");
            String redirected = "Empleado";
            System.out.println(s_nombre+" "+s_apellido+" "+s_dpi+" "+s_telefono+" "+s_direccion+" ");
            System.out.println(s_puesto+" "+s_fechaContratacion+" "+s_usuario+" "+s_contraseña+" ");
            
            if(s_nombre!=null && s_apellido!=null && s_dpi!=null && s_telefono!=null && s_direccion!=null&&
                    s_puesto!=null && s_fechaContratacion!=null && s_usuario!=null && s_contraseña!=null){
                try{
                java.util.Date utilDate = formatter.parse(s_fechaContratacion);
                 java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                 RequestDispatcher dispatcher = request.getRequestDispatcher("AnadirUsuario");
                
                try{
                    //Con este pedazo de codigo mandamos info a AnadirUsuario
                    request.setAttribute("s_usuario", s_usuario);
                    request.setAttribute("s_contraseña", s_contraseña);
                    request.setAttribute("s_dpi", s_dpi);
                    request.setAttribute("redirected",redirected);
                    
                    
                    c.AnadirEmpleado(s_nombre, s_apellido, s_dpi, s_telefono, s_direccion, s_puesto, sqlDate);
                   dispatcher.forward(request, response);
                   // response.sendRedirect("AnadirUsuario");
                   
// c.AnadirUsuario(s_usuario, s_usuario, s_contraseña, 0);
                }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                out.println("</body></html>");
            }
                }catch (Exception e){
                    e.getMessage();
                    e.printStackTrace();
                }
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
