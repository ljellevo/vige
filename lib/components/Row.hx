package lib.components;

import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Style;
import lib.support.StyleManager;
import js.Browser;
import js.html.Node;
import lib.support.Widget;
import lib.utils.Size;

enum RowAlignment {
    TopLeft;
    TopCenter;
    TopRight;
    Left;
    Center;
    Right;
    LowerLeft;
    LowerCenter;
    LowerRight;
    Stretch;
}

class Row implements Widget {
    var children: Array<Widget> = null;
    var style: Style;
    var cellStyle: Style;
    var size: Size;
    var cellSize: Size;
    var padding: Padding;
    var margin: Margin;
    var cellPadding: Padding;
    var alignment: RowAlignment;


    public function new(arg: {
        children: Array<Widget>,
        ?style: Style,
        ?cellStyle: Style,
        ?size: Size,
        ?cellSize: Size,
        ?padding: Padding,
        ?margin: Margin,
        ?cellPadding: Padding,
        ?alignment: RowAlignment
        
    }) {
        this.children = arg.children;
        this.style = arg.style != null ? arg.style : new Style({});
        this.cellStyle = arg.cellStyle != null ? arg.cellStyle : new Style({});
        this.size = arg.size != null ? arg.size : new Size({height: 100, heightType: "%", width: 100, widthType: "%"});
        this.cellSize = arg.cellSize != null ? arg.cellSize : new Size({});
        this.padding = arg.padding != null ? arg.padding : Padding.all(0.0);
        this.margin = arg.margin != null ? arg.margin : Margin.all(0.0);
        this.cellPadding = arg.cellPadding != null ? arg.cellPadding : Padding.all(0.0);
        this.alignment = arg.alignment != null ? arg.alignment : RowAlignment.Center; 
    }


    public function render(): Node {
        var row = Browser.document.createDivElement();
        row.style.display = "grid";
        //row.style.gridTemplateColumns =  Std.string(children.length) + " auto auto";
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
        
        return row;
    }
}