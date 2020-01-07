import lib.core.Navigate;
import lib.components.Container;
import lib.components.Navbar;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Colors;
import lib.utils.Margin;
import lib.utils.Size;

import lib.components.Row;
import lib.components.Image;
import lib.components.Text;

class CustomNavbar {
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
            })
          });

    }
}