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


enum NavbarPosition {
    Top;
    Bottom;
}

/* not done */

class Navbar implements Widget {
    var child: Widget;
    var height: Int;
    var position: NavbarPosition;
    var sticky: Bool;
    var offset: Int;

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

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
    }


    public function render(): Node {
        var navbar = Browser.document.createDivElement();
        /*
        row.style.display = "grid";
        row.classList.add("row");
        row.style.gridAutoFlow = "column";
        new StyleManager().addStyleToDiv({size: size, widget: row, style: style, padding: padding, alignment: alignment});

        for(child in children) {
            var rowCell = Browser.document.createDivElement();
            rowCell.classList.add("row-cell");
            rowCell.appendChild(child.render());
            new StyleManager().addStyleToDiv({size: cellSize, widget: rowCell, style: cellStyle, padding: cellPadding, margin: margin});
            row.appendChild(rowCell);
        }
        */

        new StyleManager().addStyleToDiv({widget: navbar, color: color, border: border, padding: padding, margin: margin, size: size});
        navbar.appendChild(child.render());
        navbar.style.overflow = "hidden";
        navbar.style.position = "fixed";
        navbar.style.top = Std.string(offset) + "px";
        navbar.style.width = "100%";
        if(height != null) {
            navbar.style.height = Std.string(height) + "px";
        }
        
        return navbar;

    }
}