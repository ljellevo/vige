package pages;

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
import classes.WidgetDoc;
import lib.utils.Border;


/**
  Not done, need to implement param getter from navigator
**/

typedef WidgetCategoryStruct = {
    var _id: String;
    var name: String;
    var desc: String;
}


class WidgetCategoryPage extends DynamicComponent {
  var data: Array<WidgetCategoryStruct> = null;//new Guide("", "", "", []);
  var category: String = "";
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
    category = Navigate.getParameters()[0];
    getWidgetsUnderCategory();
    
  }

  

  /*

  function getWidgetDoc() {
    new SingleRequest({
      url: "http://localhost:3000/api/widgets/" + category,
      method: "GET",
      onComplete: function(res: HttpResponse) {
        setState(this, function(){
          var widgetStruct: WidgetStruct = haxe.Json.parse(res.content);
          var argumentsStruct: Array<ArgumentStruct> = widgetStruct.arguments;
          var exampleStruct: Array<ExampleStruct> = widgetStruct.example;
          
          var argumentsDocs = [];
          for(i in 0...argumentsStruct.length) {
            argumentsDocs.push(new ArgumentDoc(argumentsStruct[i].name, argumentsStruct[i].req));
          }

          var exampleDocs = [];
          for(i in 0...exampleStruct.length) {
            exampleDocs.push(new ExampleDoc(exampleStruct[i].desc, exampleStruct[i].link));
          }


          data = new WidgetDoc(widgetStruct.name, widgetStruct.desc, widgetStruct.category, argumentsDocs, widgetStruct.returns, exampleDocs);
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
  */


  function getWidgetsUnderCategory() {
    new SingleRequest({
      url: "http://localhost:3000/api/widgets/" + category,
      method: "GET",
      onComplete: function(res: HttpResponse) {
        setState(this, function(){
          data = haxe.Json.parse(res.content);
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
  
  /*
  function determineCorrectWidget(i): Widget{
    if(data == null) return null;

    if(data.getSteps()[i].getFormat() == "header") {
      return new Container({
        padding: Padding.fromTRBL(20.0, 0.0, 0.0, 0.0),
        size: new Size({width: 100, widthType: "%"}),
        child: new Text(data.getSteps()[i].getContent(), {textSize: 25})
      });
    } else if(data.getSteps()[i].getFormat() == "paragraph") {
      return new Container({
        size: new Size({width: 100, widthType: "%"}),
        child: new Text(data.getSteps()[i].getContent())
      });
    } else if(data.getSteps()[i].getFormat() == "link" && data.getSteps()[i].getType() == "text") {
      //link
    }else if(data.getSteps()[i].getType() == "break") {
      return new Container({
        
        size: new Size({height: Std.parseFloat(data.getSteps()[i].getContent()), heightType: "px"}),
        
        //font-family: monaco,Consolas,Lucida Console,monospace;
      });
      //link
    } else if(data.getSteps()[i].getFormat() == "image") {
      //image
    } else if(data.getSteps()[i].getFormat() == "code") {
      //code
      return new Container({
        padding: Padding.fromTRBL(20.0, 0.0, 20.0, 0.0),
        margin: Margin.fromTRBL(20.0, 0.0, 20.0, 0.0),
        
        size: new Size({width: 500, widthType: "px"}),
        color: new Color({backgroundColor: Colors.fromString("#F2F2F2")}),
        child: new Container({
          padding: Padding.fromTRBL(0.0, 25.0, 0.0, 25.0),
          child: new Text(data.getSteps()[i].getContent(), {textSize: 16, color: new Color({color: Colors.fromString("#272727")}), font: "monaco,Consolas,Lucida Console,monospace"})
        })
        //font-family: monaco,Consolas,Lucida Console,monospace;
      });
    } else if(data.getSteps()[i].getFormat() == "link" && data.getSteps()[i].getType() == "button") {
      return new Container({
        padding: Padding.fromTRBL(20.0, 0.0, 20.0, 0.0),
        size: new Size({width: 100, widthType: "%"}),
        child: new HomeButton({
          border: new Border({
            style: BorderStyle.None,
            cornerRadius: CornerRadius.all(20),
          }),
          color: new Color({backgroundColor: Colors.fromString("#2e3440")}),
          size: new Size({height: 40, heightType: "px"}),
          child: new Center({
            alignment: CenterAlignment.Both,
            padding: Padding.fromTRBL(0.0, 20.0, 0.0, 20.0),
            child: new Text(data.getSteps()[i].getTitle(), {textSize: 18, color: new Color({color: Colors.fromString("#fafafa")})})
          }),
          onClick: function() {
            Navigate.to({url: data.getSteps()[i].getContent()});
          }
        })
      });
    } else if(data.getSteps()[i].getFormat() == "link/external" && data.getSteps()[i].getType() == "button") {
      return new Container({
        padding: Padding.fromTRBL(20.0, 0.0, 20.0, 0.0),
        size: new Size({width: 100, widthType: "%"}),
        child: new HomeButton({
          border: new Border({
            style: BorderStyle.None,
            cornerRadius: CornerRadius.all(20),
          }),
          color: new Color({backgroundColor: Colors.fromString("#2e3440")}),
          size: new Size({height: 40, heightType: "px"}),
          child: new Center({
            alignment: CenterAlignment.Both,
            padding: Padding.fromTRBL(0.0, 20.0, 0.0, 20.0),
            child: new Text(data.getSteps()[i].getTitle(), {textSize: 18, color: new Color({color: Colors.fromString("#fafafa")})})
          }),
          onClick: function() {
            Navigate.link({url: data.getSteps()[i].getContent()});
          }
        })
      });
    }
    return new Container({});
  }
  */

  


  override public function component(): Page {
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/widgets/:category",
      child: new Container({
        color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
        child: new Column({
          children: Constructors.constructRows({
            data: data,
            elementsInEachRow: 6,
            elementBuilder: function(i) {
              return new Text(data[i].name);
            },
            rowBuilder: function(children) {
              return new Row({children: children});
            }
          })
        }),
      }),
    });
    return page;
  }
}
