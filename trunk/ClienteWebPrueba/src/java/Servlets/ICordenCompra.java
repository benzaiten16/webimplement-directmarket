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
import webService.OrdenCompra;
/**
 *
 * @author guperez
 */
public class ICordenCompra {

    private URL getParametros() throws MalformedURLException{
        try{
        Properties preferences = new Properties();
        FileInputStream in = new FileInputStream(System.getProperty("user.home")+"/configWebServices.ini");
        preferences.load(in);
        String host = preferences.getProperty("Host");
        String port = preferences.getProperty("Port");
        URL ubicacion= new URL("http://"+host+":"+port+"/iordencompra");
        return ubicacion;
        }
            catch(Exception ex){
              //URL ubicacion= new URL("http://localhost:8280/iordencompra");
              //return ubicacion;
                return null;
            }
    }
    
    public void addLineaToOrdenCompra(int arg0, int arg1) throws MalformedURLException {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService(this.getParametros());
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        port.addLineaToOrdenCompra(arg0, arg1);
    }

    public void createOrdenCompra(int arg0, java.lang.String arg1, float arg2, java.lang.String arg3) throws MalformedURLException {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService(this.getParametros());
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        port.createOrdenCompra(arg0, arg1, arg2, arg3);
    }

    public int createOrdenCompra2(java.lang.String arg0, float arg1, java.lang.String arg2, webService.Estado arg3) throws MalformedURLException {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService(this.getParametros());
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        return port.createOrdenCompra2(arg0, arg1, arg2, arg3);
    }

    public void editOrdenCompra2(int arg0, java.lang.String arg1, float arg2, java.lang.String arg3, webService.Estado arg4, java.lang.String arg5, java.lang.String arg6) throws MalformedURLException {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService(this.getParametros());
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        port.editOrdenCompra2(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
    }

    public void eliminarOrdenCompra(int arg0) throws MalformedURLException {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService(this.getParametros());
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        port.eliminarOrdenCompra(arg0);
    }

    public OrdenCompra findOrdenCompra(int arg0) throws MalformedURLException {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService(this.getParametros());
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        return port.findOrdenCompra(arg0);
    }

    public java.util.List<webService.OrdenCompra> findOrdenCompraEntities() throws MalformedURLException {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService(this.getParametros());
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        return port.findOrdenCompraEntities();
    }

    public java.util.List<webService.LineaOrden> getListadoLineasXord(int arg0) throws MalformedURLException {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService(this.getParametros());
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        return port.getListadoLineasXord(arg0);
    }
    
    
    
    
}
