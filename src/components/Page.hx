package components;

import utils.Padding;
import utils.Color;
import support.StyleManager;
import js.Browser;
import utils.Style;
import utils.Size;
import js.html.Node;
import support.Widget;

class Page implements Widget{
    var route: String;
    var title: String = "NOT IMPLEMENTED";
    var navbar: Widget = null;
    var child: Widget;
    var style: Style = null;
    var size : Size = null;


    public function new(arg: {
        route: String,
        ?title: String,
        ?navbar: Widget,
        child: Widget,
        ?style: Style,
        ?size: Size,
    }) {
        this.route = arg.route;
        this.title = arg.title;
        this.navbar = arg.navbar;
        this.child = arg.child;
        this.style = arg.style != null ? arg.style : new Style({});
        this.size = arg.size != null ? arg.size : new Size({});
    }

    public function getRoute(): String {
        return route;
    }
    

    public function render() : Node {
        var element = Browser.document.createDivElement();
        element.id = "page";
        navbar != null ? element.appendChild(navbar.render()) : null;

        element.appendChild(child.render());
        
        new StyleManager().addStyleToDiv({size: size, widget: element, style: style, padding: Padding.all(0.0)});

        //Need to style container

        return element;
    }

}