<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.StringTokenizer" %>
<%@page import="Servlets.EstadoSesion"%>
<%@page import="java.util.List"%>

<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>
<%--
<%@page import="Logica_Clases.IcontroladorCategoria"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.IcontroladorProveedor"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>
--%>
<%--IMPORTS VIEJOS DEL PROYECTO ANTERIOR--%>

<%--NUEVOS IMPORTS--%>
<%@page import="Servlets.ICcategoria"%>
<%@page import="Servlets.ICcliente"%>
<%@page import="Servlets.ICproveedor"%>
<%@page import="Servlets.ICproducto"%>
<%@page import="webService.Producto"%>
<%--NUEVOS IMPORTS--%>




<!doctype html>
<html>

    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Ver Producto :: DirectMarket</title>
        <jsp:include page="/WEB-INF/template/header.jsp"/>
    </head>

    <body>
        <%--
        <%
            WsIclienteService clienteServices = new WsIclienteService();
            WsIcliente ICC = clienteServices.getWsIclientePort();
       
            WsIproveedorService ProveedorServices = new WsIproveedorService();
            WsIproveedor ICP = ProveedorServices.getWsIproveedorPort();
            
            WsIproductoService ProductoServices = new WsIproductoService();
            WsIproducto ICPROD = ProductoServices.getWsIproductoPort();
            
        %>
        --%>
        <%
        ICcliente ICC = new ICcliente();
        
        ICproveedor ICP = new ICproveedor();
        
        ICproducto ICPROD = new ICproducto();
        
        %>
        
        <%  List<Producto> ListaProducto;
            ListaProducto = ICPROD.findProductoEntities();
        %>
        <%-- traigo el numRef... pero cargo todo lo demas con el titulo --%>
        <% String pepito = request.getAttribute("numref").toString();%>
        <% Integer numero = Integer.parseInt(pepito); %>
        <% String titulo = ICPROD.findProducto(numero).getNombre();%>

        
        <div id="verProducto" class="main">
         
            <center> <h1>Direct Market</h1><br> </center>
            <h2><i>Producto Seleccionado: </i> <%=titulo%></h2><br>
            <div id="perfil_derecha">
        
        <% String usr = "";%>
        <%
            try {
                ICP.findProveedor(request.getAttribute("usuario").toString());
            } catch (Exception ex) {
                usr = "Invitado";
            }
        %>

       
        <%
          
               if (usr.equals("Invitado")){
         %>
                <form  action="Productos-Seleccionados" method="POST">
                    <h4>Agregar Producto a Carrito: </h4>
                    <input type="checkbox" name="ProductosSeleccionados" value="<%= numero %>"/><img id="trolley" src="../../media/images/carrito.png" width='50' height='50' title='Añadir' alt="Carrito de Compras"/>
                    <input type="button" value="Añadir a Carrito" class="con_margen" onclick="submit();" />
                </form>    
               <%}%>
   
            </div>
                    
            <div id="perfil_izquierda">

                <div id="principal" class="contenedor">
                    <label class="rotulo">Numero de Referencia: </label>
                    <label class="valor"><%= ICPROD.findProducto(numero).getNumRef()%></label>
                    <br>
                    <label class="rotulo">Descripción: </label>
                    <label class="valor"><%= ICPROD.findProducto(numero).getDescripcion()%></label>
                    <br>
                    <label class="rotulo">Especifiaciones: </label>
                    <textarea class=textarea cols="60" rows="8" ><%= ICPROD.findProducto(numero).getEspecificacion()%></textarea>
                    <br>
                    <label class="rotulo">Precio: </label>
                    <label class="valor"><%= ICPROD.findProducto(numero).getPrecio()%></label>
                    <br>
                    <label class="rotulo">Proveedor: </label>
                    <label class="valor"><%= ICPROD.findProducto(numero).getProveedor().getNickname()%></label>
                    <br>
                    <label class="rotulo">Categoria(s): </label> -
                    <%for (int j = 0; j < ICPROD.getListadoCategoriasXprod(ICPROD.findProducto(numero).getNumRef()).size(); j++) {%>

                            <label class="valor">   <%=ICPROD.getListadoCategoriasXprod(ICPROD.findProducto(numero).getNumRef()).get(j).getNombre()%> -</label>
                    <%}%>
                </div>

            </div>      
            <br/>
            <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
            <br/><br/>
            <h3>Comentarios</h3>


        </div>

        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>
