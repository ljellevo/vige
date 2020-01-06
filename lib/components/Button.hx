package lib.components;

import lib.support.StyleManager;
import js.Browser;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;

class Button implements Widget {
    var child: Widget = null;
    
    var onClick: haxe.Constraints.Function = null;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;

    public function new(arg: {
        child: Widget, 
        onClick: haxe.Constraints.Function,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
    }) {
        this.child = arg.child;
        this.onClick = arg.onClick;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
    }

    public function render():js.html.ButtonElement {
        var button = Browser.document.createButtonElement();
        button.appendChild(child.render());
        button.onclick = onClick;
        button.style.cursor = "pointer";


        new StyleManager().addStyleToButton({widget: button, color: color, border: border, padding: padding, margin: margin, size: size});
        return button;
        
    }
}