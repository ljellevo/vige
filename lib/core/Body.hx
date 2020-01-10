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

    public function font(fontFamily: String, fontWeight: String) {
        //font-family: 'Quicksand', sans-serif;
        var style = Browser.document.body.style;
        style.fontFamily = fontFamily;
        style.fontWeight = fontWeight;
        //style.fontSize = "48";
    }

    public function setHeader(stylesheetUrl: String) {
        //font-family: 'Quicksand', sans-serif;
        var element = '<link href="' + stylesheetUrl + '", rel="stylesheet">';
        var style = Browser.document.head.innerHTML += element;
        
    }


    public function render(widget: js.html.Node) {
        Browser.document.body.appendChild(widget);
    }
}