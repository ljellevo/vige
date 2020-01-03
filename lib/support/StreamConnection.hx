package lib.support;

import lib.components.Page;
import js.html.WebSocket;

class StreamConnection{
    var page: Page;
    var socket: WebSocket;
    

    public function new(url: String, page: Page) {
        socket = new WebSocket(url);
        this.page = page;
    }

    public function getPage(): Page {
        return page;
    }

    public function getSocket(): WebSocket {
        return socket;
    }
}