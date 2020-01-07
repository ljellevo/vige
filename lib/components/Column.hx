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

class Column implements Widget {
    var children: Array<Widget> = null;
    var cellColor: Color;
    var cellSize: Size;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;


    public function new(arg: {
        children: Array<Widget>,
        ?cellColor: Color,
        ?cellSize: Size,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
    }) {
        this.children = arg.children;
        this.cellColor = arg.cellColor != null ? arg.cellColor : new Color({});
        this.cellSize = arg.cellSize != null ? arg.cellSize : new Size({});

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
    }

    public function init(){}


    public function render(): Node {
        var column = Browser.document.createDivElement();
        column.style.display = "grid";
        column.style.boxSizing = "border-box";
        new StyleManager().addStyleToDiv({widget: column, color: color, border: border, padding: padding, margin: margin, size: size});


        for(child in children) {
            /*
            var columnCell = Browser.document.createDivElement();
            columnCell.appendChild(child.render());
            new StyleManager().addStyleToDiv({widget: columnCell, color: cellColor, size: cellSize});

            column.appendChild(columnCell);
            */
            var cell = child.render();
            column.appendChild(cell);
        }
        
        return column;
    }
}

