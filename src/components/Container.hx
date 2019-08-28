package components;

import js.Browser;
import support.Widget;
import support.StyleManager;
import utils.Style;

class Container implements Widget {
    var height: Float = -1.0;
    var width: Float = -1.0;
    var style: Style = null;
    var child: Widget = null;

    public function new(
        arg: {
            ?height: Float, 
            ?width: Float, 
            ?style: Style,
            child: Widget
        }){
        this.height = arg.height;
        this.width = arg.width;
        this.style = arg.style;
        this.child = arg.child;
    }
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        container.appendChild(child.render());
        new StyleManager().addStyleToDiv(height, width, container, style);
        return container;
    }
}