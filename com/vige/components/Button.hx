package com.vige.components;

import js.Browser;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
/*
import lib.support.StyleManager;

import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;
*/

/**
    Is documented
**/

class Button implements Widget {
    var child: Widget = null;
    var isLink: Bool;
    var onClick: haxe.Constraints.Function = null;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;
    public var shadow: Array<Shadow>;

    public function new(arg: {
        child: Widget, 
        ?isLink: Bool,
        onClick: haxe.Constraints.Function,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        ?overflow: Overflow,
        ?shadow: Array<Shadow>
    }) {
        this.child = arg.child;
        this.isLink = arg.isLink != null ? arg.isLink : false;
        this.onClick = arg.onClick;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
        this.overflow = arg.overflow;
        this.shadow = arg.shadow;
    }

    public function init(){}

    public function render():js.html.Node {
      if(isLink) {
        var button = Browser.document.createAnchorElement();
        button.appendChild(child.render());
        button.onclick = onClick;
        button.style.cursor = "pointer";
        button.style.border = "none";
        //button.target = "_blank";
        //button.href = "/news";

        //castButton.style.padding = "8px 22px";
        button.style.textAlign = "left";
        button.style.textDecoration = "none";
        button.style.display = "inline-block";
        //castButton.style.fontSize = "16px";
        //castButton.style.borderRadius = "12px";



        new StyleManager().addStyleToAnchor({widget: button, color: color, border: border, padding: padding, margin: margin, size: size, overflow: overflow, shadow: shadow});
        return button;
      } else {
        var button = Browser.document.createButtonElement();
        button.appendChild(child.render());
        button.onclick = onClick;
        button.style.cursor = "pointer";
        button.style.border = "none";

        //castButton.style.padding = "8px 22px";
        button.style.textAlign = "left";
        button.style.textDecoration = "none";
        button.style.display = "inline-block";
        //castButton.style.fontSize = "16px";
        //castButton.style.borderRadius = "12px";



        new StyleManager().addStyleToButton({widget: button, color: color, border: border, padding: padding, margin: margin, size: size, overflow: overflow, shadow: shadow});
        return button;
      }
        
        
    }
}