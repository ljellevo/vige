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

    public static function to(arg: {route: String}) {
        Browser.location.pathname = arg.route;
    }
}