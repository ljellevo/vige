package pages;

import com.akifox.asynchttp.HttpRequest;
import js.html.Request;
import classes.WidgetDoc;
import js.html.Navigator;
import components.HomeButton;
import lib.support.Widget;
import lib.components.Container;
import lib.core.Navigate;
import lib.components.Button;
import lib.utils.Padding;
import lib.components.Image;
import lib.utils.Margin;
import lib.utils.Color;
import lib.components.Column;
import classes.Category;
import lib.components.Row;
import com.akifox.asynchttp.HttpResponse;
import lib.core.SingleRequest;
import lib.components.Center;
import Main.CustomNavbar;
import classes.Guide;
import classes.Step;
import lib.components.Text;
import lib.components.Page;
import lib.core.DynamicComponent;
import lib.components.Constructors;

import lib.utils.Size;
import lib.utils.Colors;
import lib.utils.Border;

import lib.components.HtmlSnippet;
import lib.components.Script;
import lib.components.Request;

import templates.GistLoader;



/**
  Not done, need to implement param getter from navigator
**/



class WidgetPage extends DynamicComponent {
  var data: WidgetDoc = null;//new Guide("", "", "", []);
  var id: String = "";
  var images = [
    "Layout" => "./assets/layout-grid.svg",
    "Functionality" => "./assets/functionality.svg",
    "Customization" => "./assets/swatchbook.svg",
    "Components" => "./assets/puzzle.svg",
    "Utilities" => "./assets/tools.svg"
  ];

  public function new() {}

  override function init() {
    super.init();
    id = Navigate.getParameters()[0];
    getWidgetDoc();
    
  }


  
  function getWidgetDoc() {
    new SingleRequest({
      url: "http://localhost:3000/api/widgets/" + Navigate.getParameters()[0] + "/" + Navigate.getParameters()[1],
      method: "GET",
      onComplete: function(res: HttpResponse) {
        setState(this, function(){
          var widgetStruct: WidgetStruct = haxe.Json.parse(res.content);
          var argumentsStruct: Array<ArgumentStruct> = widgetStruct.arguments;
          var exampleStruct: Array<ExampleStruct> = widgetStruct.example;
          
          var argumentsDocs = [];
          for(i in 0...argumentsStruct.length) {
            argumentsDocs.push(
              new ArgumentDoc(
                argumentsStruct[i].name, 
                argumentsStruct[i].req,
                argumentsStruct[i].type,
                argumentsStruct[i].link,
                argumentsStruct[i].note
              )
            );
          }          
          var exampleDocs = [];
          for(i in 0...exampleStruct.length) {
            exampleDocs.push(
              new ExampleDoc(
                exampleStruct[i].desc, 
                exampleStruct[i].code
              )
            );
          }


          data = new WidgetDoc(
              widgetStruct.name, 
              widgetStruct.shortDesc,
              widgetStruct.desc, 
              widgetStruct.category, 
              argumentsDocs, 
              widgetStruct.returns, 
              exampleDocs
            );
        });
      },
      onProgress: function() {
        setState(this, function(){
          data = null;
        });
      }
    }).request();
  }

  /**
    Guide can have following items:
    Header
    Paragraph
    Image
    Code
    Button
    Link
  **/
  
  function determineCorrectArgumentWidget(argument: ArgumentDoc): Widget{
    if(data == null) return null;
    var child;

    if(argument.getReq()){
      child = new Row({
        equalElementWidth: false,
        alignment: RowAlignment.Left,
        cellSize: new Size({width: 120, widthType: "px"}),
        children: [
          new Container({
            size: new Size({width: 100, widthType: "px"}),
            child: new Text(" - " + argument.getName(), {textSize: 16, color: new Color({color: Colors.fromString("#272727")}), font: "monaco,Consolas,Lucida Console,monospace"}),
          }),
          new Container({
            size: new Size({width: 100, widthType: "px"}),
            child: new Text("(" + argument.getType() + ")", {textSize: 16, color: new Color({color: Colors.fromString("#272727")}), font: "monaco,Consolas,Lucida Console,monospace"}),
          }),
          new Container({
            child: new Text(" : " + argument.getNote() , {textSize: 16, color: new Color({color: Colors.fromString("#272727")}), font: "monaco,Consolas,Lucida Console,monospace"}),
          })
        ]
      });
    } else {
      child = new Row({
        alignment: RowAlignment.Left,
        equalElementWidth: false,
        children: [
          new Container({
            size: new Size({width: 100, widthType: "px"}),
            child: new Text(" - " + argument.getName(), {textSize: 16, color: new Color({color: Colors.fromString("#808080")}), font: "monaco,Consolas,Lucida Console,monospace"}),
          }),
          new Container({
            size: new Size({width: 100, widthType: "px"}),
            child: new Text("(" + argument.getType() + ")", {textSize: 16, color: new Color({color: Colors.fromString("#808080")}), font: "monaco,Consolas,Lucida Console,monospace"}),
          }),
          new Container({
            child: new Text(" : " + argument.getNote() , {textSize: 16, color: new Color({color: Colors.fromString("#808080")}), font: "monaco,Consolas,Lucida Console,monospace"}),
          }),
        ]
      });
    }

    //if(data[i].d)

    return new Container({
      padding: Padding.fromTRBL(0.0, 25.0, 0.0, 25.0),
      child: child
    });

     
    
  }



