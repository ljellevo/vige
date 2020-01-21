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

enum MainAxisAlignment {
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

enum CrossAxisAlignment {
  Stretch;
  Center;
  FlexStart;
  FlexEnd;
  Initial;
  Inherit;
  SpacedEvenly;
  SpaceBetween;
  SpaceAround;
}


/**
    Is documented,, not enum
    Need updated docs
    Need to have even destribution, fill and so on...
    https://www.w3schools.com/cssref/css3_pr_align-content.asp
    https://www.w3schools.com/cssref/css3_pr_justify-content.asp
**/

class Row implements Widget {
    var children: Array<Widget> = null;
    var cellColor: Color;
    var cellSize: Size;
    var cellPadding: Padding;
    var cellMargin: Margin;
    var mainAxisAlignment: MainAxisAlignment;
    var crossAxisAlignment: CrossAxisAlignment;
    var equalElementWidth: Bool;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;



    public function new(arg: {
        children: Array<Widget>,
        ?equalElementWidth: Bool,
        ?cellColor: Color,
        ?cellSize: Size,
        ?cellPadding: Padding,
        ?cellMargin: Margin,
        ?mainAxisAlignment: MainAxisAlignment,
        ?crossAxisAlignment: CrossAxisAlignment,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        ?overflow: Overflow,
        
    }) {
        this.children = arg.children;
        this.equalElementWidth = arg.equalElementWidth != null ? arg.equalElementWidth : true;
        this.cellColor = arg.cellColor != null ? arg.cellColor : new Color({});
        this.cellSize = arg.cellSize != null ? arg.cellSize : new Size({width: 100, widthType: "%"});
        this.cellPadding = arg.cellPadding;
        this.cellMargin = arg.cellMargin;
        this.mainAxisAlignment = arg.mainAxisAlignment != null ? arg.mainAxisAlignment : MainAxisAlignment.Stretch; 
        this.crossAxisAlignment = arg.crossAxisAlignment != null ? arg.crossAxisAlignment : CrossAxisAlignment.Stretch;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size != null ? arg.size : new Size({width: 100, widthType: "%"});
        this.overflow = arg.overflow;
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
        new StyleManager().addStyleToDiv({widget: row, color: color, border: border, padding: padding, margin: margin, size: size, mainAxisAlignment: mainAxisAlignment, crossAxisAlignment: crossAxisAlignment, type: DivType.Row, overflow: overflow});

        for(child in children) {
            
            var rowCell = Browser.document.createDivElement();
            rowCell.classList.add("row-cell");
            rowCell.style.boxSizing = "border-box";
            
            rowCell.appendChild(child.render());
            new StyleManager().addStyleToDiv({widget: rowCell, color: cellColor, padding: cellPadding, margin: cellMargin, size: cellSize});
            row.appendChild(rowCell);
            
            /*
            var cell = child.render();
            row.appendChild(cell);
            */
            
        }
        
        return row;
    }
}