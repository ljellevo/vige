package button;

import util.Widget;

import js.Browser;

class Button implements Widget {
    var text: String = "";
    var onClick: haxe.Constraints.Function = null;

    public function new(text, onClick) {
        this.text = text;
        this.onClick = onClick;
    }


    public function render():js.html.Node {
        var button = Browser.document.createButtonElement();
        button.textContent = text;
        button.onclick = onClick;
        return button;
        
    }
}