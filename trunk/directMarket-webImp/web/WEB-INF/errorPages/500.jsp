<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="media/styles/main.css">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-language" content="es" />
    <link href="media/images/faviconn.ico" rel="icon" type="image/x-icon" />
    <link href="media/images/faviconn.ico" rel="shortcut icon" />
    <title>Error interno en el Servidor :: Direct Market</title>
    
</head>
<body id="error_page">
    <div id="body-container">
        <div class="gameover">500: R.I.P</div>

        <p>Ocurrió un error al procesar la página. Puedes intentar recargar o 
        <a href="/">volver</a> al inicio.
        </p>
    
        <div id="dead_mario"></div>
        <div class="main">
            <pre><%= exception.getClass().getName() %>: <%= exception.getMessage() %>
<% for(StackTraceElement ste: exception.getStackTrace()){ %><%= ste.toString() %>
<% } %></pre>
        </div>
    </div>
</body>
</html>
