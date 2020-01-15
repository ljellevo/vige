package pages;

import js.Browser;
import lib.utils.Margin;
import js.html.ErrorEvent;
import js.html.Event;
import js.html.CloseEvent;
import js.html.MessageEvent;
import com.akifox.asynchttp.HttpResponse;
import lib.support.Widget;
import lib.utils.Padding;
import lib.utils.Size;
import lib.utils.Colors;
import lib.utils.Color;

import lib.components.Request;
import lib.components.Stream;
import lib.components.Button;
import lib.components.Page;
import lib.components.Text;
import lib.components.Column;
import lib.components.Row;
import lib.components.Center;
import lib.components.Container;
import lib.components.Image;
import lib.components.Navbar;

import Main;

import lib.core.Navigate;
import lib.core.DynamicComponent;


/**
  Great tool to understand Row Layout
**/

class RowPage extends DynamicComponent {
  var data: Array<String> = [];

  public function new() {}

  override public function component(): Page {
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/row",
      child:  new Row({
        mainAxisAlignment: MainAxisAlignment.Center,
        cellSize: new Size({height: 100, heightType: "%", width: 50, widthType: "vw"}),
        //cellMargin: Margin.fromTRBL(80.0, 80.0, 80.0, 80.0),
        children: [
          new Container({
            color: new Color({backgroundColor: Colors.fromString("#CBDFBD")}),
            size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
            padding: Padding.fromTRBL(80.0, 80.0, 80.0, 80.0),
            child: new Center({
              alignment: CenterAlignment.Both,
              child: new Container({
                color: new Color({backgroundColor: Colors.fromString("#98b979")}),
                size: new Size({height: 100, heightType: "%"}),
                child:new Image({
                  resizeModifier: ResizeModifier.Width,
                  src: "./assets/code2.png",
                  minWidth: 400,
                  maxWidth: 600,
                })
              })
            })
          }),
          new Container({
            color: new Color({backgroundColor: Colors.fromString("#FF5964")}),
            size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
            padding: Padding.fromTRBL(80.0, 0.0, 80.0, 0.0),
            child: new Center({
              alignment: CenterAlignment.Both,
              child: new Container({
                color: new Color({backgroundColor: Colors.fromString("#98b979")}),
                size: new Size({height: 300, heightType: "px", width: 500, widthType: "px"}),
                child: new Text("VIGE is a modern and feature rich webframework that does things a bit different. \n\n
                Write your website in the new popular declarative way. This makes your code easy toread, change and maintain. Constrct your website by combining widgets in the library, or extend and customize these widgets for a more personal touch. It's your choice!\n\n
                VIGE utilizes the amazing Haxe language to compile your staticly typed code into an efficent single page JavaScript application.", {color: new Color({color: Colors.fromString("#fafafa")})}),
              })
            })
          }),
        ]
      })
    });
    return page;
  }
}