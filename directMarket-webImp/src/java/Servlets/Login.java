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
import Servlets.exceptions.UsuarioNoEncontrado;

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
public class Login extends HttpServlet {

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
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        EstadoSesion nuevoEstado = null;
        
        WsIClienteService clienteServices = new WsIClienteService();
        WsICliente ICC = clienteServices.getWsIClientePort();
       
        WsIProveedorService ProveedorServices = new WsIProveedorService();
        WsIProveedor ICP = ProveedorServices.getWsIProveedorPort();
            
        /*Fabrica fabrica = Fabrica.getInstance();
        IcontroladorCliente ICC = fabrica.getControladorCliente();
        IcontroladorProveedor ICP = fabrica.getControladorProveedor();
	*/
        
        	try {
                // chequea contraseña
		    //Si no es cliente, entonces es proveedor distinto de null
                   //if(!request.getSession().getAttribute("estado_sesion").equals(EstadoSesion.NO_LOGIN)){
                    if( (ICC.findCliente(login) == null ) && ( ICP.findProveedor(login) != null ) ){
                        if(!ICP.findProveedor(login).getPassword().equals(password)){
				nuevoEstado = EstadoSesion.LOGIN_INCORRECTO;
                            }   
                        else {
				nuevoEstado = EstadoSesion.LOGIN_CORRECTO;
				// setea el usuario logueado
				request.getSession().setAttribute("usuario_logueado", ICP.findProveedor(login).getNickname());
			}
                   }
                   else if( (ICC.findCliente(login) != null ) && ( ICP.findProveedor(login) == null ) ){
                                if(!ICC.findCliente(login).getPassword().equals(password)){
				nuevoEstado = EstadoSesion.LOGIN_INCORRECTO;
                                }
                            else {
				nuevoEstado = EstadoSesion.LOGIN_CORRECTO;
				// setea el usuario logueado
				request.getSession().setAttribute("usuario_logueado", ICC.findCliente(login).getNickname());
			}
                   }
                   else{
                       	nuevoEstado = EstadoSesion.LOGIN_INCORRECTO;
		   }
                   
                }
              //}
                catch(Exception ex){
			nuevoEstado = EstadoSesion.NO_LOGIN;
		}
		 
        objSesion.setAttribute("estado_sesion", nuevoEstado);
		
		// redirige a la página principal para que luego rediriga a la página
		// que corresponde
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
        dispatcher.forward(request, response);
    }

    
    /**
	 * Devuelve el usuario logueado
	 * @param request
	 * @return
	 * @throws UsuarioNoEncontrado 
	 */
    
    
	static public String getUsuarioLogueado(HttpServletRequest request)
			throws UsuarioNoEncontrado
	{
         WsIClienteService clienteServices = new WsIClienteService();
         WsICliente ICC = clienteServices.getWsIClientePort();
       
         WsIProveedorService ProveedorServices = new WsIProveedorService();
         WsIProveedor ICP = ProveedorServices.getWsIProveedorPort();
        
         /*Fabrica fabrica = Fabrica.getInstance();
        IcontroladorCliente ICC = fabrica.getControladorCliente();
        IcontroladorProveedor ICP = fabrica.getControladorProveedor();
	*/
        
         try{
           if( (ICC.findCliente(request.getSession().getAttribute("usuario_logueado").toString()) != null )|| (ICP.findProveedor(request.getSession().getAttribute("usuario_logueado").toString()) != null)){
               return request.getSession().getAttribute("usuario_logueado").toString();
           }
        }catch(Exception ex){
            return null;
        } 
        return null;
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

