import utils.Color;
import utils.Style;
import js.Browser;

import components.Container;
import components.Button;

class Main {
    static function main() {
        var container = new Container({
            height: 100,
            width: 100,
            style: new Style({color: new Color(Colors.red)}),
            child: new Button({
                text: "Click me",
                onClick: function(event) {
                    trace(event);
                    Browser.alert("You clicked me!");
                }
            }),
        });

        Browser.document.body.appendChild(container.render());
    }
}