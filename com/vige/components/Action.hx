package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;
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

class Action implements Widget {
    var child: Widget;
    var onClick: haxe.Constraints.Function;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;
    public var shadow: Array<Shadow>;

    public function new(arg: {
        child: Widget,
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
        this.onClick = arg.onClick;

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
        var anchor = Browser.document.createDivElement();
        if(child != null) {
          anchor.appendChild(child.render());
        }

        anchor.onclick = onClick;
        anchor.style.cursor = "pointer";



        return anchor;
    }
}