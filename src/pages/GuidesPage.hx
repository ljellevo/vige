package pages;

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
import lib.components.Text;
import lib.components.Page;
import lib.core.DynamicComponent;
import lib.components.Constructors;

import lib.utils.Size;
import lib.utils.Colors;
import lib.utils.Border;

typedef GuideSummary = {
  var _id: String;
  var title: String;
  var desc: String;
}

class GuidesPage extends DynamicComponent {
  var data: Array<GuideSummary> = [];
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


  /*
  function getGuides() {
    new SingleRequest({
      url: "http://localhost:3000/api/guides",
      method: "GET",
      onComplete: function(res: HttpResponse) {
        setState(this, function(){
          var result: Array<GuideStruct> = haxe.Json.parse(res.content);
          for(i in 0...result.length) {
            var steps = result[i].steps;
            var stepsObject = [];
            for(j in 0...steps.length) {
              stepsObject.push(new Step(steps[j].type, steps[j].format, steps[j].title, steps[j].content));
            }
            data.push(new Guide(result[i].title, result[i].desc, stepsObject));
          }
        });
      },
      onProgress: function() {
        setState(this, function(){
          data = [];
        });
      }
    }).request();
  }

  */

  

  function getGuides() {
    new SingleRequest({
      url: "http://localhost:3000/api/guides",
      method: "GET",
      onComplete: function(res: HttpResponse) {
        setState(this, function(){
          var result: Array<GuideSummary> = haxe.Json.parse(res.content);
          for(i in 0...result.length) {
            data.push(result[i]);
          }
        });
      },
      onProgress: function() {
        setState(this, function(){
          data = [];
        });
      }
    }).request();
  }

  //new Text(data[i].getTitle(), {color: new Color({color: Colors.fromString("#2e3440")})})

  override public function component(): Page {
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/guides",
      child: new Center({
        margin: Margin.fromTRBL(-60.0, 0.0, 0.0, 0.0),
        alignment: CenterAlignment.Both,
        color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
        child: new Column({
          mainAxisAlignment: MainAxisAlignment.Center,
          crossAxisAlignment: CrossAxisAlignment.Center,
          size: new Size({height: 60, heightType: "vh", width: 80, widthType: "%"}),
          children: Constructors.constructRows({
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
                    crossAxisAlignment: CrossAxisAlignment.Center,
                    children: [
                      /*
                      new Image({
                        src: images[data[i].getTitle()], 
                        alt: "Layout", 
                        height: 40,
                        padding: Padding.fromTRBL(0, 20, 0, 10)
                      }),
                      */
                      new Column({
                        children: [
                          new Text(data[i].title, {textSize: 20,  color: new Color({color: Colors.fromString("#2e3440")})}),
                          new Text(data[i].desc, {color: new Color({color: Colors.fromString("#2e3440")})})
                        ]
                      })
                    ]
                  }),
                
                }),
                onClick: function (e) {
                    Navigate.to({url: "/guides/" + data[i]._id});
                },
                border: new Border({style: BorderStyle.Solid, width: 3, color: Colors.fromString("#2e3440"), cornerRadius: CornerRadius.all(20.0)})
              });
            },
            rowBuilder: function(children) {
              return new Row({
                crossAxisAlignment: CrossAxisAlignment.SpacedEvenly,
                children: children,
              });
            }
          })
        })
      })
    });
    return page;
  }
}