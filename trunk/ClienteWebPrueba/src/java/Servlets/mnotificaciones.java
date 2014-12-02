/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webService.Cliente;


public class mnotificaciones extends HttpServlet {

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
        String noto = request.getParameter("notificacionesorden");
        String notp = request.getParameter("notificacionesprod");
        String nick = request.getParameter("nico");
        String password = request.getParameter("password");
        boolean A=true;
        boolean B=true;
        EstadoSesion nuevoEstado = null;
        
        ICcliente ICC = new ICcliente();
        // chequea contraseña
	Cliente cli= ICC.findCliente(nick);
            if(cli.getPassword().equals(password)){
				nuevoEstado = EstadoSesion.LOGIN_CORRECTO;
                                request.getSession().setAttribute("usuario_logueado", cli.getNickname());
                                // redirige a la página principal para que luego rediriga a la página
                                objSesion.setAttribute("estado_sesion", nuevoEstado);
                                if (noto.equalsIgnoreCase("2")){
                                    B=false;
                                }
                                if (notp.equalsIgnoreCase("2")){
                                    A=false;
                                }
                                System.out.println(nick);
                                System.out.println(A);
                                System.out.println(B);
                                ICC.editCliente2(nick, A, B);
                                //
                                ICC=null;
                                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/usuarios/notOK.jsp");
                                dispatcher.forward(request, response);
            }
            else {
                
		nuevoEstado = EstadoSesion.NO_LOGIN;
		objSesion.setAttribute("estado_sesion", nuevoEstado);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
                                dispatcher.forward(request, response);
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
