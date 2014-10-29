/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import Logica_Clases.Fabrica;
import Logica_Clases.IcontroladorCategoria;
import Logica_Clases.IcontroladorProducto;
import Logica_Clases.IcontroladorProveedor;
import Logica_Clases.Proveedor;
import Servlets.exceptions.UsuarioNoEncontrado;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Roxio
 */
public class Registroproducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws Servlets.exceptions.UsuarioNoEncontrado
     */
    //@throws Servlets.exceptions.UsuarioNoEncontrado;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
    
        HttpSession objSesion = request.getSession();
        //OBTENER USUARIO- DEBE SER PROVEEDOR
        String usr=null;
        try {
             usr = Login.getUsuarioLogueado(request);
             request.setAttribute("usuario", usr);
         }catch(Exception ex) {
                response.sendRedirect("http://localhost:8080/home");
             }
        
        if (usr==null){
        response.sendRedirect("http://localhost:8080/home");
                }
        else {
                //Datos producto
        int numref = Integer.parseInt(request.getParameter("numref"));
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("DescripcionProducto");
        String especificaciones = request.getParameter("especificaciones");
        float precio = Float.parseFloat(request.getParameter("precio"));
        //Leo dato de la sesion usr
        String nick = usr;        
        Fabrica fabrica = Fabrica.getInstance();
        IcontroladorProveedor ICP = fabrica.getControladorProveedor();
        IcontroladorProducto ICPR =fabrica.getControladorProducto();
        IcontroladorCategoria ICC=fabrica.getControladorCategoria();
	Proveedor prov = ICP.findProveedor(nick);
        try{
                ICPR.createProducto(numref, titulo, descripcion, especificaciones, precio, prov);
                //ASOCIO PRODUCTOS A CATEGORIAS Y VICEVERSA
                String Categoria = request.getParameter("cat");
                StringTokenizer tokens=new StringTokenizer(Categoria, " ");
                while(tokens.hasMoreTokens()){
                    String cate=tokens.nextToken();
                    ICC.addProductoCategoria(cate,numref);
                    ICPR.asignarCate(numref,cate);
                }   
                //AGREGO PRODUCTO A SU PROVEEDOR
                ICP.addProductoProveedor(numref,nick);
                //LO REDIRIGO A VER DETALLES PRODUCTO
                request.setAttribute("usuario", nick);
                request.getSession().setAttribute("estado_sesion", EstadoSesion.LOGIN_CORRECTO);
                response.sendRedirect("http://localhost:8080/verProducto?numref="+numref);
        }catch(Exception ex){
            request.getRequestDispatcher("/500").forward(request, response);
            }
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
