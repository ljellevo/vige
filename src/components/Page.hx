package components;

import js.Browser;
import utils.Style;
import utils.Position;
import js.html.Node;
import support.Widget;

class Page implements Widget{
    var route: String = "";
    var title: String = "NOT IMPLEMENTED";
    var navbar: Widget = null;
    var child: Widget = null;
    var style: Style = null;


    public function new(arg: {
        route: String,
        ?title: String,
        ?navbar: Widget,
        child: Widget,
        ?style: Style,
    }) {
        this.route = arg.route;
        this.title = arg.title;
        this.navbar = arg.navbar;
        this.child = arg.child;
        this.style = arg.style;
    }
    

    public function render() : Node {
        var container = Browser.document.createDivElement();
        navbar != null ? container.appendChild(navbar.render()) : null;
        container.appendChild(child.render());

        //Need to style container
        
        



        return new Node();
    }

}