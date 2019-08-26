import js.Browser;

import widgets.Container;
import widgets.Button;

class Main {
    static function main() {

        var container = new Container(
            100,
            100,
            new Button(
                "test", 
                function(event) {
                    Browser.alert("Haxe is great yo");
                }
            ),
            {test: "hei"} // Dette som er løsningen
        );

        Browser.document.body.appendChild(container.render());
        
    }
}