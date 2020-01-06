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

class Container implements Widget {
    var child: Widget;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;

    public function new(arg: {
        ?child: Widget,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
    }) {
        this.child = arg.child;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size != null ? arg.size : new Size({height: 100, heightType: "%", width: 100, widthType: "%"});
    }
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        container.classList.add("container");
        if(child != null) {
             container.appendChild(child.render());
        }
        
       
        new StyleManager().addStyleToDiv({widget: container, color: color, border: border, padding: padding, margin: margin, size: size});
        //container.style.margin = "auto";
        
        return container;
    }
}