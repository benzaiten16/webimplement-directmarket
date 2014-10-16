<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Categoria"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.IcontroladorCategoria"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!-- referencia al CSS maestro -->
<link rel="stylesheet" type="text/css" href="media/styles/main.css">

<!-- para el icono de la página -->
<link href="media/images/favicon.ico" rel="icon" type="image/x-icon" />
<link href="media/images/favicon.ico" rel="shortcut icon" />
        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorCategoria ICC = fabrica.getControladorCategoria();%>
        <% IcontroladorProducto ICP = fabrica.getControladorProducto();
        List<Categoria> ListaCategoria;
        ListaCategoria = ICC.findCategoriaEntities();%>

<div id="listarCategorias" >

    <div id="perfil_izquierda">

        <div class="contenedor">
            <h2>Categorias <i>(con productos)</i></h2> <br>
            
            <select  id="cat"  onchange="evento(this);">
                <option>Seleccione categoria</option>
                <%for(int i = 0; i < ListaCategoria.size(); i++) {
                    Boolean tiene = ListaCategoria.get(i).getTieneProductos();
                    //Si tiene productos me interesa mostrarlo
                    if (tiene){
                        String ncategoria = ListaCategoria.get(i).getNombre();
                        %>
                        <option><%= ncategoria %>  </option>
                        <%
                    }
                }
                %>
             </select>
             <br><br><br><br>
     
 
            <%--<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">
                     
                        
                        function evento(categoria) {
                            
                            valor= categoria.value();
                            $("#prod").load('http://localhost:8080/productos?categoria=DOS #principal');
                            }
             
                
            </script> 
            --%>
    </div>
            <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">
            $("#prod").load('http://localhost:8080/productos?categoria=DOS #principal');
            <%--$.ajax({
            url: 'http://localhost:8080/productos?categoria=DOS',
            success:function(response){
            $("#prod").html(response);
            },error:function(){
        `   alert("error");}
            });
            --%>
            </script> 
            <div id="prod">
                
            </div> 
            </div>
              
<%--esto se va a ir--%>             
<%--<jsp:include page="/WEB-INF/producto/listarProductos.jsp"/>      --%>        
</div>