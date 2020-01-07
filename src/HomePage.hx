
import js.Browser;
import lib.utils.Margin;
import js.html.ErrorEvent;
import js.html.Event;
import js.html.CloseEvent;
import js.html.MessageEvent;
import com.akifox.asynchttp.HttpResponse;
import lib.support.Widget;
import lib.utils.Padding;
import lib.utils.Size;
import lib.utils.Colors;
import lib.utils.Color;

import lib.components.Request;
import lib.components.Stream;
import lib.components.Button;
import lib.components.Page;
import lib.components.Text;
import lib.components.Column;
import lib.components.Row;
import lib.components.Center;
import lib.components.Container;
import lib.components.Image;
import lib.components.Navbar;

import Main;

import lib.core.Navigate;
import lib.core.DynamicComponent;

class HomePage  extends DynamicComponent {
    public function new() {}

  
    override public function component() : Page {
      page = new Page({
        navbar:  CustomNavbar.getNavbar(),
        route: "/",
        child: new Column({
          children: [
            new Container({
              color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
              size: new Size({height: 100, heightType: "vh", width: 100, widthType: "%"}),
              child: new Center({
                alignment: CenterAlignment.Both,
                child: new Column({
                  children: [
                    new Text("MIST.IO", {textSize: 88}),
                    new Text("The declarative web-framework")
                  ]
                }),
              }),
            }),
            
            new Container({
              child: new Column({
                color: new Color({backgroundColor: Colors.fromString("#2e3440")}),
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
                            new Text("With it's declarative syntax and nested structure,\nMIST makes it easy to create a website.", {color: new Color({color: Colors.WHITE})}),
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
                color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
                size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
                children: [
                  new Row({
                    cellSize: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
                    alignment: RowAlignment.Stretch,
                    children: [ 
                      new Container({
                        child: new Row({
                          size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
                          cellPadding: Padding.fromTRBL(0.0, 0.0, 0.0, 20.0),
                          alignment: RowAlignment.Right,
                          children: [
                            new Text("MIST lets you create modern featureful websites\nwithout any hassle.\n\nExpand your MIST experience by\n  - Reading our quick-start guide\n  - Visiting our detailed widget guide\n  - Downloading community created snippets\n  - Browsing website templates\n  - Contributing to the codebase", {color: new Color({color: Colors.fromString("#2e3440")})}),
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
              color: new Color({backgroundColor: Colors.fromString("#98b979")}),
              size: new Size({height: 400, heightType: "px", width: 100, widthType: "%"}),
              child: new Center({
                alignment: CenterAlignment.Both,
                child: new Column({
                  children: [
                    new Text("Create a more feature-rich website with asyncronous requests and\nseamless updating of the DOM.\n\nMIST has a robust and flexible API for both single requests and sockets.", {color: new Color({color: Colors.fromString("#2e3440")})}),
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
                          trace("Message recieved (Homepage)");
                          return new Text("WebSocket on homepage: " + res.data);
                        },
                        onClose: function(res: CloseEvent) {
                          return new Text("Connection closed");
                        },
                        onError: function(res: ErrorEvent) {
                          return new Text("Error");
                        },
                      })
                    }),
                    new Row({
                      children: [
                        new Button({
                          child: new Text("Sockets"),
                          onClick: function (e) {
                            Navigate.to({url: "/sockets"});
                          }
                        }),
                        new Button({
                          child: new Text("Database"),
                          onClick: function (e) {
                            Navigate.to({url: "/database"});
                          }
                        })
                      ]
                    })
                  ]
                })
              }), 
            }),
          ]
        })
      });
      return page;
    }
  } 