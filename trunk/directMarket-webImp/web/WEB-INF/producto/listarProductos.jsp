<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.IcontroladorCategoria"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
        <% Fabrica fabrica = Fabrica.getInstance();%>
        <% IcontroladorCategoria ICC = fabrica.getControladorCategoria();%>
        <% IcontroladorProducto ICP = fabrica.getControladorProducto();%>
        <% List<Producto> ListaProductos;%>
        <% ListaProductos = ICC.findCategoria(request.getAttribute("catseleccionada").toString()).getListadoProducto();%>
        <h2>Listar productos (Productos)</h2>
        <%for(int i = 0; i < ListaProductos.size(); i++) {%>
            <div id=principal class="contenedor">
                    <label class="rotulo">Numero de referencia:</label>
                    <label class="valor"><%=ListaProductos.get(i).getNumRef()%> </label><br/>
                    <label class="rotulo">Nombre:</label>
                    <a href="verProducto?numref=<%=ListaProductos.get(i).getNumRef()%>">
                    <label class="valor"><%=ListaProductos.get(i).getNombre()%> </label><br/></a>
                    <label class="rotulo">Descripcion:</label>
                    <label class="valor"><%=ListaProductos.get(i).getDescripcion()%> </label><br/>
                    <label class="rotulo">Especificacion:</label>
                    <label class="valor"><%=ListaProductos.get(i).getEspecificacion()%> </label><br/>
                    <label class="rotulo">Precio:</label>
                    <label class="valor"><%=ListaProductos.get(i).getPrecio()%> </label><br/>
                    <label class="rotulo">Proveedor:</label>
                    <label class="valor"><%=ListaProductos.get(i).getproveedor().getNickname()%> </label><br/>
                     
                     
            </div>
     <%}%>
</html>