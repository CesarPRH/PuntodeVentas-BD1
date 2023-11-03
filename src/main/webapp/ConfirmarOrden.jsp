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
        String cliente = (String) request.getAttribute("cliente");
        String producto = (String) request.getAttribute("producto");
        String cantidad = (String) request.getAttribute("cantidad");
        System.out.println(cliente + producto + cantidad);
        int i_cliente = Integer.parseInt(cliente);
        int i_producto =Integer.parseInt(producto);
        int i_cantidad = Integer.parseInt(cantidad);
        ConexionBD c = new ConexionBD();
        
   
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
       
    </head>
    
    <body>
        < <div class="mdl-tabs__panel" id="tabListClient" style="width:75%;margin-left:auto;margin-right:auto">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-success text-center tittles">
								Información del órden
							</div>
							<div class="full-width panel-content" >
                                                            
                                                            <div class="mdl-list">
	
                                                            <form name="form" onsubmit="return false">
                                                            
								<div class="mdl-list listFiltro">
                                                            <% 
                                                                c.AsignarPseudoIdDetalleOrden();
                                                                if(c.rsAux4.next()){
                                                                %>
                                                                    <div class="mdl-list__item mdl-list__item--two-line Lista">
                                                                            
										<span class="mdl-list__item-primary-content">
                                                                                    
                                                                                    <span><b>Orden:</b> #<%=c.rsAux4.getInt("id_detalles_orden")  %></span>
                                                                                    <input type="hidden" >
										</span>
									</div>
                                                                    
                                                                    
                                                                    <%
                                                                        }
                                                                        c.conseguirInfoCliente(cliente);
                                                                        if(c.rs.next()){
                                                                        %>
                                                                        <div class="mdl-list__item mdl-list__item--two-line Lista">
                                                                            
										<span class="mdl-list__item-primary-content">
                                                                                    
                                                                                    <span><b>CLIENTE:</b> <%=c.rs.getString("nombre")  %>| Telefono: <%=c.rs.getInt("telefono")  %></span>
                                                                                        <span class="mdl-list__item-sub-title">NIT:<%=c.rs.getString("nit") %> | email: <%= c.rs.getString("email") %> </span>
										</span>
                                                                                        <input type="hidden" value="<%=c.rs.getInt("id_clientes")%>" name="txt_cliente">
									</div>
                                                                        <%
                                                                            }
                                                                            %>
									<li class="full-width divider-menu-h"></li>
                                  
								</div>
                                                                
                                                                <div class="mdl-list listFiltro">
                                                                    <%
                                                                        c.conseguirInfoProducto(i_producto);
                                                                        
                                                                        if(c.rsAux3.next()){
                                                                        %>
									<div class="mdl-list__item mdl-list__item--two-line Lista">         
                                                                            <span class="mdl-list__item-primary-content">
                                                                                
                                                                                <span><b>PRODUCTO:</b> <%=c.rsAux3.getString("producto")  %> </span>
                                                                                <span class="mdl-list__item-sub-title">Precio: <%=c.rsAux3.getFloat("precio") %> | Cantidad en orden: <%= i_cantidad %> </span>
										</span>
                                                                                <input type="hidden" value="<%=c.rsAux3.getInt("id_productos")  %>" name="txt_producto">
                                                                                <input type="hidden" value="<%=i_cantidad%>" name="txt_cantidad">
                                                                                
                                                                        </div>
                                                                        <%
                                                                            }
                                                                        Float precio = c.rsAux3.getFloat("precio");
                                                                        Float totalPagar = precio * i_cantidad;
                                                                            %>
									<li class="full-width divider-menu-h"></li>
                                                                        <div class="mdl-list__item mdl-list__item--two-line Lista">										<span class="mdl-list__item-primary-content">
											
                                                                                <span>Subtotal: Q<%= totalPagar %></span>
									</div>
                                  
								</div>
                                                                        <hr>
                                                                        <div class="full-width panel-tittle bg-info text-center tittles">
								Información del envío
							</div>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input class="mdl-textfield__input" type="text"  id="direccion" name="txt_direccion" >
                                                                                <label class="mdl-textfield__label" for="direccion">Dirección (Barrio, Calle, etc...)</label>
                                                                                <span class="mdl-textfield__error">Dirección Inválido</span>
                                                                        </div>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input class="mdl-textfield__input" type="text"  id="ciudad" name="txt_ciudad" >
                                                                                <label class="mdl-textfield__label" for="ciudad">Ciudad</label>
                                                                                <span class="mdl-textfield__error">Ciudad Invalida</span>
                                                                        </div>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input class="mdl-textfield__input" type="text"  id="referencia" name="txt_referencia" >
                                                                                <label class="mdl-textfield__label" for="referencia">Referencia</label>
                                                                                <span class="mdl-textfield__error">Referencia Inválida</span>
                                                                        </div>
                                                                        <div class="mdl-textfield mdl-js-textfield">
												<select class="mdl-textfield__input" name="txt_metodoEnvio">
													<option value="" disabled="" selected="">Selecciona El método de envío</option>
                                                                    <!-- Aquí se va a utilizar un ciclo para mostrar todas las categorías -->
                                                                    <%
                                                                        //Esta utilizar rs
                                                                          c.ConseguirMetodosEnvio();
                                                                        while(c.rsAux2.next()){
                                                                        %>
                                                                        <option value="<%= c.rsAux2.getInt("id_metodos_envio") %>"><%= c.rsAux2.getString("nombre") %> - Q<%=c.rsAux2.getFloat("costo")  %></option>
                                                                                                        <%
                                                                                                            }
                                                                                                            %>
												</select>
											</div>
                                                                        <div class="full-width" style="text-align:center">¿Estas seguro del orden?</div>
                                                                        <div class="full-width" style="margin-left:auto; margin-right:auto; width:50%; display:flex; justify-content:center;place-items: center">
                                                                            <button class="mdl-button mdl-button--colored bg-info mdl-js-button mdl-button mdl-js-ripple-effect" onclick="document.form.action='AnadirOrden';document.form.submit();">Si</button>
                                                                        <button class="mdl-button mdl-button-colored bg-danger" onclick="window.location.href='ordenes.jsp'">no</button>
                                                                        </div>
                                                            </form>
                                                                
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
    </body>
</html>
