<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>

<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>
<%--
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.IcontroladorProveedor"%>
<%@page import="Logica_Clases.Producto"%>
--%>
<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>


<%--NUEVOS IMPORTS--%>
<%@page import="ServicesProducto.Producto"%>
<%@page import="ServicesProducto.WsIProducto"%>
<%@page import="ServicesProducto.WsIProductoService"%>
<%@page import="ServicesProveedor.WsIProveedor"%>
<%@page import="ServicesProveedor.WsIProveedorService"%>
<%--NUEVOS IMPORTS--%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/WEB-INF/media/styles/main.css">

        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Ver Carrito</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>

        <div id="producto" class ="main">
            <center><h1>Listado de Productos en el Carrito</h1></center>
            
            <%--
            <% Fabrica fabrica = Fabrica.getInstance();  %>
            <% IcontroladorProducto ICPROD = fabrica.getControladorProducto(); %>
            <% IcontroladorProveedor ICPROV = fabrica.getControladorProveedor(); %>
            --%>
            <%
            WsIProveedorService ProveedorServices = new WsIProveedorService();
            WsIProveedor ICPROV = ProveedorServices.getWsIProveedorPort();
            
            WsIProductoService ProductoServices = new WsIProductoService();
            WsIProducto ICPROD = ProductoServices.getWsIProductoPort();    
            
            %>
            
            <% List<Producto> ListaProductos = null;%>
            <% Vector V = (Vector) session.getAttribute("codigos"); %> 
            <% ListaProductos = ICPROD.findProductoEntities(); %>
            
            <div class="datagrid">
        <form action="Procesa-Carrito" method="POST">
            <table border="0" cellspacing="2" cellpadding="5" align="Center">    
                <thead>
                    <tr bgcolor="red">
                        <th>Numero <br>Referencia</th>
                        <th>Nombre <br>Producto</th>
                        <th>Descripcion</th>
                        <th>Especificacion</th>
                        <th>Precio <br>Producto</th>
                        <th>Proveedor</th>
                        <th>Cantidad</th>
                        <th bgcolor="white"></th>
                    </tr>  
                </thead> <tbody>
               
            <% if(V != null){
                for (int i = 0; i < V.size(); i++) {
                    for (int j = 0; j < ListaProductos.size(); j++) {
                        if (String.valueOf(V.elementAt(i)).equalsIgnoreCase(String.valueOf(ListaProductos.get(j).getNumRef()))) {

            %>    

                <tr bgcolor="#FFFF99">
                    <td><input style="width: 100px"  size ="10" type="text" name="numRef" value="<%= ListaProductos.get(j).getNumRef()%>" readonly="readonly"/>
                    </td>   
                    <td><input style="width: 100px" size ="10" type="text" name="nombre" value="<%= ListaProductos.get(j).getNombre()%>" readonly="readonly"/>
                    </td>   
                    <td><input style="width: 100px" size ="20" type="text" name="descripcion" value="<%= ListaProductos.get(j).getDescripcion()%>" readonly="readonly"/>
                    </td>   
                    <td><input style="width: 100px" size ="30" type="text" name="especificacion" value="<%= ListaProductos.get(j).getEspecificacion()%>" readonly="readonly"/>
                    </td>   
                    <td><input style="width: 100px" size ="5" type="text" name="precio" value="<%= ListaProductos.get(j).getPrecio()%>" readonly="readonly"/>
                    </td>       
                    <td><input style="width: 100px" size ="20" type="text" name="proveedor" value="<%= ListaProductos.get(j).getProveedor().getNickname()%>" readonly="readonly"/>
                    </td>       
                    <td bgcolor="009999"><input style="width: 50px" size ="3" type="text" name="Cantidad" value="1"/>
                    </td>       
                    <td>
                        <a href="/EliminarProductoCarrito?pos=<%=i%>">[Eliminar]</a>
                    </td>
                </tr>   
           
            <%-- CIERRA EL IF EQUEALS --%>
            <%}%>   
            <%-- CIERRA EL FOR DE ADENTRO --%>
            <%}%>
            <%-- CIERRA EL FOR EXTERIOR --%>
            <%}%>
            <%-- CIERRA EL IF DE V DIST NULL --%>
           
     <%}%>
      </tbody></table></div>        
     <div align="center">
         <br>
            <input class="con_margen" type="button" value="Confirmar Compra" onclick="submit()"/>    
     </div>
     </form>      
        
     </div>
    <jsp:include page="/WEB-INF/template/footer.jsp"/>
    
    </body>
</html>
