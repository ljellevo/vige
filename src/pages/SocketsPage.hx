package pages;

import js.html.ErrorEvent;
import js.html.Event;
import js.html.CloseEvent;
import js.html.MessageEvent;

import lib.components.Stream;
import lib.components.Page;
import lib.components.Text;
import lib.components.Collection;
import lib.components.Center;

import lib.core.DynamicComponent;



class SocketsPage extends DynamicComponent {
    var data: Array<String> = [];
  
    public function new() {}
  
    override public function component(): Page {
      page = new Page({
        route: "/sockets",
        child: new Center({
          alignment: CenterAlignment.Horizontal,
          child: new Stream(page, {
            url: "ws://localhost:3001/socket",
            onStandby: function() {
              return new Text("On standby");
            },
            onOpen: function(res: Event) {
              return new Text("Connection open");
            },
            onMessage: function(res: MessageEvent) {
              data.push(res.data);
              
              return new Collection({
                count: data.length,
              }).build(function(iterator) {
                return new Text(data[iterator]);
              });
            },
            onClose: function(res: CloseEvent) {
              return new Text("Connection closed");
            },
            onError: function(res: ErrorEvent) {
              return new Text("Error");
            },
          })
        }),
      });
  
      return page;
    }
  }