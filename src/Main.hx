
import js.html.audio.ChannelSplitterNode;
import lib.support.Widget;
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
import lib.components.Center;
import lib.components.Container;

import lib.core.Body;
import lib.core.Navigate;

class HelloPage {
    public static function component() : Widget {
        return new Page({
            route: "/hello",
            child: new Column({
                size: new Size({
                    height: 100,
                    heigthType: "%",
                    width: 100,
                    widthType: "%"
                }),
                children: [
                    new Row({
                        size: new Size({
                            height: 100,
                            heigthType: "%"
                        }),
                        children: [
                            new Center({
                                child: new Container({
                                    style: new Style({color: Color.MAGENTA}),
                                    size: new Size({width: 20, widthType: "px", height: 20, heigthType: "px"})

                                }),
                                alignment: CenterAlignment.Both
                            }),
                            new Button({
                                text: "Click me",
                                onClick: function (e) {
                                    Navigate.getParams();
                                    /*
                                    Navigate.to({route: "/", param: [
                                        {param: "id", data: "dkadaJKFJmvlERFGMS120Fmf545"},
                                        {param: "name", data: "Ludvig"},
                                        {param: "age", data: "23"}
                                    ]});
                                    */
                                }
                            })
                        ]
                    })
                ]
            })
        });
    }
}

class HomePage {
    public static function component() : Widget {
        return new Page({
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
                            Navigate.to({route: "/hello", param: [
                                        {param: "id", data: "dkadaJKFJmvlERFGMS120Fmf545"},
                                        {param: "name", data: "Ludvig"},
                                        {param: "age", data: "23"}
                                    ]});
                        }
                    })
                ]
            })
        });
    }
}


class Main {
    static function main() {
        var body = new Body();

        Navigate.routing([
            {route: "/", component: HomePage.component()},
            {route: "/hello", component: HelloPage.component()}
        ]);

        body.init();
    }

   
}