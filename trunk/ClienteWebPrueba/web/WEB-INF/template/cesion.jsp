<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%--<%@page import="Logica_Clases.Fabrica"%>--%>
<%--<%@page import="Logica_Clases.IcontroladorCliente"%>--%>


<%--
    <% Fabrica fabrica = Fabrica.getInstance();  %>
    <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>
--%>

    
        <%--SE REALIZA IMPLEMENTACION DE FORMULARIO PARA INICIO SESION COMUN --%>
        <form action="iniciar-sesion" ACTION="POST">

            
                <h4>Iniciar Sesion</h4>
                <label class="rotulo">NickName:</label>  <input id="inputCorreo" type="text" name="login"/>
                <br>
                <label class="rotulo">Contraseña:</label> <input id="InputPasswd" type="password" name="password"/>
                <br>

            
            
                <input class="con_margen" type="button"
                       value="E n t r a r" onclick="submit()"/>
            
           
        </form>
        <%--TERMINA IMPLEMENTACION DE FORMULARIO PARA INICIO SESION COMUN --%>

   