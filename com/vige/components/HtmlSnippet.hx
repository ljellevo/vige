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

class HtmlSnippet implements Widget {
    var snippet: String;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;

    public function new(arg: {
        snippet: String,
    }) {
        this.snippet = arg.snippet;
    }

    public function init(){}
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        container.innerHTML = snippet;
        return container;
    }
}