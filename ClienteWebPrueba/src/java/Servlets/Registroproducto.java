/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import Mail.javamail;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//IMPORTS VIEJOS DEL PROYECTO ANTERIOR
/*
import Logica_Clases.Fabrica;
import Logica_Clases.IcontroladorCategoria;
import Logica_Clases.IcontroladorProducto;
import Logica_Clases.IcontroladorProveedor;
import Logica_Clases.Proveedor;
*/
//IMPORTS VIEJOS DEL PROYECTO ANTERIOR

//NUEVOS IMPORTS
import webService.Proveedor;
//NUEVOS IMPORTS


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
        
        ICcategoria ICC = new ICcategoria();
        
        ICproveedor ICP = new ICproveedor();
        
        ICproducto ICPR = new ICproducto();
        
        /*
        WsIcategoriaService CategoriaServices = new WsIcategoriaService();
        WsIcategoria ICC = CategoriaServices.getWsIcategoriaPort();
        
        WsIproveedorService ProveedorServices = new WsIproveedorService();
        WsIproveedor ICP = ProveedorServices.getWsIproveedorPort();

        WsIproductoService ProductoServices = new WsIproductoService();
        WsIproducto ICPR = ProductoServices.getWsIproductoPort();
        */
        
        /*
        Fabrica fabrica = Fabrica.getInstance();
        IcontroladorProveedor ICP = fabrica.getControladorProveedor();
        IcontroladorProducto ICPR =fabrica.getControladorProducto();
        IcontroladorCategoria ICC=fabrica.getControladorCategoria();
	*/
        
        //PLANTEO MOMENTANEO.
        Proveedor prov = ICP.findProveedor(nick);
        
        try{
                ICPR.createProducto(numref, titulo, descripcion, especificaciones, precio, prov);
                //ASOCIO PRODUCTOS A CATEGORIAS Y VICEVERSA
                String Categoria = request.getParameter("cat");
                //System.out.println("Lo que viene en cat: "+ Categoria);
                StringTokenizer tokens=new StringTokenizer(Categoria, " ");
                while(tokens.hasMoreTokens()){
                    String cate=tokens.nextToken();
                    ICC.addProductoCategoria(cate,numref);
                    ICPR.asignarCate(numref,cate);
                }   
                //AGREGO PRODUCTO A SU PROVEEDOR
                ICP.addProductoProveedor(numref,nick);
                
                
                //ENVIO NOTIFICACIONES a todos los clientes que compraron productos de este proveedor
                ICcliente ICcli = new ICcliente();
                List<webService.Cliente> Listaclientes=ICcli.findClienteEntities();
                for (int i = 0; i < Listaclientes.size(); i++) {
                    try {
                    javamail mail = new javamail();
                    String cuerpo1="<label class=\"rotulo\"><b>Direct Market:</b></label><br><br><label>Estimado/a ";
                    String cuerpo2 =Listaclientes.get(i).getNombre() ;
                    String cuerpo3=", le informamos que el proveedor ";
                    String cuerpo34=nick;
                    String cuerpo35=" a publicado un nuevo producto el cual puede interesarle, por mas detalles ingrese en:</label>";        
                    String cuerpo4 ="<br><label> http://localhost:8080/verProducto?numref=";
                    String cuerpo5= Integer.toString(numref);
                    String cuerpo6="</label>";
                    String cuerpo7="<br><label>Saludos,</label><br><label> El equipo de Direct Market.</label>";
                    String cuerpo=cuerpo1+cuerpo2+cuerpo3+cuerpo34+cuerpo35+cuerpo4+cuerpo5+cuerpo6+cuerpo7;
                    //System.out.println(e.getMessage());
                    System.out.println(cuerpo);
                    String subject=Listaclientes.get(i).getMail();
                    mail.send(subject,"Direct Market",cuerpo);
                    
                    } catch (Exception e) {
                    System.out.println(e.getMessage());
                    }

                }            
                
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
