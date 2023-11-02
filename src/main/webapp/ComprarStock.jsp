<%-- 
    Document   : ComprarStock
    Created on : 2/11/2023, 01:30:25
    Author     : Cesar S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Estructura.ConexionBD"  %>
<!DOCTYPE html>
<html>
    <%
                String id = (String) pageContext.getAttribute("id", PageContext.SESSION_SCOPE);
         int i_id = Integer.parseInt(id);
        ConexionBD c = new ConexionBD();
        %>
    <head>
        
 	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Empleados</title>
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
     
     //Alerta SweetAlert2
     /*
      * Esta alerta es utilizado para que el usuario verifique si quiere hacer cambios.
      * 
      */
    function verificar() {
        Swal.fire({
            title: '¿Estás Seguro?',
            text: 'Estás a punto de añadir un nuevo usuario.',
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: 'Sí',
            cancelButtonText: 'No'
        }).then((result) => {
            //Esta parte se ejecuta al presionar si
            if (result.isConfirmed) {
                Swal.fire('¡Perfecto!', 'El cliente fue añadido con éxito.', 'success').then(() => {
                  document.form.action = 'AnadirDetalleCompra';
                    document.form.submit();
                });
            } else if (result.isDismissed) {
                //Esta parte se ejecuta al presionar no
                Swal.fire('Cancelado.', 'Cancelaste la transacción :(', 'error').then(() => {
                    //window.location.href = 'categories.jsp';
                });
            }
        });
    }
    



</script>
    </head>
    <body>
        <div class="mdl-tabs__panel is-active" id="tabNewProduct">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Actualizar producto
							</div>
							<div class="full-width panel-content">
								<form name="form" onsubmit="return false" action="AnadirDetalleCompra">
									<div class="mdl-grid">
										<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
											<h5 class="text-condensedLight">Añade la información para la compra de stock.</h5>
                                                                                        <%
                                                                                            c.conseguirInfoProducto(i_id);
                                                                                            while(c.rsAux3.next()){
                                                                                            %>
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="number"  id="IdProducto" name="txt_idproducto" value="<%= c.rsAux3.getInt("id_productos") %>" readonly>
												<label class="mdl-textfield__label" for="NombreProducto">Id</label>
												<span class="mdl-textfield__error">Id Inválido</span>
											</div>
                                                                                            <%
                                                                                                }
                                                                                                %>
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="number"  id="NombreProducto" name="txt_cantidad" ">
												<label class="mdl-textfield__label" for="NombreProducto">Cantidad</label>
												<span class="mdl-textfield__error">cantidad Inválida</span>
											</div>
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text"  id="DescripcionProducto" name="txt_precio" ">
												<label class="mdl-textfield__label" for="DescripcionProducto">Precio unitario</label>
												<span class="mdl-textfield__error">Precio Inválido</span>
											</div>
											
											
											
                                                                                                                                                        
											
                                                                                                <h5 class="text-condensedLight">Proveedor</h5>
											<div class="mdl-textfield mdl-js-textfield">
												<select class="mdl-textfield__input" name="txt_proveedor">
													<option value="" disabled="" selected="">Selecciona proveedor</option>
                                                                    <!-- Igual que la categoría y marca -->
                                                                    <%
                                                                        c.mostrarProveedores();
                                                                        while(c.rs.next()){
                                                                        %>
                                                                                                        <option value="<%=c.rs.getInt("Id_proveedores")%>"><%=c.rs.getString("nombre_empresa")%></option>
                                                                                                        <%
                                                                                                            }
                                                                                                            %>
												</select>
											</div>
                                                                    <!--Con esto, podemos utilizarlo para añadir una nueva página "promociones" que contienen todos los productos con descuentos. -->
                                                                    <!--Si no le queremos poner descuento, lo dejamos a 0.-->
                                                                    <br>
                                                                    
										</div>
									
									</div>
									<p class="text-center">
										<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-modifyEmpleado" onclick="verificar()">
											<i class="zmdi zmdi-shopping-cart"></i>
										</button>
                                                                            
                                                                           
										<div class="mdl-tooltip" for="btn-modifyEmpleado">Comprar</div>
                                                                                 
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
    </body>
</html>
