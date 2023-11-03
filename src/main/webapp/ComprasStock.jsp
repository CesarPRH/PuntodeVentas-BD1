<%-- 
    Document   : ComprasStock
    Created on : 3/11/2023, 01:18:29
    Author     : Cesar S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Estructura.ConexionBD" %>
<!-- 
* Copyright 2016 Carlos Eduardo Alfaro Orellana
-->
<!-- Tablas Enlazadas: 
    Productos
-->
<!DOCTYPE html>
<html lang="es">
    <%
        ConexionBD c = new ConexionBD();
        c.ConseguirInformacionGeneralCompras();
        %>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Inventory</title>
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
            function AñadirStock(){
Swal.fire({
 title: 'Ingrese los detalles',
 html:
 '<input id="stock-comprado" class="swal2-input" placeholder="Stock comprado">' +
 '<input id="precio-unitario" class="swal2-input" placeholder="Precio unitario">' +
 '<input id="proveedor" class="swal2-input" placeholder="Proveedor">',
 focusConfirm: false,
 showCancelButton: true,
 confirmButtonText: 'Guardar',
 preConfirm: () => {
 return {
  stockComprado: document.getElementById('stock-comprado').value,
  precioUnitario: document.getElementById('precio-unitario').value,
  proveedor: document.getElementById('proveedor').value
 }
 }
}).then((result) => {
 if (result.isConfirmed) {
  const formData = new URLSearchParams();
  formData.append('stockComprado', result.value.stockComprado);
  formData.append('precioUnitario', result.value.precioUnitario);
  formData.append('proveedor', result.value.proveedor);

  fetch('AnadirDetalleCompra', {
   method: 'POST',
   headers: {
     'Content-Type': 'application/x-www-form-urlencoded'
   },
   body: formData.toString()
  }).then((response) => {
   if (response.ok) {
      <%
                        session.setAttribute("stockComprado", request.getParameter("stockComprado"));
                        session.setAttribute("precioUnitario", request.getParameter("precioUnitario"));
                        session.setAttribute("proveedor", request.getParameter("proveedor"));
                        %>
    Swal.fire('Success!', '', 'success').then((result) => {
     if (result.isConfirmed) {
      window.location.href = 'AnadirDetalleCompra';
     }
    });
   } else {
    Swal.fire('Error!', '', 'error');
   }
  });
 }
});
            }
        </script>
        
        
        <script>
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
	
	
	<section class="mdl-tabs__panel">
		<section class="full-width header-well">
			<div class="full-width header-well-icon">
				<i class="zmdi zmdi-store"></i>
			</div>
			<div class="full-width header-well-text">
				<p class="text-condensedLight">
                                    Historial de todas las compras hechas por el punto de ventas.
                                </p>
			</div>
		</section>
		<div class="full-width"></div>
		<div class="mdl-grid">
			<div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
					<thead>
						<tr>
							<th class="mdl-data-table__cell--non-numeric">Producto</th>
                                                        <th>Descripción</th>
							<th>Proveedor</th>
							<th>Stock Comprado</th>
                                                        <th>Precio unitario</th>
							<th>Monto total</th>
							
						</tr>
					</thead>
					<tbody>
                                            <%
                                                while(c.rs.next()){
                                                %>
						<tr>
							<td class="mdl-data-table__cell--non-numeric"><%= c.rs.getString("nombre_producto")%></td>
                                                        <td><%= c.rs.getString("descripcion_producto") %></td>
                                                        <td><%= c.rs.getString("nombre_proveedor") %></td>
                                                        <td><%= c.rs.getInt("stock_producto") %></td>
                                                        <td><%= c.rs.getFloat("precio_compra") %></td>
                                                        <td><%= c.rs.getFloat("monto_total_compra") %></td>
							
						</tr>
                                                <%
                                                    }
                                                    %>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>
