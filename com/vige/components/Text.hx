package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import js.html.Node;
import com.vige.support.Enums;
import js.Browser;

/*
import lib.support.Widget;
import js.Browser;


import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;
*/





/**
    Is documented, not enum
**/

class Text implements Widget {
    var textSize = -1;
    var text: String = "";
    var textFormat: TextFormat;
    var font: String;
    var textAlignment: TextAlignment;
    var fontStyle: FontStyle;
    var textOverflow: TextOverflow;
    var noWrap: Bool;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;




    public function new(text: String, ?arg: {
        ?textFormat: TextFormat,
        ?textSize: Int,
        ?font: String,
        ?textAlignment: TextAlignment,
        ?fontStyle: FontStyle,
        ?textOverflow: TextOverflow,
        ?noWrap: Bool,
        
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
        this.fontStyle = arg.fontStyle != null ? arg.fontStyle : FontStyle.Normal;
        this.textOverflow = arg.textOverflow != null ? arg.textOverflow : TextOverflow.Clip;
        this.noWrap = arg.noWrap != null ? arg.noWrap : false;
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
            element.style.display = "block";
            element.style.fontSize = "1em";
            element.style.margin = "0 0";
            element.style.fontWeight = "normal";
          case a:
            element = Browser.document.createParagraphElement();
            element.style.display = "block";
            element.style.fontSize = "1em";
            element.style.margin = "0 0";
            element.style.fontWeight = "normal";
          case pre:
            element = Browser.document.createParagraphElement();
            element.style.display = "block";
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


        switch (fontStyle) {
          case Normal:
            element.style.fontStyle = "normal";
          case Italic:
            element.style.fontStyle = "italic";
          case Oblique:
            element.style.fontStyle = "oblique";
          case Initial:
            element.style.fontStyle = "initial";
          case Inherit:
            element.style.fontStyle = "inherit";
        }

        switch (textOverflow) {
          case Clip:
            element.style.textOverflow = "clip";
          case Ellipsis:
            element.style.textOverflow = "ellipsis";
          case String:
            element.style.textOverflow = "string";
          case Initial:
            element.style.textOverflow = "initial";
          case Inherit:
            element.style.textOverflow = "inherit";
        }
        //var element = Browser.document.createParagraphElement();
        if(textSize > -1) {
            element.style.fontSize = Std.string(textSize);
        }

        if(font != null) {
            element.style.fontFamily = font;
        }

        if(noWrap) {
          element.style.whiteSpace = "nowrap";
        }
        
        
        element.style.color = color.getColor();
        element.style.backgroundColor = color.getBackgroundColor();
        element.innerText = text;
        return element;
    }
}