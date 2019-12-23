package lib.components;

import lib.components.Center.CenterAlignment;
import lib.utils.Padding;
import lib.utils.Size;
import js.Browser;
import lib.support.Widget;
import lib.support.StyleManager;
import lib.utils.Style;


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
        ?child: Widget
    }) {
        this.size = arg.size != null ? arg.size : new Size({height: 100, heightType: "%", width: 100, widthType: "%"});
        this.style = arg.style != null ? arg.style : new Style({});
        this.child = arg.child;
    }
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        if(child != null) {
             container.appendChild(child.render());
        }
        
       
        new StyleManager().addStyleToDiv({size: size, widget: container, style: style, padding: Padding.all(0.0)});
        //container.style.margin = "auto";
        
        return container;
    }
}