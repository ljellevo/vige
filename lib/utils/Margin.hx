package lib.utils;

/**
    Is documented
**/


class Margin {
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

    public static function fromTRBL(top: Float, right: Float, bottom: Float, left: Float): Margin {
        return new Margin({top: top, right: right, bottom: bottom, left: left});
    }

    public static function all(margin: Float): Margin {
        return new Margin({top: margin, right: margin, bottom: margin, left: margin});
    }

    public function getMargin(): String {
        return top + "px " + right + "px " + bottom + "px " + left + "px";
    }
}