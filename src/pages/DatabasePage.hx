package pages;

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

    function catalogue(operation){
      new SingleRequest({
        url: "http://localhost:3000/maintenance/database/widgets/catalogue/" + operation,
        method: "GET",
        onComplete: function(res: HttpResponse) {
          setState(this, function(){
            status = res.content;
          });
        },
        onProgress: function() {
          setState(this, function(){
            status = "Loading";
          });
        }
      }).request();
    }

    function categories(operation){
      new SingleRequest({
        url: "http://localhost:3000/maintenance/database/widgets/categories/" + operation,
        method: "GET",
        onComplete: function(res: HttpResponse) {
          setState(this, function(){
            status = res.content;
          });
        },
        onProgress: function() {
          setState(this, function(){
            status = "Loading";
          });
        }
      }).request();
    }

    function quickStartGuides(operation){
      new SingleRequest({
        url: "http://localhost:3000/maintenance/database/guides/" + operation,
        method: "GET",
        onComplete: function(res: HttpResponse) {
          setState(this, function(){
            status = res.content;
          });
        },
        onProgress: function() {
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
                    child: new Text("Insert catalogue"),
                    onClick: function(e) {
                      catalogue("insert");
                    }
                  }),
                  new Button({
                    child: new Text("Delete catalogue"),
                    onClick: function(e) {
                      catalogue("delete");
                    }
                  })
                ]
              }),
              new Row({
                children: [
                  new Button({
                    child: new Text("Insert categories"),
                    onClick: function(e) {
                      categories("insert");
                    }
                  }),
                  new Button({
                    child: new Text("Delete categories"),
                    onClick: function(e) {
                      categories("delete");
                    }
                  })
                ]
              }),
              new Row({
                children: [
                  new Button({
                    child: new Text("Insert Quick-Start Guides"),
                    onClick: function(e) {
                      quickStartGuides("insert");
                    }
                  }),
                  new Button({
                    child: new Text("Delete Quick-Start Guides"),
                    onClick: function(e) {
                      quickStartGuides("delete");
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