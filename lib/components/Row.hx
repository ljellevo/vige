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


/**
    Is documented,, not enum
    Need updated docs
**/

class Row implements Widget {
    var children: Array<Widget> = null;
    var cellColor: Color;
    var cellSize: Size;
    var cellPadding: Padding;
    var alignment: RowAlignment;
    var equalElementWidth: Bool;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;


    public function new(arg: {
        children: Array<Widget>,
        ?equalElementWidth: Bool,
        ?cellColor: Color,
        ?cellSize: Size,
        ?cellPadding: Padding,
        ?alignment: RowAlignment,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        
    }) {
        this.children = arg.children;
        this.equalElementWidth = arg.equalElementWidth != null ? arg.equalElementWidth : true;
        this.cellColor = arg.cellColor != null ? arg.cellColor : new Color({});
        this.cellSize = arg.cellSize != null ? arg.cellSize : new Size({});
        this.cellPadding = arg.cellPadding != null ? arg.cellPadding : Padding.all(0.0);
        this.alignment = arg.alignment != null ? arg.alignment : RowAlignment.Center; 

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
    }

    public function init(){}


    public function render(): Node {
        var row = Browser.document.createDivElement();
        if(equalElementWidth) {
            row.style.display = "grid";
        } else {
            row.style.display = "inline-grid";
        }
        
        //row.style.gridTemplateColumns =  Std.string(children.length) + " auto auto";
        //row.style.gridTemplateRows = "auto 1fr";
        row.classList.add("row");
        row.style.gridAutoFlow = "column";
        new StyleManager().addStyleToDiv({widget: row, color: color, border: border, padding: padding, margin: margin, size: size, alignment: alignment});

        for(child in children) {
            /*
            var rowCell = Browser.document.createDivElement();
            rowCell.classList.add("row-cell");
            rowCell.appendChild(child.render());
            new StyleManager().addStyleToDiv({widget: rowCell, color: cellColor, padding: cellPadding, size: cellSize});
            row.appendChild(rowCell);
            */
            
            var cell = child.render();
            row.appendChild(cell);
            
            
        }
        
        return row;
    }
}