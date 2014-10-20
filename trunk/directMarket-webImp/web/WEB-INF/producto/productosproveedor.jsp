<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.Proveedor"%>
<%@page import="Logica_Clases.IcontroladorProveedor"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- referencia al CSS maestro -->
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Ver Producto :: DirectMarket</title>
        <jsp:include page="/WEB-INF/template/header.jsp"/>
    </head>

    <body>
        <div id="Productos" class="main">
            <%
                Fabrica fabrica = Fabrica.getInstance();
            String prov =request.getAttribute("usuario").toString();
            //IcontroladorProveedor ICP = fabrica.getControladorProveedor();
            IcontroladorProducto ICPR = fabrica.getControladorProducto();
            //Proveedor pepe= ICP.findProveedor(prov);
            List<Producto> ListaProductos;
            ListaProductos= ICPR.findProductoEntities();
            %>
            <h2>Lista de Productos: </h2>
            
            <%for (int i = 0; i < ListaProductos.size(); i++) { %>
                <%String provisto=ListaProductos.get(i).getproveedor().getNickname();
                if (provisto.equals(prov)) {%>
                <label class="rotulo">Titulo</label>
                <label class="valor"><%=ListaProductos.get(i).getNombre()%></label>
                <br/>
                <label class="rotulo">Numero de referencia:</label>
                <label class="valor"><%=ListaProductos.get(i).getNumRef()%> </label><br/>
                <br>
                <label class="rotulo">Descripcion:</label>
                <label class="valor"><%=ListaProductos.get(i).getDescripcion()%> </label><br/>
                <label class="rotulo">Especificacion:</label> 
                <textarea class=textarea cols="60" rows="8" placeholder="ingresar especifiaciones..."><%=ListaProductos.get(i).getEspecificacion()%></textarea>
                <br>
                <label class="rotulo">Precio:</label>
                <label class="valor"><%=ListaProductos.get(i).getPrecio()%> </label>
                <br>
                <br>
                <br>
                <%}%>
            <%}%>    
        </div>
        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>
