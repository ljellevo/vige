package utils;

class Position {
    var x: Float = 0.0;
    var y: Float = 0.0;

    public function new(arg: {
        x: Float, 
        y: Float
    }) {
        this.x = arg.x;
        this.y = arg.y;
    }
}