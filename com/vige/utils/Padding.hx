package com.vige.utils;

/**
    Is documented
**/


class Padding {
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

    public static function fromTRBL(top: Float, right: Float, bottom: Float, left: Float): Padding {
        return new Padding({top: top, right: right, bottom: bottom, left: left});
    }

    public static function all(padding: Float): Padding {
        return new Padding({top: padding, right: padding, bottom: padding, left: padding});
    }

    public function getPadding(): String {
        return top + "px " + right + "px " + bottom + "px " + left + "px";
    }
}