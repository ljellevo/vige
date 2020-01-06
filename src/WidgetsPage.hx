
import com.akifox.asynchttp.HttpResponse;
import lib.components.Page;
import lib.components.Request;
import lib.core.DynamicComponent;

class WidgetsPage extends DynamicComponent {
    var data: Array<String> = [];
  
    public function new() {}
  
    override public function component(): Page {
      page = new Page({
        route: "/widgets",
        child: new Request({
          url: "http://localhost:3000/widgets",
          onProgress: function() {

          },
          onComplete: function(res: HttpResponse) {
            
          }
        })
      });
  
      return page;
    }
  }