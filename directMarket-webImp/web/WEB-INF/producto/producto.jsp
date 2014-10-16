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
                        <label class="rotulo" >Titulo: </label> <input type="text" name="tituloProducto" placeholder="ingresar Titulo..."> 
                        <br>
                        <label class="rotulo">Numero Referencia:</label> <input type="text" name="numRefProducto" placeholder="ingresar Numero de Referencia..."> 
                        <br>
                        <label class="rotulo">Descripción:</label><textarea class=textarea cols="60" rows="8" placeholder="ingresar Una descripción..."></textarea>
                        <br>
                        <label class="rotulo">Precio:</label> <input type="text" name="precio" placeholder="ingresar Precio...">
                        <br>
                    </div>
                    <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                    <br><br><br>
                    <label class="rotulo">Seleccione la(s) Categoria(s):</label>
                    <div class="contenedor">

                        <select  id="dropdown" name="catego">
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
                        
                            
                        <%--<button type="button" value="cat" onclick="javascript:add()" > + </button> --%>
                        
                        <button type="button" value="cat" onclick="add()" > + </button>

                    </div>
                    <br><br>
                    <table id="tabla">
                        <th>Categoria(s) Seleccionadas</th>
                    </table>

                    <%-- <% int i = 0;%> --%>
                    
                    
                    <%-- Funcion add() --%>
                    <script type="text/javascript">
                        function add() {
                            
                           var x = document.getElementById("dropdown");
                           
        
                        <%-- 
                        console.log($('#dropdown').val());
                            $('#dropdown').find(":selected").text();
                        --%>
                        };
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
</html>

