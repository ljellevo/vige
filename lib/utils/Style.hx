package lib.utils;

import lib.utils.Color;

class Style {
    var color: Color;
    var backgroundColor: Color;


    public function new(arg: {
        ?color: Color,
        ?backgroundColor: Color
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
        return "rgba(" + backgroundColor.ri + ", " +  backgroundColor.gi + ", " + backgroundColor.bi + ", " + backgroundColor.ai + ")";
    }
}
