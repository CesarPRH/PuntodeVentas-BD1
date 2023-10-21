<%-- 
    Document   : categories
    Created on : 10/10/2023, 14:23:38
    Author     : Cesar S
--%>

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
        c.ConseguirInfoMarcas(id);
        c.rs.next();
      // System.out.println(c.rs.getInt("id_categorias"));
        %>
    
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Categories</title>
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
                  document.form.action = 'ActualizarMarca';
                    document.form.submit();
                });
            } else if (result.isDismissed) {
                //Esta parte se ejecuta al presionar no
                Swal.fire('Cancelado.', 'Cancelaste la transacción :(', 'error').then(() => {
                   // window.location.href = 'categories.jsp';
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
                    document.form.action = 'EliminarMarca';
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
	<div class="mdl-tabs__panel is-active" id="tabNewCategory">
        <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
                        <div class="full-width panel mdl-shadow--2dp">
                                <div class="full-width panel-tittle bg-primary text-center tittles">
                                        Nueva categoría
                                </div>
                                <div class="full-width panel-content">
                                        <form onsubmit="return false" name="form"  method="POST" >
                                            <!--Utilizando queries, podemos meter: id_categorias, estado -->
                                                <h5 class="text-condensedLight">Datos de la categoría</h5>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="number" name="txt_idmarca" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="idMarca" value="<%=c.rs.getString("id_marcas")%>" readonly>
                                                        <label class="mdl-textfield__label" for="idMarca">ID (No podrás modificar este campo)</label>
                                                        <span class="mdl-textfield__error">Id Inválido</span>
                                                </div>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="text" name="txt_nombremarca" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NombreMarca" value="<%=c.rs.getString("nombre")%> ">
                                                        <label class="mdl-textfield__label" for="NombreMarca">Nombre</label>
                                                        <span class="mdl-textfield__error">Nombre Inválido</span>
                                                </div>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <input class="mdl-textfield__input" type="text" name="txt_paisOrigenMarca" id="paisOrigenMarca"value="<%=c.rs.getString("pais_origen")  %>">
                                                        <label class="mdl-textfield__label" for="paisOrigenMarca">Descripcion</label>
                                                        <span class="mdl-textfield__error">Descripción inválida</span>
                                                </div>
                                                <p class="text-center">
                                                        <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addCategory" onclick="verificar()" formaction="ActualizarMarca">
                                                                <i class="zmdi zmdi-plus"></i>
                                                        </button>
                                                        <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-danger" id="btn-deleteCategoria" onclick="verificarBorrar()" formaction="EliminarMarca">
                                                            <i class="zmdi zmdi-delete"></i>
                                                        </button>
                                                        <div class="mdl-tooltip" for="btn-addCategory">Añadir categoría</div>
                                                        <div class="mdl-tooltip" for="btn-deleteCategoria">Desactivar Cliente</div>

                                                </p>
                                        </form>
                                </div>
                        </div>
                </div>
        </div>
</div>
</body>
</html>