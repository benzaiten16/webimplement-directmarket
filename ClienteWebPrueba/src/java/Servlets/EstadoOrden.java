/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webService.Estado;
import webService.OrdenCompra;
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

        response.setContentType("text/html;charset=UTF-8");

        //INFORMACION SOBRE EL ESTADO
        int tipoEst = Integer.parseInt(request.getParameter("estado"));
        int numOrden = Integer.parseInt(request.getParameter("numero"));
        
        System.out.println("-------> "+ numOrden +" <-------");
        
        
        //FECHA ACTUAL
        Date ahora = new Date();
        SimpleDateFormat formato_fecha = new SimpleDateFormat("dd-MM-yyyy-mm");
        String fecha = formato_fecha.format(ahora);

        //ORDEN
        ICordenCompra ICORDC = new ICordenCompra();
        
        
              
        
        try (PrintWriter out = response.getWriter()) {
            
            OrdenCompra or = ICORDC.findOrdenCompra(numOrden);
            
            if (tipoEst == 2){ //Si cambió el estado
            or.setEstado(Estado.CONFIRMADA);
            or.setFechaOrdenC(fecha);
            
            //como para redirigirlo a algun lugar
            request.getRequestDispatcher("/WEB-INF/usuarios/RegUsrOk.jsp").forward(request, response);
            
            }else{
                System.out.println("------- NO se cambió esl ESTADO -------");
            }
            
            
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
