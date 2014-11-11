<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.StringTokenizer" %>

<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>
<%--
<%@page import="Logica_Clases.IcontroladorProveedor"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>
--%>
<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>

<%--NUEVOS IMPORTS--%>
<%@page import="services.WsICliente"%>
<%@page import="services.WsIClienteService"%>
<%@page import="ServicesProveedor.WsIProveedor"%>
<%@page import="ServicesProveedor.WsIProveedorService"%>
<%--NUEVOS IMPORTS--%>


<!doctype html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Perfil :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>

        <%--
        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>
        <% IcontroladorProveedor ICP = fabrica.getControladorProveedor();%>
        --%>
        
        <%
            WsIClienteService clienteServices = new WsIClienteService();
            WsICliente ICC = clienteServices.getWsIClientePort();
       
            WsIProveedorService ProveedorServices = new WsIProveedorService();
            WsIProveedor ICP = ProveedorServices.getWsIProveedorPort();
            
        %>
   
        <div id="categoria" class ="main">
            <%-- bla bla bla --%>
        </div>

        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>