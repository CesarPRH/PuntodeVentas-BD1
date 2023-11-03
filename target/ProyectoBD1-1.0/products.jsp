<%-- 
    Document   : products
    Created on : 10/10/2023, 17:11:37
    Author     : Cesar S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Estructura.ConexionBD"  %>
<!-- 
* Copyright 2016 Carlos Eduardo Alfaro Orellana
-->
<!-- TABLAS ENLAZADAS 
    Productos
    Promociones
-->
<!DOCTYPE html>
<html lang="es">
    
    <%
        //Esto fue un dolor de cabeza :(
        ConexionBD c = new ConexionBD();
        
        //Esta utilizara rsAux
       
        %>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Products</title>
	<link rel="stylesheet" href="css/normalize.css">
	<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/material.min.css">
	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
	<link rel="stylesheet" href="css/main.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>')</script>
	<script src="js/material.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
	<script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>
	<script src="js/main.js" ></script>
</head>
<body>
    <!-- Script para habilitar la sección de promoción -->
    <script>
$(document).ready(function(){
    $("#toggle").change(function(){
        if(this.checked){
            $(".mdl-textfield__input.disable").prop('disabled', false);
        } else {
            $(".mdl-textfield__input.disable").prop('disabled', true);
        }
    });
});
</script>
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
            if (result.isConfirmed) {
                Swal.fire('¡Perfecto!', 'El cliente fue añadido con éxito.', 'success').then(() => {
                  //  document.form.action = 'Estructura.AnadirCliente';
                    document.form.submit();
                });
            } else if (result.isDismissed) {
                Swal.fire('Cancelado.', 'Cancelaste la transacción :(', 'error').then(() => {
                   // window.location.href = 'client.jsp';
                });
            }
        });
    }
    
 //Funcion filtrar
 /*
  * Esta función es utilizado para filtrar y buscar usuarios por nombre. Tiene un pequeño bug que las líneas aparecen.
  * 
  */
    function filtrar() {
  var input, lista, div;
  input = document.getElementById("BuscarCliente");
  filter = input.value.toUpperCase();
  lista = document.getElementsByClassName("mdl-list__item mdl-list__item--two-line Lista");
  //linea = document.getElementsByClassName("full-width divider-menu-h");
  for (var i = 0; i < lista.length; i++) {
    var a = lista[i];
   // var b = linea[i];
    var text = a.textContent || a.innerText;

    if (text.toUpperCase().indexOf(filter) > -1) {
      a.style.display = "";
    //  b.style.display = "";
    } else {
      a.style.display = "none";
    //b.style.display = "none";
    }
  }
}

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
	<!-- Notifications area -->
	<section class="full-width container-notifications">
		<div class="full-width container-notifications-bg btn-Notification"></div>
	    <section class="NotificationArea">
	        <div class="full-width text-center NotificationArea-title tittles">Notifications <i class="zmdi zmdi-close btn-Notification"></i></div>
	        <a href="#" class="Notification" id="notifation-unread-1">
	            <div class="Notification-icon"><i class="zmdi zmdi-accounts-alt bg-info"></i></div>
	            <div class="Notification-text">
	                <p>
	                    <i class="zmdi zmdi-circle"></i>
	                    <strong>New User Registration</strong> 
	                    <br>
	                    <small>Just Now</small>
	                </p>
	            </div>
	        	<div class="mdl-tooltip mdl-tooltip--left" for="notifation-unread-1">Notification as UnRead</div> 
	        </a>
	        <a href="#" class="Notification" id="notifation-read-1">
	            <div class="Notification-icon"><i class="zmdi zmdi-cloud-download bg-primary"></i></div>
	            <div class="Notification-text">
	                <p>
	                    <i class="zmdi zmdi-circle-o"></i>
	                    <strong>New Updates</strong> 
	                    <br>
	                    <small>30 Mins Ago</small>
	                </p>
	            </div>
	            <div class="mdl-tooltip mdl-tooltip--left" for="notifation-read-1">Notification as Read</div>
	        </a>
	        <a href="#" class="Notification" id="notifation-unread-2">
	            <div class="Notification-icon"><i class="zmdi zmdi-upload bg-success"></i></div>
	            <div class="Notification-text">
	                <p>
	                    <i class="zmdi zmdi-circle"></i>
	                    <strong>Archive uploaded</strong> 
	                    <br>
	                    <small>31 Mins Ago</small>
	                </p>
	            </div>
	            <div class="mdl-tooltip mdl-tooltip--left" for="notifation-unread-2">Notification as UnRead</div>
	        </a> 
	        <a href="#" class="Notification" id="notifation-read-2">
	            <div class="Notification-icon"><i class="zmdi zmdi-mail-send bg-danger"></i></div>
	            <div class="Notification-text">
	                <p>
	                    <i class="zmdi zmdi-circle-o"></i>
	                    <strong>New Mail</strong> 
	                    <br>
	                    <small>37 Mins Ago</small>
	                </p>
	            </div>
	            <div class="mdl-tooltip mdl-tooltip--left" for="notifation-read-2">Notification as Read</div>
	        </a>
	        <a href="#" class="Notification" id="notifation-read-3">
	            <div class="Notification-icon"><i class="zmdi zmdi-folder bg-primary"></i></div>
	            <div class="Notification-text">
	                <p>
	                    <i class="zmdi zmdi-circle-o"></i>
	                    <strong>Folder delete</strong> 
	                    <br>
	                    <small>1 hours Ago</small>
	                </p>
	            </div>
	            <div class="mdl-tooltip mdl-tooltip--left" for="notifation-read-3">Notification as Read</div>
	        </a>  
	    </section>
	</section>
	<!-- navBar -->
	<div class="full-width navBar">
		<div class="full-width navBar-options">
			<i class="zmdi zmdi-more-vert btn-menu" id="btn-menu"></i>	
			<div class="mdl-tooltip" for="btn-menu">Menu</div>
			<nav class="navBar-options-list">
				<ul class="list-unstyle">
						<i class="zmdi zmdi-notifications"></i>
						<!-- <i class="zmdi zmdi-notifications-active btn-Notification" id="notifications"></i> -->
						<div class="mdl-tooltip" for="notifications">Notifications</div>
					</li>
					<li class="btn-exit" id="btn-exit">
						<i class="zmdi zmdi-power"></i>
						<div class="mdl-tooltip" for="btn-exit">LogOut</div>
					</li>
					<li class="text-condensedLight noLink" ><small>User Name</small></li>
					<li class="noLink">
						<figure>
							<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
						</figure>
					</li>
				</ul>
			</nav>
		</div>
	</div>				<li class="btn-Notification" id="notifications">
						<i class="zmdi zmdi-notifications"></i>
						<!-- <i class="zmdi zmdi-notifications-active btn-Notification" id="notifications"></i> -->
						<div class="mdl-tooltip" for="notifications">Notifications</div>
					</li>
					<li class="btn-exit" id="btn-exit">
						<i class="zmdi zmdi-power"></i>
						<div class="mdl-tooltip" for="btn-exit">LogOut</div>
					</li>
					<li class="text-condensedLight noLink" ><small>User Name</small></li>
					<li class="noLink">
						<!--<figure>
							<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
						</figure>-->
					</li>
				</ul>
			</nav>
		</div>
	</div>
        
        
	<!-- navLateral -->
	<section class="full-width navLateral">
		<div class="full-width navLateral-bg btn-menu"></div>
		<div class="full-width navLateral-body">
			<div class="full-width navLateral-body-logo text-center tittles">
				<i class="zmdi zmdi-close btn-menu"></i> Inventario
			</div>
			<figure class="full-width" style="height: 77px;">
				<div class="navLateral-body-cl">
					<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
				</div>
				<figcaption class="navLateral-body-cr hide-on-tablet">
					<span>
                                            <!-- TODO: Configurar nombre aquí -->
						Nombre completo<br>
						<small>Admin</small>
					</span>
				</figcaption>
			</figure>
			<div class="full-width tittles navLateral-body-tittle-menu">
				<i class="zmdi zmdi-desktop-mac"></i><span class="hide-on-tablet">&nbsp; PANEL PRINCIPAL</span>
			</div>
			<nav class="full-width">
				<ul class="full-width list-unstyle menu-principal">
					<li class="full-width">
						<a href="home.jsp" class="full-width">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-view-dashboard"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								INICIO
							</div>
						</a>
					</li>
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#!" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-case"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								ADMINISTRACION
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
                                                    <!-- comment 
                                                        <li class="full-width">
								<a href="company.html" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-balance"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										COMPANY
									</div>
								</a>
							</li>-->
							<li class="full-width">
								<a href="providers.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-truck"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										PROVEEDORES
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="envio.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-bus"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										METODOS DE ENVIO
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="categories.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-label"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										CATEGORIAS
									</div>
								</a>
							</li>
                                                        <li>
                                                            <a href="marcas.jsp" class="full-width">
                                                                <div class="navLateral-body-cl">
                                                                    <i class="zmdi zmdi-tag"></i>
                                                                    
                                                                </div>
                                                                <div class="navLateral-body-cr hide-on-tablet">
                                                                    MARCAS
                                                                </div>
                                                            </a>
                                                        </li>
						</ul>
					</li>
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#!" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-face"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								USUARIOS
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
								<a href="admin.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-account"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										ADMINISTRADORES
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="client.jsp" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-accounts"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										CLIENTES
									</div>
								</a>
							</li>
                                                        <li>
                                                            <a href="empleados.jsp" class="full-width">
                                                                <div class="navLateral-body-cl">
                                                                        <i class="zmdi zmdi-account-box-mail"></i>
                                                                </div>
                                                                <div class="navLateral-body-cr hide-on-tablet">
                                                                        EMPLEADOS
                                                                </div>
                                                            </a>
                                                        </li>
						</ul>
					</li>
                                        <li class="full-width divider-menu-h"></li>
                                        <li class="full-width">
						<a href="#!" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-mall"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								PRODUCTOS & VENTAS
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
						<a href="products.jsp" class="full-width">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-washing-machine"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								PRODUCTOS
							</div>
						</a>
					</li>
                                        <li class="full-width divider-menu-h"></li>
							<li class="full-width">
						<a href="inventory.jsp" class="full-width">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-store"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								INVENTARIO
							</div>
						</a>
					</li>
                                        <li class="full-width divider-menu-h"></li>
                                                        <li class="full-width">
						<a href="sales.jsp" class="full-width">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-shopping-cart"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								VENTAS
							</div>
						</a>
					</li>
                                        <li class="full-width divider-menu-h"></li>
                                        <li class="full-width">
                                            <a href="ordenes.jsp" class="full-width">
                                                <div class="navLateral-body-cl">
                                                    <i class="zmdi zmdi-shopping-cart-plus"></i>
                                                    
                                                </div>
                                                <div class="navLateral-body-cr hide-on-tablet">
                                                        ÓRDENES
                                                </div>
                                            </a>
                                        </li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</section>
	<!-- pageContent -->
	<section class="full-width pageContent">
		<section class="full-width header-well">
			<div class="full-width header-well-icon">
				<i class="zmdi zmdi-washing-machine"></i>
			</div>
			<div class="full-width header-well-text">
				<p class="text-condensedLight">
                                    Añade un nuevo producto. Para consultar los productos, visita el inventario.
                                </p>
			</div>
		</section>
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<div class="mdl-tabs__tab-bar">

			</div>
			<div class="mdl-tabs__panel is-active" id="tabNewProduct">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nuevo producto
							</div>
							<div class="full-width panel-content">
								<form name="form" onsubmit="return false" action="AnadirProducto">
									<div class="mdl-grid">
										<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
											<h5 class="text-condensedLight">Información Básica</h5>
											
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text"  id="NombreProducto" name="txt_nombreProducto">
												<label class="mdl-textfield__label" for="NombreProducto">Name</label>
												<span class="mdl-textfield__error">Nombre Inválido</span>
											</div>
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text"  id="DescripcionProducto" name="txt_descripcionProducto">
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
												<input class="mdl-textfield__input" type="text" pattern="-?[0-9.]*(\.[0-9]+)?" id="CostoProducto" name="txt_precio">
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
												<input class="mdl-textfield__input" type="number" pattern="-?[0-9]*(\.[0-9]+)?" id="StockProducto" name="txt_stock">
												<label class="mdl-textfield__label" for="StockProducto"> Stock disponible</label>
												<span class="mdl-textfield__error">Stock Inválido</span>
											</div>       
                                                                                           <!--     
                                                                                        <div><input type="checkbox" id="toggle" name="txt_promocion" value="si" >       Promoción   </div>
                                                                                        
                                                                                        
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label " >
												<input class="mdl-textfield__input disable" type="number" id="DescuentoProducto" disabled  name="txt_promocionDescuento">
												<label class="mdl-textfield__label" for="DescuentoProducto">% Descuento</label>
												<span class="mdl-textfield__error">Descuento Inválido</span>
											</div>	
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label " disabled="true">
												<input class="mdl-textfield__input disable" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NombreDescuento" disabled name="txt_promocionNombre">
												<label class="mdl-textfield__label" for="NombreDescuento">Nombre de la promoción</label>
												<span class="mdl-textfield__error">Nombre Inválido</span>
											</div>	
                         
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label " disabled="true">
												<input class="mdl-textfield__input disable" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="DescripcionProducto" disabled name="txt_promocionDescripcion">
												<label class="mdl-textfield__label" for="DescripcionProducto">Descripcion</label>
												<span class="mdl-textfield__error">Descripcion inválida</span>
											</div>	
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" disabled="true">
												<input class="mdl-textfield__input disable" type="date" pattern="-?[0-9]*(\.[0-9]+)?" id="FechaFinalDescuento" disabled name="txt_promocionFecha">
												<label class="mdl-textfield__label" for="FechaFinalDescuento">Fecha Final</label>
												<span class="mdl-textfield__error">Fecha inválida</span>
											</div>	
                                                                                        -->
                                                                                        
										</div>
									</div>
									<p class="text-center">
										<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addProduct" onclick="verificar()">
											<i class="zmdi zmdi-plus"></i>
										</button>
										<div class="mdl-tooltip" for="btn-addProduct">Añadir producto</div>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
                    
                   
                    
		</div>
	</section>

       

    
</body>

</html>
