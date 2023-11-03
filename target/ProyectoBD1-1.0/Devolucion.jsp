<%-- 
    Document   : Devolucion
    Created on : 3/11/2023, 00:49:59
    Author     : Cesar S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Estructura.ConexionBD"  %>
<!DOCTYPE html>
<html lang="es">
    <%
        String id = (String) pageContext.getAttribute("id", PageContext.SESSION_SCOPE);
        System.out.println(id);
        int i_id = Integer.parseInt(id);
        ConexionBD c = new ConexionBD();
        //int num = c.contarFilas("categorias");
        c.conseguirInfoOrdenConId(i_id);
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
            text: 'Estás a punto de cancelar tu órden mediante una devolución.',
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: 'Sí',
            cancelButtonText: 'No'
        }).then((result) => {
            //Esta parte se ejecuta al presionar si
            if (result.isConfirmed) {
                Swal.fire('¡Perfecto!', 'El órden ha sido devuelto.', 'success').then(() => {
                  document.form.action = 'ProcesarDevolucion';
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
                                                    <input class="mdl-textfield__input" type="number" name="txt_id" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="idMarca" value="<%=c.rs.getString("id_ordenes")%>" readonly>
                                                        <label class="mdl-textfield__label" for="idMarca">ID (No podrás modificar este campo)</label>
                                                        <span class="mdl-textfield__error">Id Inválido</span>
                                                </div>
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                    <span>¿Porque quieres devolver el producto? </span>
                                                    <input class="mdl-textfield__input" type="text" name="txt_motivo" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="NombreMarca">
                                                        
                                                        <span class="mdl-textfield__error">Nombre Inválido</span>
                                                </div>
                                                <p class="text-center">
                                                        <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-danger" id="btn-addCategory" onclick="verificar()" formaction="ActualizarMarca">
                                                                <i class="zmdi zmdi-plus"></i>
                                                        </button>
                                                        
                                                        <div class="mdl-tooltip" for="btn-addCategory">Procesar Devolucion</div>
                                                       
                                                        
                                                </p>
                                        </form>
                                </div>
                        </div>
                </div>
        </div>
</div>
</body>
</html>
