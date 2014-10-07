<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="Servlets.Login"%>

    
    <%--  Comienzo del cabezal     --%>
    <div id="headerr">
            <div id="headerr-izquierda">
                <img id="logo" src="../../media/images/logo-plane.png" " alt="logo"/>

            </div>
            
            <div id="headerr-derecha">
                <img id="banner" src="../../media/images/banner-plane.png"  alt="banner"/>
            </div>
            
            <div id="headerr-barra">
            
                <%-- BUSCADOR --%>
                <div id="buscador">
                    <jsp:include page="/WEB-INF/template/buscador.jsp"/>
                </div>
               
               <div class="usuario">
                Bienvenido <a href="/perfil"> lalalla </a> 
                |   <a href="/jugar"> <img id="trolley" src="../../media/images/trolley.png"  alt="Carrito de Compras"/></a>   |
                 <a href="/">Cerrar Cesión</a> 
                <br>
		  (lalal@gmail.com)
                </div>
                
                <%--
                <%
		try {
                    Login.getUsuarioLogueado(request);
		} catch(Exception ex){
			usr = null;
		}
		
		if(usr != null) {
	%> 
         <div id="buscador">
                    <jsp:include page="/WEB-INF/template/buscador.jsp"/>
                </div>
	<div class="usuario">
                Bienvenido <a href="/perfil"><%= usr.getNombre() %></a> 
                |   <a href="/jugar"> <img id="trolley" src="../../media/images/trolley.png"  alt="Carrito de Compras"/></a>   |
                 <a href="/">Cerrar Cesión</a> 
                <br>
		<a href="/usuarios">...</a>     acá linkea con el listado de USUARIOS
		(<%= usr.getEmail() %>)
	</div>
	<% } %> --%>               
                
                
            </div>
                
            
        </div>
    
    <%--  FIN del cabezal     --%>

<div id="body-container">