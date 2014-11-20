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
import webService.Categoria;

/**
 *
 * @author guperez
 */
public class ICcategoria {
    
    private URL getParametros() throws MalformedURLException{
        try{
        Properties preferences = new Properties();
        FileInputStream in = new FileInputStream(System.getProperty("user.home")+"/configWebServices.ini");
        preferences.load(in);
        String host = preferences.getProperty("Host");
        String port = preferences.getProperty("Port");
        URL ubicacion= new URL("http://"+host+":"+port+"/icategoria");
        return ubicacion;
        }
            catch(Exception ex){
              //URL ubicacion= new URL("http://localhost:8280/icategoria");
              //return ubicacion;
                return null;
            }
    }

    public  void removeProductoCategoria(java.lang.String arg0, int arg1) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        port.removeProductoCategoria(arg0, arg1);
    }

    public void addCatHijaToCatPadre(java.lang.String arg0, java.lang.String arg1) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        port.addCatHijaToCatPadre(arg0, arg1);
    }

    public void addProductoCategoria(java.lang.String arg0, int arg1) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        port.addProductoCategoria(arg0, arg1);
    }

    public void createCategoria(java.lang.String arg0, boolean arg1) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        port.createCategoria(arg0, arg1);
    }

    public void createCategoriacpadre(java.lang.String arg0, java.lang.String arg1, boolean arg2) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        port.createCategoriacpadre(arg0, arg1, arg2);
    }

    public void editCategoria(java.lang.String arg0) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        port.editCategoria(arg0);
    }

    public Categoria findCategoria(java.lang.String arg0) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        return port.findCategoria(arg0);
    }

    public boolean getTieneProd(java.lang.String arg0) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        return port.getTieneProd(arg0);
    }

    public  java.util.List<webService.Categoria> findCategoriaEntities() throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        return port.findCategoriaEntities();
    }

    public  java.util.List<webService.Producto> getListadoProductosXcat(java.lang.String arg0) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        return port.getListadoProductosXcat(arg0);
    }

    public  java.util.List<webService.Producto> getListadoCategoriaXcate(java.lang.String arg0) throws MalformedURLException {
        webService.WsIcategoriaService service = new webService.WsIcategoriaService(this.getParametros());
        webService.WsIcategoria port = service.getWsIcategoriaPort();
        return port.getListadoCategoriaXcate(arg0);
    }

    
    

}
