<%-- 
   H E A D E R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="Servlets.Login"%>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>


<!-- referencia al CSS maestro -->
<link rel="stylesheet" type="text/css" href="media/styles/main.css">

<!-- para el icono de la página -->
<link href="media/images/faviconn.ico" rel="icon" type="image/x-icon" />
<link href="media/images/faviconn.ico" rel="shortcut icon" />



<%--  Comienzo del cabezal     --%>
<div id="headerr">
    <div id="headerr-izquierda">

        <img id="logo" src="../../media/images/logo-plane.png"  alt="logo"/>

    </div>

    <div id="headerr-derecha">
        <img id="banner" src="../../media/images/banner-plane.png"  alt="banner"/>
    </div>

    <div id="headerr-barra">

        <%-- BUSCADOR --%>
        <div id="buscador">
            <jsp:include page="/WEB-INF/template/buscador.jsp"/>
        </div>

        <%-- IDENTIFICACIÓN de Usuario --%>

        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>

        <% String usr = "";%>

        <%
            try {
                ICC.findCliente(request.getAttribute("usuario").toString());
            } catch (Exception ex) {
                usr = "Invitado";
            }
        %>

        <% if (!usr.equals("Invitado")) {%> 

        <%-- SI se INICIO --%>
        <div class="usuario">
            Bienvenido <a href="<%= request.getContextPath()%>/perfil"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getNombre()%></a> 
            |   <a href="<%= request.getContextPath()%>/jugar"> <img id="trolley" src="../../media/images/trolley.png"  alt="Carrito de Compras"/></a>   |
            <a href="/">Cerrar Cesión</a> 
            <br>
            (<%= ICC.findCliente(request.getAttribute("usuario").toString()).getMail()%>)
        </div>

        <%-- si NO se INICIO --%>
        <% } else {%> 
        <div class = "usuario">
            Bienvenido INVITADO <br>
            <a href="<%= request.getContextPath()%>/registrar"> Registrar</a> |
            <a href="<%= request.getContextPath()%>/iniciar-sesion">Iniciar Sesión </a>

        </div>
        <% }%>      

        <%-- fin --%>

    </div>

</div>

<%--  FIN del cabezal     --%>

<div id="body-container">
