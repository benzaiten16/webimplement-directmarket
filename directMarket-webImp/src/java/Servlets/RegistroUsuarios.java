/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//IMPORTS VIEJOS DEL PROYECTO ANTERIOR
/*
import Logica_Clases.Fabrica;
import Logica_Clases.IcontroladorCliente;
import Logica_Clases.IcontroladorProveedor;
*/
//IMPORTS VIEJOS DEL PROYECTO ANTERIOR

//NUEVOS IMPORTS
import services.WsICliente;
import services.WsIClienteService;
import ServicesProveedor.WsIProveedor;
import ServicesProveedor.WsIProveedorService;
//NUEVOS IMPORTS

/**
 *
 * @author Usuario
 */
public class RegistroUsuarios extends HttpServlet {

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
        
        HttpSession objSesion = request.getSession();
        //INFORMACION SOBRE EL USUARIO EN GRAL
        String nick = request.getParameter("nick");
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String fnac = request.getParameter("fechaNac");
        int TipoUsr = Integer.parseInt(request.getParameter("tipoUsuario"));
        
        //ESPECIALIZACION, EN CASO DE SER PROVEEDOR
        String nomCompania = request.getParameter("nombreComp");
        String URLweb = request.getParameter("URLweb");
        
        WsIClienteService clienteServices = new WsIClienteService();
        WsICliente ICC = clienteServices.getWsIClientePort();
       
        WsIProveedorService ProveedorServices = new WsIProveedorService();
        WsIProveedor ICP = ProveedorServices.getWsIProveedorPort();

        
        /*Fabrica fabrica = Fabrica.getInstance();
        IcontroladorCliente ICC = fabrica.getControladorCliente();
        IcontroladorProveedor ICP = fabrica.getControladorProveedor();
	*/
        try{
            if(TipoUsr == 1){
                ICC.createCliente(nick, nombre, apellido, fnac, password, mail);
                           request.getRequestDispatcher("/WEB-INF/usuarios/RegUsrOk.jsp").forward(request, response);
            }
            
            else{
                ICP.createProveedor(nomCompania, URLweb, nick, nombre, apellido, fnac, password, mail);
                          request.getRequestDispatcher("/WEB-INF/usuarios/RegUsrOk.jsp").forward(request, response);
            }
        
        }catch(Exception ex){
            request.getRequestDispatcher("/500").forward(request, response);
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
