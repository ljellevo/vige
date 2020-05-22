package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;
import js.html.Window;
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

class Stack implements Widget {
    var children: Array<Widget>;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;
    public var shadow: Array<Shadow>;

    public function new(arg: {
        ?children: Array<Widget>,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        ?overflow: Overflow,
        ?shadow: Array<Shadow>
    }) {
        this.children = arg.children;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size != null ? arg.size : new Size({height: "100%", width: "100%"});
        this.overflow = arg.overflow;
        this.shadow = arg.shadow;
    }

    public function init(){}
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        container.style.boxSizing = "border-box";

        var i = children.length;
        for(child in children) {
          var stackedContainer = Browser.document.createDivElement();
          stackedContainer.style.zIndex = i-- + "";
          stackedContainer.style.position = "absolute";
          //stackedContainer.style.top = "0px";
          stackedContainer.appendChild(child.render());
          container.appendChild(stackedContainer);
      }
        new StyleManager().addStyleToDiv({widget: container, color: color, border: border, padding: padding, margin: margin, size: size, overflow: overflow, shadow: shadow});        
        return container;
    }
}