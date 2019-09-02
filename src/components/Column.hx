package components;

import js.html.Node;
import support.Widget;

class Column implements Widget {
    var children: Array<Widget> = null;

    public function new(arg: {
        children: Array<Widget>,
    }) {
        this.children = arg.children;
    }


    public function render(): Node {
        return new Node();
    }
}

