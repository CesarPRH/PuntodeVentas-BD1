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
import java.io.BufferedReader;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;
import jakarta.servlet.RequestDispatcher;
import java.sql.SQLException;

/**
 *
 * @author Cesar S
 */
public class AnadirDetalleCompra extends HttpServlet {

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

        // Get the data from the JSON object
String id = request.getParameter("txt_idproducto");
String stockComprado = request.getParameter("txt_cantidad");
String precioUnitario = request.getParameter("txt_precio");
String proveedor = request.getParameter("txt_proveedor");
System.out.println(id);
    if(id!=null && stockComprado!=null && precioUnitario!=null && proveedor!=null){
        try{
            int i_id = Integer.parseInt(id);
        int i_stock = Integer.parseInt(stockComprado);
        float f_precio = Integer.parseInt(precioUnitario);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("CompraUltimo");
        
        request.setAttribute("proveedor", proveedor);
        request.setAttribute("cantidad", stockComprado);
        request.setAttribute("precio", precioUnitario);
        request.setAttribute("productoId", id);
        c.AnadirDetalleCompra(i_id, i_stock, f_precio);
        
        dispatcher.forward(request, response);
       }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                out.println("</body></html>");
        }
        
    }else{
        
    

        // Output the data
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet NewServlet</title>");           
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
        out.println("<p> id:"+id+"</p>");
        out.println("<p>Stock comprado: " + stockComprado + "</p>");
        out.println("<p>Precio unitario: " + precioUnitario + "</p>");
        out.println("<p>Proveedor: " + proveedor + "</p>");
       
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
