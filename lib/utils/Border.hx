package lib.utils;

import lib.utils.Colors;


enum BorderStyle {
    Dotted;
    Dashed;
    Solid;
    Double;
    Groove;
    Ridge;
    Inset;
    Outset;
    None;
    Hidden;
}

enum BorderSides {
    Top;
    Right;
    Bottom;
    Left;
    All;
}

class CornerRadius {
    var top: Float;
    var right: Float;
    var bottom: Float;
    var left: Float;
    

    function new(arg: {
        top: Float, 
        right: Float, 
        bottom: Float, 
        left: Float
    }) {
        this.top = arg.top;
        this.right = arg.right;
        this.bottom = arg.bottom;
        this.left = arg.left;
    }

    public static function fromTRBL(top: Float, right: Float, bottom: Float, left: Float): CornerRadius {
        return new CornerRadius({top: top, right: right, bottom: bottom, left: left});
    }

    public static function all(radius: Float): CornerRadius {
        return new CornerRadius({top: radius, right: radius, bottom: radius, left: radius});
    }

    public function getCornerRadius(): String {
        return top + "px " + right + "px " + bottom + "px " + left + "px";
    }
}

class Border {
    var style: BorderStyle;
    var width: Int;
    var color: Colors;
    var cornerRadius: CornerRadius;
    var sides: BorderSides;

    public function new(arg: {
        ?style: BorderStyle,
        ?width: Int,
        ?color: Colors,
        ?cornerRadius: CornerRadius,
        ?sides: BorderSides
        
    }) {
        this.style = arg.style != null ? arg.style : BorderStyle.Solid;
        this.width = arg.width != null ? arg.width : 5;
        this.color = arg.color != null ? arg.color : Colors.BLACK;
        this.cornerRadius = arg.cornerRadius != null ? arg.cornerRadius : CornerRadius.all(0.0);
        this.sides = arg.sides != null ? arg.sides : BorderSides.All;
    }

    public function getStyle(): String {
        var styleString = "";
        switch (style){
            case Dotted:
                styleString = "dotted";
            case Dashed:
                styleString = "dashed";
            case Solid:
                styleString = "solid";
            case Double:
                styleString = "double";
            case Groove:
                styleString = "groove";
            case Ridge:
                styleString = "ridge";
            case Inset:
                styleString = "inset";
            case Outset:
                styleString = "outset";
            case None:
                styleString = "none";
            case Hidden:
                styleString = "hidden";
        }
        return styleString;
    }

    public function getWidth(): String {
        return Std.string(width) + "px";
    }

    public function getColor(): String {
        return "rgba(" + color.ri + ", " +  color.gi + ", " + color.bi + ", " + color.ai + ")";
    }

    public function getCornerRadius(): String {
        return cornerRadius.getCornerRadius();
    }

    public function getSides(): BorderSides {
        return sides;
    }


    
}