  function determineCorrectExampleWidget(example: ExampleDoc): Widget{
    if(data == null) return null;
    var child;
    child = new Row({
      equalElementWidth: false,
      alignment: RowAlignment.Left,
      cellSize: new Size({width: 120, widthType: "px"}),
      children: [
        new Container({
          size: new Size({width: 100, widthType: "px"}),
          child: new Text(" - " + example.getDesc(), {textSize: 16, color: new Color({color: Colors.fromString("#272727")}), font: "monaco,Consolas,Lucida Console,monospace"}),
        }),
        new Container({
          size: new Size({width: 100, widthType: "px"}),
          child: new Request({
            jsonp: true,
            url: "https://gist.github.com/ljellevo/7cbac37d851ce59a45ca45ce6c01fefd.json",
            onComplete: function(response: Dynamic) {
              var res: GistSnippet = response;
              return new GistLoader({
                content: res.div,
                css: res.stylesheet
              });
            },
            onProgress: function() {
              return new Text("loading gist");
            }
          })
        }),
        //<script src="https://gist.github.com/ljellevo/7cbac37d851ce59a45ca45ce6c01fefd.js"></script>
       //<iframe src="data:text/html;charset=utf-8,%3Cbody%3E%3Cscript%20src%3D%22https%3A%2F%2Fgist.github.com%2Fljellevo%2F7cbac37d851ce59a45ca45ce6c01fefd.js%22%3E%3C%2Fscript%3E%3C%2Fbody%3E">

       /*
       new Script({
            src: "https://gist.github.com/ljellevo/7cbac37d851ce59a45ca45ce6c01fefd.js",
            //src: "data:text/html;charset=utf-8,%3Cbody%3E%3Cscript%20src%3D%22https%3A%2F%2Fgist.github.com%2Fljellevo%2F7cbac37d851ce59a45ca45ce6c01fefd.js%22%3E%3C%2Fscript%3E%3C%2Fbody%3E"
          }),

       */
      ]
    });
    

    //if(data[i].d)

    return new Container({
      padding: Padding.fromTRBL(0.0, 25.0, 0.0, 25.0),
      child: child
    });
  }
  

  

  //new Text(data[i].getTitle(), {color: new Color({color: Colors.fromString("#2e3440")})})

