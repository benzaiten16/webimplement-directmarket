<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Categoria"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.IcontroladorCategoria"%>
<%@page import="Logica_Clases.IcontroladorProveedor"%>
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
        <% IcontroladorCategoria ICC = fabrica.getControladorCategoria();%>
        <% IcontroladorProducto ICP = fabrica.getControladorProducto();
        List<Categoria> ListaCategoria;
        ListaCategoria = ICC.findCategoriaEntities();%>
        
        <div id="producto" class ="main">
        <h2>Listar productos (productos)</h2>    
         <select  id="cat"  onchange="evento(this);">
                                <option>Seleccione categoria</option>
                                <%
                                for(int i = 0; i < ListaCategoria.size(); i++) {
                                Boolean tiene = ListaCategoria.get(i).getTieneProductos();
                                //Si tiene productos me interesa mostrarlo
                                if (tiene){
                                String ncategoria = ListaCategoria.get(i).getNombre();
                                %>
                                <option><%= ncategoria %>  </option>
                                <%
                                }
                                }
                                %>
        
                                
         </select>
        </div>

        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>