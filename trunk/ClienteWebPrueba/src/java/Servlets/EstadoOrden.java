/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Mail.javamail;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webService.Estado;
import webService.Cliente;
import webService.OrdenCompra;
import webService.WsIcliente;
import webService.WsIclienteService;
import webService.WsIordenCompra;
import webService.WsIordenCompraService;

/**
 *
 * @author Benzaiten
 */
public class EstadoOrden extends HttpServlet {

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

        String numerr = (String) request.getSession().getAttribute("numero");
        
        HttpSession objSesion = request.getSession();
        
        //INFORMACION SOBRE EL ESTADO
        int tipoEst = Integer.parseInt(request.getParameter("estado"));
        int num = Integer.parseInt(numerr);
        
        //FECHA ACTUAL
        Date ahora = new Date();
        SimpleDateFormat formato_fecha = new SimpleDateFormat("dd-MM-yyyy-mm");
        String fecha = formato_fecha.format(ahora);

        //ORDEN
        ICordenCompra ICORDC = new ICordenCompra();
//    ICordenCompra ICORDC = new ICordenCompra();
//    OrdenCompra or = ICORDC.findOrdenCompra(num);
        
        
        //WsIordenCompra ordenServices = (WsIordenCompra) new WsIordenCompraService();
//        WsIordenCompra ordenServices = (WsIordenCompra) new WsIordenCompraService();
//        WsIordenCompra ICORDC = (WsIordenCompra) ordenServices.getListadoLineasXord(num);
        
        
        
        
        try (PrintWriter out = response.getWriter()) {
             String usr = Login.getUsuarioLogueado(request);
             request.setAttribute("usuario", usr);   
             
            //(int numeroOrdenCompra, String FechaOrden, float precioTotal, String Nickname, Estado estado, String fechaOrdenC, String fechaordenP)
            ICORDC.editOrdenCompra2(num, ICORDC.findOrdenCompra(num).getFechaOrden(), ICORDC.findOrdenCompra(num).getPrecioTotal(), usr , Estado.CONFIRMADA, fecha, ICORDC.findOrdenCompra(num).getFechaOrdenP());
            
//            or.setEstado(Estado.CONFIRMADA);
//            or.setFechaOrdenC(fecha);
            
            
            //Envio notificacion al cliente
            
            //Enviar el correo electronico
            
            javamail mail = new javamail();
            String cuerpo1="<label class=\"rotulo\"><b>Direct Market:</b></label><br><br><label>Estimado/a ";
            String cuerpo2 =usr ;
            String cuerpo3=", le informamos que su orden de compra número ";
            String cuerpo34=Integer.toString(num);
            String cuerpo35=" a sido modificada. Su estado es CONFIRMADA, por mas detalles puede consultar en: </label>";        
            String cuerpo4 ="<br><label> http://localhost:8080/verOrdenCompra?numero=";
            String cuerpo5= Integer.toString(num);
            String cuerpo6="</label>";
            String cuerpo7="<br><label>Saludos,</label><br><label> El equipo de Direct Market.</label>";
            String cuerpo=cuerpo1+cuerpo2+cuerpo3+cuerpo34+cuerpo35+cuerpo4+cuerpo5+cuerpo6+cuerpo7;
            System.out.println(cuerpo);
            
            //COnsulto datos del cliente
            ICcliente ICCLI = new ICcliente();
            String subject=ICCLI.findCliente(usr).getMail();
            //Si tiene las notificaciones activas le envia correo de notificacion.
            if (ICCLI.findCliente(usr).isNotificacionesO()){
            mail.send(subject,"Direct Market",cuerpo);
            }
            
                      
            
            //como para redirigirlo a algun lugar
            request.getRequestDispatcher("WEB-INF/ordenCompra/okCambioEstado.jsp").forward(request, response);
            ///WEB-INF/ordenCompra/okCambioEstado.jsp
            
            
            
        }catch(Exception ex) {
                response.sendRedirect("http://localhost:8080/home");
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
