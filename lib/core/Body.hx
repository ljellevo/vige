package lib.core;

import lib.support.Widget;
import js.Browser;

class Body {

    public function new() { }


    public function routing(routes: Array<{route: String, component: Widget}>) {
        var currentURL = Browser.location.pathname;
        trace(currentURL);
        for(route in routes) {
            if (route.route == currentURL) {
                Browser.document.body.appendChild(route.component.render());
            }
        }
    }


    public function render(widget: js.html.Node) {
        Browser.document.body.appendChild(widget);
    }
}