package lib.core;

import lib.support.Widget;
import js.Browser;

class Body {

    public function new() { }


    public function routing(routes: Array<{route: String, component: Widget}>) {
        var currentURL = Browser.location.pathname;
        trace(currentURL);

        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        for(route in routes) {
            if (route.route == currentURL) {
                Browser.document.body.appendChild(route.component.render());
            }
        }
    }

    public function to(arg: {route: String}) {
        var currentURL = Browser.location.pathname;

        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        Browser.location.pathname = arg.route;
        trace("Added to path");
        //Browser.document.body.appendChild(arg.component.render());
        
    }

    public function init() {
        Browser.document.body.style.margin = "0px";
    }


    public function render(widget: js.html.Node) {
        Browser.document.body.appendChild(widget);
    }
}