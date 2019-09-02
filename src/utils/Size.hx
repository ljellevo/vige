package utils;

class Size {
    var height: Float;
    var heigthType: String;
    var width: Float;
    var widthType: String;

    public function new(arg: {
        ?height: Float,
        ?heigthType: String,
        ?width: Float,
        ?widthType: String
    }) {
        this.height = arg.height != null ? arg.height : Math.NEGATIVE_INFINITY;
        this.heigthType = arg.heigthType != "" ? arg.heigthType : "px";
        this.width = arg.width != null ? arg.width : Math.NEGATIVE_INFINITY;
        this.widthType = arg.widthType != "" ? arg.widthType : "px";
    }

    public function getHeight(): String {
        if (height == Math.NEGATIVE_INFINITY) {
            return null;
        }
        return Std.string(height) + heigthType;
    }

    public function getWidth(): String {
        if (width == Math.NEGATIVE_INFINITY) {
            return null;
        }
        return Std.string(width) + widthType;
    }

}