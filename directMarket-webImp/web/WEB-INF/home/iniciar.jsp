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

        <!-- ejemplo de estilo CSS enbebido en la página -->
        <style type="text/css">
            .input_blur {
                font-style: italic;
                color:#808080;
            }
        </style>

        <script type="text/javascript">
            /// saca el blur a un elemento y lo resetear
            function sacarBlurReset(event)
            {
                event.target.setAttribute('class', "");
                event.target.value = "";
            }
        </script>

          <%--SE REALIZA IMPLEMENTACION DE FORMULARIO PARA INICIO SESION COMUN --%>
       <div id="perfil_derecha">
           
         <form class=formulariodemoGuillermo action="iniciar-sesion" ACTION="POST">
            <h4>Iniciar Sesion</h4>
            <div class="fila_input">
               <label for="inputCorreo">Correo: </label>
               <input id="inputCorreo" type="text" name="login"/>
            </div>
            <div class="fila_input">
               <label for="InputPasswd">Contraseña:</label>
               <input id="InputPasswd" type="password" name="password"/>
            </div>
            <div class="fila_input">
               <input type="button"  value="Ingresar" onclick="submit()"/>
            </div>
               </form>
        <%--TERMINA IMPLEMENTACION DE FORMULARIO PARA INICIO SESION COMUN --%>
        
         </div>

        <jsp:include page="../categorias/listarCategoria.jsp"/>

        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>
