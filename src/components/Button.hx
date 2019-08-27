package components;

import js.Browser;
import interfaces.Widget;

class Button implements Widget {
    var text: String = "";
    var onClick: haxe.Constraints.Function = null;

    public function new(arg: {text: String, onClick: haxe.Constraints.Function}) {
        this.text = arg.text;
        this.onClick = arg.onClick;
    }

    public function render():js.html.Node {
        var button = Browser.document.createButtonElement();
        button.textContent = text;
        button.onclick = onClick;
        return button;
        
    }
}