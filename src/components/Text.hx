package components;

import support.Widget;
import js.Browser;
import js.html.Node;


enum TextFormat {
    h1;
    h2;
    h3;
    h4;
    h5;
    h6;
    p;
    a;
    pre;
}

class Text implements Widget {
    var text: String = "";

    public function new(text: String) {
        this.text = text;
    }

    public function getText(): String {
        return text;
    }

    public function render() : Node {
        var element = Browser.document.createParagraphElement();
        element.innerText = text;
        return element;

    }
}