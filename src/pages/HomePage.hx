package pages;

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
        navbar: new CustomNavbar().navbarComponent(),
        route: "/",
        child: new Column({
          margin: Margin.fromTRBL(-60.0, 0.0, 0.0, 0.0),
          children: [
            new Container({
              color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
              size: new Size({height: 100, heightType: "vh", width: 100, widthType: "%"}),
              child: new Center({
                alignment: CenterAlignment.Both,
                child: new Column({
                  children: [
                    //new Text("MIST.IO", {textSize: 88}),
                    new Image({src: "./assets/logo-short-text.png", height: 180}),
                    //new Text("The declarative web-framework", {color: new Color({color: Colors.fromString("#4A4A4A")})})
                  ]
                }),
              }),
            }),
            
            new Container({
              color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
              size: new Size({height: 400, heightType: "px", width: 100, widthType: "%"}),
              child: new Center({
                alignment: CenterAlignment.Both,
                
                child: new Column({
                  //crossAxisAlignment: CrossAxisAlignment.SpaceBetween,
                  mainAxisAlignment: MainAxisAlignment.Center,
                  children: [
                    new Text("News, releases and stuff being worked at. Also anouncements", {color: new Color({color: Colors.fromString("#2e3440")})}),
                    new Container({size: new Size({height: 50, heightType: "px"})}),
                    new Row({
                      crossAxisAlignment: CrossAxisAlignment.SpacedEvenly,
                      
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
                    }),
                  ]
                })
              }), 
            }),

            
            new Container({
              child: new Column({
                color: new Color({backgroundColor: Colors.fromString("#2e3440")}),
                size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
                children: [
                  new Row({
                    //crossAxisAlignment: CrossAxisAlignment.SpacedEvenly,
                    mainAxisAlignment: MainAxisAlignment.Center,
                    cellSize: new Size({height: 100, heightType: "%", width: 50, widthType: "vw"}),
                    //cellMargin: Margin.fromTRBL(80.0, 80.0, 80.0, 80.0),
                    children: [
                      new Container({
                        //color: new Color({backgroundColor: Colors.fromString("#CBDFBD")}),
                        size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
                        padding: Padding.fromTRBL(80.0, 80.0, 80.0, 80.0),
                        child: new Center({
                          alignment: CenterAlignment.Both,
                          child: new Container({
                            //color: new Color({backgroundColor: Colors.fromString("#98b979")}),
                            size: new Size({height: 100, heightType: "%"}),
                            child:new Image({
                              resizeModifier: ResizeModifier.Width,
                              src: "./assets/code2.png",
                              minWidth: 400,
                              maxWidth: 600,
                            })
                          })
                        })
                      }),
                      new Container({
                        color: new Color({backgroundColor: Colors.fromString("#2e3440")}),
                        size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
                        padding: Padding.fromTRBL(80.0, 0.0, 80.0, 0.0),
                        child: new Center({
                          alignment: CenterAlignment.Both,
                          child: new Container({
                            //color: new Color({backgroundColor: Colors.fromString("#2e3440")}),
                            size: new Size({height: 300, heightType: "px", width: 500, widthType: "px"}),
                            child: new Text("VIGE is a modern and feature rich webframework that does things a bit different. \n\n
                            Write your website in the new, popular declarative way. This makes your code easy to read, edit and maintain. Constrct your website by combining widgets in the library, or extend and customize these widgets for a more personal touch. It's your choice!\n\n
                            VIGE utilizes the amazing Haxe language to compile your staticly typed code into an efficent single-page JavaScript application. \n\n\n
                            So what exactly is declarative programming, and why should I bother?", {color: new Color({color: Colors.fromString("#fafafa")})}),
                          })
                        })
                      }),
                    ]
                  })
                ]
              }),
            }),
            
            /*
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
                            new Text("VIGE lets you create modern featureful websites\nwithout any hassle.\n\nExpand your VIGE experience by\n  - Reading our quick-start guide\n  - Visiting our detailed widget guide\n  - Downloading community created snippets\n  - Browsing website templates\n  - Contributing to the codebase", {color: new Color({color: Colors.fromString("#2e3440")})}),
                          ]
                        })
                      }),
                      /*
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
                      */
                      /*
                      new Center({
                        alignment: CenterAlignment.Horizontal,
                        child:  new Container({
                          size: new Size({height: 900, heightType: "px", width: 100, widthType: "%"}),
                          padding: Padding.fromTRBL(80.0, 0.0, 80.0, 80.0),
                          child: new Image({
                            src: "./assets/code3.png",
                            //height: 419,
                            //width: 100
                          })
                        }),
                      }),
                    ]
                  })
                ]
              }),
            }),
            */
            /*
            new Container({
              color: new Color({backgroundColor: Colors.fromString("#98b979")}),
              size: new Size({height: 400, heightType: "px", width: 100, widthType: "%"}),
              child: new Center({
                alignment: CenterAlignment.Both,
                child: new Column({
                  children: [
                    new Text("Create a more feature-rich website with asyncronous requests and\nseamless updating of the DOM.\n\nVIGE has a robust and flexible API for both single requests and sockets.", {color: new Color({color: Colors.fromString("#2e3440")})}),
                    new Container({size: new Size({height: 50, heightType: "px"})}),
                    new Center({
                      alignment: CenterAlignment.Horizontal,
                      child: new Request({
                        url: "http://localhost:3000/test",
                        onComplete: function(res: HttpResponse) {
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
            */
            new Container({
              color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
              size: new Size({height: 400, heightType: "px", width: 100, widthType: "%"}),
              child: new Center({
                alignment: CenterAlignment.Both,
                child: new Column({
                  mainAxisAlignment: MainAxisAlignment.Center,
                  children: [
                    //new Text("All this talk about declarative, but what does it mean?", {color: new Color({color: Colors.fromString("#2e3440")})}),
                    new Container({size: new Size({height: 50, heightType: "px"})}),
                    new Row({
                      mainAxisAlignment: MainAxisAlignment.Center,
                      crossAxisAlignment: CrossAxisAlignment.SpaceAround,
                      size: new Size({width: 70, widthType: "%"}),
                      children: [
                        new Text('"Declarative programming focuses on what the program should accomplish without specifying how the program should achieve the result."', {textAlignment: TextAlignment.Right, fontStyle: FontStyle.Italic, color: new Color({color: Colors.fromString("#adadad")})}),
                        new Container({size: new Size({width: 40, widthType: "px"})}),
                        new Image({
                          src: "./assets/Equal.png",
                          width: 80
                        }),
                        new Container({size: new Size({width: 40, widthType: "px"})}),
                        new Text("This means for the mere mortals that this framework is designed around the principle that you, as the coder, describes what the website should look like. And we'll handle how it's actually laid out behind the scenes.", {color: new Color({color: Colors.fromString("#2e3440")})}),
                      ]
                    }),
                  ]
                })
              }), 
            }),
            
            new Container({
              color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
              size: new Size({height: 600, heightType: "px", width: 100, widthType: "%"}),
              child: new Center({
                alignment: CenterAlignment.Both,
                child: new Column({
                  mainAxisAlignment: MainAxisAlignment.Center,
                  crossAxisAlignment: CrossAxisAlignment.SpaceAround,
                  //padding: Padding.fromTRBL(0, 20, 0, 20),
                  size: new Size({width: 70, widthType: "%"}),
                  children: [
                    new Image({
                      src: "./assets/VIGE_loves_HAXE.png",
                      maxWidth: 800,
                    }),
                    new Container({
                      size: new Size({height: 50, heightType: "px"})
                    }),
                    new Center({
                      alignment: CenterAlignment.Horizontal,
                      child: new Text("HAXE is an easy to learn, lightweight, staticly-typed object oriented language that comiles to a variety of languages, with JavaScript being one of them. \n\nVIGE utilizes it's JavaScript API to communicate directly with both the DOM and available browser functions. \n\nEverything is possible in HAXE, and thats why we love it.", {textAlignment: TextAlignment.Center, color: new Color({color: Colors.fromString("#2e3440")})}),

                    }),

                    //
                    /*
                    new Container({
                      size: new Size({height: 100, heightType: "px"})
                    }),
                    */
                    
                    /*
                    new Column({
                      children: [
                        new Row({
                          crossAxisAlignment: CrossAxisAlignment.SpacedEvenly,
                          size: new Size({height: 100, heightType: "px"}),
                          children: [
                            new Column({
                              mainAxisAlignment: MainAxisAlignment.Center,
                              children: [
                                new Image({
                                  src: "./assets/haxe-logo.png",
                                  width: 400
                                }),
                                new Text("Staticly typed and compiled with Haxe"),
                              ]
                            }),
                            new Text("Single Page Application and client side routing"),
                          ]
                        }),
                        new Row({
                          crossAxisAlignment: CrossAxisAlignment.SpacedEvenly,
                          size: new Size({height: 100, heightType: "px"}),
                          children: [
                            new Text("Smart DOM updating with cascading updates"),
                            new Text("Serve site staticly from any webserver"),
                          ]
                        })
                      ]
                    })
                    */
                  ]
                })
              }), 
            }),

            new Container({
              color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
              size: new Size({height: 400, heightType: "px", width: 100, widthType: "%"}),
              child: new Center({
                alignment: CenterAlignment.Both,
                child: new Column({
                  mainAxisAlignment: MainAxisAlignment.Center,
                  children: [
                    new Text("Download VIGE", {color: new Color({color: Colors.fromString("#2e3440")})}),
                    new Container({size: new Size({height: 50, heightType: "px"})}),
                  ]
                })
              }), 
            }),

            new Container({
              color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
              size: new Size({height: 200, heightType: "px", width: 100, widthType: "%"}),
              child: new Column({
                mainAxisAlignment: MainAxisAlignment.Center,
                children: [
                  new Row({
                    mainAxisAlignment: MainAxisAlignment.Center,
                    crossAxisAlignment: CrossAxisAlignment.SpaceAround,
                    children: [
                      new Image({
                        src: "./assets/logo-simple.png",
                        width: 100
                      })
                    ]
                  }),
                ]
              })
            })
          ]
        })
      });
      return page;
    }
  } 