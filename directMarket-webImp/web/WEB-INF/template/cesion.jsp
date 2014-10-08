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
            <div id="perfil_izquierda">
                <div class="contenedor">
                    <h2>Ingresa tus datos para iniciar sesión</h2>
                    
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