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
        <script src="/js/prototype.js" type="text/javascript"></script>  
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

        <div id="registrar" class ="main">
            <div id="perfil_derecha">
                <br><br><br><br><br><br>  
                <img src="media/images/gatos.png" alt="imagen"/>
            </div>

            <%-- Ingreso de Datos --%>
            <div id="perfil_izquierda">
                <form id="registrar" action="registro-producto" method="POST">
                    <div class="contenedor" id="dproducto">
                        <h1>Direct Market</h1>
                        <h2>Datos Producto</h2>
                        <div>
                        <label for="registrar_titulo" class="rotulo">Titulo:</label> <input id="registrar_titulo" placeholder="Ingrese titulo" type="text" name="titulo"></input> (*) <span class="error_no">Titulo invalido</span>
                        <br>
                        </div>
                        <br>
                        <div>
                        <label for="registrar_numref" class="rotulo">Numero Referencia:</label> <input id="registrar_numref" placeholder="ingresar Numero de Referencia..." type="text" name="numRefProducto" ></input> (*) <span class="error_no">Numero invalido</span> 
                        <br>
                        </div>
                        <label class="rotulo">Descripción:</label> <input type="text" name="DescripcionProducto" placeholder="ingresar breve descripción"> 
                        <br>
                        <label class="rotulo">Especificaciones:</label><textarea class=textarea cols="60" rows="8" placeholder="ingresar especifiaciones..."></textarea>
                        <br>
                        <label class="rotulo">Precio:</label> <input type="text" name="precio" placeholder="ingresar Precio...">
                        <br>
                    </div>
                    <label class="divisor">- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </label>
                    <br><br><br>
                    <label class="rotulo">Seleccione la(s) Categoria(s):</label>
                    <div class="contenedor">
                         <select  id="cate" name="catego">
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
                    <script type='text/javascript'>
                        function agregarcat(){
                            var tbl = document.getElementById("tblcategoria");
                            var lastRow = tbl.rows.length;
                            var row = tbl.insertRow(lastRow);
                            var valor = row.insertCell(0);
                            var elemento = document.getElementById("cate");//toma el combobox
                            var catseleccionada = elemento.options[elemento.selectedIndex].value;//toma el valor seleccionado
                            valor.innerHTML = catseleccionada;
                        }
                    </script>
                    <button type="button" value="cat" onclick="agregarcat()" > + </button>
                    </div>
                        <br><br>
                        <table id="tblcategoria">
                            <th>Categoria(s) Seleccionadas:</th>
                        </table>
                        <br><br>
                    <div id="registrar_submit">
                        <button type="submit">Guardar</button>
                    </div>     
                </form>
                            
                            
                            
                            
            </div>
                          
        </div>            

    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="/media/jQuerys/RegistrerproductoValidate.js"></script>
    <jsp:include page="/WEB-INF/template/footer.jsp"/>
    </body>
</html>

