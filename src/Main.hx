
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

import lib.core.Navigate;
import lib.core.DynamicComponent;

import lib.components.Navbar;
import lib.support.Widget;
import lib.core.GlobalState;
import js.Browser;

import lib.core.Body;
import lib.core.Navigate;




class Main {
  static function main() {
    var body = new Body();
    body.font("Lato", "100");
    
    Navigate.routes = [
      new HomePage().component(),
      new GuidesPage().component(),
      new DocsPage().component(),
      new WidgetsPage().component(),
      new SnippetsPage().component(),
      new TemplatesPage().component(),
      new SocketsPage().component(),
      new DatabasePage().component()
    ];

    Navigate.to({url: Browser.location.pathname, main: true});

    //Need to move to a different class
    Browser.window.addEventListener('popstate', function(e) {

      //Browser.window.history.pushState(null, null, Browser.window.location.pathname);
      Navigate.navigationEvent();
    });

    
    body.init();
    


  }
}


class CustomNavbar {

  
  //Set color of buttons
  private static function homepageButton(text: String, src: String, onClick: haxe.Constraints.Function): Widget{
    function getButtonContents(text: String, src: String): Array<Widget>{
      var widgets: Array<Widget> = [];
      if(src != null && src != "") {

        widgets = [
          new Container({color: new Color({color: Colors.BLACK}), child: new Image({src: src, height: 15})}),
          new Container({size: new Size({width: 20, widthType: "px"})}),
         
        ];
      }
      widgets.push(new Text(text, {textSize: 12, color: new Color({color: Colors.fromString("#2e3440")})}));
      return widgets;
    }

    return new HomeButton({
      size: new Size({height: 40, heightType: "px"}),
      color: new Color({color: Colors.BLACK, backgroundColor: Colors.fromString("#fafafa")}),
      child: new Row({
        alignment: RowAlignment.Center,
        children: getButtonContents(text, src)
      }), 
      onClick: onClick
    });
  }


  public static function getNavbar(): Widget {
    return new Navbar({
      position: NavbarPosition.Top,
      offset: 0,
      color: new Color({backgroundColor: "#fafafa"}),
      child: new Row({
        margin: Margin.fromTRBL(10, 50, 10, 50),
        children: [
          homepageButton("Quick-start", "./assets/chevron-right-solid.svg", function(e){
            Navigate.to({url: "/guides"});
          }),
          homepageButton("Docs", "./assets/book-solid.svg", function(e){
            Navigate.to({url: "/docs"});
          }),
          homepageButton("Widgets", "./assets/book-open.svg", function(e){
            Navigate.to({url: "/widgets"});
          }),
          homepageButton("Snippets", "./assets/code-solid.svg", function(e){
            Navigate.to({url: "/snippets"});
          }),
          homepageButton("Templates", "./assets/template.svg", function(e){
            Navigate.to({url: "/templates"});
          }),
          homepageButton("Codebase", "./assets/github.svg", function(e){
            Navigate.link({url: "https://github.com/ljellevo/mist.io"});
          }),
        ],
      }),
      onComplete: function (){
        trace("Navbar rendered");
        var path = Browser.location.pathname;
        trace(path); 
        switch (path){
          case "/guides":
            trace("guides");
          case "/docs":
            trace("docs");
          case "/widgets":
            trace("widgets");
          case "/snippets":
            trace("snippets");
          case "/templates":
            trace("templates");
        }
      }
    });
  }
}

/*


*/