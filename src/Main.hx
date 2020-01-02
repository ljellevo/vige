
import lib.support.Widget;
import lib.utils.Padding;
import lib.utils.Size;
import lib.utils.Color;
import lib.utils.Style;
import js.Browser;

import lib.components.Request;
import lib.components.Button;
import lib.components.Page;
import lib.components.Text;
import lib.components.Column;
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

class HomeView  extends DynamicComponent {
  public function new() {}



  function homepageButton(text: String, src: String): Widget{
    return new HomeButton({
      child: new Row({
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
            //size: new Size({height: 500, heightType: "px", width: 100, widthType: "%"}),
            child: new Column({
              //style: new Style({backgroundColor: Color.fromRGBAi(27, 152, 224, 1)}),
              //style: new Style({backgroundColor: Color.fromRGBAf(0.3, 0.3, 0.3, 0.8)}),
              style: new Style({backgroundColor: Color.fromString("#2e3440")}),
              size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
              children: [
                new Row({
                  alignment: RowAlignment.Stretch,
                  children: [
                    /*
                    new Positioned({
                      bottom: 30,
                      right: 40,
                      child: new Text("Pos", {style: new Style({color: Color.WHITE})}),
                    }),
                    */
                    new Container({
                      child: new Row({
                        //margin: Margin.fromTRBL(0.0, 20.0, 0.0, 0.0),
                        cellPadding: Padding.fromTRBL(80.0, 0.0, 80.0, 0.0),
                        alignment: RowAlignment.Center,
                        children: [
                          //new Text("Page 2", {style: new Style({color: Color.WHITE})}),
                          new Image({
                            src: "./assets/code2.png",
                            width: 100
                            //height: 80
                          })
                        ]
                      })
                    }),
                    new Container({
                      child: new Row({
                        //margin: Margin.fromTRBL(0.0, 0.0, 0.0, 20.0),
                        cellPadding: Padding.fromTRBL(0.0, 0.0, 0.0, 20.0),
                        alignment: RowAlignment.Left,
                        children: [
                          //new Button({text: "Prosjekter",onClick: function(e) {trace("Click");}}),
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
            //size: new Size({height: 500, heightType: "px", width: 100, widthType: "%"}),
            child: new Column({
              //style: new Style({backgroundColor: Color.fromRGBAi(27, 152, 224, 1)}),
              //style: new Style({backgroundColor: Color.fromRGBAf(0.3, 0.3, 0.3, 0.8)}),
              style: new Style({backgroundColor: Color.fromString("#fafafa")}),
              size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
              children: [
                new Row({
                  alignment: RowAlignment.Stretch,
                  children: [
                    /*
                    new Positioned({
                      bottom: 30,
                      right: 40,
                      child: new Text("Pos", {style: new Style({color: Color.WHITE})}),
                    }),
                    */
                    new Container({
                      child: new Row({
                        //margin: Margin.fromTRBL(0.0, 0.0, 0.0, 20.0),
                        cellPadding: Padding.fromTRBL(0.0, 0.0, 0.0, 20.0),
                        alignment: RowAlignment.Right,
                        children: [
                          //new Button({text: "Prosjekter",onClick: function(e) {trace("Click");}}),
                          new Text("MIST lets you create modern featureful websites\nwithout any hassle.\n\nExpand your MIST experience by\n  - Reading our quick-start guide\n  - Visiting our detailed widget guide\n  - Downloading community created snippets\n  - Browsing website templates\n  - Contributing to the codebase", {style: new Style({color: Color.fromString("#2e3440")})}),
                        ]
                      })
                    }),
                    new Container({
                      child: new Row({
                        //margin: Margin.fromTRBL(0.0, 20.0, 0.0, 0.0),
                        cellPadding: Padding.fromTRBL(80.0, 0.0, 80.0, 0.0),
                        alignment: RowAlignment.Center,
                        children: [
                          //new Text("Page 2", {style: new Style({color: Color.WHITE})}),
                          new Image({
                            src: "./assets/code3.png",
                            width: 100
                            //height: 80
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
            style: new Style({backgroundColor: Color.fromString("#fafafa")}),
            size: new Size({height: 150, heightType: "px", width: 100, widthType: "%"}),
            child: new Row({
              alignment: RowAlignment.Center,
              children: [
                homepageButton("Quick-start", "./assets/book-open.svg"),
                homepageButton("Widgets", "./assets/book-solid.svg"),
                homepageButton("Snippets", "./assets/code-solid.svg")
              ]
            })
          }),

          new Request(this,{
            url: "http://localhost:3000/test",
            onComplete: function(res) {
              return new Text("Done from main: " + res);
            },
            onProgress: function() {
              return new Text("Progress");
            },
            onError: function(res) {
              return new Text("Error from main: " + res);
            },
          })
        ]
      })
    });
    return page;
  }
} 

//haxe.Constraints.Function

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