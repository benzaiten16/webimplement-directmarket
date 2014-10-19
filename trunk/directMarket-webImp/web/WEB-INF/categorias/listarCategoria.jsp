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

    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">


        function evento(categoria) {
            console.log($('#cat').val());

            valor = categoria.value();

            $("#prod").load('http://localhost:8080/productos?categoria=DOS #principal');
        }


    </script> 

    

        <div class="contenedor">
            <h2>Categorias <i>(con productos)</i></h2> <br>


            <select  id="cat"  onchange="evento();">
                <option>Seleccione categoria</option>
                <%for (int i = 0; i < ListaCategoria.size(); i++) {
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
            <br><br><br><br>
            
            <%-- Los botones 
             
            
            
            <input type="image" src="../../media/images/box-md.png"  class="con_margen" onclick="submit();" />
            --%>




        </div>

        <div id="prod">

        </div> 
    


    <script type='text/javascript'>
        function evento() {
            var e = document.getElementById("cat");//toma el combobox
            var selGate = e.options[e.selectedIndex].value;//toma el valor seleccionado
            var Ajax = new XMLHttpRequest();
            var DIV_Destino = document.getElementById("prod");
            Ajax.open("GET", "http://localhost:8080/productos?categoria=" + selGate, true);// true = asincronico, no espera a que finalice
            Ajax.onreadystatechange = function () {
                if (Ajax.readyState == 4 && Ajax.status == 200) {
                    DIV_Destino.innerHTML = Ajax.responseText;
                }
            }
            Ajax.send();

        }
    </script> 
    <div id="prod">
        <%-- ACA se carga el resultado con AJAX --%>

    </div>
</div>

