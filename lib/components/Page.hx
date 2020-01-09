package lib.components;

import lib.core.GlobalState;
import lib.support.StyleManager;
import js.Browser;
import js.html.Node;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;

/**
    Is documented
**/

class Page implements Widget{
    var route: String;
    var title: String = "NOT IMPLEMENTED";
    var navbar: Widget;
    var child: Widget;


    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;


    public function new(arg: {
        route: String,
        ?title: String,
        ?navbar: Widget,
        child: Widget,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
    }) {
        this.route = arg.route;
        this.title = arg.title;
        this.navbar =  arg.navbar;
        this.child = arg.child;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
    }

    public function init(){}



    public function getRoute(): String {
        return route;
    }
    

    public function render() : Node {
        var element = Browser.document.createDivElement();
        element.id = "page";
        navbar != null ? element.appendChild(navbar.render()) : null;
        //element.appendChild(navbar.render());
        element.appendChild(child.render());
        
        new StyleManager().addStyleToDiv({widget: element, color: color, border: border, padding: padding, margin: margin, size: size});

        //Need to style container

        return element;
    }

}