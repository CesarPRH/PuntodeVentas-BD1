<%-- 
    Document   : prueba
    Created on : 11/10/2023, 21:17:50
    Author     : Cesar S
--%>

<%@page import="Estructura.ConexionBD"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%//Instanciamos la estructura en un objeto para usarlo en el JSP
        ConexionBD c = new ConexionBD();
        c.mostrar();
        
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UNIVERSIDAD</title>
         <!--Una hoja de estilo simple para dar una pizca de attracción-->
         <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <h1>DATOS INGRESADOS<br>Mi pene productions</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>CODIGO DE ESTUDIANTE</th>
                    <th>NOMBRE</th>
                    <th>EMAIL</th>
                    <TH>NIT</TH>
                    <TH>TELEFONO</TH>
                    <TH>FECHA DE REGISTRO</TH>
                    <TH>ESTADO</TH>
                    
                </tr>
            </thead>
            <tbody>
                
                    <%
                    //Usamos el bucle while para crear nuevas sentencias SQL
                        while(c.rs.next()){
                        %><tr>
                        <td><%=
                            //Conseguimos la información para desplegarlo en la tabla usando las variables que se usan para ejecutar los queries en la estructura.
                            c.rs.getInt("id_clientes") %></td>
                    <td><%=c.rs.getString("nombre") %></td>
                    <td><%=c.rs.getString("email") %></td>
                    <td><%=c.rs.getString("nit") %></td>
                    
                    <td><%=c.rs.getInt("telefono") %></td>
                    <td><%=c.rs.getDate("fecha_registro") %></td>
                    <td><%=c.rs.getString("estado") %></td>
                </tr>
                <%
                    }
                    %>

            </tbody>
        </table>   
        <!-- comment    <a href="Insertar.jsp">
                        <button type="submit" value="INSERTAR" name="btn_insertar">Insertar</button>
                    </a>--> 
                    </body>
    
</html>
