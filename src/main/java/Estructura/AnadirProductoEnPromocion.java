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
public class AnadirProductoEnPromocion extends HttpServlet {

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
            String s_producto = (String) request.getAttribute("nombreProducto");
            String s_promocion = (String) request.getAttribute("nombrePromocion");
            
            if(s_producto!= null && s_promocion!= null){
                try{
                    c.conseguirProductoId(s_producto);
                    Integer i_id = null;
                    
                    while(c.rs.next()){
                        i_id = c.rs.getInt("id_productos");
                    }
                    c.conseguirPromocionId(s_promocion);
                    Integer i_idPrm  = null;
                    while(c.rsAux.next()){
                        i_idPrm = c.rsAux.getInt("id_promociones");
                    }
                    c.AnadirProductoEnPromocion(i_id, i_idPrm);
                    response.sendRedirect("home.jsp");
                    
                    
            }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                
                out.println("</body></html>");
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AnadirProductoEnPromocion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AnadirProductoEnPromocion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
