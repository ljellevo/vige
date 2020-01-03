package lib.support;

import lib.components.Page;
import js.html.WebSocket;

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