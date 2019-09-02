package components;

import utils.Style;
import utils.Position;
import js.html.Node;
import support.Widget;

class Page implements Widget{
    var navbar: Widget = null;
    var child: Widget = null;
    var style: Style = null;
    var position: Position = null;


    public function new(arg: {
        ?navbar: Widget,
        child: Widget,
        ?style: Style,
        ?position: Position

    }) {
        this.navbar = arg.navbar;
        this.child = arg.child;
        this.style = arg.style;
        this.position = arg.position != null ? arg.position : new Position({x: 0.0, y: 0.0});
        
    }
    

    public function render() : Node {
        



        return new Node();
    }

}