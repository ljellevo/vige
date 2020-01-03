package lib.core;


import js.Browser;
import lib.components.Page;
import lib.support.StreamConnection;

class GlobalState {
    var streams: Array<StreamConnection> = [];
    var routeHistory: Array<String> = [];

    public static var instance(default, null): GlobalState = new GlobalState();

    private function new() {}


    public function openStream(stream: StreamConnection) {
        trace("Added stream: " + stream.getSocket().url + " from page " + stream.getRoute());
        streams.push(stream);
    }

    public function closeAllStreams(){
        for(i in 0...streams.length) {
            streams[i].getSocket().close();
            streams = [];
        }
    }

/*
    //Closes all streams on a page
    public function closeAllStreamsOnPage(route: String){
        for(i in 0...streams.length) {
            if(streams[i].getRoute() == route){
                trace("Closed stream: " + streams[i].getSocket().url);
                var stream = streams.splice(i, 0);
                stream[0].getSocket().close();
            }
        }
    }

    public function closeAllStreamsOnPreviousRoute() {
        trace("Current URL: " + Browser.location.pathname);
        closeAllStreamsOnPage(routeHistory[routeHistory.length - 2]);
    }

    public function closeAllStreamsWithURL(url: String){
        for(i in 0...streams.length) {
            if(streams[i].getSocket().url == url){
                var stream = streams.splice(i, 0);
                stream[0].getSocket().close();
            }
        }
    }

    //Closes spessific stream
    public function closeStream(route: String, url: String){
        for(i in 0...streams.length) {
            if(streams[i].getRoute() == route && streams[i].getSocket().url == url) {
                var stream = streams.splice(i, 0);
                stream[0].getSocket().close();
                return;
            }
        }
    }
    



    public function addCurrentToRouteHistory() {
        routeHistory.push(Browser.location.pathname);
    }
    */
    


}