package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;

/*
import lib.components.Center.CenterAlignment;
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

class Container implements Widget {
    var child: Widget;
    var stretch: Bool;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;

    public function new(arg: {
        ?child: Widget,
        ?stretch: Bool,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        ?overflow: Overflow,
    }) {
        this.child = arg.child;
        this.stretch = arg.stretch;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size != null ? arg.size : new Size({height: 100, heightType: "%", width: 100, widthType: "%"});
        this.overflow = arg.overflow;
    }

    public function init(){}
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        container.classList.add("container");
        container.style.boxSizing = "border-box";
        if(child != null) {
             container.appendChild(child.render());
        }

        /*
        if(stretch) {
            container.style.alignItems = "stretch";
        }
        */
        if(size != null) {
          container.id = size.getWidth();
        }
        
       
        new StyleManager().addStyleToDiv({widget: container, color: color, border: border, padding: padding, margin: margin, size: size, overflow: overflow});
        //container.style.margin = "auto";
        
        return container;
    }
}