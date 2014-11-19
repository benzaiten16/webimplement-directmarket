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
<%@page import="webService.WsIcliente"%>
<%@page import="webService.WsIclienteService"%>
<%@page import="webService.WsIproveedor"%>
<%@page import="webService.WsIproveedorService"%>
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
            WsIclienteService clienteServices = new WsIclienteService();
            WsIcliente ICC = clienteServices.getWsIclientePort();
       
            WsIproveedorService ProveedorServices = new WsIproveedorService();
            WsIproveedor ICP = ProveedorServices.getWsIproveedorPort();
            
        %>
   
        <div id="categoria" class ="main">
            <%-- bla bla bla --%>
        </div>

        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>