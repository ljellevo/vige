import button.Button;
import js.Browser;
import container.Container;

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
            )
        );

    
        Browser.document.body.appendChild(container.render());
    }
}