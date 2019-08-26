package container;

import js.Browser;
import util.Widget;
import js.html.CSSStyleDeclaration;

class Container implements Widget {
    var height: Int = -1;
    var width: Int = -1;
    var child: Widget = null;

    public function new(height, width, child){
        this.height = height;
        this.width = width;
        this.child = child;
    }
    
    public function render():js.html.Node {

        var container = Browser.document.createDivElement();
        container.appendChild(child.render());
        var style = container.style;
        style.width = Std.string(width);
        style.height = Std.string(height);
        style.backgroundColor = "#457E9A";
        return container;
    }
    
}