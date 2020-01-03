package lib.components;

import lib.utils.Style;
import lib.support.StyleManager;
import js.Browser;
import js.html.Node;
import lib.support.Widget;
import lib.utils.Size;
import lib.utils.Padding;

class Column implements Widget {
    var children: Array<Widget> = null;
    var style: Style;
    var cellStyle: Style;
    var size: Size;
    var cellSize: Size;
    var padding: Padding;


    public function new(arg: {
        children: Array<Widget>,
        ?style: Style,
        ?cellStyle: Style,
        ?size: Size,
        ?cellSize: Size,
        ?padding: Padding
    }) {
        this.children = arg.children;
        this.style = arg.style != null ? arg.style : new Style({});
        this.cellStyle = arg.cellStyle != null ? arg.cellStyle : new Style({});
        this.size = arg.size != null ? arg.size : new Size({});
        this.cellSize = arg.cellSize != null ? arg.cellSize : new Size({});
        this.padding = arg.padding != null ? arg.padding : Padding.all(0.0);
        //this.padding = arg.padding;
    }


    public function render(): Node {
        var column = Browser.document.createDivElement();
        column.style.display = "grid";
        //column.style.gridTemplateColumns = "auto/auto";
        column.style.boxSizing = "border-box";
        new StyleManager().addStyleToDiv({size: size, widget: column, style: style, padding: padding});

        for(child in children) {
            var columnCell = Browser.document.createDivElement();
            columnCell.appendChild(child.render());
            new StyleManager().addStyleToDiv({size: cellSize, widget: columnCell, style: cellStyle, padding: padding});
            column.appendChild(columnCell);
        }
        
        return column;
    }
}

