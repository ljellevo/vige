package support;

import utils.Style;

class StyleManager {

    public function new (){}

    public function addStyleToDiv(height: String, width: String, widget: js.html.DivElement, style: Style): js.html.Node {
        widget.style.height = height;
        widget.style.width = width;
        widget.style.backgroundColor = style.getColor();
        return widget;
    }
}