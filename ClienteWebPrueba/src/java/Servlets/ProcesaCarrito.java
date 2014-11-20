/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webService.Estado;

/**
 *
 * @author Usuario
 */
public class ProcesaCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
try {
    String usr = Login.getUsuarioLogueado(request);
    //String usr="GUIPECEA";
    //System.out.println(request.getSession().getAttribute("usuario_logueado").toString()+" <---ES EL USUARIO");
    request.setAttribute("usuario_logueado", usr);
    //request.getRequestDispatcher("/WEB-INF/errorPages/PaginaEnConstruccion.jsp").forward(request, response);
        
    //OBTENGO ARRAYS DE AQUELLOS SELECCIONADOS
    float total=0;
    
    IClineaOrden ICLORD= new IClineaOrden();
    ICordenCompra ICORDC = new ICordenCompra();
    
    String [] numReferencia = request.getParameterValues("numRef");
    String [] precioCompra = request.getParameterValues("precio");
    String [] cantidad = request.getParameterValues("Cantidad");
    
    Date ahora = new Date();
    SimpleDateFormat formato_fecha= new SimpleDateFormat("dd-MM-yyyy-mm");
    String fecha = formato_fecha.format(ahora);
    
    //PARA SACAR EL TOTAL DE LA ORDEN
    for(int i=0; i<numReferencia.length; i++){
        
        int cantActual = Integer.parseInt(cantidad[i]);
    
        float precioCompraAct = Float.parseFloat(precioCompra[i]);
    
        //total+=precioCompraAct*cantActual;
        total=total+(precioCompraAct*cantActual);
    }
    
    int numOrdenCom = ICORDC.createOrdenCompra2(fecha, total, usr , Estado.RECIBIDA);
    
    //System.out.println("SEGUNDO FOR LUEGO DE CREAR LA ORDEN");
    for(int i=0; i<numReferencia.length; i++){
        
        int prodActual = Integer.parseInt(numReferencia[i]);
        int cantActual = Integer.parseInt(cantidad[i]);
        float precioCompraAct = Float.parseFloat(precioCompra[i]);
        total+=precioCompraAct*cantActual;
        int numLinea = ICLORD.intcreateLineaOrden(cantActual, precioCompraAct, prodActual);
        
        ICORDC.addLineaToOrdenCompra(numOrdenCom, numLinea);
        
    }                    
    
    request.getRequestDispatcher("/WEB-INF/errorPages/OrdenCompraOk.jsp").forward(request, response);                  

    }catch(Exception ex){
    // no existe el usuario, se trata como deslogueado
        request.getSession().setAttribute("estado_sesion", EstadoSesion.NO_LOGIN);
        request.getRequestDispatcher("/WEB-INF/errorPages/InicieSesion.jsp").forward(request, response);
    }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
