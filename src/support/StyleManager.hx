package support;

import utils.Style;

class StyleManager {

    public function new (){}

    public function addStyleToDiv(height: Float, width: Float, widget: js.html.DivElement, style: Style): js.html.Node {
        widget.style.width = width == Math.POSITIVE_INFINITY ? Std.string(100) + "%" : Std.string(width);
        widget.style.height = height == Math.POSITIVE_INFINITY ? Std.string(100) + "%" : Std.string(height);
        widget.style.backgroundColor = style.getColor();
        return widget;
    }
}