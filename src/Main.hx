import utils.Size;
import utils.Color;
import utils.Style;
import js.Browser;

import components.Button;
import components.Page;
import components.Text;
import components.Column;
import core.Body;

class Main {
    static function main() {

        var page = new Page({
            route: "/",
            child: new Column({
                style: new Style({
                    color: Color.WHITE
                }),
                cellSize: new Size({
                    height: 100.0, 
                    heigthType: "px", 
                    width: 100.0, 
                    widthType: "px"
                }),
                children: [
                    new Text("Hello"),
                    new Text("Hello"),
                    new Text("Hello"),
                    new Button({
                        text: "Click me",
                        onClick: function (e) {
                            trace("Clicked");
                        }
                    })
                ]
            })
        });

        /*
        new Button({
            text: "Click me",
            onClick: function (e) {
                trace("Clicked");
            }
        });
        */

        Browser.document.body.style.margin = "0px";
        //Browser.document.body.appendChild(page.render());
        new Body().init(page.render());
    }
}