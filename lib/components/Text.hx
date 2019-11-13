package lib.components;

import lib.utils.Style;
import lib.support.Widget;
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
    var style: Style;

    public function new(
        text: String, 
        ?arg: {
            style: Style
        }
    ) {
        this.text = text;

        if (arg == null) {
            arg = {style: new Style({})}
        }

        this.style = arg.style;
        
    }

    public function getText(): String {
        return text;
    }

    public function render() : Node {
        var element = Browser.document.createParagraphElement();
        element.style.color = style.getColor();
        element.style.backgroundColor = style.getBackgroundColor();
        element.innerText = text;
        return element;

    }
}