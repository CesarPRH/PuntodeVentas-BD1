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
import java.sql.SQLException;

/**
 *
 * @author Cesar S
 */
public class AnadirOrden extends HttpServlet {

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
            
            String s_cliente = request.getParameter("txt_cliente");
            String s_producto = request.getParameter("txt_producto");
            String s_cantidad = request.getParameter("txt_cantidad");
            String s_direccion = request.getParameter("txt_direccion");
            String s_ciudad = request.getParameter("txt_ciudad");
            String s_referencia = request.getParameter("txt_referencia");
            String s_idMetodoEnvio = request.getParameter("txt_metodoEnvio");
            System.out.println(s_cliente);
           if (s_cliente!=null && s_producto!=null && s_cantidad!=null && s_direccion!=null && s_ciudad!=null
                   && s_referencia!=null && s_idMetodoEnvio!=null){
               try{
                   int i_cliente = Integer.parseInt(s_cliente);
                   int i_producto = Integer.parseInt(s_producto);
                   int i_cantidad = Integer.parseInt(s_cantidad);
                   
                   
                   RequestDispatcher dispatcher = request.getRequestDispatcher("OrdenUltimo");
                   
                   request.setAttribute("cliente", s_cliente);
                   request.setAttribute("producto", s_producto);
                   request.setAttribute("cantidad",s_cantidad);
                   request.setAttribute("metodoEnvio", s_idMetodoEnvio);
                   
                   
                   c.AnadirOrdenDetalles(i_producto, i_cantidad);
                   c.AnadirDireccionesEnvio(i_cliente, s_direccion, s_ciudad, s_referencia);
                   
                   dispatcher.forward(request, response);
               }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                out.println("</body></html>");
            }
           }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AnadirOrden</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AnadirOrden at " + request.getContextPath() + "</h1>");
            out.println("<h1>"+s_cliente+ s_producto+s_cantidad+"</h1>");

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
