package support;

import utils.Padding;
import utils.Size;
import utils.Style;

class StyleManager {

    public function new (){}

    public function addStyleToDiv(arg: {
        size: Size, 
        widget: js.html.DivElement, 
        style: Style,
        padding: Padding
    }): js.html.Node {
        arg.widget.style.height = arg.size.getHeight();
        arg.widget.style.width = arg.size.getWidth();
        arg.widget.style.backgroundColor = arg.style.getColor();
        arg.widget.style.padding = arg.padding.getPadding();
        return arg.widget;
    }
}