package lib.components;

import js.Browser;
import lib.support.Widget;



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

    public function new(arg: {
        count: Int
    }) {
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