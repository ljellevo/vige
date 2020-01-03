
import haxe.display.Display.HoverExpectedNameKind;
import js.html.ErrorEvent;
import js.html.Event;
import js.html.CloseEvent;
import js.html.MessageEvent;
import com.akifox.asynchttp.HttpResponse;
import lib.support.Widget;
import lib.utils.Padding;
import lib.utils.Size;
import lib.utils.Color;
import lib.utils.Style;
import js.Browser;

import lib.components.Request;
import lib.components.Stream;
import lib.components.Button;
import lib.components.Page;
import lib.components.Text;
import lib.components.Column;
import lib.components.Collection;
import lib.components.Row;
import lib.components.Center;
import lib.components.Container;
import lib.components.Image;

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
          heightType: "%",
          width: 100,
          widthType: "%"
        }),
        children: [
          new Row({
            size: new Size({
              height: 100,
              heightType: "%"
            }),
            children: [
              new Text("Text en: " + text),
              new Text("Text to: " + textTo),
              new Button({
                child: new Text("Click me: En"),
                onClick: function (e) {
                  setState(this, function(e){
                      text++;
                  });
                }
              }),
              new Button({
                child: new Text("Click me: To"),
                onClick: function (e) {
                  setState(this, function(e){
                    text++;
                    textTo++;
                  });
                }
              }),
              new Button({
                child: new Text("Navigate"),
                onClick: function (e) {
                  Navigate.to({route: "/", from: page, param: [
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

 
  override public function component() : Widget {
    return new Page({
      route: "/",
      child: new Column({
        style: new Style({
          color: Color.WHITE
        }),
        size: new Size({
          height: 100,
          heightType: "%",
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
            child: new Text("Click me"),
            onClick: function (e) {
              Navigate.to({route: "/hello", from: null, param: [
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

class HomeView  extends DynamicComponent {
  public function new() {}



  function homepageButton(text: String, src: String): Widget{
    return new HomeButton({
      size: new Size({height: 40, heightType: "px"}),
      child: new Row({
        alignment: RowAlignment.Center,
        children: [
          new Container({style: new Style({color: Color.WHITE}), child: new Image({src: src, height: 20})}),
          new Container({size: new Size({width: 20, widthType: "px"})}),
          new Text(text)
        ]
      }), 
      onClick: function (e) {}
    });
  }

  override public function component() : Widget {
    page = new Page({
      route: "/",
      child: new Column({
        children: [
          new Container({
            style: new Style({backgroundColor: Color.fromString("#fafafa")}),
            size: new Size({height: 100, heightType: "vh", width: 100, widthType: "%"}),
            child: new Center({
              alignment: CenterAlignment.Both,
              child: new Column({
                children: [
                  new Text("MIST.IO", {size: 88}),
                  new Text("The declarative web-framework")
                ]
              }),
            }),
          }),
          
          new Container({
            child: new Column({
              style: new Style({backgroundColor: Color.fromString("#2e3440")}),
              size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
              children: [
                new Row({
                  alignment: RowAlignment.Stretch,
                  cellSize: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
                  children: [
                    new Container({
                      child: new Row({
                        cellPadding: Padding.fromTRBL(80.0, 0.0, 80.0, 0.0),
                        alignment: RowAlignment.Center,
                        children: [
                          new Image({
                            src: "./assets/code2.png",
                            width: 100,
                            minWidth: 20
                          })
                        ]
                      })
                    }),
                    new Container({
                      child: new Row({
                        size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
                        cellPadding: Padding.fromTRBL(0.0, 0.0, 0.0, 20.0),
                        alignment: RowAlignment.Left,
                        children: [
                          new Text("With it's declarative syntax and nested structure,\nMIST makes it easy to create a website.", {style: new Style({color: Color.WHITE})}),
                        ]
                      })
                    }),
                  ]
                })
              ]
            }),
          }),
          
          new Container({
            child: new Column({
              style: new Style({backgroundColor: Color.fromString("#fafafa")}),
              size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
              children: [
                new Row({
                  cellSize: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
                  alignment: RowAlignment.Stretch,
                  children: [ 
                    new Container({
                      child: new Row({
                        cellPadding: Padding.fromTRBL(0.0, 0.0, 0.0, 20.0),
                        alignment: RowAlignment.Right,
                        children: [
                          new Text("MIST lets you create modern featureful websites\nwithout any hassle.\n\nExpand your MIST experience by\n  - Reading our quick-start guide\n  - Visiting our detailed widget guide\n  - Downloading community created snippets\n  - Browsing website templates\n  - Contributing to the codebase", {style: new Style({color: Color.fromString("#2e3440")})}),
                        ]
                      })
                    }),
                    new Container({
                      child: new Row({
                        cellPadding: Padding.fromTRBL(80.0, 0.0, 80.0, 0.0),
                        alignment: RowAlignment.Center,
                        children: [
                          new Image({
                            src: "./assets/code3.png",
                            width: 100,
                            minWidth: 20
                          })
                        ]
                      })
                    }),
                  ]
                })
              ]
            }),
          }),
          
          new Container({
            style: new Style({backgroundColor: Color.fromString("#98b979")}),
            size: new Size({height: 400, heightType: "px", width: 100, widthType: "%"}),
            child: new Center({
              alignment: CenterAlignment.Both,
              child: new Column({
                children: [
                  new Text("Create a more feature-rich website with asyncronous requests and\nseamless updating of the DOM.\n\nMIST has a robust and flexible API for both single requests and sockets.", {style: new Style({color: Color.fromString("#2e3440")})}),
                  new Container({size: new Size({height: 50, heightType: "px"})}),
                  new Center({
                    alignment: CenterAlignment.Horizontal,
                    child: new Request({
                      url: "http://localhost:3000/test",
                      onComplete: function(res: HttpResponse) {
                        trace(res.content);
                        return new Text("Single request: " + res.content);
                      },
                      onProgress: function() {
                        return new Text("Loading");
                      },
                      onError: function(res: HttpResponse) {
                        return new Text("Error: " + res.error);
                      },
                    }),
                  }),
                  new Container({size: new Size({height: 50, heightType: "px"})}),
                  new Center({
                    alignment: CenterAlignment.Horizontal,
                    child: new Stream(page, {
                      url: "ws://localhost:3001/socket",
                      onStandby: function() {
                        return new Text("On standby");
                      },
                      onOpen: function(res: Event) {
                        return new Text("Connection opened");
                      },
                      onMessage: function(res: MessageEvent) {
                        return new Text("WebSocket: " + res.data);
                      },
                      onClose: function(res: CloseEvent) {
                        return new Text("Connection closed");
                      },
                      onError: function(res: ErrorEvent) {
                        return new Text("Error");
                      },
                    })
                  }),
                ]
              })
            }), 
          }),
          new Container({
            style: new Style({backgroundColor: Color.fromString("#98b979")}),
            size: new Size({height: 150, heightType: "px", width: 100, widthType: "%"}),
            child: new Row({
              alignment: RowAlignment.Center,
              children: [
                homepageButton("Quick-start", "./assets/book-open.svg"),
                homepageButton("Widgets", "./assets/book-solid.svg"),
                homepageButton("Snippets", "./assets/code-solid.svg"),
                homepageButton("Templates", "./assets/template.svg"),
                homepageButton("Codebase", "./assets/github.svg"),
                new Button({
                  child: new Text("Sockets"),
                  onClick: function (e) {
                    Navigate.to({route: "/socket",from: page});
                  }
                })
              ]
            })
          }),
          /*
          new Collection({
            count: 10,
          }).build(function(iterator) {
            return new Text(iterator);
          }),
          */
          
        ]
      })
    });
    return page;
  }
} 

class SocketPage extends DynamicComponent {
  var data: Array<String> = [];

  public function new() {}

  override public function component(): Widget {
    page = new Page({
      route: "/socket",
      child: new Center({
        alignment: CenterAlignment.Horizontal,
        child: new Stream(page, {
          url: "ws://localhost:3001/socket",
          onStandby: function() {
            return new Text("On standby");
          },
          onOpen: function(res: Event) {
            return new Text("Connection open");
          },
          onMessage: function(res: MessageEvent) {
            trace("Message recieved");
            data.push(res.data);
            
            return new Collection({
              count: data.length,
            }).build(function(iterator) {
              trace("Building");
              return new Text(data[iterator]);
            });
          },
          onClose: function(res: CloseEvent) {
            return new Text("Connection closed");
          },
          onError: function(res: ErrorEvent) {
            return new Text("Error");
          },
        })
      }),
    });

    return page;
  }
}

/*

new Collection({
  count: 10,
}).build(function(iterator) {
  return new Text(iterator);
}),


*/

class Main {
  static function main() {
    var body = new Body();
    //body.font("Cormorant Garamond", "100");
    body.font("Lato", "100");
    //Lato



    Navigate.routes = [
      {route: "/", component: new HomeView().component()},
      {route: "/socket", component: new SocketPage().component()}
    ];

    trace(Browser.location.pathname);
    var rootPage= Navigate.routes[0].component cast Page;
    cast(rootPage, Page);
    Navigate.to({route: Browser.location.pathname, from: rootPage});


    //Need to move to a different class
    Browser.window.addEventListener('popstate', function(e) {

      //Browser.window.history.pushState(null, null, Browser.window.location.pathname);
      Navigate.navigationEvent();
    });

    body.init();
  }
}