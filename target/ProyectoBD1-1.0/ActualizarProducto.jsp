<%-- 
    Document   : ActualizarProducto
    Created on : 24/10/2023, 10:20:47
    Author     : Cesar S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Estructura.ConexionBD"  %>
<!DOCTYPE html>
<html>
    <%
        String id = (String) pageContext.getAttribute("id", PageContext.SESSION_SCOPE);
        int i_id = Integer.parseInt(id);
        System.out.println(id);
        
        ConexionBD c = new ConexionBD();
        c.conseguirInfoProducto(i_id);
        c.rsAux3.next();
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
                  document.form.action = 'ActualizarProducto';
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
    
function verificarBorrar(){
        Swal.fire({
            title: '¿Estás Seguro?',
            text: 'Estás a punto de BORRAR a un cliente. ¿Estas seguro de tus acciones?',
            icon: 'warning',
            showCancelButton: true,
            background: '#A9A9A9',
            confirmButtonText: 'Sí',
            cancelButtonText: 'No'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire('¡Perfecto!', 'El cliente fue actualizado con éxito.', 'success').then(() => {
                    document.form.action = 'EliminarProducto';
                    document.form.submit();
                });
            } else if (result.isDismissed) {
                Swal.fire('Cancelado.', 'Cancelaste la transacción :(', 'error').then(() => {
                   // window.location.href = 'client.jsp';
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
								<form name="form" onsubmit="return false" action="AnadirProducto">
									<div class="mdl-grid">
										<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
											<h5 class="text-condensedLight">Información Básica</h5>
											
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="text"  id="IdProducto" name="txt_idProducto" value="<%=c.rsAux3.getString("id_productos") %>" readonly>
												<label class="mdl-textfield__label" for="NombreProducto">Id</label>
												<span class="mdl-textfield__error">Id Inválido</span>
											</div>
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="text"  id="NombreProducto" name="txt_nombreProducto" value="<%=c.rsAux3.getString("producto") %>">
												<label class="mdl-textfield__label" for="NombreProducto">Name</label>
												<span class="mdl-textfield__error">Nombre Inválido</span>
											</div>
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text"  id="DescripcionProducto" name="txt_descripcionProducto" value="<%=c.rsAux3.getString("descripcion") %>">
												<label class="mdl-textfield__label" for="DescripcionProducto">Descripción</label>
												<span class="mdl-textfield__error">Descripción Inválida</span>
											</div>
											<div class="mdl-textfield mdl-js-textfield">
												<select class="mdl-textfield__input" name="txt_categoria">
													<option value="" disabled="" selected="">Selecciona categoría</option>
                                                                    <!-- Aquí se va a utilizar un ciclo para mostrar todas las categorías -->
                                                                    <%
                                                                        //Esta utilizar rs
                                                                          c.mostrarCategorias();
                                                                        while(c.rs.next()){
                                                                        %>
                                                                        <option value="<%= c.rs.getInt("id_categorias") %>"><%= c.rs.getString("nombre") %></option>
                                                                                                        <%
                                                                                                            }
                                                                                                            %>
												</select>
											</div>
                                                                                        <div class="mdl-textfield mdl-js-textfield">
												<select class="mdl-textfield__input"name="txt_marca">
													<option value="" disabled="" selected="">Selecciona Marca</option>
                                                                    <!-- Aquí se va a utilizar un ciclo para mostrar todas las marcas -->
                                                                    <%
                                                                        //Esta utiliza rsAux
                                                                        c.mostrarMarcas();
                                                                        while(c.rsAux.next()){
                                                                        %>
                                                                        <option value="<%= c.rsAux.getInt("id_marcas")  %>"><%= c.rsAux.getString("nombre")  %></option>
                                                                                                        <%
                                                                                                            }
                                                                                                            %>
												</select>
											</div>
											
											
                                                                                                                                                        
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="text" pattern="-?[0-9.]*(\.[0-9]+)?" id="CostoProducto" name="txt_precio" value="<%=c.rsAux3.getFloat("precio") %>">
												<label class="mdl-textfield__label" for="PrecioProducto">Precio</label>
												<span class="mdl-textfield__error">Precio Inválido</span>
											</div>
                                                                    <!--Con esto, podemos utilizarlo para añadir una nueva página "promociones" que contienen todos los productos con descuentos. -->
                                                                    <!--Si no le queremos poner descuento, lo dejamos a 0.-->
                                                                    <br>
                                                                    
										</div>
										<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
											<h5 class="text-condensedLight">Proveedor</h5>
											<div class="mdl-textfield mdl-js-textfield">
												<select class="mdl-textfield__input" name="txt_proveedor">
													<option value="" disabled="" selected="">Selecciona proveedor</option>
                                                                    <!-- Igual que la categoría y marca -->
                                                                    <%
                                                                        c.mostrarProveedores();
                                                                        while(c.rsAux2.next()){
                                                                        %>
                                                                                                        <option value="<%=c.rsAux2.getInt("Id_proveedores")%>"><%=c.rsAux2.getString("nombre_empresa")%></option>
                                                                                                        <%
                                                                                                            }
                                                                                                            %>
												</select>
											</div>
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="number" pattern="-?[0-9]*(\.[0-9]+)?" id="StockProducto" name="txt_stock" value="<%=c.rsAux3.getInt("stock") %>">
												<label class="mdl-textfield__label" for="StockProducto"> Stock disponible</label>
												<span class="mdl-textfield__error">Stock Inválido</span>
											</div>         
                                                                                        
                                                                                        
                                                                                        
										</div>
									</div>
									<p class="text-center">
										<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-modifyEmpleado" onclick="verificar()">
											<i class="zmdi zmdi-plus"></i>
										</button>
                                                                            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-danger" id="btn-deleteEmpleado" onclick="verificarBorrar()" formaction="EliminarProducto">
                                                                                <i class="zmdi zmdi-delete"></i>
                                                                            </button>
										<div class="mdl-tooltip" for="btn-modifyEmpleado">Actualizar producto</div>
                                                                                  <div class="mdl-tooltip" for="btn-deleteEmpleado">Desactivar producto</div>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
    </body>
</html>
