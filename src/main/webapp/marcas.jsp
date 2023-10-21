<%-- 
    Document   : marcas
    Created on : 10/10/2023, 14:23:38
    Author     : Cesar S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Estructura.ConexionBD"  %>
<%@page import="Estructura.AnadirMarca" %>

<!-- 
* Copyright 2016 Carlos Eduardo Alfaro Orellana
-->
<!-- TABLAS ENLAZADAS 
    marcas
-->
<!DOCTYPE html>
<html lang="es">
    <%
        ConexionBD c = new ConexionBD();
        int num = c.contarFilas("marcas");
        c.mostrarMarcas();
        %>
    
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Marcas</title>
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
                  
                    document.form.submit();
                });
            } else if (result.isDismissed) {
                //Esta parte se ejecuta al presionar no
                Swal.fire('Cancelado.', 'Cancelaste la transacción :(', 'error').then(() => {
                  //  window.location.href = 'marca.jsp';
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
  input = document.getElementById("BuscarCategoria");
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
</head>
<body>
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
					<li class="btn-Notification" id="notifications">
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
                            <i class="zmdi zmdi-tag"></i>

			</div>
			<div class="full-width header-well-text">
				<p class="text-condensedLight">
                                   Las marcas de nuestro diferentes productos.
                                </p>
			</div>
		</section>
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<div class="mdl-tabs__tab-bar">
				<a href="#tabNewCategory" class="mdl-tabs__tab is-active">NUEVO</a>
				<a href="#tabListCategory" class="mdl-tabs__tab">CONSULTAR</a>
			</div>
			<div class="mdl-tabs__panel is-active" id="tabNewCategory">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nueva marca
							</div>
							<div class="full-width panel-content">
								<form name="form" onsubmit="return false" method="POST" action="AnadirMarca">
                                                                    <!--Utilizando queries, podemos meter: id_categorias, estado -->
									<h5 class="text-condensedLight">Datos de la categoría</h5>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NombreMarca" name="txt_nombremarca">
										<label class="mdl-textfield__label" for="NombreMarca" >Nombre</label>
										<span class="mdl-textfield__error">Nombre Inválido</span>
									</div>
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="text" pattern="-?[A-Za-záéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="PaisMarca" name="txt_paismarca">
										<label class="mdl-textfield__label" for="PaisMarca" >País Origen</label>
										<span class="mdl-textfield__error">País Inválido</span>
									</div>
									<p class="text-center">
										<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addCategory" onclick="verificar()">
											<i class="zmdi zmdi-plus"></i>
										</button>
										<div class="mdl-tooltip" for="btn-addCategory">Añadir marca</div>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mdl-tabs__panel" id="tabListCategory">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-success text-center tittles">
								Lista de marcas
							</div>
							<div class="full-width panel-content">
                                                            
                                                            <%
                                                                if (num == 0){
                                                                
                                                                %>
                                                            <div class="mdl-list">
									<div class="mdl-list__item mdl-list__item--two-line">
										<span class="mdl-list__item-primary-content">
                                                                                    <span>No existe categorias.</span>
									</div>
									<li class="full-width divider-menu-h"></li>
                                                                   
								</div>
                                                            <% 
                                                                } else{
                                                            
                                                            %>
                                                            
                                                <span class="mdl-typography--text-center" >Existen <%=num %> categoria(s).</span>
                                                <a style="text-decoration:none; color:black" href="MarcasDesactivadas.jsp">
                                                            <button class="btn-subMenu" formaction="clientDesactivados.jsp">
                                                                <i class="zmdi zmdi-eye" id="btn-mirarDesactivados"></i>
                                                            </button>
                                                            <div class="mdl-tooltip" for="btn-mirarDesactivados" >Mirar Desactivados</div>
								</a>
								<form action="#">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
										<label class="mdl-button mdl-js-button mdl-button--icon" for="BuscarMarca">
											<i class="zmdi zmdi-search"></i>
										</label>
										<div class="mdl-textfield__expandable-holder">
											<input class="mdl-textfield__input" type="text" id="BuscarMarca">
											<label class="mdl-textfield__label"></label>
										</div>
									</div>
								</form>
                                                                <%
                                                                    while(c.rs.next()){
                                                                    %>
								<div class="mdl-list">
									<div class="mdl-list__item mdl-list__item--two-line">
										<span class="mdl-list__item-primary-content">
											<i class="zmdi zmdi-label mdl-list__item-avatar"></i>
                                                                                        <span><%=c.rs.getString("nombre")   %></span>
                                                                                        <span class="mdl-list__item-sub-title"><%= c.rs.getString("pais_origen") %></span>
										</span>
										<a class="mdl-list__item-secondary-action" href="MarcaModificar.jsp" onclick="SetSession(this, '<%=c.rs.getString("id_marcas")%>')" style="color:black"><i class="zmdi zmdi-edit"></i></a>
									</div>
									<li class="full-width divider-menu-h"></li>
                                                                        
                                                                        <%
                                                                            }

                                                                                }
                                                                        %>
								</div>
							</div>
                                                                
                                                                
						</div>
						
					</div>
				</div>
			</div>
                                                                
		</div>
	</section>
</body>
</html>