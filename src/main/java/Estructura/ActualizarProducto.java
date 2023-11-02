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
public class ActualizarProducto extends HttpServlet {

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
            
            String s_id = request.getParameter("txt_idProducto");
            String s_nombre = request.getParameter("txt_nombreProducto");
            String s_descripcion = request.getParameter("txt_descripcionProducto");
            String s_categoria = request.getParameter("txt_categoria");
            String s_marca = request.getParameter("txt_marca");
            String s_precio = request.getParameter("txt_precio");
            String s_proveedor = request.getParameter("txt_proveedor");
            String s_stock = request.getParameter("txt_stock");
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ActualizarProducto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1> Nombre: "+s_nombre+"</h1>");
            out.println("<h1> Nombre: "+s_descripcion+"</h1>");
            out.println("<h1> Marca: "+s_marca+"</h1>");
            out.println("<h1> Categoria: "+s_categoria+"</h1>");
            out.println("<h1> Precio: "+s_precio+"</h1>");
            out.println("<h1> proveedor: "+s_proveedor+"</h1>");
            out.println("<h1> Nombre: "+s_stock+"</h1>");            
            out.println("</body>");
            out.println("</html>");
            int i_id = Integer.parseInt(s_id);
            int i_categoria = Integer.parseInt(s_categoria);
            int i_marca = Integer.parseInt(s_marca);
            int i_stock = Integer.parseInt(s_stock);
            float f_precio = Float.parseFloat(s_precio);
            if(s_id!=null&&s_nombre !=null && s_descripcion!= null && s_marca!=null && s_categoria!=null  &&
            s_precio!=null && s_proveedor!=null && s_stock!=null){
                try{
                    c.actualizarProducto(i_id, i_categoria, i_marca, s_nombre, s_descripcion, f_precio, i_stock);
                    response.sendRedirect("home.jsp");
                }
            catch(SQLException ex){
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
