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
import java.sql.SQLException;

/**
 *
 * @author Cesar S
 */
public class AnadirProveedor extends HttpServlet {

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
            
            String s_nombreEmpresa = request.getParameter("txt_nombreEmpresa");
            String s_nombreContacto = request.getParameter("txt_nombreContacto");
            String s_emailContacto = request.getParameter("txt_emailContacto");
            String s_telefonoContacto = request.getParameter("txt_telefonoContacto");
            
            System.out.println(s_nombreEmpresa + " "+s_nombreContacto + " "+s_emailContacto + " "+ s_telefonoContacto);
            if(s_nombreEmpresa!=null && s_nombreContacto!=null && s_emailContacto!=null && s_telefonoContacto!=null){
                try{
                    c.AnadirProveedor(s_nombreEmpresa, s_nombreContacto, s_emailContacto, s_telefonoContacto);
                    response.sendRedirect("home.jsp");
                }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                out.println("</body></html>");
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
