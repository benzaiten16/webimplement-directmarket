/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import webService.Cliente;

/**
 *
 * @author guperez
 */
public class ICcliente {

    public void createCliente(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5) {
        webService.WsIclienteService service = new webService.WsIclienteService();
        webService.WsIcliente port = service.getWsIclientePort();
        port.createCliente(arg0, arg1, arg2, arg3, arg4, arg5);
    }

    public Cliente findCliente(java.lang.String arg0) {
        webService.WsIclienteService service = new webService.WsIclienteService();
        webService.WsIcliente port = service.getWsIclientePort();
        return port.findCliente(arg0);
    }

    public java.util.List<webService.Cliente> findClienteEntities() {
        webService.WsIclienteService service = new webService.WsIclienteService();
        webService.WsIcliente port = service.getWsIclientePort();
        return port.findClienteEntities();
    }

    
}
