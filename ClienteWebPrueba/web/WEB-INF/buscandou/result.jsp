<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>
<%--
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.Fabrica"%>
--%>
<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>


<%--NUEVOS IMPORTS--%>
<%@page import="webService.Producto"%>
<%@page import="Servlets.ICproducto"%>
<%--NUEVOS IMPORTS--%>


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
            <% Boolean encontro = false; %>


            <%--
            <% Fabrica fabrica = Fabrica.getInstance();  %>
            <% IcontroladorProducto ICPR = fabrica.getControladorProducto();
                List<Producto> ListaProducto;
                ListaProducto = ICPR.findProductoEntities();

            %>
            
            <%

            WsIproductoService ProductoServices = new WsIproductoService();
            WsIproducto ICPR = ProductoServices.getWsIproductoPort();    
             
            List<Producto> ListaProducto;
            ListaProducto = ICPR.findProductoEntities();

            %>
            --%>
            <%
            ICproducto ICPR = new ICproducto();
            
            List<Producto> ListaProducto;
            ListaProducto = ICPR.findProductoEntities();

            %>

            <div id="producto" class ="main">
                <center><h1>¡ Resultado(s) de Busqueda !</h1> </center>

                <div id="perfil_derecha"> 
                    <h1>Direct Market</h1>
                </div>
                <div id="perfil_izquierda"> 
                    <h2>Lista de Productos</h2>    
                    <br>

                    <%for (int i = 0; i < ListaProducto.size(); i++) {
                        
                    
                            String nProducto = ListaProducto.get(i).getNombre();

                            // Si coincide con una parte del Nombre del Producto --
                            if ((nProducto.toLowerCase().indexOf(nombre.toLowerCase()) != -1) || // ... O ...
                                    // Si coincide con una parte del Nombre del Proveedor --
                                    (ListaProducto.get(i).getProveedor().getNombre().toLowerCase().indexOf(nombre.toLowerCase()) != -1)) {
                                encontro = true;
                    %>
                            <label class="valor">  <a  href="verProducto?numref=<%=ListaProducto.get(i).getNumRef()%>"> <b> <%=ListaProducto.get(i).getNombre()%> </b></a></label>
                            <br>
                            <%} else {%> 
                                <%-- Entro a chequear todas las categorias a la q pertenece --%>
                                <%for (int j = 0; j < ICPR.getListadoCategoriasXprod(ListaProducto.get(j).getNumRef()).size(); j++) {%>
                                
                                <%--<%for (int j = 0; j < ListaProducto.get(j).getListacategorias().size(); j++) {%>--%>

                                <%--<%if ((ListaProducto.get(j).getListacategorias().get(j).getNombre().toLowerCase()).indexOf(nombre.toLowerCase()) != -1) {%>--%>
                                
                                <%if ((ICPR.getListadoCategoriasXprod(ListaProducto.get(j).getNumRef()).get(j).getNombre().toLowerCase()).indexOf(nombre.toLowerCase()) != -1) {%>
                                    <label class="valor">  <a  href="verProducto?numref=<%=ListaProducto.get(i).getNumRef()%>"> <b> <%=ListaProducto.get(i).getNombre()%> </b> </a> </label><br/><br>
                                    <% encontro = true; %>
                                <%}%>

                                <%}  %>  <%-- Fin for ListaCategoria --%>
                            <%}%> <%-- Fin else --%>

                    <%}//FIN FOR %>
                    
                    

                    <%-- ............. Si NO se encuentran coincidencias .............. --%>
                    <%
                        if (encontro == false) {%>
                        <center> <label class="valor"> <b>Ups! </b> No se ha encontrado ningún Producto.  </label> <br><br>
                            <img src="../../media/images/upsGato.jpg" /> </center>

                    <%  }%>

                </div><%-- FIN div izquierda --%>

            </div> <%-- FIN div main --%>


            <jsp:include page="/WEB-INF/template/footer.jsp"/>
        </form>
    </body>
</html>
