package lib.components;

import js.Browser;
import lib.support.Widget;

class Button implements Widget {
    var child: Widget = null;
    var image: Image = null;
    var onClick: haxe.Constraints.Function = null;

    public function new(arg: {child: Widget, ?image: Image, onClick: haxe.Constraints.Function}) {
        this.child = arg.child;
        this.image = arg.image;
        this.onClick = arg.onClick;
    }

    public function render():js.html.ButtonElement {
        var button = Browser.document.createButtonElement();
        button.appendChild(child.render());
        //button.textContent = text;
        button.onclick = onClick;
        if(this.image != null) {
            trace("Button with image");
            //var imageElement = Browser.document.createImageElement();
            //imageElement.src = image;
            button.appendChild(image.render());
        }
        return button;
        
    }
}