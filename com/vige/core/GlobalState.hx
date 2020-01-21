package com.vige.core;

import com.vige.components.*;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.akifox.asynchttp.HttpRequest;
/*
import lib.support.Widget;

import lib.support.StreamConnection;
*/
class GlobalState {
    var streams: Array<StreamConnection> = [];
    var connections: Array<HttpRequest> = [];
    var navbar: Widget;

    public static var instance(default, null): GlobalState = new GlobalState();

    private function new() {}

    public function openStream(stream: StreamConnection) {
        streams.push(stream);
    }

    public function closeAllStreams(){
        for(i in 0...streams.length) {
            //Remember to use correct status code when closing connection:
            //developer.mozilla.org/en-US/docs/Web/API/CloseEvent
            streams[i].getSocket().close(1000);
            streams = [];
        }
    }

    
    public function openConnection(connection: HttpRequest) {
        connections.push(connection);
    }


    public function isConnectionOpen(url: String): Bool{
        for(i in 0...connections.length) {
            if(connections[i].url.toString() == url){
                return true;
            }
        }
        return false;
    }

    public function removeConnection(url: String): HttpRequest {
        for(i in 0...connections.length) {
            if(connections[i].url.toString() == url){
                return connections.splice(i, 0)[0];
            }
        }
        return null;
    }
    
}