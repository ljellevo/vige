package lib.components;

import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Style;
import lib.support.StyleManager;
import js.Browser;
import js.html.Node;
import lib.support.Widget;
import lib.utils.Size;


enum NavbarPosition {
    Top;
    Bottom;
}

class Navbar implements Widget {
    var child: Widget;
    var height: Int;
    var style: Style;
    var position: NavbarPosition;
    var sticky: Bool;
    var padding: Padding;
    var margin: Margin;
    var offset: Int;


    public function new(arg: {
        child: Widget,
        height: Int,
        ?style: Style,
        ?position: NavbarPosition,
        ?sticky: Bool,
        ?padding: Padding,
        ?margin: Margin,
        ?offset: Int
        
    }) {
        this.child = arg.child;
        this.height = arg.height;
        this.style = arg.style != null ? arg.style : new Style({});
        this.position = arg.position != null ? arg.position : NavbarPosition.Top;
        this.sticky = arg.sticky != null ? arg.sticky : true;
        this.padding = arg.padding != null ? arg.padding : Padding.all(0.0);
        this.margin = arg.margin != null ? arg.margin : Margin.all(0.0);
        this.offset = arg.offset != null ? arg.offset : 0;
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

        new StyleManager().addStyleToDiv({size: null, widget: navbar, style: style, padding: padding, margin: margin});
        navbar.appendChild(child.render());
        navbar.style.overflow = "hidden";
        navbar.style.position = "fixed";
        navbar.style.top = Std.string(offset) + "px";
        navbar.style.width = "100%";
        navbar.style.height = Std.string(height) + "px";
        return navbar;

    }
}