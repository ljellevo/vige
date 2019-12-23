package lib.components;

import lib.utils.Margin;
import lib.utils.Padding;
import lib.utils.Size;
import js.Browser;
import lib.support.Widget;
import lib.support.StyleManager;
import lib.utils.Style;


/**
Not done
Needs documentation
**/

class Positioned implements Widget {
    var size: Size;
    var style: Style;
    var top: Float;
    var right: Float;
    var bottom: Float;
    var left: Float;
    var child: Widget;

    public function new(arg: {
        ?size: Size,
        ?style: Style,
        ?top: Float,
        ?right: Float,
        ?bottom: Float,
        ?left: Float,
        child: Widget
    }) {
        this.size = arg.size != null ? arg.size : new Size({});
        this.style = arg.style != null ? arg.style : new Style({});
        this.top = arg.top != null ? arg.top : 0.0;
        this.right = arg.right != null ? arg.right : 0.0;
        this.bottom = arg.bottom != null ? arg.bottom : 0.0;
        this.left = arg.left != null ? arg.left : 0.0;
        this.child = arg.child;
    }
    
    public function render():js.html.Node {
        var parent = Browser.document.createDivElement();
        parent.style.position = "relative";
        new StyleManager().addStyleToDiv({
            size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}), 
            widget: parent, 
            style: new Style({}), 
            padding: Padding.all(0.0)
        });


        var positioned = Browser.document.createDivElement();
        positioned.appendChild(child.render());
        positioned.style.position = "absolute";
        if(top != 0.0) {
            positioned.style.top = Std.string(top) + "px";
        }
        
        if(right != 0.0) {
            positioned.style.right = Std.string(right) + "px";
        }
        
        if(bottom != 0.0) {
            positioned.style.bottom = Std.string(bottom) + "px";
        }

        if(left != 0.0) {
            positioned.style.left = Std.string(left) + "px";
        }
        new StyleManager().addStyleToDiv({
            size: size, 
            widget: positioned, 
            style: style, 
            padding: Padding.all(0.0),
        });
        
        parent.appendChild(positioned);
        return parent;
    }
}