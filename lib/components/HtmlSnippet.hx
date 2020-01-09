package lib.components;

import lib.components.Center.CenterAlignment;
import js.Browser;
import lib.support.Widget;
import lib.support.StyleManager;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;


/**
Not done
**/
/**
    Is documented
**/

class HtmlSnippet implements Widget {
    var snippet: js.html.Node;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;

    public function new(arg: {
        snippet: js.html.Node,
    }) {
        this.snippet = arg.snippet;
    }

    public function init(){}
    
    public function render():js.html.Node {
        return snippet;
    }
}