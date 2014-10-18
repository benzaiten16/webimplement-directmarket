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
        <title>Perfil :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>

        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>
        <% IcontroladorProveedor ICP = fabrica.getControladorProveedor();%>

        <div id="perfil" class ="main">



            <%-- Comenzando a separar si es CLIENTE o PROVEEDOR --%>
            <% if (session.getAttribute("estado_sesion") != null) {%>
            <% if (ICC.findCliente(request.getAttribute("usuario").toString()) != null) {%>

            <%-- ___________________________SI ES UN CLIENTE_______________________________ --%>
            <div id="perfil_derecha">
                <div class="contenedor">
                    <jsp:include page="../categorias/listarCategoria.jsp"/>
                </div>
            </div>

            <div id="perfil_izquierda">


                <div class="contenedor">
                    <h1>Cliente</h1>
                    <h2>Información Usuario</h2>
                    <label class="rotulo">Nick:</label>
                    <label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getNickname()%></label>
                    <br/>
                    <label class="rotulo">Correo electrónico:</label>
                    <label class="valor">
                        <a href="mailto:<%= ICC.findCliente(request.getAttribute("usuario").toString()).getMail()%>">
                            <%= ICC.findCliente(request.getAttribute("usuario").toString()).getMail()%>
                        </a>
                        <br/>
                        <label class="rotulo">Tipo:</label>
                        <label class="valor">Cliente</label>
                </div>
                <br/><br/>

                <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                <div class="contenedor">


                    <br/><br/>
                    <h2>Información Personal</h2>
                    <label class="rotulo">Nombre:</label>
                    <label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getNombre()%></label>
                    <br/>
                    <label class="rotulo">Apellido:</label>
                    <label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getApellido()%></label>
                    <br/>
                    <label class="rotulo">Fecha de nacimiento:</label>
                    <label class="valor"><%= ICC.findCliente(request.getAttribute("usuario").toString()).getFechNacim()%></label>
                    <br/>
                </div>
                <br/>
                <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                <br><br/>
                <div class="contenedor">

                    <h2>Orden(es) de Compra</h2>
                </div>

            </div>
            <% } else {%>


            <%-- ___________________________SI ES UN PROVEEDOR_______________________________ --%>
            <div id="perfil_izquierda">
                <h1>Proveedor</h1>

                <div class="contenedor">
                    <h2>Información Usuario</h2>
                    <label class="rotulo">Nick:</label>
                    <label class="valor"><%= ICP.findProveedor(request.getAttribute("usuario").toString()).getNickname()%></label>
                    <br/>
                    <label class="rotulo">Correo electrónico:</label>
                    <label class="valor">
                        <a href="mailto:<%= ICP.findProveedor(request.getAttribute("usuario").toString()).getMail()%>">
                            <%= ICP.findProveedor(request.getAttribute("usuario").toString()).getMail()%>
                        </a>
                        <br/>
                        <label class="rotulo">Tipo de Usuario:</label>
                        <label class="valor">Proveedor</label>
                </div>
                <br/><br/>
                <div class="contenedor">
                    <br/>
                    <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>

                    <br/><br/>
                    <h2>Información Personal</h2>
                    <label class="rotulo">Nombre:</label>
                    <label class="valor"><%= ICP.findProveedor(request.getAttribute("usuario").toString()).getNombre()%></label>
                    <br/>
                    <label class="rotulo">Apellido:</label>
                    <label class="valor"><%= ICP.findProveedor(request.getAttribute("usuario").toString()).getApellido()%></label>
                    <br/>
                    <label class="rotulo">Fecha de nacimiento:</label>
                    <label class="valor"><%= ICP.findProveedor(request.getAttribute("usuario").toString()).getFechNacim()%></label>
                    <br/>
                </div>
                <br/>
                <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>

                <br/><br/>
                <h2>Datos Empresa</h2>
                <div class="contenedor" >
                    <label class="rotulo">Nombre Compañia:</label> 
                    <label class="valor"><%= ICP.findProveedor(request.getAttribute("usuario").toString()).getCompania()%></label>
                    <br>
                    <label class="rotulo">Nombre Compañia:</label> 
                    <label class="valor"><%= ICP.findProveedor(request.getAttribute("usuario").toString()).getWeb()%></label>
                    <br/>
                    <label class="rotulo">Productos:</label> 
                    <br/>
                    <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>

                    <br/>

                </div>  <br/>  <br/>
                <h2>Listado de Productos</h2>
                <% }%> <%-- Fin de if Cliente/Proveedor --%>

                <%}%>


            </div>
        </div>

        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>