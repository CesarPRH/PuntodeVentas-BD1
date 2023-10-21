<!--
    Document   : categories
    Created on : 10/10/2023, 14:23:38
    Author     : Cesar S
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Estructura.ConexionBD" %>

<!-- 
* Copyright 2016 Carlos Eduardo Alfaro Orellana
-->
<!-- TABLAS ENLAZADAS
    Categorias
-->
<!DOCTYPE html>
<html lang="es">
    <%
        String id = (String) pageContext.getAttribute("id", PageContext.SESSION_SCOPE);
        System.out.println(id);
        
        ConexionBD c = new ConexionBD();
        //int num = c.contarFilas("categorias");
        c.ConseguirInfoEmpleados(id);
        c.ConseguirInfoUsuario(id);
        c.rs.next();
        c.rsAux.next();
        
      // System.out.println(c.rs.getInt("id_categorias"));
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
                  document.form.action = 'ActualizarEmpleadoUsuario';
                    document.form.submit();
                });
            } else if (result.isDismissed) {
                //Esta parte se ejecuta al presionar no
                Swal.fire('Cancelado.', 'Cancelaste la transacción :(', 'error').then(() => {
                    window.location.href = 'categories.jsp';
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
                    document.form.action = 'DesactivarEmpleadoUsuario';
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
<div class="mdl-tabs__panel is-active" id="tabNewAdmin">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-primary text-center tittles">
								Editar Empleado & Usuario
							</div>
							<div class="full-width panel-content">
								<form name="form" onsubmit="return false" action="AnadirEmpleadoUsuario">
									<div class="mdl-grid">
										<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
                    <!-- Datos personales del empleado -->
                                                                                        <h5 class="text-condensedLight">Datos Personales</h5>
                                                                                        <!-- Nombre-->
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="text" pattern="-?[A-Za-záéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NombreEmpleado" name="txt_idEmpleado" value="<%=c.rs.getInt("id_empleados") %>" readonly>
												<label class="mdl-textfield__label" for="NombreEmpleado">Nombre (No puedes modificar Esto)</label>
												<span class="mdl-textfield__error">Nombre Inválido</span>
											</div>
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="text" pattern="-?[A-Za-záéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NombreEmpleado" name="txt_nombreEmpleado" value="<%=c.rs.getString("nombre") %>">
												<label class="mdl-textfield__label" for="NombreEmpleado">Nombre</label>
												<span class="mdl-textfield__error">Nombre Inválido</span>
											</div>
                                                                                        <!-- Apellido -->
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="text" pattern="-?[A-Za-záéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="ApellidoEmpleado" name="txt_apellidoEmpleado" value="<%= c.rs.getString("apellido") %>">
												<label class="mdl-textfield__label" for="ApellidoEmpleado">Apellido</label>
												<span class="mdl-textfield__error">Nombre Inválido</span>
											</div>
                                                                                        <!-- DPI -->
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="number" pattern="-?[0-9]*(\.[0-9]+)?" id="DPIEmpleado" name="txt_DPIEmpleado" value="<%=c.rs.getString("dpi") %>" readonly>
												<label class="mdl-textfield__label" for="DPIEmpleado">DPI (No puedes modificar esto)</label>
												<span class="mdl-textfield__error">DPI Inválio</span>
											</div>
                                                                                        <!-- Numero Telefonico-->    
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="tel" pattern="-?[0-9+()- ]*(\.[0-9]+)?" id="NumTelEmpleado" name="txt_telefonoEmpleado" value="<%=c.rs.getString("telefono")  %>">
												<label class="mdl-textfield__label" for="NumTelEmpleado">Número Telefónico</label>
												<span class="mdl-textfield__error">Número Telefónico Inválido</span>
											</div>
                                                                                        <!-- Direccion -->
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
												<input class="mdl-textfield__input" type="text" id="DireccionEmpleado" name="txt_direccionEmpleado" value="<%=c.rs.getString("direccion") %>">
												<label class="mdl-textfield__label" for="DireccionEmpleado">Dirección</label>
												<span class="mdl-textfield__error">Dirección Inválido</span>
											</div>
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" >
                                                                                            <input class="mdl-textfield__input" type="text" id="PuestoEmpleado" name="txt_puestoEmpleado" value="<%=c.rs.getString("puesto")  %>">
												<label class="mdl-textfield__label" for="PuestoEmpleado">Puesto</label>
												<span class="mdl-textfield__error">Puesto Inválido</span>
											</div>
                                                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" >
												<input class="mdl-textfield__input" type="date" id="FechaContratacion" name="txt_fechaContratacion" value="<%= c.rs.getDate("fecha_contratacion") %>" readonly>
												<label class="mdl-textfield__label" for="FechaContratacion">Fecha de Contratacion (No puedes modificar Esto)</label>
												<span class="mdl-textfield__error">Fecha Inválida</span>
											</div>
										</div>
                    <!-- Información de la cuenta del empleado -->
										<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--6-col-desktop">
											<h5 class="text-condensedLight">Detalles de usuario</h5>
                                                                                        <!-- Esta info se utilizara en la tabla de usuarios -->
                                                                                        <!-- Usuario -->
                                                                                        
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ]*(\.[0-9]+)?" id="UserNameEmpleado" name="txt_usuario" value="<%=c.rsAux.getString("usuario")%>">
												<label class="mdl-textfield__label" for="UserNameEmpleado">Nombre de Usuario</label>
												<span class="mdl-textfield__error">Nombre de Usuario Inválido</span>
											</div>
                                                                                        <!-- Contraseña -->
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="password" id="ContrasenaAdmin" name="txt_contraseña" value="<%=c.rsAux.getString("contraseña")%>">
												<label class="mdl-textfield__label" for="ContrasenaAdmin">Contraseña</label>
												<span class="mdl-textfield__error">Contraseña Inválida</span>
											</div>
                                                                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                                                            <input class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ]*(\.[0-9]+)?" id="UserNameEmpleado" name="txt_tipoUsuario" value="<%=c.rsAux.getString("tipo_usuario")%>">
												<label class="mdl-textfield__label" for="UserNameEmpleado">Tipo de usuario</label>
												<span class="mdl-textfield__error">Tipo de Usuario Inválido</span>
											</div>
                                                                                                
											
										</div>
									</div>
									<p class="text-center">
										<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-modifyEmpleado" onclick="verificar()">
											<i class="zmdi zmdi-plus"></i>
										</button>
                                                                            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-danger" id="btn-deleteEmpleado" onclick="verificarBorrar()" formaction="EliminarPrvoeedor">
                                                                                <i class="zmdi zmdi-delete"></i>
                                                                            </button>
										<div class="mdl-tooltip" for="btn-modifyEmpleado">Añadir Administrador</div>
                                                                                  <div class="mdl-tooltip" for="btn-deleteEmpleado">Desactivar Empleado</div>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>