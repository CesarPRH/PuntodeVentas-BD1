<%-- 
    Document   : clientModificar
    Created on : 16/10/2023, 21:16:18
    Author     : Cesar S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Estructura.ConexionBD" %>
<!DOCTYPE html>
<html>
    <%
        
    String id = (String) pageContext.getAttribute("id", PageContext.SESSION_SCOPE);
    System.out.println(id);
    
    ConexionBD c = new ConexionBD();
    c.conseguirInfoCliente(id);
    c.rs.next();
        %>
    <head>
       <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Clients</title>
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
            text: 'Estás a punto de actualizar un usuario.',
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: 'Sí',
            cancelButtonText: 'No'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire('¡Perfecto!', 'El cliente fue actualizado con éxito.', 'success').then(() => {
                   document.form.action = 'ActualizarCliente';
                    document.form.submit();
                });
            } else if (result.isDismissed) {
                Swal.fire('Cancelado.', 'Cancelaste la transacción :(', 'error').then(() => {
                   // window.location.href = 'client.jsp';
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
                    document.form.action = 'EliminarCliente';
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
        <div class="mdl-tabs__panel is-active" id="tabNewClient">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-info text-center tittles">
								Modificar Cliente
							</div>
							<div class="full-width panel-content">
                                                            <form  name="form" onsubmit="return false"  method="POST")>
									<h5 class="text-condensedLight">Información Personal</h5>
                                                                        <!--
						
									Utilizando queries se puede meter: Id_cliente, fecha_registro, y estado
                                                                        -->
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" name="txt_id" type="number" pattern="-?[A-Za-záéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="idCliente" value="<%=c.rs.getString("id_clientes") %>" readonly>
										<label class="mdl-textfield__label" for="idCliente">ID (¡No podrás modificar Esto!)</label>
										<span class="mdl-textfield__error">Nombre Inválido</span>
									</div>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" name="txt_nombrecliente" type="text" pattern="-?[A-Za-záéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NombreCliente" value="<%=c.rs.getString("nombre") %>">
										<label class="mdl-textfield__label" for="NombreCliente">Nombre</label>
										<span class="mdl-textfield__error">Nombre Inválido</span>
									</div>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input class="mdl-textfield__input" name="txt_email" type="email" id="emailCliente" value="<%=c.rs.getString("email")  %>">
										<label class="mdl-textfield__label" for="emailCliente">E-mail</label>
										<span class="mdl-textfield__error">E-mail Inválido</span>
									</div>
                        
                                                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" name="txt_nit" type="text" id="NITCliente" value="<%=c.rs.getString("nit")  %>" readonly>
										<label class="mdl-textfield__label" for="NITCliente">NIT (¡Tampoco podrás modificar esto!)</label>
										<span class="mdl-textfield__error">NIt Inválido</span>
                                                                                </div>
                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                            <input class="mdl-textfield__input" name="txt_telefono" type="number" pattern="-?[0-9]*(\.[0-9]+)?" id="TelefonoCliente" value="<%=c.rs.getString("telefono")  %>">
										<label class="mdl-textfield__label" for="TelefonoCliente">Telefono</label>
										<span class="mdl-textfield__error">Telefono Inválido</span>
                                                                        </div>
                
									<p class="text-center">
										<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-editClient" onclick="verificar()" formaction="ActualizarCliente">
											<i class="zmdi zmdi-edit"></i>
										</button>
                                                                            
										
                                                                                <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-danger" id="btn-deleteClient" onclick="verificarBorrar()" formaction="EliminarCliente">
                                                                                    <i class="zmdi zmdi-delete"></i>
                                                                                </button>
                                                                                <div class="mdl-tooltip" for="btn-editClient" >Actualizar Cliente</div>
                                                                                <div class="mdl-tooltip" for="btn-deleteClient">Desactivar Cliente</div>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
    </body>
</html>
