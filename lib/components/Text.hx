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
    var size = -1;
    var text: String = "";
    var style: Style;
    var textFormat: TextFormat;

    public function new(
        text: String, 
        ?arg: {
            ?size: Int,
            ?textFormat: TextFormat,
            ?style: Style
        }
    ) {
        this.text = text;
        if(arg == null) {
            arg = {
                size: -1,
                style: new Style({}),
                textFormat: TextFormat.p
            }
        }
        this.size = arg.size != null ? arg.size : -1;
        this.style = arg.style != null ? arg.style : new Style({});
        this.textFormat = arg.textFormat != null ? arg.textFormat : TextFormat.p;
    }

    public function getText(): String {
        return text;
    }

    public function render() : Node {
        var element;

        switch (textFormat){
            case h1:
                element = Browser.document.createParagraphElement();
                element.style.display = "block";
                element.style.fontSize = "2em";
                element.style.margin = ".67em 0";
                element.style.fontWeight = "bold";
            case h2:
                element = Browser.document.createParagraphElement();
                element.style.display = "block";
                element.style.fontSize = "1.5em";
                element.style.margin = ".83em 0";
                element.style.fontWeight = "bold";
            case h3:
                element = Browser.document.createParagraphElement();
                element.style.display = "block";
                element.style.fontSize = "1.17em";
                element.style.margin = "1em 0";
                element.style.fontWeight = "bold";
            case h4:
                element = Browser.document.createParagraphElement();
                element.style.display = "block";
                element.style.fontSize = "1em";
                element.style.margin = "1.33em 0";
                element.style.fontWeight = "bold";
            case h5:
                element = Browser.document.createParagraphElement();
                element.style.display = "block";
                element.style.fontSize = ".83em";
                element.style.margin = "1.67em 0";
                element.style.fontWeight = "bold";
            case h6:
                element = Browser.document.createParagraphElement();
                element.style.display = "block";
                element.style.fontSize = ".67em";
                element.style.margin = "2.33em 0";
                element.style.fontWeight = "bold";
            case p:
                element = Browser.document.createParagraphElement();
                element.style.display = "inline";
                element.style.fontSize = "1em";
                element.style.margin = "0 0";
                element.style.fontWeight = "normal";
            case a:
                element = Browser.document.createParagraphElement();
                element.style.display = "inline";
                element.style.fontSize = "1em";
                element.style.margin = "0 0";
                element.style.fontWeight = "normal";
            case pre:
                element = Browser.document.createParagraphElement();
                element.style.display = "inline";
                element.style.fontSize = "1em";
                element.style.margin = "0 0";
                element.style.fontWeight = "normal";
            
        }
        //var element = Browser.document.createParagraphElement();
        if(size > -1) {
            element.style.fontSize = Std.string(size);
        }
        
        element.style.color = style.getColor();
        element.style.backgroundColor = style.getBackgroundColor();
        element.innerText = text;
        return element;
    }
}