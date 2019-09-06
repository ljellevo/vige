package lib.core;

import lib.support.Widget;
import js.Browser;

class Body {

    public function new() { }


    

    public function to(arg: {route: String}) {
        
    }

    public function init() {
        Browser.document.body.style.margin = "0px";
    }


    public function render(widget: js.html.Node) {
        Browser.document.body.appendChild(widget);
    }
}