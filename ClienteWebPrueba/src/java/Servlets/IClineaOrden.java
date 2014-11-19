/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import webService.LineaOrden;
/**
 *
 * @author guperez
 */
public class IClineaOrden {

    public int intcreateLineaOrden(int arg0, float arg1, int arg2) {
        webService.WsIlineaOrdenService service = new webService.WsIlineaOrdenService();
        webService.WsIlineaOrden port = service.getWsIlineaOrdenPort();
        return port.intcreateLineaOrden(arg0, arg1, arg2);
    }

    public void createLineaOrden(int arg0, float arg1, int arg2) {
        webService.WsIlineaOrdenService service = new webService.WsIlineaOrdenService();
        webService.WsIlineaOrden port = service.getWsIlineaOrdenPort();
        port.createLineaOrden(arg0, arg1, arg2);
    }

    public LineaOrden findLineaOrden(int arg0) {
        webService.WsIlineaOrdenService service = new webService.WsIlineaOrdenService();
        webService.WsIlineaOrden port = service.getWsIlineaOrdenPort();
        return port.findLineaOrden(arg0);
    }

    public java.util.List<webService.LineaOrden> findLineaOrdenEntities() {
        webService.WsIlineaOrdenService service = new webService.WsIlineaOrdenService();
        webService.WsIlineaOrden port = service.getWsIlineaOrdenPort();
        return port.findLineaOrdenEntities();
    }
    
}
