<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<!doctype html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Iniciar sesión :: Direct Market</title>
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

        
        <jsp:include page="/WEB-INF/template/Sesion.jsp"/>

        
        
        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>
