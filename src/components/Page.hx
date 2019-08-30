package components;

import utils.Style;
import js.html.Node;
import support.Widget;

class Page implements Widget{
    var navbar: Widget = null;
    var child: Widget = null;
    var style: Style = null;


    public function new(arg: {
        ?navbar: Widget,
        child: Widget,
        ?style: Style,

    }) {
        
    }
    

    public function render() : Node {
        



        return new Node();
    }

}