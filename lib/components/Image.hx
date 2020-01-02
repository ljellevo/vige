package lib.components;

import lib.components.Center.CenterAlignment;
import lib.utils.Padding;
import lib.utils.Size;
import js.Browser;
import lib.support.Widget;
import lib.support.StyleManager;
import lib.utils.Style;


/**
Not done
**/

class Image implements Widget {

    var src: String;
    var alt: String;
    var height: Float;
    var width: Float;
    var style: Style;

    public function new(arg: {
        src: String,
        ?alt: String,
        ?height: Float,
        ?width: Float,
        ?style: Style
    }) {
        this.src = arg.src;
        this.alt = arg.alt;
        this.height = arg.height;
        this.width = arg.width;
        this.style = arg.style;
    }
    
    public function render():js.html.Node {
        var container = Browser.document.createImageElement();

        container.src = src;
        container.alt = alt;
        if(height == null) {
            container.style.height = "auto";
        } else {
            container.style.height = Std.string(height);
        }

        if(width == null) {
            container.style.width = "auto";
        } else {
            container.style.width = Std.string(width) + "%";
        }

        if(style != null) {
            //container.style.fill = style.getColor();
            //container.style.backgroundColor = style.getBackgroundColor();
        }
        
        
        //container.height = Std.int(height);
        //container.width = Std.int(width);

        return container;

        /*
        var container = Browser.document.createDivElement();
        if(child != null) {
             container.appendChild(child.render());
        }
        
       
        new StyleManager().addStyleToDiv({size: size, widget: container, style: style, padding: Padding.all(0.0)});
        //container.style.margin = "auto";
        
        return container;
        */
    }
}