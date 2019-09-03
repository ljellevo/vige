package core;

import js.Browser;

class Body {

    public function new() { }


    public function init(widget: js.html.Node) {
        Browser.document.body.appendChild(widget);
    }
}