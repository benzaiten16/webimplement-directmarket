<%@page import="Servlets.EstadoSesion"%>
<%@page import="Logica_Clases.IcontroladorCategoria"%>
<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
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
        <title>Ver Producto :: DirectMarket</title>
        <jsp:include page="/WEB-INF/template/header.jsp"/>
    </head>

    <body>

        <% Fabrica fabrica = Fabrica.getInstance();%>
        <% IcontroladorProducto ICP = fabrica.getControladorProducto();%>
        <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>

        <%-- traigo el numRef... pero cargo todo lo demas con el titulo --%>
        <% String pepito = request.getAttribute("numref").toString();%>
        <% Integer numero = Integer.parseInt(pepito); %>
        <% String titulo = ICP.findProducto(numero).getNombre();%>



        <div id="verProducto" class="main">
            <center> <h1>Direct Market</h1><br> </center>
            <h2><i>Producto Seleccionado: </i> <%=titulo%></h2><br>
            <div id="perfil_derecha">
                
                <%-- Si el Cliente está Logeado --%>
                <% if ( (request.getSession().getAttribute("estado_sesion").equals(EstadoSesion.NO_LOGIN)) || (request.getSession().getAttribute("estado_sesion").equals(EstadoSesion.LOGIN_INCORRECTO))) {%>
            <form>
                    <h4>Agregar Producto a Carrito: </h4>
                    <label class="rotulo">Cantidad: </label>
                    <input id="cantidad" type="text" name="cantidad">
                    <button class="enviar" type="submit">Agregar</button>
                </form>
             <%}%>  
                
                
            </div>
            <div id="perfil_izquierda">

                <div id="principal" class="contenedor">
                    <label class="rotulo">Numero de Referencia: </label>
                    <label class="valor"><%= ICP.findProducto(numero).getNumRef()%></label>
                    <br>
                    <label class="rotulo">Descripción: </label>
                    <label class="valor"><%= ICP.findProducto(numero).getDescripcion()%></label>
                    <br>
                    <label class="rotulo">Especifiaciones: </label>
                    <textarea class=textarea cols="60" rows="8" ><%= ICP.findProducto(numero).getEspecificacion()%></textarea>
                    <br>
                    <label class="rotulo">Precio: </label>
                    <label class="valor"><%= ICP.findProducto(numero).getPrecio()%></label>
                    <br>
                    <label class="rotulo">Proveedor: </label>
                    <label class="valor"><%= ICP.findProducto(numero).getproveedor().getNickname()%></label>
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