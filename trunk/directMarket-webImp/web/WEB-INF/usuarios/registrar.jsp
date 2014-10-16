<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>

<%@page import="java.util.Calendar"%>

<!doctype html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <script src="/js/prototype.js" type="text/javascript"></script>  
        <title>Registrar :: DirectMarket</title>
        
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>

        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>

        <div id="registrar" class ="main">
            <div id="perfil_derecha">
                <br><br><br><br>
                <img src="media/images/bienvenidoGato.png" alt="imagen"/>
                <br><br><br>
            </div>

            <%-- Ingreso de Datos --%>
            <div id="perfil_izquierda">
                <form action="registro-usuarios" method="POST">
                    <div class="contenedor">
                        <h1>Direct Market</h1>
                        <h2>Datos Usuario</h2>
                        <label class="rotulo">Nick:</label> <input type="text" name="nick"> 
                        <br>
                        <label class="rotulo">Mail:</label> <input type="text" name="mail"> 
                        <br>
                        <label class="rotulo">Contraseña:</label> <input type="password" name="pass"> 
                        <br>
                        <label class="rotulo">Repetir Contraseña:</label> <input type="password" name="passR">
                        <br>
                    </div>
                    <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                    <br><br>

                    <div class="contenedor">
                        <h2>Datos Personales</h2>
                        <label class="rotulo">Nombre:</label> <input type="text" name="nombre">
                        <br>
                        <label class="rotulo">Apellido:</label> <input type="text" name="apellido">
                        <br>
                        <label class="rotulo">Fecha de Nacimiento: (No Explorer)</label> <input type="date" name="nacimiento"> 
                        <br> 
                        <label class="rotulo">¿Qué eres?:</label> 
                        <div>                          
                            <select  id="dropdown"  onchange="evento(this);" name="tipoUsuario">
                                <option value="1" selected>C l i e n t e</option>
                                <option value="2">P r o v e  e d o r</option>
                            </select>
                        </div> 
                        <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                        <br><br>

                        <%-- Comenzando a ocultar  --%>
                    </div>
                    <%-- el div lo oculto --%>

                    <div id='ver' style=' display: none ;'>
                        <h2>Datos Empresa</h2>
                        <div class="contenedor" >
                            <label class="rotulo">Nombre Compañia:</label> <input type="text" name="nomComp">
                            <br>
                            <label class="rotulo">Web:</label> <input type="text" name="web">
                            <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                            <br><br>
                        </div>
                    </div>

                    <%-- la función del div --%>

                    <script type="text/javascript">
                        function evento(sel) {
                            if (sel.value == "1") {

                                divT = document.getElementById("ver");
                                divT.style.display = "none";

                            } else {



                                divT = document.getElementById("ver");
                                divT.style.display = "";
                            }
                        }
                    </script>

                    <%--  ...................................   --%>

                    <input type="submit" value="Enviar">
                </form>


            </div>
        </div>

    </body>
    <jsp:include page="/WEB-INF/template/footer.jsp"/>
</html>
