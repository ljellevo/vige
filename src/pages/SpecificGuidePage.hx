package pages;

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


/**
  Not done, need to implement param getter from navigator
**/


class SpecificGuidePage extends DynamicComponent {
  var data: Guide = null;//new Guide("", "", "", []);
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
    getGuides();
  }


  
  function getGuides() {
    new SingleRequest({
      url: "http://localhost:3000/api/guides/5e15da7b8772f062a495c3a8",
      method: "GET",
      onComplete: function(res: HttpResponse) {
        trace(res);
        setState(this, function(){
          var result: GuideStruct = haxe.Json.parse(res.content);
          trace(result);
          var steps: Array<StepStruct> = result.steps;
          
          var stepsObject = [];
          for(j in 0...steps.length) {
            stepsObject.push(new Step(steps[j].type, steps[j].format, steps[j].title, steps[j].content));
          }
          trace(stepsObject);
          data = new Guide(result._id, result.title, result.desc, stepsObject);
          trace(data);
        });
      },
      onProgress: function() {
        trace("working");
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
  
  function determineCorrectWidget(i): Widget{

    return new Container({
      size: new Size({height: 100, heightType: "px", width: 100, widthType: "%"}),
      child: new Text(data.getSteps()[i].getContent())
    });
  }

  

  //new Text(data[i].getTitle(), {color: new Color({color: Colors.fromString("#2e3440")})})

  override public function component(): Page {
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/guides/:id",
      child: new Container({
        color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
        child: new Column({
          //padding: Padding.fromTRBL(0.0, 0.0, 0.0, 20.0),
          children: [
            new Container({
              
              size: new Size({height: 5, heightType: "px", width: 60, widthType: "%"}),
              color: new Color({backgroundColor: Colors.fromString("#2e3440")})
            }),
            //padding: Padding.fromTRBL(0.0, 0.0, 20.0, 20.0),
            new Container({
              padding: Padding.fromTRBL(20.0, 0.0, 0.0, 20.0),
              child: new Column({
                children: [
                  new Text(data != null? data.getTitle() : "", {
                    textSize: 40,
                    
                  }),
                  new Column({
                    padding: Padding.fromTRBL(10.0, 0.0, 0.0, 0.0),
                    children: Constructors.constructRows({
                      data: data != null ? data.getSteps() : null,
                      elementsInEachRow: 1,
                      elementBuilder: function(i) {
                        //Each element
                        return determineCorrectWidget(i);
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