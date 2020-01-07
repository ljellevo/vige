package lib.components;

import lib.support.StyleManager;
import js.Browser;
import js.html.Node;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;

/*
new Navbar({
    position: NavbarPosition.Top,
    offset: 0,
    sticky: true,
    color: new Color({backgroundColor: "#fafafa"}),
    child: new Row({
    margin: Margin.all(10),
    children: [
        homepageButton("Quick-start", "./assets/book-open.svg", function(e){}),
        homepageButton("Widgets", "./assets/book-solid.svg", function(e){}),
        homepageButton("Snippets", "./assets/code-solid.svg", function(e){}),
        homepageButton("Templates", "./assets/template.svg", function(e){}),
        homepageButton("Codebase", "./assets/github.svg", function(e){}),
        
        homepageButton("Sockets", "", function(e){
        Navigate.to({url: "/sockets"});
        }),
        homepageButton("Database", "", function(e){
        Navigate.to({url: "/database"});
        }),
    ],
        
    })
}),
*/

enum NavbarPosition {
    Top;
    Bottom;
}

/* not done 


- Needs to be able to highlight button that is connected to current route or something, this
to show user if they are at a certain route.

*/

class Navbar implements Widget {
    var child: Widget;
    var height: Int;
    var position: NavbarPosition;
    var sticky: Bool;
    var offset: Int;
    var onComplete: haxe.Constraints.Function;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;


    public function new(arg: {
        child: Widget,
        ?height: Int,
        ?position: NavbarPosition,
        ?sticky: Bool,
        ?offset: Int,
        ?onComplete: haxe.Constraints.Function,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        
    }) {
        this.child = arg.child;
        this.height = arg.height;
        this.position = arg.position != null ? arg.position : NavbarPosition.Top;
        this.sticky = arg.sticky != null ? arg.sticky : true;
        this.offset = arg.offset != null ? arg.offset : 0;
        this.onComplete = arg.onComplete != null ? arg.onComplete : function(){};

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
    }

    public function init(){}


    public function render(): Node {
        var navbar = Browser.document.createDivElement();        

        new StyleManager().addStyleToDiv({widget: navbar, color: color, border: border, padding: padding, margin: margin, size: size});
        navbar.appendChild(child.render());
        navbar.style.overflow = "hidden";
        if(sticky){
            navbar.style.position = "sticky";
            //navbar.style.position = "-webkit-sticky";
        } else {
            navbar.style.position = "fixed";
        }
        //navbar.style.position = "absolute";
        if(position == NavbarPosition.Top){
            navbar.style.top = Std.string(offset) + "px";
        } else {
            navbar.style.bottom = Std.string(offset) + "px";
        }
        
        navbar.style.width = "100%";
        if(height != null) {
            navbar.style.height = Std.string(height) + "px";
        }
        navbar.style.zIndex = "1000";
        onComplete();
        return navbar;
    }
}