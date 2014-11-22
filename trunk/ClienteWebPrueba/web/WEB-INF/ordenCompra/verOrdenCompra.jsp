<%@page import="webService.Estado"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="webService.LineaOrden"%>
<%@page import="Servlets.IClineaOrden"%>
<%@page import="webService.OrdenCompra"%>
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
<%@page import="Servlets.ICordenCompra" %>
<%--NUEVOS IMPORTS--%>




<!doctype html>


<head>
    <jsp:include page="/WEB-INF/template/head.jsp"/>
    <title>Ver Orden de Compra :: DirectMarket</title>
    <jsp:include page="/WEB-INF/template/header.jsp"/>
</head>


<% String numerr = (String) request.getSession().getAttribute("numero"); %>
<% Integer num = Integer.parseInt(numerr);%>


<%
    ICordenCompra ICOC = new ICordenCompra();
    OrdenCompra or = new OrdenCompra();
    or = ICOC.findOrdenCompra(num);

    List<LineaOrden> lineaOrden;
    lineaOrden = ICOC.getListadoLineasXord(num);

%>
<div id="verOrdenCompra" class ="main">
    <center> <h1> Orden de Compra N°: <%=num%></h1>  </center>
    <div id="perfil_derecha">

        <b>Tu estado de Orden es : </b> <label><%=or.getEstado().toString()%></label>

        <%-- SI ESTA PREPARADA --%>
        <% if (or.getEstado().toString().equals("PREPARADA")) {%>   
        <br><br>

        <div><br>
            ¿Ya recibistes tú pedido? 
            <select  id="dropdown2"  name="estado">
                <option value="1" selected> N O </option>
                <option value="2"> S I </option>
            </select>
        </div> 
        
        
        <div id="estado_submit">
            <br><center> <button type="submit" class="enviar"> Aceptar </button> </center>
        </div> 


        <% } %>
        <br> <br>
        <center>  <img src="../../media/images/GATOcomprando.png" alt="gato comprando"/> </center>

    </div>
    <div id="perfil_izquierda">
        <h2>Productos</h2>

        <% for (int i = 0; i < lineaOrden.size(); i++) {%>


        <div id="principal" class="contenedor">
            <br/>
            <label class="rotulo">Nombre: </label>
            <label class="valor"><%=lineaOrden.get(i).getP().getNombre()%></label>
            <br>
            <label class="rotulo">Numero de Referencia:</label>
            <label class="valor"><a  href="verProducto?numref=<%=lineaOrden.get(i).getP().getNumRef()%>" >  <%=lineaOrden.get(i).getP().getNumRef()%> </a></label>
            <br>
            <br/>

            <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
            <br/>
            <br/>



        </div>


        <%}%>



    </div>     
</div>















<jsp:include page="/WEB-INF/template/footer.jsp"/>


