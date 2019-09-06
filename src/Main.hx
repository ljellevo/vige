
import lib.utils.Padding;
import lib.utils.Size;
import lib.utils.Color;
import lib.utils.Style;
import js.Browser;

import lib.components.Button;
import lib.components.Page;
import lib.components.Text;
import lib.components.Column;
import lib.components.Row;
import lib.components.Container;

import lib.core.Body;

class Main {
    static function main() {

        var page = new Page({
            route: "/",
            child: new Column({
                style: new Style({
                    color: Color.WHITE
                }),
                size: new Size({
                    height: 100,
                    heigthType: "%",
                }),
                padding: Padding.all(10),
                children: [
                    new Row({
                        children: [
                            new Text("Row"),
                            new Text("Row"),
                            new Text("Row")
                        ]
                    }),
                    new Text("Hello"),
                    new Text("Hello", {
                        style: new Style({
                            color: Color.YELLOW
                        })
                    }),
                    new Button({
                        text: "Click me",
                        onClick: function (e) {
                            trace("Clicked");
                        }
                    })
                ]
            })
        });


        Browser.document.body.style.margin = "0px";
        //Browser.document.body.appendChild(page.render());
        new Body().init(page.render());
    }
}