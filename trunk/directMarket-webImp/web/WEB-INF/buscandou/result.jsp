<%@page import="java.util.List"%>
<%@page import="Logica_Clases.Producto"%>
<%@page import="Logica_Clases.IcontroladorProducto"%>
<%@page import="Logica_Clases.Fabrica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <% Fabrica fabrica = Fabrica.getInstance();  %>
        <% IcontroladorProducto ICPR = fabrica.getControladorProducto();
            List<Producto> ListaProducto;
        %>

        <%-- ListaProducto = ICPR.findProductoEntities(); --%>

        <h1>Resultado(s) de Busqueda!</h1>

        <div id="producto" class ="main">
            <h1>Lista de Productos</h1>    


            <select  id="dropdown"  onchange="evento(this);">
                <option>Seleccione Producto</option>
                <%
                    String name = request.getParameter("search");
                    for (int i = 0; i < ListaProducto.size(); i++) {
                        String nProducto = ListaProducto.get(i).getNombre();
                        if (ICPR.findProducto2(name).equals(nProducto)) {

                %>
                <option><%= nProducto%>  </option>
                <%
                        }
                    }
                %>


            </select>
        </div>



    </body>
</html>
