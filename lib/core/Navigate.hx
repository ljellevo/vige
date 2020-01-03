package lib.core;

import lib.components.Page;
import js.Browser;
import lib.support.Widget;

class Navigate {
    
    public static var routes: Array<{route: String, component: Widget}> = [];
    
    public function new() { }

    public static function to(arg: {route: String, from: Page, ?param: Array<{param: String, data: String}>, ?main: Bool}) {
        var url = arg.route;
        if (arg.main == null) arg.main = false;
        if (arg.param != null && arg.param.length > 0) {
            url += "?";

            for(i in 0...arg.param.length){
                if(i != 0) url += "&";
                url += arg.param[i].param + "=" + arg.param[i].data;
            }
        }
        
        if(arg.from != null) {
            GlobalState.instance.closeAllStreamsOnPage(arg.from);
        }
        

        if (!arg.main) {

            Browser.window.history.pushState(null, "Index", url);
        }
        
        setComponent(true); 
    }

    /**
    TODO: Implement this feature:
        Determines whether a new component needs to be loaded, or an exsisting component from the stack
    **/
    static function setComponent(newHistoryElement: Bool) {
        var currentURL = Browser.location.pathname;
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }


        for(route in routes) {
            if (route.route == currentURL) {
                Browser.document.body.appendChild(route.component.render());
                return;
            }
        }
    }

    /**
    TODO: Implement this feature:
        Figures out if user navigates forwards or backwards when using browser navigation buttons
    **/
    public static function navigationEvent() {  
        setComponent(false);
    }

    public static function updateComponent(component: js.html.Node) {
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        Browser.document.body.appendChild(component);
    }
}