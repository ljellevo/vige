
import pages.*;
import components.*;
import lib.utils.Border;
import lib.utils.Margin;
import lib.utils.Size;
import lib.utils.Colors;
import lib.utils.Color;


import lib.components.Text;
import lib.components.Row;
import lib.components.Container;
import lib.components.Image;

import lib.core.DynamicComponent;

import lib.components.Navbar;
import lib.support.Widget;
import js.Browser;

import lib.core.Body;
import lib.core.Navigate;




class Main {
  static function main() {
    var body = new Body();
    body.font("Lato", "100");
    
    Navigate.routes = [
      new HomePage(),
      new GuidesPage(),
      new DocsPage(),
      new WidgetsPage(),
      new SnippetsPage(),
      new TemplatesPage(),
      new SocketsPage(),
      new DatabasePage(),
      new WidgetCategoryPage()
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


class CustomNavbar extends DynamicComponent {

  public function new(){}

  
  private function homepageButton(text: String, src: String, url: String): Widget{
    function getButtonContents(text: String, src: String): Array<Widget>{
      var widgets: Array<Widget> = [];
      if(src != null && src != "") {
        if(url == "/") {
          widgets.push(new Container({color: new Color({color: Colors.BLACK}), child: new Image({src: src, height: 25})}));
        } else {
          widgets.push(new Container({color: new Color({color: Colors.BLACK}), child: new Image({src: src, height: 15})}));
        }  
      }
      
      if(text != null && text != "") {
        if(src != null && src != "") {
          widgets.push(new Container({size: new Size({width: 20, widthType: "px"})}));
        }
        widgets.push(new Text(text, {textSize: 12, color: new Color({color: Colors.fromString("#2e3440")})}));
      }
      return widgets;
    }

    function determineBorder(): Border {
      var path = Browser.location.pathname;
      if(path == url) {
        return new Border({style: BorderStyle.Solid, width: 5, color: Colors.fromString("#2e3440"), sides: BorderSides.Bottom});
      }
      return null;
    }

    return new HomeButton({
      size: new Size({height: 40, heightType: "px"}),
      color: new Color({color: Colors.BLACK, backgroundColor: Colors.fromString("#fafafa")}),
      border: determineBorder(),
      child: new Row({
        alignment: RowAlignment.Center,
        children: getButtonContents(text, src)
      }), 
      onClick: function (e) {
        if(url == "https://github.com/ljellevo/mist.io") {
          Navigate.link({url: url});
        }
        
        Navigate.to({url: url});
      }
    });
  }

  public function navbarComponent(): Navbar {
    var navbar = new Navbar({
      position: NavbarPosition.Top,
      offset: 0,
      color: new Color({backgroundColor: "#fafafa"}),
      child: new Row({
        margin: Margin.fromTRBL(10, 50, 10, 50),
        children: [
          homepageButton(null, "./assets/logo-verbose.png", "/"),
          homepageButton("Quick-start", "./assets/chevron-right-solid.svg", "/guides"),
          homepageButton("Docs", "./assets/book-solid.svg", "/docs"),
          homepageButton("Widgets", "./assets/book-open.svg",  "/widgets"),
          homepageButton("Widgets", "./assets/book-open.svg",  "/widgets/category"),
          homepageButton("Snippets", "./assets/code-solid.svg", "/snippets"),
          homepageButton("Templates", "./assets/template.svg", "/templates"),
          homepageButton("Codebase", "./assets/github.svg", "https://github.com/ljellevo/mist.io"),
        ],
      }),
      onComplete: function (){}
    });
    return navbar;
  }
}
