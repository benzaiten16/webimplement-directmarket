<%@page import="java.util.List"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.Categoria"%>
<%@page import="Logica_Clases.IcontroladorCategoria"%>
<%@page import="Logica_Clases.IcontroladorProveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="/WEB-INF/errorPages/500.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page import="Logica_Clases.IcontroladorCliente"%>
<%@page import="java.util.StringTokenizer" %>

<!doctype html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Perfil :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>

        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCliente ICC = fabrica.getControladorCliente();%>
        <% IcontroladorProveedor ICP = fabrica.getControladorProveedor();%>
        <% IcontroladorCategoria ICCA = fabrica.getControladorCategoria();%>
        <% IcontroladorProducto ICPR = fabrica.getControladorProducto();
            List<Categoria> ListaCategoria;
            ListaCategoria = ICCA.findCategoriaEntities();%>
            



        <div id="producto" class ="main">
            <div id="perfil_derecha">
                <br><br><br><br><br><br>  
                <img src="media/images/gatos.png" alt="imagen"/>
            </div>

            <%-- Ingreso de Datos --%>
            <div id="perfil_izquierda">
                <form action="guardar" method="POST">
                    <div class="contenedor">
                        <h1>Direct Market</h1>
                        <h2>Datos Producto</h2>
                        <label class="rotulo">Titulo: </label> <input type="text" name="tituloProducto"> 
                        <br>
                        <label class="rotulo">Numero Referencia:</label> <input type="text" name="numRefProducto"> 
                        <br>
                        <label class="rotulo">Descripción:</label><textarea class=textarea cols="60" rows="8"></textarea>
                        <br>
                        <label class="rotulo">Precio:</label> <input type="password" name="passR">
                        <br>
                    </div>
                    <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                    <br><br><br>
                    <label class="rotulo">Seleccione la(s) Categoria(s):</label>
                    <div class="contenedor">
                        
                        <select  id="dropdown" name="catego" onchange="lolo(this);">
                            <%-- carga el select Box --%>
                            <option>Categorias</option>
                            <%
                                for (int i = 0; i < ListaCategoria.size(); i++) {
                                    Boolean tiene = ListaCategoria.get(i).getTieneProductos();
                                    //Si tiene productos me interesa mostrarlo
                                    if (tiene) {
                                        String ncategoria = ListaCategoria.get(i).getNombre();
                            %>
                            <option><%= ncategoria%>  </option>
                            <%
                                    }
                                }
                            %>
                            
                        </select>
                        <input type="button" value="+" >
                        
                    </div>
                           
                    <%-- Funcion add() --%>
                     <script type="text/javascript">
                         function lolo(lo){
                             
                             <% String lala = request.getParameter("dropdown") ; %>
                            <% out.println( lala ); %>
                            <% lala = getInitParameter("catego") ; %>
                            <% out.println( lala ); %>
                           request.getParameterValues('dropdown');
                             
                         }
                        if (request.getParameter("+") != null) {
                          myClass.function1();
                         } 
                    </script>  
                        
                    <br>
                    categoria1 <br> categoria2 <br> <i> (falta q cargue las categorias seleccionadas </i>
                    
                    <br><br><br>
                    <input type="submit" value="guardar">
                </form>


            </div>
        </div>            



        <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>z

