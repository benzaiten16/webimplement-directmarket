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
    <h2>Lista de Productos </h2>
    
    <form  action="Productos-Seleccionados" method="POST">
        
      <%for (int i = 0; i < ListaProductos.size(); i++) {%>
        <br>
        <div id=principal class="contenedor">

        <label class="rotulo">Nombre:</label>
        <%-- VALEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE --%>
        <label class="valor">  <a  href="verProducto?numref=<%=ListaProductos.get(i).getNumRef()%>"> <b> <%=ListaProductos.get(i).getNombre()%> </b></label><br/></a>
        <label class="rotulo">Numero de referencia:</label>
        <label class="valor"><%=ListaProductos.get(i).getNumRef()%> </label><br/>
        <br>
        <label class="rotulo">Descripcion:</label>
        <label class="valor"><%=ListaProductos.get(i).getDescripcion()%> </label><br/>
        <label class="rotulo">Especificacion:</label> 
        <textarea class=textarea cols="60" rows="8" placeholder="ingresar especifiaciones..."><%=ListaProductos.get(i).getEspecificacion()%></textarea>
        <br>
        <label class="rotulo">Precio:</label>
        <label class="valor"><%=ListaProductos.get(i).getPrecio()%> </label><br/>
        <br>
        <label class="rotulo">Proveedor:</label>
        <label class="valor"><%=ListaProductos.get(i).getproveedor().getNickname()%> </label><br/>
        
        <%-- CHECKBOX INDICA SI VA PARA EL CARRITO O NO --%>
        <br/>
        <label class="check"> <b> Añadir Producto al Carro -> </b></label>
        
        <input type="checkbox" name="ProductosSeleccionados" value="<%= ListaProductos.get(i).getNumRef()%>"/><img id="trolley" src="../../media/images/carrito.png" width='50' height='50' title='Añadir' alt="Carrito de Compras"/>
      
        <br><br>

        <label class="divisor">- - - - - - - - - - - - - -- - - - - - </label><br><br>

        

        </div>
    <%}%>
    <%-- ENVIA ARTICULOS SELECCIONADOS CON CHECKBOX --%><br>   
    
    <input type="button" value="Añadir a Carrito" class="con_margen" onclick="submit();" /><img id="trolley" src="../../media/images/CarritoComprasOk.png" width='50' height='50' title='Añadir al carrito' alt="Carrito de Compras"/>
    
    </form>
</html>