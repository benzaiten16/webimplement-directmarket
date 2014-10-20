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
                <form id="registrar" action="registro-usuarios" method="POST">
                    <div class="contenedor">
                        <h1>Direct Market</h1>
                        <h2>Datos Usuario</h2>
                        <div>
                        <label for="registrar_nick" class="rotulo">Nick:</label> <input id="registrar_nick"  type="text" name="nick"/> (*) <span class="error_no">Nick invalido y/o en uso</span>
                        <br>
                        </div>
                        <div>
                        <label for="registrar_mail" class="rotulo">Mail:</label> <input id="registrar_mail" type="text" name="mail"/> (*) <span class="error_no">Email Invalido</span> 
                        <br>
                        </div>
                        <div>
                        <label for="registrar_password" class="rotulo">Contraseña:</label> <input id="registrar_password" type="password" name="password"/>(*) <span class="error_no">Password mayor a 2 dig</span> 
                        <br>
                        </div>
                        <div>
                        <label for="registrar_passwordR" class="rotulo">Repetir Contraseña:</label> <input id="registrar_passwordR" type="password" name="passwordR"/>(*) <span class="error_no">Confirmacion Incompleta</span>
                        <br>
                        </div>
                    </div>
                    <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                    <br><br>

                    <div class="contenedor">
                        <h2>Datos Personales</h2>
                        <div>
                        <label for="registrar_nombre" class="rotulo">Nombre:</label> <input id="registrar_nombre" type="text" name="nombre"/> (*) <span class="error_no">Ingrese Nombre</span>
                        <br>
                        </div>
                        <div>
                        <label for="registrar_apellido" class="rotulo">Apellido:</label> <input id="registrar_apellido" type="text" name="apellido"/> (*) <span class="error_no">Ingrese Apellido</span>
                        <br>
                        </div>
                        <div>
                            <label for="registrar_fechaNac" class="rotulo">Fecha de Nacimiento: <br><i>(No Explorer)</i></label> <input id="registrar_fechaNac" type="date" name="fechaNac"/> (*) <span class="error_no">Fecha Nacimiento</span>
                        <br> 
                        </div>
                        <div>
                        <label for="dropdown" class="rotulo">¿Qué eres?:</label> 
                        </div>
                        <div>                          
                            <select  id="dropdown"  onchange="evento(this);" name="tipoUsuario">
                                <option value="1" selected>C l i e n t e</option>
                                <option value="2">P r o v e  e d o r</option>
                            </select>(*)
                        </div> 
                        <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                        <br><br>

                        <%-- Comenzando a ocultar  --%>
                    </div>
                    <%-- el div lo oculto --%>

                    <div id='ver' style=' display: none ;'>
                        <h2>Datos Empresa</h2>
                        <div class="contenedor" >
                            <div>
                            <label for="registrar_nombreComp" class="rotulo">Nombre Compañia:</label> <input id="registrar_nombreComp" type="text" name="nombreComp"/><span class="error_no">Ingrese nombre Company</span>
                            <br>
                            </div>
                            <div>
                            <label for="registrar_URLweb" class="rotulo">Web:</label> <input id="registrar_URLweb" type="text" name="URLweb"/><span class="error_no">Ingrese URL Company</span>
                            </div>
                            <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                            <br><br>
 
                        </div>
                    </div>
                    (*) - Campos Obligatorios 
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

                    <div id="registrar_submit">            
                        <button type="submit" class="enviar">Enviar</button>
                    </div>
                    
                </form>
                    
            </div>
        </div>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="/media/jQuerys/RegisterUserValidate.js"></script>
    </body>
    <jsp:include page="/WEB-INF/template/footer.jsp"/>
    
</html>
