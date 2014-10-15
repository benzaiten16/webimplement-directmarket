<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<!doctype html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Bienvenido a Direct Market</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>

             <div id="inicio" class ="main">
            
            <div id="perfil_derecha">
                  <%--SE REALIZA IMPLEMENTACION DE FORMULARIO PARA INICIO SESION COMUN --%>
                <form class=formulariodemoGuillermo action="iniciar-sesion" ACTION="POST">

                    <div class="contenedor">
                        <h4>Iniciar Sesion</h4>
                        <label class="rotulo">Correo: </label>  <input id="inputCorreo" type="text" name="login"/>
                        <br>
                        <label class="rotulo">Contraseña:</label> <input id="InputPasswd" type="password" name="password"/>
                        <br>

                    </div>
                    <input type="button"  value="Ingresar" onclick="submit()"/>
                    <br>
                </form>
            </div>
                <div id="perfil_izquierdar">
            <%--TERMINA IMPLEMENTACION DE FORMULARIO PARA INICIO SESION COMUN --%>
            <jsp:include page="../categorias/listarCategoria.jsp"/></div>
        </div>




        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>
