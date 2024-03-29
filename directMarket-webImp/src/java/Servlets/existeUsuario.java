/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//IMPORTS VIEJOS DEL PROYECTO ANTERIOR
/*
import Logica_Clases.Fabrica;
import Logica_Clases.IcontroladorCliente;
import Logica_Clases.IcontroladorProveedor;
*/
//IMPORTS VIEJOS DEL PROYECTO ANTERIOR

//NUEVOS IMPORTS
import ServicesProveedor.WsIProveedor;
import ServicesProveedor.WsIProveedorService;
import services.WsICliente;
import services.WsIClienteService;
//NUEVOS IMPORTS

/**
 *
 * @author Usuario
 */
public class existeUsuario extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        String nickName = request.getParameter("nick");
        
        WsIClienteService clienteServices = new WsIClienteService();
        WsICliente ICC = clienteServices.getWsIClientePort();
       
        WsIProveedorService ProveedorServices = new WsIProveedorService();
        WsIProveedor ICP = ProveedorServices.getWsIProveedorPort();

        /*
        Fabrica fabrica = Fabrica.getInstance();
        IcontroladorCliente ICC = fabrica.getControladorCliente();
        IcontroladorProveedor ICP = fabrica.getControladorProveedor();
        */
        try {
                
            if( (ICC.findCliente(nickName) != null) || ( ICP.findProveedor(nickName) != null ) ){
                out.println("1");
            }
            else{
                out.println("0");
            }
         
        } finally {
            out.close();
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
