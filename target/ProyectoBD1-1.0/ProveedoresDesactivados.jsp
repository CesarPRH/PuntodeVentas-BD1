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
    //c.conseguirInfoCliente(id);
    //c.rs.next();
    int num = c.contarFilasDesactivados("proveedores");
    c.mostrarProveedoresDesactivados();
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
           
        function verificar(element) {
            var id= element.getAttribute('data-id');
        Swal.fire({
            title: '¿Estás Seguro?',
            text: 'Estás a punto de recuperar un usuario desactivado.',
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: 'Sí',
            cancelButtonText: 'No'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire('¡Perfecto!', 'El cliente fue recuperado con éxito.', 'success').then(() => {
                   SetSession('RecuperarProveedores',id);
                });
            } else if (result.isDismissed) {
                Swal.fire('Cancelado.', 'Cancelaste la transacción :(', 'error').then(() => {
                   // window.location.href = 'client.jsp';
                });
            }
        });
    }
   function SetSession(link, id){
    
    console.log("SetSession called with link:", link, "and id:", id);
    
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function(){
        if (this.readyState == 4 && this.status == 200){
            window.location.href = link;
        }
    };
    xhttp.open("POST","SetSessionServlet", true);
    xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhttp.send("id="+id);
    
}
      </script>  
    </head>
    <body>
     <div class="mdl-tabs__panel" id="tabListClient">
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--2dp">
							<div class="full-width panel-tittle bg-success text-center tittles">
								Lista de proveedores desactivados
							</div>
							<div class="full-width panel-content">
                                                            <%
                                                            /*
                                                            ¿QUE SUCEDE AQUÍ?
                                                            Esta condicion revisa cuantas filas hay en una tabla. Si no hay filas (num == 0), no hay usuarios.
                                                            Si hay filas, entonces que muestre todos los usuarios.
                                                            
                                                            */
                                                            if (num == 0 ){
                                                            %>
                                                            <div class="mdl-list">
									<div class="mdl-list__item mdl-list__item--two-line">
                                                                            
										<span class="mdl-list__item-primary-content">
                                                                                    <span>No existe proveedores desactivados.</span>
									</div>
                
                                                            <%
                                                                }else{
                                                                %>
                                                            
                                                            <span class="mdl-typography--text-center">Existen <%=num  %> proveedores(s) desactivados.</span>
                                                            <button class="btn-subMenu" >
                                                                <i class="zmdi zmdi-eye" id="btn-mirarDesactivados"></i>
                                                            </button>
                                                            <div class="mdl-tooltip" for="btn-mirarDesactivados" >Mirar Desactivados</div>
								<form action="#">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
										<label class="mdl-button mdl-js-button mdl-button--icon" for="BuscarCliente">
											<i class="zmdi zmdi-search"></i>
										</label>
										<div class="mdl-textfield__expandable-holder">
                                                                                    <input class="mdl-textfield__input" type="text" id="BuscarCliente" onkeyup="filtrar()">
											<label class="mdl-textfield__label"></label>
										</div>
									</div>
                                                                    
								</form>
                                                            <form name="form" onsubmit="return false" action="RecuperarCliente">
                                                            <%
                                                                
                                                            while(c.rs.next()){
                                                            %>
								<div class="mdl-list listFiltro">
									<div class="mdl-list__item mdl-list__item--two-line Lista">
                                                                            
										<span class="mdl-list__item-primary-content">
											<i class="zmdi zmdi-account mdl-list__item-avatar"></i>
											<span><%=c.rs.getString("nombre_empresa")%></span>
                                                                                        <span class="mdl-list__item-sub-title">ID:<%=c.rs.getInt("id_proveedores")  %> || Nombre del contacto:<%=c.rs.getString("contacto_nombre") %></span>
										</span>
                                                                                        <a class="mdl-list__item-secondary-action"  onclick="verificar(this)" data-id="<%=c.rs.getInt("id_proveedores")%>" style="color:black"><i class="zmdi zmdi-archive"></i></a>
									</div>
									<li class="full-width divider-menu-h"></li>
                                   <%                                     
                                       }    }
				%>
								</div>
                                                                </form>
                                                                
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
    </body>
</html>
