package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;


class Sized implements Widget {
    var child: Widget;
    var maxWidth: Int;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;
    public var shadow: Array<Shadow>;

    public function new(arg: {
        child: Widget,
        maxWidth: Int,

    }) {
        this.child = arg.child;
        this.maxWidth = arg.maxWidth;
    }

    public function init(){}

    public function getMaxWidth(): Int {
      return maxWidth;
    }
    
    public function render():js.html.Node {
        return child.render();
    }
}