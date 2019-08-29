package utils;

import utils.Color;

class Style {
    var color: Color = null;


    public function new(
        arg: {
            ?color: Color
        }
        ){
        this.color = arg.color != null ? arg.color : new Color(Colors.transparent);
    }

    public function getColor(): String {
        return color.getColor();
    }
}