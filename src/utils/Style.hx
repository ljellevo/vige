package utils;

import utils.Color;

class Style {
    var color: Color;


    public function new(arg: {
        ?color: Color
    }) {
        this.color = arg.color;
        trace("Color from Style constructor: " + color);
    }

    public function getColor(): String {
        if (color == null) {
            return "";
        }
        return "rgba(" + color.ri + ", " +  color.gi + ", " + color.bi + ", " + color.af + ")";
    }
}
