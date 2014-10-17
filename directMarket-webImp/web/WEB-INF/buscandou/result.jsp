<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/template/head.jsp"/>
        <title>Resultados de Busqueda :: DirectMarket</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp"/>
        <form action="search" method="get">
            <%-- TRAIGO el nombre --%>
            <% String nombre = (String) request.getSession().getAttribute("searchResult"); %>
            <% Boolean encontro = false; %>



            <% Fabrica fabrica = Fabrica.getInstance();  %>
            <% IcontroladorProducto ICPR = fabrica.getControladorProducto();
                List<Producto> ListaProducto;
                ListaProducto = ICPR.findProductoEntities();

            %>



            <div id="producto" class ="main">
                <center><h1>¡ Resultado(s) de Busqueda !</h1> </center>

                <div id="perfil_derecha"> 
                    <div>    <br><label class="valor"> Ordenar : </label>                      
                        <select  id="dropdown"  onchange="evento(this);" name="tipoUsuario">
                            <option value="1" selected>Alfabeticamente</option>
                            <option value="2">Precio</option>
                            <option value="3">Cantidad de Compras de cada Producto</option>
                        </select>
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

                </div> <%-- FIN de perfil-derecha --%>
                <div id="perfil_izquierda"> 
                    <h2>Lista de Productos</h2>    
                    

                    <%for (int i = 0; i < ListaProducto.size(); i++) {
                        
                    
                            String nProducto = ListaProducto.get(i).getNombre();

                            // Si coincide con una parte del Nombre del Producto --
                            if ((nProducto.toLowerCase().indexOf(nombre.toLowerCase()) != -1) || // ... O ...
                                    // Si coincide con una parte del Nombre del Proveedor --
                                    (ListaProducto.get(i).getproveedor().getNombre().toLowerCase().indexOf(nombre.toLowerCase()) != -1)) {
                                encontro = true;
                    %>
                            <label class="valor">  <a  href="verProducto?numref=<%=ListaProducto.get(i).getNumRef()%>"> <b> <%=ListaProducto.get(i).getNombre()%> </b></a></label>
                            <br>
                            <%} else {%> 
                                <%-- Entro a chequear todas las categorias a la q pertenece --%>
                                <%for (int j = 0; j < ListaProducto.get(j).getlistacategorias().size(); j++) {%>

                                <%if ((ListaProducto.get(j).getlistacategorias().get(j).getNombre().toLowerCase()).indexOf(nombre.toLowerCase()) != -1) {%>
                                    <label class="valor">  <a  href="verProducto?numref=<%=ListaProducto.get(i).getNumRef()%>"> <b> <%=ListaProducto.get(i).getNombre()%> </b> </a> </label><br/>
                                    <% encontro = true; %>
                                <%}%>

                                <%}  %>  <%-- Fin fro ListaCategoria --%>
                            <%}%> <%-- Fin else --%>

                    <%}//FIN FOR %>
                    
                    

                    <%-- ............. Si NO se encuentran coincidencias .............. --%>
                    <%
                        if (encontro == false) {%>
                        <center> <label class="valor"> <b>Ups! </b> No se ha encontrado ningún Producto.  </label> <br><br>
                            <img src="../../media/images/upsGato.jpg" /> </center>

                    <%  }%>

                </div><%-- FIN div izquierda --%>

            </div> <%-- FIN div main --%>


            <jsp:include page="/WEB-INF/template/footer.jsp"/>
        </form>
    </body>
</html>
