package com.vige.utils;

/**
    Is documented
**/


class Size {
    var minHeight: String;
    var minWidth: String;
    var height: String;
    var width: String;
    var maxHeight: String;
    var maxWidth: String;

    public function new(arg: {
        ?minHeight: String,
        ?minWidth: String,
        ?height: String,
        ?width: String,
        ?maxHeight: String,
        ?maxWidth: String,
    }) {
        this.minHeight = arg.minHeight != null ? arg.minHeight : Std.string(Math.NEGATIVE_INFINITY) + "px";
        this.minWidth = arg.minWidth != null ? arg.minWidth : Std.string(Math.NEGATIVE_INFINITY) + "px";
        this.height = arg.height != null ? arg.height : Std.string(Math.NEGATIVE_INFINITY) + "px";
        this.width = arg.width != null ? arg.width : Std.string(Math.NEGATIVE_INFINITY) + "px";
        this.maxHeight = arg.maxHeight != null ? arg.maxHeight : Std.string(Math.NEGATIVE_INFINITY) + "px";
        this.maxWidth = arg.maxWidth != null ? arg.maxWidth : Std.string(Math.NEGATIVE_INFINITY) + "px";
    }

    public function getMinHeight(): String {
        return minHeight;
    }

    public function getMinWidth(): String {
        return minWidth;
    }

    public function getHeight(): String {
        return height;
    }

    public function getWidth(): String {
        return width;
    }

    public function getMaxHeight(): String {
        return maxHeight;
    }

    public function getMaxWidth(): String {
        return maxWidth;
    }
}