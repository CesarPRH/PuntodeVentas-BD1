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
public class OrdenUltimo extends HttpServlet {

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
            
            String s_cliente = (String) request.getAttribute("cliente");
            String s_producto =(String) request.getAttribute("producto");
            String s_cantidad = (String) request.getAttribute("cantidad");
            
            try{
                int i_cliente = Integer.parseInt(s_cliente);
                int i_producto = Integer.parseInt(s_producto);
                int i_cantidad = Integer.parseInt(s_cantidad);
                Integer i_detalle_orden = null;
                
                c.ConseguirInfoDetalleOrden(i_producto, i_cantidad);
                if(c.rs.next()){
                    i_detalle_orden = c.rs.getInt("id_detalles_orden");
                }
                c.AnadirOrden(i_cliente, i_detalle_orden);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Gracias por su orden. Será redirigido en unos segundos.');");
                out.println("setTimeout(function(){window.location.href='home.jsp'},5000);");
                out.println("</script>");
            }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                out.println("</body></html>");
            }
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrdenUltimo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrdenUltimo at " + request.getContextPath() + "</h1>");
            out.println("<h1>"+s_cliente+s_producto+s_cantidad+"</h1>");
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
