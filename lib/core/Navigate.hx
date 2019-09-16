package lib.core;

import js.html.History;
import js.Browser;
import lib.support.Widget;

class Navigate {
    
    public static var routes: Array<{route: String, component: Widget}> = [];
    static var history: Array<js.html.Node> = [];
    static var historyIndex: Int = 0;

    public function new() { }

    public static function to(arg: {route: String, ?param: Array<{param: String, data: String}>, ?main: Bool}) {
        var url = arg.route;
        if (arg.main == null) arg.main = false;
        if (arg.param != null && arg.param.length > 0) {
            url += "?";

            for(i in 0...arg.param.length){
                if(i != 0) url += "&";
                url += arg.param[i].param + "=" + arg.param[i].data;
            }
        }
        if (arg.main) {
        } else {
            Browser.window.history.pushState(null, "Index", arg.route);
        }
        

        //Browser.location.href = url; 
        setComponent(true); 
    }

    static function setComponent(newHistoryElement: Bool) {
        var currentURL = Browser.location.pathname;
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        for(route in routes) {
            if (route.route == currentURL) {
                /*
                if (newHistoryElement == true) {
                    Browser.document.body.appendChild(route.component.render());
                    history.push(route.component.render());
                    trace("New page on history stack");
                    historyIndex = history.length - 1;
                } else {
                    if(historyIndex < 0) {
                        Browser.window.history.go(-1);
                    } else {
                        Browser.document.body.appendChild(history[historyIndex]);
                    }
                    
                }
                */
                Browser.document.body.appendChild(route.component.render());
                return;
                
            }
        }
        trace(history);
    }

    public static function back() {
        historyIndex--;
        setComponent(false);
    }

    public static function updateComponent(component: js.html.Node) {
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        var currentURL = Browser.location.pathname;
        Browser.document.body.appendChild(component);
    }
}