package Servlets;


import java.io.FileInputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;
import webService.Exception_Exception;
import webService.NonexistentEntityException_Exception;
import webService.PreexistingEntityException_Exception;
import webService.Proveedor;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author guperez
 */
public class ICproveedor {

    private URL getParametros() throws MalformedURLException{
        try{
        Properties preferences = new Properties();
        FileInputStream in = new FileInputStream(System.getProperty("user.home")+"/configWebServices.ini");
        preferences.load(in);
        String host = preferences.getProperty("Host");
        String port = preferences.getProperty("Port");
        URL ubicacion= new URL("http://"+host+":"+port+"/iproveedor");
        return ubicacion;
        }
            catch(Exception ex){
             // URL ubicacion= new URL("http://localhost:8280/iproveedor");
              //return ubicacion;
            return null;
            }
    }
    
    public void removeProductoProveedor(int arg0, java.lang.String arg1) throws MalformedURLException {
        webService.WsIproveedorService service = new webService.WsIproveedorService(this.getParametros());
        webService.WsIproveedor port = service.getWsIproveedorPort();
        port.removeProductoProveedor(arg0, arg1);
    }

    public void addProductoProveedor(int arg0, java.lang.String arg1) throws NonexistentEntityException_Exception, Exception_Exception, MalformedURLException {
        webService.WsIproveedorService service = new webService.WsIproveedorService(this.getParametros());
        webService.WsIproveedor port = service.getWsIproveedorPort();
        port.addProductoProveedor(arg0, arg1);
    }

    public void createProveedor(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5, java.lang.String arg6, java.lang.String arg7) throws PreexistingEntityException_Exception, Exception_Exception, MalformedURLException {
        webService.WsIproveedorService service = new webService.WsIproveedorService(this.getParametros());
        webService.WsIproveedor port = service.getWsIproveedorPort();
        port.createProveedor(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    }

    public Proveedor findProveedor(java.lang.String arg0) throws MalformedURLException {
        webService.WsIproveedorService service = new webService.WsIproveedorService(this.getParametros());
        webService.WsIproveedor port = service.getWsIproveedorPort();
        return port.findProveedor(arg0);
    }

    public java.util.List<webService.Proveedor> findProveedorEntities() throws MalformedURLException {
        webService.WsIproveedorService service = new webService.WsIproveedorService(this.getParametros());
        webService.WsIproveedor port = service.getWsIproveedorPort();
        return port.findProveedorEntities();
    }

    
    
}
