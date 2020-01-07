package pages;

import util.CategoryStruct;
import lib.components.Button;
import lib.utils.Padding;
import lib.components.Image;
import lib.utils.Margin;
import lib.utils.Color;
import lib.components.Container;
import lib.support.Widget;
import lib.components.Column;
import classes.Category;
import lib.components.Row;
import com.akifox.asynchttp.HttpResponse;
import lib.core.SingleRequest;
import lib.components.Center;
import Main.CustomNavbar;
import lib.components.Text;
import lib.components.Page;
import lib.components.Collection;
import lib.core.DynamicComponent;
import lib.components.Constructors;

import lib.utils.Size;
import lib.utils.Colors;
import lib.utils.Border;



class WidgetCategoryPage extends DynamicComponent {
  var data: Array<Catagory> = [];
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
    getCategories();
  }

  function getCategories() {
    new SingleRequest({
      url: "http://localhost:3000/widgets/categories/",
      method: "GET",
      onComplete: function(res: HttpResponse) {
        trace(res);
        setState(this, function(){
          var result: Array<CategoryStruct> = haxe.Json.parse(res.content);
          for(i in 0...result.length) {
            data.push(new Catagory(result[i].title, result[i].desc));
          }
        });
      },
      onProgress: function() {
        trace("working");
        setState(this, function(){
          data = [];
        });
      }
    }).request();
  }

  //new Text(data[i].getTitle(), {color: new Color({color: Colors.fromString("#2e3440")})})

  override public function component(): Page {
      /*
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/widgets/category",
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
                padding: Padding.all(10),
                size: new Size({height: 150, heightType: "px", width: 300, widthType: "px"}),
                child: new Center({
                  alignment: CenterAlignment.Both,
                  child: new Row({
                    alignment: RowAlignment.Center,
                    children: [
                      new Image({
                        src: images[data[i].getTitle()], 
                        alt: "Layout", 
                        height: 40,
                        padding: Padding.fromTRBL(0, 20, 0, 10)
                      }),
                      new Column({
                        children: [
                          new Text(data[i].getTitle(), {textSize: 20,  color: new Color({color: Colors.fromString("#2e3440")})}),
                          new Text(data[i].getDesc(), {color: new Color({color: Colors.fromString("#2e3440")})})
                        ]
                      })
                    ]
                  }),
                
                }),
                onClick: function (e) {},
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
    */

    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/widgets/category",
      child: new Text("Page")
    });

    return page;
  }
}