package lib.core;

import js.html.Window;
import lib.components.Page;
import js.Browser;

class Navigate {
    
    public static var routes: Array<DynamicComponent> = [];
    
    public function new() { }

    public static function to(arg: {url: String, ?param: Array<{param: String, data: String}>, ?main: Bool, ?hardRefresh: Bool}) {
        var url = arg.url;
        if (arg.main == null) arg.main = false;
        if (arg.hardRefresh == null) arg.hardRefresh = false;
        if (arg.param != null && arg.param.length > 0) {
            url += "?";

            for(i in 0...arg.param.length){
                if(i != 0) url += "&";
                url += arg.param[i].param + "=" + arg.param[i].data;
            }
        }



        GlobalState.instance.closeAllStreams();
        
        if (!arg.main) {
            
            Browser.window.history.pushState(null, "Index", url);
            if(arg.hardRefresh){
                Browser.window.location.reload();
            }
        }
        
        setComponent(true); 
    }

    public static function link(arg: {url: String}) {
        Browser.window.history.pushState(null, "Index", Browser.location.pathname);
        Browser.window.location.replace(arg.url);
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
            if (route.component().getRoute() == currentURL) {
                Browser.document.body.appendChild(route.component().render());
                route.init();
                return;
            }
        }
    }

    /**
    TODO: Implement this feature:
        Figures out if user navigates forwards or backwards when using browser navigation buttons
    **/
    public static function navigationEvent() {  
        trace("Click");
        
        GlobalState.instance.closeAllStreams();
        setComponent(false);
    }

    public static function updateComponent(component: js.html.Node) {
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        Browser.document.body.appendChild(component);
    }
}