<%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.StringTokenizer" %>


<%--NUEVOS IMPORTS--%>
<%@page import="Servlets.ICcliente"%>
<%--NUEVOS IMPORTS--%>


<!doctype html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Editar noticicaciones :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>
        
          <div id="inicio" class ="main">
              <h1>Editar notificaciones</h1>
              <br>
              
              
              <form action="desactivar-notificaciones" ACTION="POST">
                  
              <% String nickname = request.getAttribute("nick").toString();%>
              
              
              <label class="rotulo">Usuario:  </label> 
              <input id="nico" name="nico" value="<%=nickname%>" style="border-width:0;" >

              <br>
              <label class="rotulo">Notificaciones de Ordenes de Compra</label>
              <br>
              <select  id="notificacionesorden"  name="notificacionesorden" onchange="evento(this);">
                    <option value="1" selected> Recibir </option>
                    <option value="2"> No recibir </option>
              </select>
              <br>
              <label class="rotulo">Notificaciones de nuevos productos</label> 
              <select  id="notificacionesprod"  name="notificacionesprod" onchange="evento(this);">
                    <option value="1" selected> Recibir </option>
                    <option value="2"> No recibir </option>
              </select>
              <br>
              <br>
              <label class="rotulo">Confirma tu contraseña:</label> <br><input id="InputPasswd" type="password" name="password"/>
              <br> 
              
               <input class="con_margen" type="button"
                       value="E n t r a r" onclick="submit()"/>
            
           
                </form>
         </div>
                
    </body>
</html>