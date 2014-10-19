<%-- 
    Document   : InicieSesion
    Created on : 19/10/2014, 05:35:26 PM
    Author     : Guillermo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/template/head.jsp"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ups, problemas :Direct Market</title>
    </head>
    <body>

        <div class="main">

            <div id="perfil_izquierda">
                <h2>Usted debera iniciar sesion para realizar dicha accion </h2> 
                <br>
                <h1>Saludos; Equipo de Direct Market!</h1>
            </div>

            <div id="perfil_derecha">
                <img id="pantera" src="../../media/images/StopSign.png" alt="Stop Sign"/> 
            </div>

            <br><br><br><br>
            <p>Volver a <a href="/home">Iniciar Sesion</a></p>
        </div>
    </body>
</html>