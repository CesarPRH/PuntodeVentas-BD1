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
public class CompraUltimo extends HttpServlet {

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
            String proveedor = (String) request.getAttribute("proveedor");
            String cantidad = (String) request.getAttribute("cantidad");
            String precio = (String) request.getAttribute("precio");
            String id = (String) request.getAttribute("productoId");
            
            if(proveedor!=null && cantidad!=null && precio!=null && id!=null){
                
            try{
                 int i_proveedor = Integer.parseInt(proveedor);
            int i_id = Integer.parseInt(id);
            int i_cantidad = Integer.parseInt(cantidad);
            System.out.println(i_proveedor+i_id+i_cantidad);
            float f_precio = Float.parseFloat(precio);
            try{
                c.ConseguirInfoDetalleCompra(i_id, i_cantidad);
            }catch(SQLException e){
          System.err.println("SQLException: "+e.getMessage());
          e.printStackTrace();
      }
            
            if(c.rs != null && c.rs.next()){
                int i_detalle_compra = c.rs.getInt("id_detalles_compras");
                c.AnadirCompra(i_detalle_compra, i_proveedor);
                response.sendRedirect("home.jsp");
            }else{
                System.out.println("there was a fucking error.");
                out.println("<h1>Hubo un error.</h1>");
                out.println(i_proveedor);
                out.println(i_id);
                out.println(i_cantidad);
                out.println(f_precio);
                //out.println(i_detalle_compra);
            }
            }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                out.println("</body></html>");
            }
           
            
            }else{
                
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CompraUltimo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompraUltimo at " + request.getContextPath() + "</h1>");
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
