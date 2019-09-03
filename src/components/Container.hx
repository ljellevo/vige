package components;

import utils.Padding;
import utils.Size;
import js.Browser;
import support.Widget;
import support.StyleManager;
import utils.Style;


/**
Not done
**/

class Container implements Widget {
    var size: Size;
    var style: Style;
    var child: Widget;

    public function new(arg: {
        ?size: Size,
        ?style: Style,
        child: Widget
    }) {
        this.size = arg.size != null ? arg.size : new Size({});
        this.style = arg.style;
        this.child = arg.child;
    }
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        container.appendChild(child.render());
        new StyleManager().addStyleToDiv({size: size, widget: container, style: style, padding: Padding.all(0.0)});
        return container;
    }
}