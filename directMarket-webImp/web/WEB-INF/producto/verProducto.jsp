<%@page import="Logica_Clases.IcontroladorCategoria"%>
<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.IcontroladorProveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>
<%@page import="java.util.StringTokenizer" %>

<html>
<% Fabrica fabrica = Fabrica.getInstance();%>
<% IcontroladorProducto ICP = fabrica.getControladorProducto();%>

<%-- traigo el numRef... pero cargo todo lo demas con el titulo --%>
<% String pepito = request.getAttribute("numref").toString();%>
<% Integer numero= Integer.parseInt(pepito); %>
<% String titulo = ICP.findProducto(numero).getNombre();%>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Perfil :: DirectMarket</title>
    </head>
    
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>
    <div id="verProducto" class="main">
    <h2><%=titulo%></h2><br>
    <div id="perfil_izquierda">

        <div id="principal" class="contenedor">
            <label class="rotulo">Numero de Referencia: </label>
            <label class="valor"><%= ICP.findProducto(numero).getNumRef()%></label>
            <br>
            <label class="rotulo">Descripción: </label>
            <label class="valor"><%= ICP.findProducto(numero).getDescripcion()%></label>
            <br>
            <label class="rotulo">Especifiaciones: </label>
            <textarea class=textarea cols="60" rows="8" ><%= ICP.findProducto(numero).getEspecificacion()%></textarea>
            <br>
            <label class="rotulo">Precio: </label>
            <label class="valor"><%= ICP.findProducto(numero).getPrecio()%></label>
            <br>
            <label class="rotulo">Proveedor: </label>
            <label class="valor"><%= ICP.findProducto(numero).getproveedor().getNickname()%></label>
        </div>

    </div>      
    <br/><br/>

    <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>

</div>
        
        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>