package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;


class Responsive implements Widget {
    var child: Widget;
    var stretch: Bool;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;
    public var shadow: Array<Shadow>;

    public function new(arg: {
        ?child: Widget,
        ?stretch: Bool,

    }) {
        this.child = arg.child;
        this.stretch = arg.stretch;
    }

    public function init(){}
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        container.style.boxSizing = "border-box";
        if(child != null) {
             container.appendChild(child.render());
        }

        
        return container;
    }
}