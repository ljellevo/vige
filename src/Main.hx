
import js.html.TextTrackList;
import haxe.display.Display.Package;
import haxe.macro.Expr.Var;
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
              color: Color.MAGENTA,
              backgroundColor: Color.YELLOW
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

class HomeView  extends StaticComponent {
  public function new() {}

  public function component() : Widget {
    return new Page({
      route: "/",
      child: new Column({
        size: new Size({
          height: 100, 
          heigthType: "%",
          width: 100,
          widthType: "%"
        
        }),
        style: new Style({
          backgroundColor: Color.TRANSPARENT
        }),
        children: [
          new Center({
            alignment: CenterAlignment.Both,
            child: new Column({
              //size: new Size({height: 10, heigthType: "px"}),
              children: [
                new Text("MIST.IO", {size: 88}),
                new Text("The declarative web-framework")
              ]
            }),
          }),
          
          new Center({
            style: new Style({backgroundColor: Color.fromRGBAi(53, 129, 184, 1)}),
            alignment: CenterAlignment.Both,
            child: new Column({
              size: new Size({height: 10, heigthType: "px"}),
              children: [
                new Row({
                  padding: Padding.all(10.0),
                  children: [
                    new Text("Page 2"),
                    new Container({
                      size: new Size({width: 40, widthType: "px"}),
                    }),
                    new Button({
                      text: "Prosjekter",
                      onClick: function(e) {
                        trace("Click");
                      }
                    })
                  ]
                })
              ]
            }),
            
          }),
          
        ]
      })
    });
  }
} 


class Main {
  static function main() {
    var body = new Body();
    //body.font("Cormorant Garamond", "100");
    body.font("Lato", "100");
    //Lato



    Navigate.routes = [
      {route: "/", component: new HomeView().component()},
      {route: "/hello", component: new HelloPage().component()}
    ];
    Navigate.to({route: Browser.location.pathname, main: true});


    //Need to move to a different class
    Browser.window.addEventListener('popstate', function(e) {
      //Browser.window.history.pushState(null, null, Browser.window.location.pathname);
      Navigate.navigationEvent();
    });

    body.init();
  }
}