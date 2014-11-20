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
import webService.Cliente;

/**
 *
 * @author guperez
 */
public class ICcliente {

    private URL getParametros() throws MalformedURLException{
        try{
        Properties preferences = new Properties();
        FileInputStream in = new FileInputStream(System.getProperty("user.home")+"/configWebServices.ini");
        preferences.load(in);
        String host = preferences.getProperty("Host");
        String port = preferences.getProperty("Port");
        URL ubicacion= new URL("http://"+host+":"+port+"/icliente");
        return ubicacion;
        }
            catch(Exception ex){
              //URL ubicacion= new URL("http://localhost:8280/icliente");
              //return ubicacion;
                return null;
            }
    }

    
    public void createCliente(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5) throws MalformedURLException {
        webService.WsIclienteService service = new webService.WsIclienteService(this.getParametros());
        webService.WsIcliente port = service.getWsIclientePort();
        port.createCliente(arg0, arg1, arg2, arg3, arg4, arg5);
    }

    public Cliente findCliente(java.lang.String arg0) throws MalformedURLException {
        webService.WsIclienteService service = new webService.WsIclienteService(this.getParametros());
        webService.WsIcliente port = service.getWsIclientePort();
        return port.findCliente(arg0);
    }

    public java.util.List<webService.Cliente> findClienteEntities() throws MalformedURLException {
        webService.WsIclienteService service = new webService.WsIclienteService(this.getParametros());
        webService.WsIcliente port = service.getWsIclientePort();
        return port.findClienteEntities();
    }

    
}
