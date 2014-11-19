/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import webService.OrdenCompra;
/**
 *
 * @author guperez
 */
public class ICordenCompra {

    public void addLineaToOrdenCompra(int arg0, int arg1) {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService();
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        port.addLineaToOrdenCompra(arg0, arg1);
    }

    public void createOrdenCompra(int arg0, java.lang.String arg1, float arg2, java.lang.String arg3) {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService();
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        port.createOrdenCompra(arg0, arg1, arg2, arg3);
    }

    public int createOrdenCompra2(java.lang.String arg0, float arg1, java.lang.String arg2, webService.Estado arg3) {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService();
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        return port.createOrdenCompra2(arg0, arg1, arg2, arg3);
    }

    public void editOrdenCompra2(int arg0, java.lang.String arg1, float arg2, java.lang.String arg3, webService.Estado arg4, java.lang.String arg5, java.lang.String arg6) {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService();
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        port.editOrdenCompra2(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
    }

    public void eliminarOrdenCompra(int arg0) {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService();
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        port.eliminarOrdenCompra(arg0);
    }

    public OrdenCompra findOrdenCompra(int arg0) {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService();
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        return port.findOrdenCompra(arg0);
    }

    public java.util.List<webService.OrdenCompra> findOrdenCompraEntities() {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService();
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        return port.findOrdenCompraEntities();
    }

    public java.util.List<webService.LineaOrden> getListadoLineasXord(int arg0) {
        webService.WsIordenCompraService service = new webService.WsIordenCompraService();
        webService.WsIordenCompra port = service.getWsIordenCompraPort();
        return port.getListadoLineasXord(arg0);
    }
    
    
    
    
}
