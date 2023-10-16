/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Estructura;

import Model.ClienteModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.ClienteModel;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Cesar S
 */
//@WebServlet("/ClienteAnadir")
public class ClienteAnadir extends HttpServlet {

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
               /* TODO output your page here. You may use following sample code. */
          ConexionBD c = new ConexionBD();
          ClienteModel tm = new ClienteModel();
          System.out.println("Aqui entro");
          
          String s_nombre = request.getParameter("txt_nombrecliente");
          String s_email = request.getParameter("txt_email");
          String s_nit = request.getParameter("txt_nit");
          String s_telefono = request.getParameter("txt_telefono");
          
          out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Fuck you</h1>");
            out.println("<h1>"+s_nombre+"</h1>");
            out.println("<h1>"+s_email+"</h1>");
            out.println("<h1>"+s_nit+"</h1>");
            out.println("<h1>"+s_telefono+"</h1>");
            out.println("</body>");
            out.println("</html>");
            //response.sendRedirect("home.jsp");
          if(s_nombre!=null && s_email!=null && s_nit!=null && s_telefono!=null){
              int i_telefono = Integer.parseInt(s_telefono);
               
              try{
                  //out.println("<p>Hola Mundo</p>");
              tm.setNombre(s_nombre);
              tm.setEmail(s_email);
              tm.setNit(s_nit);
              tm.setTelefono(i_telefono);
              c.anadirCliente(s_nombre, s_email, s_nit, i_telefono);
              response.sendRedirect("home.jsp");
              
              }catch(SQLException ex){
                   //Logger.getLogger(AnadirCliente.class.getName()).log(Level.SEVERE, null, ex);
                   //response.setContentType("text/html");
                    
                    out.println("<html><body>");
                    out.println("<h1>Error occurred while adding client</h1>");
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
