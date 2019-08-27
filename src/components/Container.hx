package components;

import js.Browser;
import interfaces.Widget;

class Container implements Widget {
    var height: Float = -1.0;
    var width: Float = -1.0;
    var child: Widget = null;

    public function new(arg: {?height: Float, ?width: Float, child: Widget}){
        this.height = arg.height;
        this.width = arg.width;
        this.child = arg.child;
    }
    
    public function render():js.html.Node {

        var container = Browser.document.createDivElement();
        container.appendChild(child.render());
        var style = container.style;
        style.width = width == Math.POSITIVE_INFINITY ? Std.string(100) + "%" : Std.string(width);
        style.height = height == Math.POSITIVE_INFINITY ? Std.string(100) + "%" : Std.string(height);
        style.backgroundColor = "#457E9A";
        return container;
    }
    
}