
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
import lib.core.DynamicComponent;
import lib.core.StaticComponent;

class HelloPage extends DynamicComponent {
    var text = 0;
    var textTo = 0;
    public function new() {}

    override public function component() : Widget {
        page = new Page({
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
                            new Text("Text en: " + text),
                            new Text("Text to: " + textTo),
                            new Button({
                                text: "Click me: En",
                                onClick: function (e) {
                        
                                    setState(this, function(e){
                                        text++;
                                    });
                                }
                            }),
                            new Button({
                                text: "Click me: To",
                                onClick: function (e) {
                                    
                                    setState(this, function(e){
                                        text++;
                                        textTo++;
                                    });
                                }
                            }),
                            new Button({
                                text: "Navigate",
                                onClick: function (e) {
                                    
                                    Navigate.to({route: "/", param: [
                                        {param: "id", data: "dkadaJKFJmvlERFGMS120Fmf545"},
                                        {param: "name", data: "Ludvig"},
                                        {param: "age", data: "23"}
                                    ]});
                                    
                                }
                            })
                        ]
                    })
                ]
            })
        });
        return page;
    }
}

class HomePage extends StaticComponent{
    public function new() {}

    public function component() : Widget {
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

        Navigate.routes = [
            {route: "/", component: new HomePage().component()},
            {route: "/hello", component: new HelloPage().component()}
        ];
        Navigate.to({route: Browser.location.pathname, main: true});


        //Need to move to a different class
        Browser.window.addEventListener('popstate', function(e) {

            //Browser.window.history.pushState(null, null, Browser.window.location.pathname);
            Navigate.back();
        });

        body.init();
    }
}