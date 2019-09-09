package lib.core;

import js.Browser;
import lib.support.Widget;

class Navigate {

    public function new() { }

    public static function routing(routes: Array<{route: String, component: Widget}>) {
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

    public static function to(arg: {route: String, ?param: Array<{param: String, data: String}>}) {
        var url = arg.route;
        if (arg.param != null && arg.param.length > 0) {
            url += "?";

            for(i in 0...arg.param.length){
                if(i != 0) url += "&";
                url += arg.param[i].param + "=" + arg.param[i].data;
            }
        }
        Browser.location.href = url;   
    }

    public static function getParams(){
        var params = Browser.location.search.substr(1).split("&");
        var currentParams: Array<{}> = [];
        for(param in params) {
            currentParams.push({param: param.split("=")[0] , data: param.split("=")[1]});
        }
        return currentParams;

    }
}