package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;
/*
import lib.support.StyleManager;
import js.Browser;
import js.html.Node;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;
*/



/**
    Is documented, not enum
**/


class Center implements Widget {
    var child: Widget;
    var alignment: CenterAlignment;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;
    public var shadow: Array<Shadow>;



    public function new(arg: {
        child: Widget, 
        alignment: CenterAlignment,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        ?overflow: Overflow,
        ?shadow: Array<Shadow>

        
    }) {
        this.child = arg.child;
        this.alignment = arg.alignment;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
        this.overflow = arg.overflow;
        this.shadow = arg.shadow;
    }

    public function init(){}

    public function render() : js.html.Node {
        var parent = Browser.document.createDivElement();
        parent.id = "center";
        var element = Browser.document.createDivElement();

        switch alignment {
            case Horizontal:
                element.id = "element";
                element.style.display = "flex";
                element.style.justifyContent = "center";
                
                new StyleManager().addStyleToDiv({widget: parent, color: color, border: border, padding: padding, margin: margin, size: new Size({width: "100%"}), overflow: overflow, shadow: shadow});

                element.appendChild(child.render());
                parent = element;
                

            case Vertical:
                element.style.position = "relative";
                element.style.top = "50%";
                element.style.transform = "translateY(-50%)";
                new StyleManager().addStyleToDiv({widget: parent, color: color, border: border, padding: padding, margin: margin, size: new Size({height: "100%"}), overflow: overflow, shadow: shadow});
                element.appendChild(child.render());
                parent.appendChild(element);
            case Both:
                element.id = "element";
                element.style.display = "flex";
                element.style.justifyContent = "center";
                element.style.position = "relative";
                element.style.top = "50%";
                element.style.transform = "translateY(-50%)";
                new StyleManager().addStyleToDiv({widget: parent, color: color, border: border, padding: padding, margin: margin, size: new Size({height: "100%"}), overflow: overflow, shadow: shadow});
                element.appendChild(child.render());
                parent.appendChild(element);
        }
        return parent;
    }

}