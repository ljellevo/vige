package com.vige.support;

import js.html.WebSocket;
import com.vige.components.*;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;

/*
import lib.components.Page;
import js.html.WebSocket;
*/

class StreamConnection{
    var route: String;
    var socket: WebSocket;
    

    public function new(url: String, route: String) {
        socket = new WebSocket(url);
        this.route = route;
    }

    public function getRoute(): String {
        return route;
    }

    public function getSocket(): WebSocket {
        return socket;
    }
}