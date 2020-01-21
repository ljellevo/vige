package com.vige.components;

import js.html.Node;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;
/*
import lib.components.Row;
import lib.support.StyleManager;
import js.Browser;
import js.html.Node;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;
*/

/**
    Is documented
**/


class Column implements Widget {
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
        this.crossAxisAlignment = arg.crossAxisAlignment != null ? arg.crossAxisAlignment : CrossAxisAlignment.FlexStart;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size != null ? arg.size : new Size({width: 100, widthType: "%"});
        this.overflow = arg.overflow;
    }

    public function init(){}


    public function render(): Node {
        var column = Browser.document.createDivElement();
        column.style.display = "grid";
        column.classList.add("column");
        column.style.boxSizing = "border-box";
        new StyleManager().addStyleToDiv({widget: column, color: color, border: border, padding: padding, margin: margin, size: size, mainAxisAlignment: mainAxisAlignment, crossAxisAlignment: crossAxisAlignment, type: DivType.Column, overflow: overflow});


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

