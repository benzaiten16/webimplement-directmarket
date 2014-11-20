/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.FileInputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;
import webService.Producto;

/**
 *
 * @author guperez
 */
public class ICproducto {

    private URL getParametros() throws MalformedURLException{
        try{
        Properties preferences = new Properties();
        FileInputStream in = new FileInputStream(System.getProperty("user.home")+"/configWebServices.ini");
        preferences.load(in);
        String host = preferences.getProperty("Host");
        String port = preferences.getProperty("Port");
        URL ubicacion= new URL("http://"+host+":"+port+"/iproducto");
        return ubicacion;
        }
            catch(Exception ex){
              //URL ubicacion= new URL("http://localhost:8280/iproducto");
              //return ubicacion;
                return null;
            }
    }
    
    public void asignarCate(int arg0, java.lang.String arg1) throws MalformedURLException {
        webService.WsIproductoService service = new webService.WsIproductoService(this.getParametros());
        webService.WsIproducto port = service.getWsIproductoPort();
        port.asignarCate(arg0, arg1);
    }

    public void createProducto(int arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, float arg4, webService.Proveedor arg5) throws MalformedURLException {
        webService.WsIproductoService service = new webService.WsIproductoService(this.getParametros());
        webService.WsIproducto port = service.getWsIproductoPort();
        port.createProducto(arg0, arg1, arg2, arg3, arg4, arg5);
    }

    public void editProducto(int arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, float arg4, webService.Proveedor arg5) throws MalformedURLException {
        webService.WsIproductoService service = new webService.WsIproductoService(this.getParametros());
        webService.WsIproducto port = service.getWsIproductoPort();
        port.editProducto(arg0, arg1, arg2, arg3, arg4, arg5);
    }

    public Producto findProducto(int arg0) throws MalformedURLException {
        webService.WsIproductoService service = new webService.WsIproductoService(this.getParametros());
        webService.WsIproducto port = service.getWsIproductoPort();
        return port.findProducto(arg0);
    }

    public Producto findProducto2(java.lang.String arg0) throws MalformedURLException {
        webService.WsIproductoService service = new webService.WsIproductoService(this.getParametros());
        webService.WsIproducto port = service.getWsIproductoPort();
        return port.findProducto2(arg0);
    }

    public java.util.List<webService.Producto> findProductoEntities() throws MalformedURLException {
        webService.WsIproductoService service = new webService.WsIproductoService(this.getParametros());
        webService.WsIproducto port = service.getWsIproductoPort();
        return port.findProductoEntities();
    }

    public  java.util.List<webService.Categoria> getListadoCategoriasXprod(int arg0) throws MalformedURLException {
        webService.WsIproductoService service = new webService.WsIproductoService(this.getParametros());
        webService.WsIproducto port = service.getWsIproductoPort();
        return port.getListadoCategoriasXprod(arg0);
    }
    
    
}
