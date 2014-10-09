<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>

<!doctype html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Iniciar Cesión :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>

        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>

        <div id="perfil" class ="main">
           <div id="perfil_derecha">
                <img src="../../media/images/GatoRison.png" alt="Login"/>
            </div>
            <h2>Ingrese sus Datos</h2>
            <div id="perfil_izquierda">

                <div class="fila_input">
                    <label for="error_login">Correo: </label>
                    <input id="error_login" type="text" name="login"/>
                </div>

                <div class="fila_input">
                    <label for="error_password">Contraseña:</label>
                    <input id="error_password" type="password" name="password"/>
                </div>

                <div class="fila_input">
                    <input class="con_margen" type="button"
                           value="E n t r a r" onclick="submit()"/>
                </div>

            </div>
        </div>

        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
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