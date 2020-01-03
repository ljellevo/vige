package lib.core;


import js.Browser;
import lib.components.Page;
import lib.support.StreamConnection;

class GlobalState {
    var streams: Array<StreamConnection> = [];

    public static var instance(default, null): GlobalState = new GlobalState();

    private function new() {}

    public function openStream(stream: StreamConnection) {
        trace("Added stream: " + stream.getSocket().url + " from page " + stream.getRoute());
        streams.push(stream);
    }

    public function closeAllStreams(){
        for(i in 0...streams.length) {
            trace("Removed stream: " + streams[i].getSocket().url + " from page " + streams[i].getRoute());
            //Remember to use correct status code when closing connection:
            //developer.mozilla.org/en-US/docs/Web/API/CloseEvent
            streams[i].getSocket().close(1000);
            streams = [];
        }
    }
}