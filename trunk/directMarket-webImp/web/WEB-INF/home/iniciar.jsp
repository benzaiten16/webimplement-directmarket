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
        <jsp:include page="/WEB-INF/template/cesion.jsp"/>
             <div id="inicio" class ="main">
            
            
                <div id="perfil_izquierdar">
           
            <jsp:include page="../categorias/listarCategoria.jsp"/>
                </div>
        </div>




        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>
