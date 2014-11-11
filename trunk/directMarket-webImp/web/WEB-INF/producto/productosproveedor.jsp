<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>

<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>
<%--
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.Proveedor"%>
<%@page import="Logica_Clases.IcontroladorProveedor"%>
<%@page import="Logica_Clases.Fabrica"%>
--%>
<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>

<%--NUEVOS IMPORTS--%>
<%@page import="ServicesProveedor.WsIProveedor"%>
<%@page import="ServicesProveedor.WsIProveedorService"%>
<%@page import="ServicesProveedor.Proveedor"%>

<%@page import="ServicesProducto.WsIProducto"%>
<%@page import="ServicesProducto.WsIProductoService"%>
<%@page import="ServicesProducto.Producto"%>
<%--NUEVOS IMPORTS--%>


<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Ver Producto :: DirectMarket</title>
        
    </head>

    <body>
        
        <jsp:include page="/WEB-INF/template/header.jsp"/>
        
        <div id="Productos" class="main">
            
            
            <%--
            <%
                Fabrica fabrica = Fabrica.getInstance();
            String prov =request.getAttribute("usuario").toString();
            //IcontroladorProveedor ICP = fabrica.getControladorProveedor();
            IcontroladorProducto ICPR = fabrica.getControladorProducto();
            //Proveedor pepe= ICP.findProveedor(prov);
            List<Producto> ListaProductos;
            ListaProductos= ICPR.findProductoEntities();
            %>
            --%>
            
            <%
             String prov =request.getAttribute("usuario").toString();
             
            WsIProveedorService ProveedorServices = new WsIProveedorService();
            WsIProveedor ICP = ProveedorServices.getWsIProveedorPort();
            
            WsIProductoService ProductoServices = new WsIProductoService();
            WsIProducto ICPR = ProductoServices.getWsIProductoPort();
            
            List<Producto> ListaProductos;
            ListaProductos= ICPR.findProductoEntities();
            
            %>
            
            
            <center><h1>Direct Market </h1></center>
            <h2>Lista de Productos: </h2>
            
            <%for (int i = 0; i < ListaProductos.size(); i++) { %>
                <%String provisto=ListaProductos.get(i).getProveedor().getNickname();
                if (provisto.equals(prov)) {%>
                <label class="rotulo">Titulo</label>
                <label class="valor"><%=ListaProductos.get(i).getNombre()%></label>
                <br/>
                <label class="rotulo">Numero de referencia:</label>
                <label class="valor"><%=ListaProductos.get(i).getNumRef()%> </label><br/>
                <br>
                <label class="rotulo">Descripcion:</label>
                <label class="valor"><%=ListaProductos.get(i).getDescripcion()%> </label><br/>
                <br>
                <label class="rotulo">Especificacion:</label> 
                <textarea class=textarea cols="60" rows="8" placeholder="ingresar especifiaciones..."><%=ListaProductos.get(i).getEspecificacion()%></textarea>
                <br>
                <label class="rotulo">Precio:</label>
                <label class="valor"><%=ListaProductos.get(i).getPrecio()%> </label>
                <br>
                <br>
                <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                <br>
                <br>
                <br>
                <%}%>
            <%}%>    
        </div>
        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>
