package lib.components;

import lib.support.StyleManager;
import js.Browser;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;



/**
Not done
**/


/**
var data = ["1", "2", "3"]
return new Collection({
    count: data.length,
}).build(function(i) {
    return new Text(data[i]);
});

**/

class Collection implements Widget {
    var count: Int;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;


    public function new(arg: {
        count: Int,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
    }) {
        this.count = arg.count;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
    }

    public function build(callback: haxe.Constraints.Function): Widget {
        var widgets: Array<Widget> = [];
        for(i in 0...count) {
            widgets.push(callback(i));
        }
        return new Column({children: widgets});
    }
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        container.classList.add("collection");
        new StyleManager().addStyleToDiv({widget: container, color: color, border: border, padding: padding, margin: margin, size: size});

        return container;
    }
}