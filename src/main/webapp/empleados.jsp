<%-- 
    Document   : Empleados
    Created on : 12/10/2023, 22:08:23
    Author     : Cesar S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- 
* Copyright 2016 Carlos Eduardo Alfaro Orellana
-->
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Empleados</title>
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/sweetalert2.css">
	<link rel="stylesheet" href="css/material.min.css">
	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
	<link rel="stylesheet" href="css/main.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
	<script src="js/material.min.js" ></script>
	<script src="js/sweetalert2.min.js" ></script>
	<script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>
	<script src="js/main.js" ></script>
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
				<i class="zmdi zmdi-account"></i>
			</div>
			<div class="full-width header-well-text">
                           
				<p class="text-condensedLight">
                                    Añade un nuevo empleado en el sistema, o simplemenente consulta los administradores<br> (donde podrás modificar o eliminarlo).
				</p>
			</div>
		</section>
		<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
			<div class="mdl-tabs__tab-bar">
				<a href="#tabNewAdmin" class="mdl-tabs__tab is-active">AÑADIR</a>
				<a href="#tabListAdmin" class="mdl-tabs__tab">CONSULTAR</a>
			</div>
                    <!<!-- Pestaña para añadir nuevo administrador -->
			<div class="mdl-tabs__panel is-active" id="tabNewAdmin">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Nuevo empleado
							</div>
							<div class="full-width panel-content">
								<form>
									<div class="mdl-grid">
										<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
                    <!-- Datos personales del empleado -->
                                                                                        <h5 class="text-condensedLight">Datos Personales</h5>
                                                                                        <!-- Nombre-->
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text" pattern="-?[A-Za-záéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NombreEmpleado">
												<label class="mdl-textfield__label" for="NombreEmpleado">Nombre</label>
												<span class="mdl-textfield__error">Nombre Inválido</span>
											</div>
                                                                                        <!-- Apellido -->
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text" pattern="-?[A-Za-záéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="ApellidoEmpleado">
												<label class="mdl-textfield__label" for="ApellidoEmpleado">Apellido</label>
												<span class="mdl-textfield__error">Nombre Inválido</span>
											</div>
                                                                                        <!-- DPI -->
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="number" pattern="-?[0-9]*(\.[0-9]+)?" id="DPIEmpleado">
												<label class="mdl-textfield__label" for="DPIEmpleado">DPI</label>
												<span class="mdl-textfield__error">DPI Inválio</span>
											</div>
                                                                                        <!-- Numero Telefonico-->    
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="tel" pattern="-?[0-9+()- ]*(\.[0-9]+)?" id="NumTelEmpleado">
												<label class="mdl-textfield__label" for="NumTelEmpleado">Número Telefónico</label>
												<span class="mdl-textfield__error">Número Telefónico Inválido</span>
											</div>
                                                                                        <!-- Direccion -->
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text" id="DireccionEmpleado">
												<label class="mdl-textfield__label" for="DireccionEmpleado">Dirección</label>
												<span class="mdl-textfield__error">Dirección Inválido</span>
											</div>
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text" id="PuestoEmpleado">
												<label class="mdl-textfield__label" for="PuestoEmpleado">Puesto</label>
												<span class="mdl-textfield__error">Puesto Inválido</span>
											</div>
										</div>
                    <!-- Información de la cuenta del empleado -->
										<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
											<h5 class="text-condensedLight">Detalles para iniciar sesión</h5>
                                                                                        <!-- Esta info se utilizara en la tabla de usuarios -->
                                                                                        <!-- Usuario -->
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ]*(\.[0-9]+)?" id="UserNameEmpleado">
												<label class="mdl-textfield__label" for="UserNameEmpleado">Nombre de Usuario</label>
												<span class="mdl-textfield__error">Nombre de Usuario Inválido</span>
											</div>
                                                                                        <!-- Contraseña -->
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="password" id="ContrasenaAdmin">
												<label class="mdl-textfield__label" for="ContrasenaAdmin">Contraseña</label>
												<span class="mdl-textfield__error">Contraseña Inválida</span>
											</div>
											<h5 class="text-condensedLight">Elige tu Avatar</h5>
											<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-1">
												<input type="radio" id="option-1" class="mdl-radio__button" name="options" value="avatar-male.png">
												<img src="assets/img/avatar-male.png" alt="avatar" style="height: 45px; width:"45px;" ">
												<span class="mdl-radio__label">Avatar 1</span>
											</label>
											<br><br>
											<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-2">
												<input type="radio" id="option-2" class="mdl-radio__button" name="options" value="avatar-female.png">
												<img src="assets/img/avatar-female.png" alt="avatar" style="height: 45px; width:"45px;" ">
												<span class="mdl-radio__label">Avatar 2</span>
											</label>
											<br><br>
											<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-3">
												<input type="radio" id="option-3" class="mdl-radio__button" name="options" value="avatar-male2.png">
												<img src="assets/img/avatar-male2.png" alt="avatar" style="height: 45px; width:"45px;" ">
												<span class="mdl-radio__label">Avatar 3</span>
											</label>
											<br><br>
											<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-4">
												<input type="radio" id="option-4" class="mdl-radio__button" name="options" value="avatar-female2.png">
												<img src="assets/img/avatar-female2.png" alt="avatar" style="height: 45px; width:"45px;" ">
												<span class="mdl-radio__label">Avatar 4</span>
											</label>
										</div>
									</div>
									<p class="text-center">
										<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addAdmin">
											<i class="zmdi zmdi-plus"></i>
										</button>
										<div class="mdl-tooltip" for="btn-addAdmin">Añadir Administrador</div>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
                    <!-- Lista de empleados -->
			<div class="mdl-tabs__panel" id="tabListAdmin">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-success text-center tittles">
								Consultar Empleados
							</div>
							<div class="full-width panel-content">
								<form action="#">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
										<label class="mdl-button mdl-js-button mdl-button--icon" for="BuscarAdmin">
											<i class="zmdi zmdi-search"></i>
										</label>
										<div class="mdl-textfield__expandable-holder">
											<input class="mdl-textfield__input" type="text" id="BuscarAdmin">
											<label class="mdl-textfield__label"></label>
										</div>
									</div>
								</form>
								<div class="mdl-list">
                                                                    <!--OPCION: Crear nuevo HTML demostrando la información completa del administrador
                                                                                O, ampliar la lista con los detalles del los administradores-->
                                                                    
                                                                    <!-- TODO: Añadir un bucle para que repita cada div -->
									<div class="mdl-list__item mdl-list__item--two-line">
										<span class="mdl-list__item-primary-content">
											<i class="zmdi zmdi-account mdl-list__item-avatar"></i>
											<span>1. Nombre de Administrador</span>
											<span class="mdl-list__item-sub-title">DPI</span>
										</span>
										<a class="mdl-list__item-secondary-action" href="#!"><i class="zmdi zmdi-more"></i></a>
									</div>
									<li class="full-width divider-menu-h"></li>
                                                                        
									
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