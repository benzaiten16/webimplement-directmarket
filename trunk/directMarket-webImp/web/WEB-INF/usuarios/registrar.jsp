<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>

<!doctype html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Registrar :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>

        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>

        <div id="registrar" class ="main">
            <div id="perfil_derecha">
                <img src="media/images/defecto.gif" alt="imagen"/>
            </div>

            <%-- Ingreso de Datos --%>
            <div id="perfil_izquierda">
                <form action="guardar" method="POST">
                    <div class="contenedor">
                        <h2>Información Usuario</h2>
                        <label class="rotulo">Nick:</label> <input type="text" name="nick">
                        
                        <input type="submit" value="guardar">
                    </div>
                </form>
            </div>

        </div>

        <jsp:include page="/WEB-INF/template/footer.jsp"/>

    </body>
</html>