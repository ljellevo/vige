
import utils.Padding;
import utils.Size;
import utils.Color;
import utils.Style;
import js.Browser;

import components.Button;
import components.Page;
import components.Text;
import components.Column;
import components.Row;
import components.Container;

import core.Body;
import core.Navigator;

class Main {
     static function secondPage(): Page {
        return new Page({
            route: "/hello",
            child: new Text("Hello")
        });
    }


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
                            color: Color.MAGENTA
                        })
                    }),
                    new Button({
                        text: "Click me",
                        onClick: function (e) {
                            trace("Clicked");
                            Navigator.navigateTo({widget: secondPage()});
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