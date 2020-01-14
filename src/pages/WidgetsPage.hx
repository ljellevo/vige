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
    var shortDesc: String;
}


class WidgetsPage extends DynamicComponent {
  var data: Array<WidgetCategoryStruct> = null;//new Guide("", "", "", []);
  var category: String = "";
  var images = [
    "Page" => "./assets/page.svg",
    "Container" => "./assets/container.svg",
    "Column" => "./assets/column.svg",
    "Row" => "./assets/row.svg",
    "Centered" => "./assets/centered.svg",
    "Positioned" => "./assets/positioned.svg",
    //Functionality
    "Button" => "./assets/functionality.svg",

    //Customization
    "Color" => "./assets/swatchbook.svg",
    "Colors" => "./assets/palette.svg",
    "Size" => "./assets/size.svg",
    "Border" => "./assets/border.svg",

    //Components
    "Image" => "./assets/image.svg"

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
        setState(this, function(){
          data = null;
        });
      }
    }).request();
  }
  


  override public function component(): Page {
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/widgets/:category",
      child: new Center({
        margin: Margin.fromTRBL(-60.0, 0.0, 0.0, 0.0),
        alignment: CenterAlignment.Both,
        color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
        child: new Column({
          size: new Size({height: 60, heightType: "vh", width: 80, widthType: "%"}),
          children: Constructors.constructRows({
            data: data, 
            elementsInEachRow: 3, 
            elementBuilder: function(i) {
              return new Button({
                color: new Color({backgroundColor: Colors.fromString("#fafafa")}),
                padding: Padding.all(10),
                size: new Size({height: 150, heightType: "px", width: 300, widthType: "px"}),
                child: new Row({
                    
                  alignment: RowAlignment.Stretch,
                  children: [
                    
                    
                    new Container({
                      size: new Size({width: 70, widthType: "px"}),
                      child: new Image({
                        src: images[data[i].name] != null ? images[data[i].name] : "", 
                        alt: data[i].name, 
                        height: 40,
                        padding: Padding.fromTRBL(0, 20, 0, 10)
                      }),
                    }),
                    
                    new Container({
                      stretch: true,
                      size: new Size({width: 200, widthType: "px"}),
                      child: new Column({
                        children: [
                          new Text(data[i].name, {textSize: 20,  color: new Color({color: Colors.fromString("#2e3440")})}),
                          new Text(data[i].shortDesc, {color: new Color({color: Colors.fromString("#2e3440")})})
                        ]
                      })
                    })
                  ]
                }),
                onClick: function (e) {
                    Navigate.to({url: "/widgets/" + Navigate.getParameters()[0] + "/"  + data[i].name.toLowerCase()/*, param: [{param: "category", data: data[i].getTitle().toLowerCase()}]*/});
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
        })
      })
    });
    return page;
  }
}
