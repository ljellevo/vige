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

class Collection implements Widget {
    var child: Widget;
    var count: Int;

    public function new(arg: {
        ?child: Widget,
        count: Int
    }) {
        this.child = arg.child;
        this.count = arg.count;
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
        return container;
    }
}