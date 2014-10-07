<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>


<!doctype html>
<html>
   <head>
	   <jsp:include page="/WEB-INF/template/head.jsp"/>
	<title>Perfil :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>

		<% Fabrica fabrica = Fabrica.getInstance();  %>
		<% IcontroladorCliente ICC = fabrica.getControladorCliente();%>
		
	<div id="perfil" class ="main">
		<div id="perfil_izquierda">
			<img src="media/images/defecto.gif" alt="imagen"/>
		</div>

		<div id="perfil_derecha">
			<div class="contenedor">
				<h2>Información básica</h2>
				<label class="rotulo">Nombre:</label>
                                <label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getNombre() %></label>
				<br/>
				<label class="rotulo">Fecha de nacimiento:</label>
				<label class="valor">
                                    <%--<%= 
						new SimpleDateFormat("dd/MM/yyyy").format(ICC.findCliente(request.getAttribute("usuario").toString()).getFechNacim())
					--%>
				</label>
			</div>

			<div class="contenedor">
				<h2>Información de contacto</h2>
				<label class="rotulo">Correo electrónico:</label>
				<label class="valor">
					<a href="mailto:<%= ICC.findCliente(request.getAttribute("usuario").toString()).getMail() %>">
						<%= ICC.findCliente(request.getAttribute("usuario").toString()).getMail() %>
					</a>
				</label>
			</div>
		</div>
	</div>
    
		<jsp:include page="/WEB-INF/template/footer.jsp"/>
</body>
</html>