/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Listeners;

import java.util.Vector;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author Guillermo
 */
public class ListenerVectorCodSel implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        Vector V = new Vector();
        
        event.getSession().setAttribute("codigos", V);
    }
    
    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        //No implementado aun
    }

 }
