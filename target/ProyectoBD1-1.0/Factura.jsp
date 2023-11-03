<%-- 
    Document   : ConfirmarOrden
    Created on : 24/10/2023, 20:22:21
    Author     : Cesar S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Estructura.ConexionBD"  %>
<!DOCTYPE html>
<html>
    <%
        String id = (String) pageContext.getAttribute("id", PageContext.SESSION_SCOPE);
        ConexionBD c = new ConexionBD();
        int i_id = Integer.parseInt(id);
        c.ConseguirInfoCompleto(i_id);
        c.rs.next();
        float total = c.rs.getFloat("monto_total") + c.rs.getFloat("costo_envio");
        %>
    <head>
        <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Administrators</title>
	<link rel="stylesheet" href="css/normalize.css">
	<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/material.min.css">
	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
	<link rel="stylesheet" href="css/main.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
	<script src="js/material.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
	<script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>
	<script src="js/main.js" ></script>
        <script>
            function SetSession(link, id){
    
    console.log("SetSession called with link:", link, "and id:", id);
    
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function(){
        if (this.readyState == 4 && this.status == 200){
            window.location.href = link.href;
        }
    };
    xhttp.open("POST","SetSessionServlet", true);
    xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhttp.send("id="+id);
    
}
            </script>
    </head>
    
    <body>
        < <div class="mdl-tabs__panel" id="tabListClient" style="width:75%;margin-left:auto;margin-right:auto">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-success text-center tittles">
                                                            Factura # <%=c.rs.getInt("ordenes_id")  %>
							</div>
							<div class="full-width panel-content" >
                                                            
                                                            <div class="mdl-list">
	
                                                            <form name="form" onsubmit="return false">
                                                            
								<div class="mdl-list listFiltro">
                                                            
                                                                    <div class="mdl-list__item mdl-list__item--three-line Lista">
                                                                            
										<span class="mdl-list__item-primary-content">
                                                                                    
                                                                                    <span><b>Orden:</b></span>
                                                                                    <input type="hidden" >
                                                                                    <center><b><%=c.rs.getString("nombre_producto")  %></b></center>
                                                                                    <small><center><%=c.rs.getString("descripcion_producto")  %></center></small>
                                                                                </span>
									</div>
                                                                                    <small><b>Precio unitario: </b><%= c.rs.getFloat("precio_producto") %>   <b>  Cantidad Comprada:</b><%=c.rs.getInt("cantidad_detalles_orden")  %></small>   <u><big><b>  Subtotal:</b><%=c.rs.getFloat("monto_total")  %></big></u>
                                                                    
                                                                    
                                                                        <div class="mdl-list__item mdl-list__item--two-line Lista">
                                                                            
										<span class="mdl-list__item-primary-content">
                                                                                    
                                                                                    <span><b>CLIENTE:</b><%=c.rs.getString("cliente")  %></span>
                                                                                    <span class="mdl-list__item-sub-title">Email: <%=c.rs.getString("email") %> </span>
                                                                                    <span class="mdl-list__item-sub-title">Dirección: <%= c.rs.getString("direccion") %></span>
										</span>
                                                                                    
                                                                                        <input type="hidden" value="" name="txt_cliente">
									</div>
                                                                        
                                                                                <br>
									<li class="full-width divider-menu-h"></li>
                                                                        
                                                                        <span class="mdl-list__item-primary-content">
                                                                            <br>
                                                                            <span><b>Método de Envío:</b> <%=c.rs.getString("metodo_envio")  %></span>
                                                                                    <input type="hidden" >
                                                                                    <center><b>Costo de Envío: Q<%=c.rs.getFloat("costo_envio")  %></b></center>
                                                                                    <big><center>Total a pagar: <%= total %></center></big>
                                                                                    <small><center>Fecha de Envío: <%=c.rs.getDate("fecha_orden")  %> <br> Revise su correo electrónico para más información sobre su orden.</center></small>
                                                                                    
                                                                                </span>
                                  
								</div>
                                                                
                                                                <div class="mdl-list listFiltro">
                                                                    
									
                                                                        
									
                                  
								</div>
                                                                        <hr>
                                                                        <center>
                                                                            <a class="mdl-list__item-secondary-action" href="Devolucion.jsp" onclick="SetSession(this, '<%=c.rs.getInt("ordenes_id") %>')" style="color:black">
                                                                            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-danger mdl" id="btn-deleteCategoria" onclick="verificarBorrar()" formaction="EliminarPrvoeedor">
                                                                        <i class="zmdi zmdi-delete"></i>
                                                                    </button>
                                                                            </a>
                                                                        </center>
                                                                        <div class="mdl-tooltip" for="btn-deleteCategoria">Procesar Devolucion</div>
                                                            </form>
                                                                
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
    </body>
</html>
