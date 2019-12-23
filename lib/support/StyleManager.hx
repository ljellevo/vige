package lib.support;

import lib.utils.Margin;
import lib.components.Row.RowAlignment;
import lib.utils.Padding;
import lib.utils.Size;
import lib.utils.Style;

class StyleManager {

    public function new (){}

    public function addStyleToDiv(arg: {
        size: Size, 
        widget: js.html.DivElement, 
        style: Style,
        padding: Padding,
        ?margin: Margin,
        ?alignment: RowAlignment
    }): js.html.Node {
        arg.widget.style.height = arg.size.getHeight();
        arg.widget.style.width = arg.size.getWidth();
        arg.widget.style.backgroundColor = arg.style.getBackgroundColor();
        arg.widget.style.padding = arg.padding.getPadding();
        arg.widget.style.margin = arg.margin != null ? arg.margin.getMargin() : Margin.all(0.0).getMargin();
        
        
        if(arg.alignment != null) {
            switch (arg.alignment){
                case TopLeft:
                    arg.widget.style.placeItems = "start start";
                case TopCenter:
                    arg.widget.style.placeItems = "start center";
                case TopRight:
                    arg.widget.style.placeItems = "start end";
                case Left:
                    arg.widget.style.placeItems = "center start";
                case Center:
                    arg.widget.style.placeItems = "center center";
                case Right:
                    arg.widget.style.placeItems = "center end";
                case LowerLeft:
                    arg.widget.style.placeItems = "end start";
                case LowerCenter:
                    arg.widget.style.placeItems = "end center";
                case LowerRight:
                    arg.widget.style.placeItems = "end end";
                case Stretch:
                    arg.widget.style.placeItems = "stretch";
            }
        }
        return arg.widget;
    }
}