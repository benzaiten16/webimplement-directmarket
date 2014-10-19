<%-- 
   H E A D E R
--%>

<%@page import="Servlets.EstadoSesion"%>
<%@page import="Logica_Clases.IcontroladorProveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="Servlets.Login"%>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>


<!-- referencia al CSS maestro -->
<link rel="stylesheet" type="text/css" href="media/styles/main.css">

<!-- para el icono de la página -->
<link href="../WEB-INF/media/images/faviconn.ico" rel="icon" type="image/x-icon" />
<link href="../WEB-INF/media/images/faviconn.ico" rel="shortcut icon" />



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
            <jsp:include page="/WEB-INF/buscandou/buscador.jsp"/>
        </div>

        <%-- IDENTIFICACIÓN de Usuario --%>

        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>
        <% IcontroladorProveedor ICP = fabrica.getControladorProveedor(); %>

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
            
             <% if (ICC.findCliente(request.getAttribute("usuario").toString()) != null) {%>

                <%-- ___________________________SI ES UN CLIENTE_______________________________ --%>
                
                 Bienvenido <a href="<%= request.getContextPath()%>/perfil"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getNombre()%></a> 
                 |   <a href="<%= request.getContextPath()%>/verCcarrito"> <img id="trolley" src="../../media/images/trolley.png"  alt="Carrito de Compras"/></a>   |
            <a href="<%= request.getContextPath()%>/Logout">Cerrar Cesión</a> 
            <br>
            (<%= ICC.findCliente(request.getAttribute("usuario").toString()).getMail()%>)
                
             <% } else { %>
              <%-- ___________________________SI ES UN PROVEEDOR_______________________________ --%>
             

            Bienvenido <a href="<%= request.getContextPath()%>/perfil"><%= ICP.findProveedor(request.getAttribute("usuario").toString()).getNombre()%></a> 
            |   <a href="<%= request.getContextPath()%>/producto"> <img id="trolley" src="../../media/images/box_icon.png"  alt="Venta Producto"/></a>   |
            <a href="<%= request.getContextPath()%>/Logout">Cerrar Cesión</a> 
            <br>
            (<%= ICP.findProveedor(request.getAttribute("usuario").toString()).getMail()%>)
            
            <%}%> <%-- Si es un Cliente vs Proveedor --%>
            
        </div>

        <%-- _______________si NO se INICIO________________ --%>
        <% } else {%> 
        <div class = "usuario">
            Bienvenido INVITADO <br>
            <a href="<%= request.getContextPath()%>/registrar"> Registrarse</a> |
            
            <a href="<%= request.getContextPath()%>/home"> Go Home</a>
             
        </div>
        <% }%>      

        <%-- fin --%>

    </div>

</div>

<%--  FIN del cabezal     --%>

<div id="body-container">
