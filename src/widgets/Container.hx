package widgets;

import js.Browser;
import widgets.Widget;

class Container implements Widget {
    var height: Int = -1;
    var width: Int = -1;
    var child: Widget = null;

    public function new(?height, ?width, child, arg: {test: String}){
        this.height = height != null ? height: 50;
        this.width = width != null ? width : 50;
        this.child = child;
        trace(arg.test);
    }

    public function test(arg: {test: String}) {
        
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