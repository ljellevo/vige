package lib.components;

import lib.utils.Size;
import js.Browser;
import lib.support.Widget;

class Button implements Widget {
    var child: Widget = null;
    var size: Size = null;
    var image: Image = null;
    var onClick: haxe.Constraints.Function = null;

    public function new(arg: {child: Widget, ?size: Size, ?image: Image, onClick: haxe.Constraints.Function}) {
        this.child = arg.child;
        this.size = arg.size;
        this.image = arg.image;
        this.onClick = arg.onClick;
    }

    public function render():js.html.ButtonElement {
        var button = Browser.document.createButtonElement();
        button.appendChild(child.render());
        //button.textContent = text;
        button.onclick = onClick;
        button.style.cursor = "pointer";
        if(size != null) {
            button.style.height = size.getHeight();
            button.style.width = size.getWidth();
        }
        if(this.image != null) {
            trace("Button with image");
            //var imageElement = Browser.document.createImageElement();
            //imageElement.src = image;
            button.appendChild(image.render());
        }
        return button;
        
    }
}