
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

typedef CategoryStruct = {
  var title: String;
  var desc: String;
}

class WidgetsPage extends DynamicComponent {
  var data: Array<Catagory> = [];

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


  override public function component(): Page {
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/widgets",
      child: new Center({
        alignment: CenterAlignment.Both,
        child: new Column({
          children: Constructors.constructRows({
            data: data, 
            elementsInEachRow: 3, 
            elementBuilder: function(i) {
              return new Text("count: " + i);
            },
            rowBuilder: function(children) {
              return new Row({children: children});
            }
          })
        })
      })
    });
    return page;
  }
}