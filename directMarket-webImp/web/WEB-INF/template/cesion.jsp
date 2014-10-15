<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>

<!doctype html>
<html>

    <% Fabrica fabrica = Fabrica.getInstance();  %>
    <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>


    <div id="perfil_derecha">
        <%--SE REALIZA IMPLEMENTACION DE FORMULARIO PARA INICIO SESION COMUN --%>
        <form action="iniciar-sesion" ACTION="POST">

            <div class="contenedor">
                <h4>Iniciar Sesion</h4>
                <label class="rotulo">NickName:</label>  <input id="inputCorreo" type="text" name="login"/>
                <br>
                <label class="rotulo">Contraseña:</label> <input id="InputPasswd" type="password" name="password"/>
                <br>

            </div>
            <div class="fila_input">
                <input class="con_margen" type="button"
                       value="E n t r a r" onclick="submit()"/>
            </div>
            <br>
        </form>
        <%--TERMINA IMPLEMENTACION DE FORMULARIO PARA INICIO SESION COMUN --%>

    </div>


</html>






<%-- CODIGO VIEJO
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- referencia al CSS maestro -->
<link rel="stylesheet" type="text/css" href="media/styles/main.css">

<!-- para el icono de la página -->
<link href="media/images/favicon.ico" rel="icon" type="image/x-icon" />
<link href="media/images/favicon.ico" rel="shortcut icon" />

<div class="contenedor_principal main">
    <div class="izquierda">
        <h2>Ingresa tus datos para iniciar sesión</h2>
    </div>
    <div class="derecha">
        <!-- formulario de login -->
        <form action="iniciar-sesion" method="POST">
            <input class="input_blur" type="text" name="login"
                   value="email..."	onMouseDown="sacarBlurReset(event);"/>
            <br/>
            <input type="password" name="password"/>
            <br/>
            <input type="button" value="Entrar" onclick="submit()"/>
        </form>
    </div>
</div>

--%>