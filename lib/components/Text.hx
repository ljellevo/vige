package lib.components;

import lib.support.Widget;
import js.Browser;
import js.html.Node;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;


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

enum TextAlignment {
    Left;
    Right;
    Center;
    Justify;
    Inherit;
}



/**
    Is documented, not enum
**/

class Text implements Widget {
    var textSize = -1;
    var text: String = "";
    var textFormat: TextFormat;
    var font: String;
    var textAlignment: TextAlignment;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;


    public function new(text: String, ?arg: {
        ?textFormat: TextFormat,
        ?textSize: Int,
        ?font: String,
        ?textAlignment: TextAlignment,
        
        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
    }) {
        this.text = text;
        if(arg == null) {
            arg = {textSize: -1, color: new Color({}), textFormat: TextFormat.p}
        }
        this.font = arg.font;
        this.textSize = arg.textSize != null ? arg.textSize : -1;
        this.color = arg.color != null ? arg.color : new Color({});
        this.textFormat = arg.textFormat != null ? arg.textFormat : TextFormat.p;
        this.textAlignment = arg.textAlignment != null ? arg.textAlignment : TextAlignment.Left;
    }

    public function init(){}

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

        switch (textAlignment) {
            case Left:
                element.style.textAlign = "left";
            case Right:
                element.style.textAlign = "right";
            case Center:
                element.style.textAlign = "center";
            case Justify:
                element.style.textAlign = "justify";
            case Inherit:
                element.style.textAlign = "inherit";
        }
        //var element = Browser.document.createParagraphElement();
        if(textSize > -1) {
            element.style.fontSize = Std.string(textSize);
        }

        if(font != null) {
            element.style.fontFamily = font;
        }
        
        element.style.color = color.getColor();
        element.style.backgroundColor = color.getBackgroundColor();
        element.innerText = text;
        return element;
    }
}