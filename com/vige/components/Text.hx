package com.vige.components;

import com.vige.support.*;
import com.vige.utils.*;
import js.html.Node;
import com.vige.support.Enums;
import js.Browser;



/**
    Is not documented
**/

class Text implements Widget {
    var textSize = -1;
    var text: String = "";
    var textFormat: TextFormat;
    var font: Fonts;
    var textAlignment: TextAlign;
    var fontStyle: FontStyle;
    var fontWeight: FontWeight;
    var textOverflow: TextOverflow;
    var whiteSpace: WhiteSpace;
    var textIndent: Int;
    var wordBreak: WordBreak;
    var lineHeight: Int;
    var letterSpacing: Int;
    var wordSpacing: Int;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;


    public function new(text: String, ?arg: {
        ?textFormat: TextFormat,
        ?textSize: Int,
        ?font: Fonts,
        ?textAlignment: TextAlign,
        ?fontStyle: FontStyle,
        ?fontWeight: FontWeight,
        ?textOverflow: TextOverflow,
        ?whiteSpace: WhiteSpace,
        ?textIndent: Int,
        ?wordBreak: WordBreak,
        ?lineHeight: Int,
        ?letterSpacing: Int,
        ?wordSpacing: Int,
        
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
        this.textAlignment = arg.textAlignment != null ? arg.textAlignment : TextAlign.Left;
        this.fontStyle = arg.fontStyle != null ? arg.fontStyle : FontStyle.Normal;
        this.fontWeight = arg.fontWeight != null ? arg.fontWeight : FontWeight.Normal;
        this.textOverflow = arg.textOverflow != null ? arg.textOverflow : TextOverflow.Clip;
        this.whiteSpace = arg.whiteSpace != null ? arg.whiteSpace : WhiteSpace.Normal;
        this.textIndent = arg.textIndent;
        this.wordBreak = arg.wordBreak != null ? arg.wordBreak : WordBreak.Normal;
        this.lineHeight = arg.lineHeight;
        this.letterSpacing = arg.letterSpacing;
        this.wordSpacing = arg.wordSpacing;
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

        switch (fontWeight) {
          case Normal:
            element.style.fontWeight = "normal";
          case Bold:
            element.style.fontWeight = "bold";
          case Bolder:
            element.style.fontWeight = "bolder";
          case Lighter:
            element.style.fontWeight = "lighter";
          case W100:
            element.style.fontWeight = "100";
          case W200:
            element.style.fontWeight = "200";
          case W300:
            element.style.fontWeight = "300";
          case W400:
            element.style.fontWeight = "400";
          case W500:
            element.style.fontWeight = "500";
          case W600:
            element.style.fontWeight = "600";
          case W700:
            element.style.fontWeight = "700";
          case W800:
            element.style.fontWeight = "800";
          case W900:
            element.style.fontWeight = "900";
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

        switch (whiteSpace) {
          case Normal:
            element.style.whiteSpace = "normal";
          case Nowrap:
            element.style.whiteSpace = "nowrap";
          case Pre:
            element.style.whiteSpace = "pre";
          case PreLine:
            element.style.whiteSpace = "pre-line";
          case PreWrap:
            element.style.whiteSpace = "pre-wrap";
          case BreakSpace:
            element.style.whiteSpace = "break-space";
        }

        switch (wordBreak) {
          case Normal:
            element.style.wordBreak = "normal";
          case BreakAll:
            element.style.wordBreak = "break-all";
          case KeepAll:
            element.style.wordBreak = "keep-all";
          case BreakWord:
            element.style.wordBreak = "break-word";
        }

        if(textSize > -1) {
            element.style.fontSize = Std.string(textSize);
        }

        if(font != null) {
            element.style.fontFamily = font.getFamilyName() + ", " + font.getGenericFamily();
        }

        if(textIndent != null) {
          element.style.textIndent = Std.string(textIndent) + "px";
        }

        if(lineHeight != null) {
          element.style.lineHeight = Std.string(lineHeight) + "px";
        } else {
          element.style.lineHeight = "normal";
        }

        if(letterSpacing != null) {
          element.style.letterSpacing = Std.string(letterSpacing) + "px";
        } else {
          element.style.letterSpacing = "normal";
        }

        if(wordSpacing != null) {
          element.style.wordSpacing = Std.string(wordSpacing) + "px";
        } else {
          element.style.wordSpacing = "normal";
        }
        
        
        element.style.color = color.getColor();
        element.style.backgroundColor = color.getBackgroundColor();
        element.innerText = text;

        return element;
    }
}