package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;

/*
import js.Browser;
import lib.support.Widget;
import lib.support.StyleManager;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;
*/

/**
Not done

**/

/**
    Is documented
**/

class Positioned implements Widget {
    var top: Float;
    var right: Float;
    var bottom: Float;
    var left: Float;
    var child: Widget;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;

    public function new(arg: {
        ?top: Float,
        ?right: Float,
        ?bottom: Float,
        ?left: Float,
        child: Widget,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        ?overflow: Overflow,
    }) {
        this.top = arg.top != null ? arg.top : 0.0;
        this.right = arg.right != null ? arg.right : 0.0;
        this.bottom = arg.bottom != null ? arg.bottom : 0.0;
        this.left = arg.left != null ? arg.left : 0.0;
        this.child = arg.child;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
        this.overflow = arg.overflow;
    }

    public function init(){}
    
    public function render():js.html.Node {
        var parent = Browser.document.createDivElement();
        parent.style.position = "relative";

        new StyleManager().addStyleToDiv({widget: parent, color: color, border: border, padding: padding, margin: margin, size: new Size({height: "100%", width: "100%"}), overflow: overflow});



        var positioned = Browser.document.createDivElement();
        positioned.appendChild(child.render());
        positioned.style.position = "absolute";
        if(top != 0.0) {
            positioned.style.top = Std.string(top) + "px";
        }
        
        if(right != 0.0) {
            positioned.style.right = Std.string(right) + "px";
        }
        
        if(bottom != 0.0) {
            positioned.style.bottom = Std.string(bottom) + "px";
        }

        if(left != 0.0) {
            positioned.style.left = Std.string(left) + "px";
        }

        new StyleManager().addStyleToDiv({widget: positioned, color: color, border: border, padding: padding, margin: margin, size: size});

        
        
        parent.appendChild(positioned);
        return parent;
    }
}