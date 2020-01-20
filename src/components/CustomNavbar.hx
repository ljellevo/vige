package components;

import lib.core.DynamicComponent;
import lib.components.Navbar;
import lib.support.Widget;


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
      size: new Size({height: 40, heightType: "px", width: 120, widthType: "px"}),
      color: new Color({color: Colors.BLACK, backgroundColor: Colors.fromString("#fafafa")}),
      border: determineBorder(),
      child: new Row({
        mainAxisAlignment: MainAxisAlignment.Center,
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

  private function homepageButtonColored(text: String, src: String, url: String): Widget{
    function getButtonContents(text: String, src: String): Array<Widget>{
      var widgets: Array<Widget> = [];
      if(src != null && src != "") {
        if(url == "/") {
          widgets.push(new Container({color: new Color({color: Colors.BLACK}), child: new Image({src: src, height: 25, width: 25})}));
        } else {
          widgets.push(new Container({color: new Color({color: Colors.BLACK}), child: new Image({src: src, height: 15, width: 30})}));
        }  
      }
      
      if(text != null && text != "") {
        if(src != null && src != "") {
          //widgets.push(new Container({size: new Size({width: 20, widthType: "px"})}));
        }
        widgets.push(new Text(text, {textSize: 12, color: new Color({color: Colors.fromString("#fafafa")})}));
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
      size: new Size({height: 40, heightType: "px", width: 120, widthType: "px"}),
      color: new Color({color: Colors.BLACK, backgroundColor: Colors.fromString("#2e3440")}),//2e3440
      border: new Border({
        color: Colors.TRANSPARENT,
        style: BorderStyle.None,
        width: 1,
        cornerRadius: CornerRadius.all(20),
      }),
      child: new Row({
        //equalElementWidth: false,
        mainAxisAlignment: MainAxisAlignment.Center,
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
        mainAxisAlignment: MainAxisAlignment.Center,
        crossAxisAlignment: CrossAxisAlignment.SpacedEvenly,
        margin: Margin.fromTRBL(10, 0, 10, 0),
        children: [
          homepageButton(null, "./assets/logo-simple.png", "/"),
          homepageButton("Quick-start", "./assets/chevron-right-solid.svg", "/guides"),
          homepageButton("Docs", "./assets/book-solid.svg", "/docs"),
          homepageButton("Widgets", "./assets/book-open.svg",  "/widgets"),
          homepageButton("Snippets", "./assets/code-solid.svg", "/snippets"),
          homepageButton("Templates", "./assets/template.svg", "/templates"),
          homepageButton("Codebase", "./assets/github.svg", "https://github.com/ljellevo/mist.io"),
          homepageButtonColored("Download", "./assets/download.svg", "/download")
        ],
      }),
      onComplete: function (){}
    });
    return navbar;
  }
}