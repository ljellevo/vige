package lib.core;

import js.html.History;
import js.Browser;
import lib.support.Widget;

class Navigate {
    
    public static var routes: Array<{route: String, component: Widget}> = [];

    public function new() { }

    public static function to(arg: {route: String, ?param: Array<{param: String, data: String}>}) {
        var url = arg.route;
        if (arg.param != null && arg.param.length > 0) {
            url += "?";

            for(i in 0...arg.param.length){
                if(i != 0) url += "&";
                url += arg.param[i].param + "=" + arg.param[i].data;
            }
        }
        Browser.window.history.pushState(null, "Index", arg.route);
        //Browser.location.href = url; 

        setComponent(); 

    }

    static function setComponent() {
        var currentURL = Browser.location.pathname;
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        for(route in routes) {
            if (route.route == currentURL) {
                Browser.document.body.appendChild(route.component.render());
            }
        }
    }

    public static function updateComponent(component: js.html.Node) {
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        //Add to history when component changes

        var currentURL = Browser.location.pathname;
        Browser.document.body.appendChild(component);
    }


/*
    public static function setRoutes(routes: Array<{route: String, component: Widget}>) {
        var currentURL = Browser.location.pathname;
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        for(route in routes) {

            if (route.route == currentURL) {
                Browser.document.body.appendChild(route.component.render());
            }
        }
    }

    public static function replaceTo(widget: js.html.Node) {
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        var currentURL = Browser.location.pathname;
        Browser.document.body.appendChild(widget);
    }

    public static function to(arg: {route: String, ?param: Array<{param: String, data: String}>}) {
        var url = arg.route;
        if (arg.param != null && arg.param.length > 0) {
            url += "?";

            for(i in 0...arg.param.length){
                if(i != 0) url += "&";
                url += arg.param[i].param + "=" + arg.param[i].data;
            }
        }
        //Browser.window.history.pushState(null, "Index", "/");
        //Browser.location.href = url;   
    }

    public static function getParams(){
        var params = Browser.location.search.substr(1).split("&");
        var currentParams: Array<{}> = [];
        for(param in params) {
            currentParams.push({param: param.split("=")[0] , data: param.split("=")[1]});
        }
        return currentParams;
    }
    */
}