  override public function component(): Page {
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/widgets/:category/:id",
      child: new Container({
        margin: Margin.fromTRBL(-60.0, 0.0, 0.0, 0.0),
        color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
        child: new Column({
          //padding: Padding.fromTRBL(0.0, 0.0, 0.0, 20.0),
          children: [
            new Container({
              margin: Margin.fromTRBL(60.0, 0.0, 0.0, 0.0),
              size: new Size({height: 5, heightType: "px", width: 60, widthType: "%"}),
              color: new Color({backgroundColor: Colors.fromString("#2e3440")})
            }),
            //padding: Padding.fromTRBL(0.0, 0.0, 20.0, 20.0),
            new Container({
              padding: Padding.fromTRBL(50.0, 50.0, 0.0, 50.0),
              child: new Column({
                children: [
                  //padding: Padding.fromTRBL(0.0, 0.0, 20.0, 0.0),
                  //new Text(data != null? data.getTitle() : "", {textSize: 40,}),
                  new Container({
                    child: new Text(data != null? data.getName() : "", {textSize: 40, color: new Color({color: Colors.fromString("#2e3440")})}),
                    padding: Padding.fromTRBL(0.0, 0.0, 0.0, 0.0),
                  }),
                  new Container({
                    child: new Text(data != null? " - " + data.getCategory() + " - ": "", {color: new Color({color: Colors.fromString("#808080")})}),
                    padding: Padding.fromTRBL(0.0, 0.0, 0.0, 20.0),
                  }),
                  new Container({
                    child: new Text(data != null? data.getDesc() : "", {color: new Color({color: Colors.fromString("#2e3440")})}),
                    padding: Padding.fromTRBL(20.0, 0.0, 20.0, 0.0),
                  }),
                  
                  
                  new Container({
                    padding: Padding.fromTRBL(20.0, 0.0, 20.0, 0.0),
                    margin: Margin.fromTRBL(20.0, 0.0, 20.0, 0.0),
                    
                    size: new Size({width: 700, widthType: "px"}),
                    color: new Color({backgroundColor: Colors.fromString("#F2F2F2")}),
                    child: new Column({
                      padding: Padding.fromTRBL(0.0, 0.0, 0.0, 0.0),
                      children: Constructors.constructRows({
                        data: data != null ? data.getArguments() : null,
                        elementsInEachRow: 1,
                        elementBuilder: function(i) {
                          //Each element
                          return determineCorrectArgumentWidget(data.getArguments()[i]);
                        },
                        rowBuilder: function(children) {
                          //Each row
                          return new Row({
                            
                            alignment: RowAlignment.Stretch,
                            children: children,
                          });
                        }
                      })
                    })
                    //font-family: monaco,Consolas,Lucida Console,monospace;
                  }),
                  new Container({
                    padding: Padding.fromTRBL(20.0, 0.0, 20.0, 0.0),
                    margin: Margin.fromTRBL(20.0, 0.0, 20.0, 0.0),
                    
                    size: new Size({width: 700, widthType: "px"}),
                    color: new Color({backgroundColor: Colors.fromString("#F2F2F2")}),
                    child: new Column({
                      padding: Padding.fromTRBL(0.0, 0.0, 0.0, 0.0),
                      children: Constructors.constructRows({
                        data: data != null ? data.getExample() : null,
                        elementsInEachRow: 1,
                        elementBuilder: function(i) {
                          //Each element
                          return determineCorrectExampleWidget(data.getExample()[i]);
                        },
                        rowBuilder: function(children) {
                          //Each row
                          return new Row({
                            
                            alignment: RowAlignment.Stretch,
                            children: children,
                          });
                        }
                      })
                    })
                    //font-family: monaco,Consolas,Lucida Console,monospace;
                  })
                ]
              })
            }),
          ]
        }),
      }),
      /*
      new Center({
        margin: Margin.fromTRBL(-60.0, 0.0, 0.0, 0.0),
        alignment: CenterAlignment.Both,
        color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
        child: new Column({
          //size: new Size({height: 60, heightType: "vh", width: 80, widthType: "%"}),
          children: Constructors.constructRows({
            data: data != null ? data.getSteps() : null,
            elementsInEachRow: 1,
            elementBuilder: function(i) {
              //Each element
              return new Container({
                size: new Size({height: 100, heightType: "px", width: 300, widthType: "px"}),
                child: new Text(data.getSteps()[i].getContent())
              });
            },
            rowBuilder: function(children) {
              //Each row
              return new Row({
                children: children,
              });
            }
          })
        })
      })
      */
    });
    return page;
  }
}

/*
Constructors.constructRows({
            data: data, 
            elementsInEachRow: 3, 
            elementBuilder: function(i) {
              return new Button({
                color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
                padding: Padding.all(10),
                size: new Size({height: 150, heightType: "px", width: 300, widthType: "px"}),
                child: new Center({
                  alignment: CenterAlignment.Both,
                  child: new Row({
                    alignment: RowAlignment.Center,
                    children: [
                      /*
                      new Image({
                        src: images[data[i].getTitle()], 
                        alt: "Layout", 
                        height: 40,
                        padding: Padding.fromTRBL(0, 20, 0, 10)
                      }),
                      */
                      /*
                      new Column({
                        children: [
                          new Text(data[i].getDesc(), {textSize: 20,  color: new Color({color: Colors.fromString("#2e3440")})}),
                          new Text(data[i].getDesc(), {color: new Color({color: Colors.fromString("#2e3440")})})
                        ]
                      })
                    ]
                  }),
                
                }),
                onClick: function (e) {
                    Navigate.to({url: "/guides/:" + data[i].getId()});
                },
                border: new Border({style: BorderStyle.Solid, width: 3, color: Colors.fromString("#2e3440"), cornerRadius: CornerRadius.all(20.0)})
              });
            },
            rowBuilder: function(children) {
              return new Row({
                children: children,
              });
            }
          })
          */