package components;

import utils.Style;
import support.StyleManager;
import js.Browser;
import js.html.Node;
import support.Widget;
import utils.Size;

class Column implements Widget {
    var children: Array<Widget> = null;
    var style: Style;
    var cellStyle: Style;
    var size: Size;
    var cellSize: Size;


    public function new(arg: {
        children: Array<Widget>,
        ?style: Style,
        ?cellStyle: Style,
        ?size: Size,
        ?cellSize: Size
    }) {
        this.children = arg.children;
        this.style = arg.style != null ? arg.style : new Style({});
        this.cellStyle = arg.cellStyle != null ? arg.cellStyle : new Style({});
        this.size = arg.size != null ? arg.size : new Size({});
        this.cellSize = arg.cellSize != null ? arg.cellSize : new Size({});
    }


    public function render(): Node {
        var column = Browser.document.createDivElement();
        column.style.display = "grid";
        column.style.gridTemplateColumns = "auto/auto";
        column.style.padding = "10px";
        new StyleManager().addStyleToDiv(size.getHeight(), size.getWidth(), column, style);

        for(child in children) {
            var columnCell = Browser.document.createDivElement();
            columnCell.style.padding = "10px";
            columnCell.appendChild(child.render());


            new StyleManager().addStyleToDiv(cellSize.getHeight(), cellSize.getWidth(), columnCell, cellStyle);
            column.appendChild(columnCell);
        }
        

        return column;
    }
}

