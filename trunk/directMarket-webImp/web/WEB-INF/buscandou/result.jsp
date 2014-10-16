<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Resultados de Busqueda :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>
        <form action="search" method="get">
            <%-- TRAIGO el nombre --%>
            <% String nombre = (String) request.getSession().getAttribute("searchResult"); %>




            <% Fabrica fabrica = Fabrica.getInstance();  %>
            <% IcontroladorProducto ICPR = fabrica.getControladorProducto();
                List<Producto> ListaProducto;
                ListaProducto = ICPR.findProductoEntities();
            %>




            <h1>Resultado(s) de Busqueda!</h1>
            <div id="producto" class ="main">

                <br>
                <h2>Lista de Productos</h2>    

                <% for (int i = 0; i < ListaProducto.size(); i++) {
                        String nProducto = ListaProducto.get(i).getNombre();
                        if (ICPR.findProducto2(nombre).equals(nProducto)) {

                %>
                <%= nProducto%>  
                <%
                        }
                    }
                %>



            </div>


            <jsp:include page="/WEB-INF/template/footer.jsp"/>
        </form>
    </body>
</html>
