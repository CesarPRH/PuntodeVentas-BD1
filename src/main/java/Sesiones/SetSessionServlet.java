/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sesiones;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Cesar S
 */
public class SetSessionServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SetSessionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SetSessionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //Id va a cambiar: puede ser nit, puede ser nombre, o puede ser otra cosa.
        //Para ahorrar codigo, esto se utilizara mucho.
        String nombre = request.getParameter("nombre");
        String nit = request.getParameter("nit");
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
       // processRequest(request, response);
        if (nombre!= null){
            session.setAttribute("nombre",nombre);
        }
        if(nit != null){
            session.setAttribute("nit", nit);
        }
        if(id != null){
            session.setAttribute("id", id);
        }
       System.out.println("El nit en el servidor de la persona es: "+nit);
       System.out.println("El nombre en el servidor de la persona es: "+nombre);
       System.out.println("El id en el servidor de la persona es: "+id);
       
   
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
