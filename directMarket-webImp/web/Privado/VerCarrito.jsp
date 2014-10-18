<%-- 
    Document   : VerCarrito
    Created on : 18/10/2014, 02:23:40 PM
    Author     : Guillermo
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.IcontroladorProveedor"%>
<%@page import="Logica_Clases.Producto"%>


<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Ver Carrito</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>
        <h1>Listado de Productos en el Carrito</h1>
        
        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorProducto ICPROD = fabrica.getControladorProducto(); %>
        <% IcontroladorProveedor ICPROV = fabrica.getControladorProveedor(); %>
        <% List<Producto> ListaProductos = null ;%>
        <% Vector V = (Vector)session.getAttribute("codigos"); %> 
        <% ListaProductos = ICPROD.findProductoEntities(); %>
        <%  
            for(int i=0; i<V.size(); i++){
                for(int j=0; j<ListaProductos.size(); j++){
                    if(String.valueOf(V.elementAt(i)).equalsIgnoreCase(String.valueOf(ListaProductos.get(j).getNumRef()))){
                        
        %>    
        <table border="0" cellspacing="2" cellpadding="5" align="Center">    
            <thead>
                <tr bgcolor="red">
                    <th>Numero Referencia</th>
                    <th>Nombre Producto</th>
                    <th>Descripcion</th>
                    <th>Especificacion</th>
                    <th>Precio Producto</th>
                    <th>Proveedor</th>
                    <th>Cantidad</th>
                    <th bgcolor="white"></th>
                </tr>
            </thead>
            
            <tr bgcolor="#FFFF99">
                     <td><input size ="10" type="text" name="numRef" value="<%= ListaProductos.get(j).getNumRef() %>" readonly="readonly"/>
                        </td>   
                        <td><input size ="10" type="text" name="nombre" value="<%= ListaProductos.get(j).getNombre() %>" readonly="readonly"/>
                        </td>   
                        <td><input size ="20" type="text" name="descripcion" value="<%= ListaProductos.get(j).getDescripcion() %>" readonly="readonly"/>
                        </td>   
                        <td><input size ="30" type="text" name="especificacion" value="<%= ListaProductos.get(j).getEspecificacion() %>" readonly="readonly"/>
                        </td>   
                        <td><input size ="5" type="text" name="precio" value="<%= ListaProductos.get(j).getPrecio() %>" readonly="readonly"/>
                        </td>       
                        <td><input size ="20" type="text" name="proveedor" value="<%= ListaProductos.get(j).getproveedor().getNickname() %>" readonly="readonly"/>
                        </td>       
                        <td bgcolor="blue"><input size ="3" type="text" name="Cantidad" value="1"/>
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
        
        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>
