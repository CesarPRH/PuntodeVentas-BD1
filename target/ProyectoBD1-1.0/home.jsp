<%-- 
    Document   : home
    Created on : 9/10/2023, 20:49:23
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
	<title>Home</title>
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
        <!-- Podemos utilizar esto para notificar algún cambio, como cuando se añade un nuevo producto. -->
	<section class="full-width container-notifications">
		<div class="full-width container-notifications-bg btn-Notification"></div>
	    <section class="NotificationArea">
	        <div class="full-width text-center NotificationArea-title tittles">Notificaciones <i class="zmdi zmdi-close btn-Notification"></i></div>
	        <a href="#" class="Notification" id="notifation-unread-1">
	            <div class="Notification-icon"><i class="zmdi zmdi-accounts-alt bg-info"></i></div>
	            <div class="Notification-text">
	                <p>
	                    <i class="zmdi zmdi-circle"></i>
	                    <strong>Registrar nuevo usuario</strong> 
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
	<!-- Barra de navegación lateral -->
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
		<section class="full-width text-center" style="padding: 40px 0;">
			<h3 class="text-center tittles">OPCIONES</h3>
                        <h2 style="text-decoration: underline">USUARIOS</h2>
			<!-- Tiles -->
                        <!-- TODO: -Añadirle cada ficha su correspondiente enlace 
                                     -Configurar el contador para cada ficha con sus items correspondientes
                                            -Si no hay tiempo, solo borrar el número.-->
                        <a href="admin.jsp">
			<article class="full-width tile">
				<div class="tile-text">
					<span class="text-condensedLight">
						Administradores
					</span>
				</div>
				<i class="zmdi zmdi-account tile-icon"></i>
			</article>
                            </a>
                        <a href="client.jsp">
			<article class="full-width tile">
				<div class="tile-text">
					<span class="text-condensedLight">
						Clientes
					</span>
				</div>
				<i class="zmdi zmdi-accounts tile-icon"></i>
			</article>
                            </a>
                        <a href="empleados.jsp">
                        <article class="full-width tile">
                            <div class="tile-text">
                                <span class="text-condensedLight">
                                    Empleados
                                </span>
                            </div>
                            <i class="zmdi zmdi-account-box-mail tile-icon"></i>
                        </article></a>
                            <h2>ADMINISTRACIÓN</h2>
                            <a href="providers.jsp">
			<article class="full-width tile">
				<div class="tile-text">
					<span class="text-condensedLight">
						Proveedores
					</span>
				</div>
				<i class="zmdi zmdi-truck tile-icon"></i>
			</article>
                        </a>
                        <a href="categories.jsp">
			<article class="full-width tile">
				<div class="tile-text">
					<span class="text-condensedLight">
						Categorias
					</span>
				</div>
				<i class="zmdi zmdi-label tile-icon"></i>
			</article>
                        </a>
                        </a>
                            <a href="marcas.jsp">
                        <article class="full-width tile">
                            <div class="tile-text">
                                <span class="text-condensedLight">
                                   Marcas
                                </span>
                            </div>
                            <i class="zmdi zmdi-tag tile-icon"></i>
                        </article>
                            </a>
                        <a href="envio.jsp">
                            <article class="full-width tile">
                                <div class="tile-text">
                                    <span class="text-condensedLight">
                                       Métodos de Envío
                                    </span>
                                </div>
                                <i class="zmdi zmdi-truck tile-icon"></i>
                            </article>
                        </a>
                        <h2>Productos y Ventas</h2>
                        <a href="products.jsp">
			<article class="full-width tile">
				<div class="tile-text">
					<span class="text-condensedLight">
						Productos
					</span>
				</div>
				<i class="zmdi zmdi-washing-machine tile-icon"></i>
			</article>
                            </a>
                        <a href="inventory.jsp">
                            <article class="full-width tile">
                                <div class="tile-text">
                                    <span class="text-condensedLight">
                                        Inventario
                                    </span>
                                </div>
                                <i class="zmdi zmdi-store tile-icon"></i>
                            </article>
                        </a>
                            <a href="sales.jsp">
			<article class="full-width tile">
				<div class="tile-text">
					<span class="text-condensedLight">
						<br>
						<small>ventas</small>
					</span>
				</div>
				<i class="zmdi zmdi-shopping-cart tile-icon"></i>
			</article>
                            </a>
                            <a href="ordenes.jsp">
                        <article class="full-width tile">
                            <div class="tile-text">
                                <span class="text-condensedLight">
                                    Órdenes
                            </div>
                            <i class="zmdi zmdi-shopping-cart-plus tile-icon"></i>
                        </article>
                            </a>
                        <a href="ComprasStock.jsp">
                            <article class="full-width tile">
                                <div class="tile-text">
                                    <span class="text-condensedLight">
                                       Historial de Compras
                                    </span>
                                </div>
                                <i class="zmdi zmdi-parking tile-icon"></i>
                            </article>
                        </a>
                        <!-- comment 
                            <a>
                                <article class="full-width tile">
                            <div class="tile-text">
                                <span class="text-condensedLight">
                                    Hola<br>
                                    <small>Ventas (En la tienda)</small>
                            </div>
                            <i class="zmdi zmdi-shopping-cart-plus tile-icon"></i>
                        </article>
                            </a>
                            -->
                            <!--<a href="prueba.jsp">Hola mundo</a>-->
		</section>
            
            
            <!-- comment 
		<section class="full-width" style="margin: 30px 0;">
			<h3 class="text-center tittles">RESPONSIVE TIMELINE</h3>
			--><!-- TimeLine --><!--
			<div id="timeline-c" class="timeline-c">
				<div class="timeline-c-box">
	                <div class="timeline-c-box-icon bg-info">
	                    <i class="zmdi zmdi-twitter"></i>
	                </div>
	                <div class="timeline-c-box-content">
	                    <h4 class="text-center text-condensedLight">Tittle timeline</h4>
	                    <p class="text-center">
	                    	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta nobis rerum iure nostrum dolor. Quo totam possimus, ex, sapiente rerum vel maxime fugiat, ipsam blanditiis veniam, suscipit labore excepturi veritatis.
	                    </p>
	                    <span class="timeline-date"><i class="zmdi zmdi-calendar-note zmdi-hc-fw"></i>05-04-2016</span>
	                </div>
	            </div>
				<div class="timeline-c-box">
	                <div class="timeline-c-box-icon bg-success">
	                    <i class="zmdi zmdi-whatsapp"></i>
	                </div>
	                <div class="timeline-c-box-content">
	                    <h4 class="text-center text-condensedLight">Tittle timeline</h4>
	                    <p class="text-center">
	                    	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta nobis rerum iure nostrum dolor. Quo totam possimus, ex, sapiente rerum vel maxime fugiat, ipsam blanditiis veniam, suscipit labore excepturi veritatis.
	                    </p>
	                    <span class="timeline-date"><i class="zmdi zmdi-calendar-note zmdi-hc-fw"></i>06-04-2016</span>
	                </div>
	            </div>
	            <div class="timeline-c-box">
	                <div class="timeline-c-box-icon bg-primary">
	                    <i class="zmdi zmdi-facebook"></i>
	                </div>
	                <div class="timeline-c-box-content">
	                    <h4 class="text-center text-condensedLight">Tittle timeline</h4>
	                    <p class="text-center">
	                    	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta nobis rerum iure nostrum dolor. Quo totam possimus, ex, sapiente rerum vel maxime fugiat, ipsam blanditiis veniam, suscipit labore excepturi veritatis.
	                    </p>
	                    <span class="timeline-date"><i class="zmdi zmdi-calendar-note zmdi-hc-fw"></i>07-04-2016</span>
	                </div>
	            </div>
	            <div class="timeline-c-box">
	                <div class="timeline-c-box-icon bg-danger">
	                    <i class="zmdi zmdi-youtube"></i>
	                </div>
	                <div class="timeline-c-box-content">
	                    <h4 class="text-center text-condensedLight">Tittle timeline</h4>
	                    <p class="text-center">
	                    	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta nobis rerum iure nostrum dolor. Quo totam possimus, ex, sapiente rerum vel maxime fugiat, ipsam blanditiis veniam, suscipit labore excepturi veritatis.
	                    </p>
	                    <span class="timeline-date"><i class="zmdi zmdi-calendar-note zmdi-hc-fw"></i>08-04-2016</span>
	                </div>
	            </div>
			</div>
		</section>
            -->
            
	</section>
</body>
</html>