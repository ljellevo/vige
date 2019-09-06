package core;

import js.Browser;

class Body {

    public function new() { }


    public function getBody(): js.html.Element {
        return Browser.document.body;
    }

    public function init(widget: js.html.Node) {
        Browser.document.body.appendChild(widget);
    }
}