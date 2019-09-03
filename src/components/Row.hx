package components;

import utils.Padding;
import utils.Style;
import support.StyleManager;
import js.Browser;
import js.html.Node;
import support.Widget;
import utils.Size;

class Row implements Widget {
    var children: Array<Widget> = null;
    var style: Style;
    var cellStyle: Style;
    var size: Size;
    var cellSize: Size;
    var padding: Padding;
    var cellPadding: Padding;


    public function new(arg: {
        children: Array<Widget>,
        ?style: Style,
        ?cellStyle: Style,
        ?size: Size,
        ?cellSize: Size,
        ?padding: Padding,
        ?cellPadding: Padding
        
    }) {
        this.children = arg.children;
        this.style = arg.style != null ? arg.style : new Style({});
        this.cellStyle = arg.cellStyle != null ? arg.cellStyle : new Style({});
        this.size = arg.size != null ? arg.size : new Size({});
        this.cellSize = arg.cellSize != null ? arg.cellSize : new Size({});
        this.padding = arg.padding != null ? arg.padding : Padding.all(0.0);
        this.cellPadding = arg.cellPadding != null ? arg.cellPadding : Padding.all(0.0);
    }


    public function render(): Node {
        var row = Browser.document.createDivElement();
        row.style.display = "grid";
        row.style.gridTemplateColumns = "auto auto auto";
        row.style.gridAutoFlow = "column";
        new StyleManager().addStyleToDiv({size: size, widget: row, style: style, padding: padding});

        for(child in children) {
            var rowCell = Browser.document.createDivElement();
            rowCell.appendChild(child.render());
            new StyleManager().addStyleToDiv({size: cellSize, widget: rowCell, style: cellStyle, padding: cellPadding});
            row.appendChild(rowCell);
        }
        
        return row;
    }
}