package com.vige.utils;

import com.vige.utils.*;

/**
    Is documented
**/

class Color {
    var color: Colors;
    var backgroundColor: Colors;


    public function new(arg: {
        ?color: Colors,
        ?backgroundColor: Colors
    }) {
        this.color = arg.color;
        this.backgroundColor = arg.backgroundColor;
    }

    public function getColor(): String {
        if (color == null) {
            return "";
        }
        return "rgba(" + color.ri + ", " +  color.gi + ", " + color.bi + ", " + color.ai + ")";
    }

    public function getBackgroundColor(): String {
        if (backgroundColor == null) {
            return "";
        }
        return "rgba(" + backgroundColor.ri + ", " +  backgroundColor.gi + ", " + backgroundColor.bi + ", " + (backgroundColor.ai / 255) + ")";
    }
}
