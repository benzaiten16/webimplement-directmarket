/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import Mail.javamail;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
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
import webService.Cliente;
import webService.OrdenCompra;
import webService.LineaOrden;
import webService.Producto;
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
        
        ICordenCompra ICOC= new ICordenCompra();
        
        IClineaOrden ICLO= new IClineaOrden();
        
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
 
                //Obtengo todas las ordenes
                List<webService.OrdenCompra > ListaOrdenes=ICOC.findOrdenCompraEntities();
                System.out.println("El total de ordenes de compra es:");
                System.out.println(ListaOrdenes.size());
                //3-Genero un listado de clientes para mandar correos
                List<webService.Cliente> clientesmail = new ArrayList<webService.Cliente>();
                
                //Recorro las ordenes.
                
                for (int i = 0; i < ListaOrdenes.size(); i++){
                    List <webService.LineaOrden> lineas=ICOC.getListadoLineasXord(ListaOrdenes.get(i).getNumero());
                    System.out.println("Esta orden tiene esta cantidad de lineas:");
                    System.out.println(lineas.size());
                    int x=0;
                    while (x<lineas.size()){
                        System.out.println("ENTRA EN EL WHILE");
                        if (lineas.get(x).getP().getProveedor().getNickname().equals(prov.getNickname())){
                             System.out.println("entra en el contains");
                            //Agrego al cliente al listado de clientes para mandar el correo
                            boolean yaagregado;
                            yaagregado=false; 
                            int y=0;
                            while (y < clientesmail.size()){
                                if (clientesmail.get(y).getNickname().equals(ListaOrdenes.get(i).getCliente().getNickname())){
                                    yaagregado=true;
                                    y=clientesmail.size();
                                }
                                else{
                                y=y+1;
                                }
                                
                            }
                            if (yaagregado==false){
                                clientesmail.add(ListaOrdenes.get(i).getCliente());
                                
                            }
                            x=lineas.size();
                            }
                        else{
                        System.out.println("entra en el else");    
                        x=x+1;
                        }      
                    }
                }
                System.out.println("El total de clientesmail es:");
                System.out.println(clientesmail.size());
                
                               
                for (int i = 0; i < clientesmail.size(); i++) {

                    try {
                    javamail mail = new javamail();
                    String cuerpo1="<label class=\"rotulo\"><b>Direct Market:</b></label><br><br><label>Estimado/a ";
                    String cuerpo2 =clientesmail.get(i).getNombre() ;
                    String cuerpo3=", le informamos que el proveedor ";
                    String cuerpo4=nick;
                    String cuerpo5=" a publicado un nuevo producto el cual puede interesarle, por mas detalles ingrese en:</label>";        
                    String cuerpo6 ="<br><label> http://localhost:8080/verProducto?numref=";
                    String cuerpo7= Integer.toString(numref);
                    String cuerpo8="</label>";
                    String cuerpo9="<label> Para no recibir mas este correo electronico ingrese en:";
                    String cuerpo10 ="<br><label> http://localhost:8080/notificaciones?nick=";
                    String cuerpo11= clientesmail.get(i).getNickname();
                    String cuerpo12="<br></label>";
                    String cuerpo13="<br><label>Saludos,</label><br><label> El equipo de Direct Market.</label>";
                    String cuerpo=cuerpo1+cuerpo2+cuerpo3+cuerpo4+cuerpo5+cuerpo6+cuerpo7+cuerpo8+cuerpo9+cuerpo10+cuerpo11+cuerpo12+cuerpo13;
   
                    System.out.println(cuerpo);
                    String subject=clientesmail.get(i).getMail();
                    System.out.println(clientesmail.get(i).isNotificaciones());
                    if (clientesmail.get(i).isNotificaciones()){
                    mail.send(subject,"Direct Market",cuerpo);
                    }
                    
                    
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
