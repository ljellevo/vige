import lib.components.Column;
import lib.components.Row;
import com.akifox.asynchttp.HttpResponse;

import lib.components.Page;
import lib.components.Text;
import lib.components.Center;
import lib.components.Button;

import lib.core.DynamicComponent;
import lib.core.SingleRequest;


class DatabasePage extends DynamicComponent {
    var data: Array<String> = [];
    var status: String = "Waiting for operation";
  
    public function new() {}

    function queryDB(operation){
      trace("Request called");
      new SingleRequest({
        url: "http://localhost:3000/database/" + operation,
        method: "GET",
        onComplete: function(res: HttpResponse) {
          trace(res);
          setState(this, function(){
            status = res.content;
          });
        },
        onProgress: function() {
          trace("working");
          setState(this, function(){
            status = "Loading";
          });
        }
      }).request();
    }
  
  
    override public function component(): Page {
      page = new Page({
        route: "/database",
        child: new Center({
          alignment: CenterAlignment.Horizontal,
          child: new Column({
            children: [
              new Row({
                children: [
                  new Text(status),
                ]
              }),
              new Row({
                children: [
                  new Button({
                    child: new Text("Insert"),
                    onClick: function(e) {
                      queryDB("insertDemoData");
                    }
                  }),
                  new Button({
                    child: new Text("Delete"),
                    onClick: function(e) {
                      queryDB("deleteDemoData");
                    }
                  })
                ]
              })
            ]
          })
        }),
      });
      return page;
    }
  }