<!-- referencia al CSS maestro -->
<link rel="stylesheet" type="text/css" href="media/styles/main.css">

<!-- Para evitar ver caracteres raros -->
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-language" content="es" />

<!-- para el icono de la página -->
<link href="media/images/favicon.ico" rel="icon" type="image/x-icon" />
<link href="media/images/favicon.ico" rel="shortcut icon" />

<%--

<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>
<%@page import="java.util.StringTokenizer" %>

<% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCategoria ICC = fabrica.getControladorCategoria();%>
        <% IcontroladorProducto ICPR = fabrica.getControladorProducto();
            List<Producto> ListaProducto;
            ListaProducto = ICPR.findProductoEntities();%>

--%>

<form class="formulariodemo cf" method="GET" action="/buscador.jsp">
    <input type="text" placeholder="ingresar texto ..." required>
    <button type="submit">buscar</button>
</form>



