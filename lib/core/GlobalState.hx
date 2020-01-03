package lib.core;


import lib.components.Page;
import lib.support.StreamConnection;

class GlobalState {
    var streams: Array<StreamConnection> = [];

    public static var instance(default, null): GlobalState = new GlobalState();

    private function new() {}


    public function openStream(stream: StreamConnection) {
        trace("Added stream: " + stream.getSocket().url);
        streams.push(stream);
    }

    //Closes all streams on a page
    public function closeAllStreamsOnPage(page: Page){
        for(i in 0...streams.length) {
            if(streams[i].getPage().getRoute() == page.getRoute()){
                trace("Closed stream: " + streams[i].getSocket().url);
                streams.splice(i, 0);
            }
        }
    }

    public function closeAllStreamsWithURL(url: String){
        for(i in 0...streams.length) {
            if(streams[i].getSocket().url == url){
                streams.splice(i, 0);
            }
        }
    }

    //Closes spessific stream
    public function closeStream(page: Page, url: String){
        for(i in 0...streams.length) {
            if(streams[i].getPage().getRoute() == page.getRoute() && streams[i].getSocket().url == url) {
                streams.splice(i, 0);
                return;
            }
        }
    }


}