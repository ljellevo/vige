package lib.components;

import lib.utils.Style;
import lib.utils.Padding;
import lib.utils.Size;
import lib.support.StyleManager;
import js.Browser;
import js.html.Node;
import lib.support.Widget;

enum CenterAlignment {
    Horizontal;
    Vertical;
    Both;
}

class Center implements Widget {
    var child: Widget;
    var alignment: CenterAlignment;
    var style: Style;
    var padding: Padding;


    public function new(arg: {
        child: Widget, 
        alignment: CenterAlignment,
        ?style: Style,        
        ?padding: Padding,
        
    }) {
        this.child = arg.child;
        this.alignment = arg.alignment;
        this.style = arg.style != null ? arg.style : new Style({});
        this.padding = arg.padding != null ? arg.padding : Padding.all(0.0);
    }

    public function render() : js.html.Node {
        var parent = Browser.document.createDivElement();
        parent.id = "center";
        var element = Browser.document.createDivElement();

        switch alignment {
            case Horizontal:
                element.id = "element";
                element.style.display = "flex";
                element.style.justifyContent = "center";
                
                new StyleManager().addStyleToDiv({size: new Size({width: 100, widthType: "%"}), widget: parent, style: style, padding: padding});
                element.appendChild(child.render());
                parent = element;
                

            case Vertical:
                element.style.position = "relative";
                element.style.top = "50%";
                element.style.transform = "translateY(-50%)";
                new StyleManager().addStyleToDiv({size: new Size({height: 100, heigthType: "%"}), widget: parent, style: style, padding: padding});
                element.appendChild(child.render());
                parent.appendChild(element);
            case Both:
                element.id = "element";
                element.style.display = "flex";
                element.style.justifyContent = "center";
                element.style.position = "relative";
                element.style.top = "50%";
                element.style.transform = "translateY(-50%)";
                new StyleManager().addStyleToDiv({size: new Size({height: 100, heigthType: "%"}), widget: parent, style: style, padding: padding});
                element.appendChild(child.render());
                parent.appendChild(element);


        }
        

        
        return parent;
    }

}