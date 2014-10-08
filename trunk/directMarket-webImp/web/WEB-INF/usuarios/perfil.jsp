<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>
<%@page import="java.util.StringTokenizer" %>

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
		<div id="perfil_derecha">
			<img src="media/images/defecto.gif" alt="imagen"/>
		</div>

		<div id="perfil_izquierda">
                    <div class="contenedor">
                        <h2>Información Usuario</h2>
                        <label class="rotulo">Nick:</label>
                        <label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getNickname() %></label>
                        <br/>
                        <label class="rotulo">Correo electrónico:</label>
			<label class="valor">
                            <a href="mailto:<%= ICC.findCliente(request.getAttribute("usuario").toString()).getMail() %>">
						<%= ICC.findCliente(request.getAttribute("usuario").toString()).getMail() %>
                            </a>
                        <br/>
                        
                        <%-- Necesario para poder traer la clase y convertirla a string y cortarla --%>
                        <% String tipo = ICC.findCliente(request.getAttribute("usuario").toString()).getClass().toString(); %>
                        <% StringTokenizer tokens=new StringTokenizer(tipo, "."); %>
                        <% int nDatos=tokens.countTokens(); %>
                       
                        
                        <label class="rotulo">Tipo de Usuario:</label>
                        <label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getClass() %></label>
                        
                    </div>
                        <br/><br/>
			<div class="contenedor">
				 <% out.println(nDatos); %>
                                <h2>Información Personal</h2>
				<label class="rotulo">Nombre:</label>
                                <label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getNombre() %></label>
				<br/>
                                <label class="rotulo">Apellido:</label>
				<label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getApellido()%></label>
                                <br/>
				<label class="rotulo">Fecha de nacimiento:</label>
				<label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getFechNacim()%></label>
                                <br/>
			</div>
                        
                        <br/>
                        
                        <%--SI es Proveedor Muestra el Div con los campos exclusivos al mismo --%>
                        <%--<% if (ICC.findCliente(request.getAttribute("usuario").toString()).getClass().equals("Proveedor")) %> --%>
			<div class="contenedor">
                            <div class="proveedor">
                                ESTO SE OCULTA......
                                <br/>
                                <h2>Información Empresa</h2>
                                <label class="rotulo">Nombre Compañia:</label>
                                <br/>
				<label class="rotulo">Sitio Web:</label>
                                <br/>
                                <label class="rotulo">Producto(s):</label>
                                <br/>
                                EN PRODUCTOS se debe poder seleccionar el deseado y ver su información
                                
                            </div>
				
                                
                                
				
			</div>

			
		</div>
	</div>
    
		<jsp:include page="/WEB-INF/template/footer.jsp"/>
</body>
</html>