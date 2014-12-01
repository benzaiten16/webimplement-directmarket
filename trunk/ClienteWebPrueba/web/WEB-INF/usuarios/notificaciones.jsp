<%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.StringTokenizer" %>


<%--NUEVOS IMPORTS--%>
<%@page import="Servlets.ICcliente"%>
<%--NUEVOS IMPORTS--%>


<!doctype html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Editar noticicaciones :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>
        
         <div class="contenedor">
              <h1>Editar notificaciones</h1>
              <br>
              <h2>Notificaciones de cambio de orden</h2>
              <h2>Notificaciones de nuevos productos</h2> 
         </div>
                
    </body>
</html>