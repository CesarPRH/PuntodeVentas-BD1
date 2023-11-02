/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Estructura.ConexionBD;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Cesar S
 */
public class ConfirmarOrden extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
       protected void processRequest(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           ConexionBD c = new ConexionBD();
           
           String s_cliente = request.getParameter("txt_idCliente");
           String s_producto = request.getParameter("txt_producto");
           String s_cantidad = request.getParameter("txt_cantidad");
           Integer stock = 0;
           int i_id = Integer.parseInt(s_producto);
           int i_cantidad = Integer.parseInt(s_cantidad);
           int i_cliente = Integer.parseInt(s_cliente);
           if(s_cliente!=null && s_producto!=null && s_cantidad!=null){
           try{
            c.conseguirInfoCliente(s_cliente);
            if(c.rs.next()){
                c.conseguirInfoProducto(i_id);
                if(c.rsAux3.next()){
                    stock = c.rsAux3.getInt("stock");
                    int stockRestante = stock - i_cantidad;
                 out.println("<h1>"+stockRestante+"</h1>");
                     if(stockRestante <0){
                         out.println("<h1> Tu orden no pudo ser procesado ya que no hay suficientes productos en nuestro stock. Sorry!</h1>");
                     }else{
                         out.println("<h1>Si hay suficiente. Hijo de puta.</h1>");
                         RequestDispatcher dispatcher = request.getRequestDispatcher("ConfirmarOrden.jsp");

                         request.setAttribute("cliente", s_cliente);
                         request.setAttribute("producto",s_producto);
                         request.setAttribute("cantidad", s_cantidad);
                        // c.AnadirOrdenDetalles(i_id, i_cantidad);
                         dispatcher.forward(request, response);
                     }
                }else{
             out.println("<h1>Ocurrio un error. Por favor revise el codigo del producto.</h1>");

                }
            }   else{
    out.println("<h1>Ocurrio un error. Por favor revise el codigo del cliente.</h1>");

            }
           
           }catch(SQLException ex){
                out.println("<html> <body>");
                out.println("<h1>Error Occurred while adding category</h1>");
                out.println("<p>" + ex.getMessage() + "</p>");
                out.println("</body></html>");
            }
            
        }else{
    out.println("<h1>Ocurrio un error. Por favor llene todo los campos.</h1>");

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
