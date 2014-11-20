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
import webService.LineaOrden;
/**
 *
 * @author guperez
 */
public class IClineaOrden {

    private URL getParametros() throws MalformedURLException{
        try{
        Properties preferences = new Properties();
        FileInputStream in = new FileInputStream(System.getProperty("user.home")+"/configWebServices.ini");
        preferences.load(in);
        String host = preferences.getProperty("Host");
        String port = preferences.getProperty("Port");
        URL ubicacion= new URL("http://"+host+":"+port+"/ilineorden");
        return ubicacion;
        }
            catch(Exception ex){
              //URL ubicacion= new URL("http://localhost:8280/ilineorden");
              //return ubicacion;
                return null;
            }
    }
    
    public int intcreateLineaOrden(int arg0, float arg1, int arg2) throws MalformedURLException {
        webService.WsIlineaOrdenService service = new webService.WsIlineaOrdenService(this.getParametros());
        webService.WsIlineaOrden port = service.getWsIlineaOrdenPort();
        return port.intcreateLineaOrden(arg0, arg1, arg2);
    }

    public void createLineaOrden(int arg0, float arg1, int arg2) throws MalformedURLException {
        webService.WsIlineaOrdenService service = new webService.WsIlineaOrdenService(this.getParametros());
        webService.WsIlineaOrden port = service.getWsIlineaOrdenPort();
        port.createLineaOrden(arg0, arg1, arg2);
    }

    public LineaOrden findLineaOrden(int arg0) throws MalformedURLException {
        webService.WsIlineaOrdenService service = new webService.WsIlineaOrdenService(this.getParametros());
        webService.WsIlineaOrden port = service.getWsIlineaOrdenPort();
        return port.findLineaOrden(arg0);
    }

    public java.util.List<webService.LineaOrden> findLineaOrdenEntities() throws MalformedURLException {
        webService.WsIlineaOrdenService service = new webService.WsIlineaOrdenService(this.getParametros());
        webService.WsIlineaOrden port = service.getWsIlineaOrdenPort();
        return port.findLineaOrdenEntities();
    }
    
}
