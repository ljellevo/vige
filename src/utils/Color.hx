package utils;

enum Colors {
    red;
    blue;
    white;
    transparent;
    rgb(r: Int, g: Int, b: Int);
}

class Color {
    var color: Colors = null;

    public function new(color: Colors) {
        this.color = color;
    }

/*
    public function getColor(): String{
        switch (color){
            case red:

            case blue:

            case white:

            case transparent:

            default:
                return "#e5f3a2";
        }

        //return color;
    }
    */

    public function getColor() {
        return "#70C5B0";
    }
}