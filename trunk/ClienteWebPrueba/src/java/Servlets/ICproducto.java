/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import webService.Producto;

/**
 *
 * @author guperez
 */
public class ICproducto {

    public void asignarCate(int arg0, java.lang.String arg1) {
        webService.WsIproductoService service = new webService.WsIproductoService();
        webService.WsIproducto port = service.getWsIproductoPort();
        port.asignarCate(arg0, arg1);
    }

    public void createProducto(int arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, float arg4, webService.Proveedor arg5) {
        webService.WsIproductoService service = new webService.WsIproductoService();
        webService.WsIproducto port = service.getWsIproductoPort();
        port.createProducto(arg0, arg1, arg2, arg3, arg4, arg5);
    }

    public void editProducto(int arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, float arg4, webService.Proveedor arg5) {
        webService.WsIproductoService service = new webService.WsIproductoService();
        webService.WsIproducto port = service.getWsIproductoPort();
        port.editProducto(arg0, arg1, arg2, arg3, arg4, arg5);
    }

    public Producto findProducto(int arg0) {
        webService.WsIproductoService service = new webService.WsIproductoService();
        webService.WsIproducto port = service.getWsIproductoPort();
        return port.findProducto(arg0);
    }

    public Producto findProducto2(java.lang.String arg0) {
        webService.WsIproductoService service = new webService.WsIproductoService();
        webService.WsIproducto port = service.getWsIproductoPort();
        return port.findProducto2(arg0);
    }

    public java.util.List<webService.Producto> findProductoEntities() {
        webService.WsIproductoService service = new webService.WsIproductoService();
        webService.WsIproducto port = service.getWsIproductoPort();
        return port.findProductoEntities();
    }
    
    
}
