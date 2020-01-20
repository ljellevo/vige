
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
    //body.font("Lato", "100");
    body.font("Arial", "400");
    body.setGlobalTitle("VIGE");
    
    Navigate.routes = [
      new HomePage(),
      new GuidesPage(),
      new GuidePage(),
      new DocsPage(),
      new CategoryPage(),
      new SnippetsPage(),
      new TemplatesPage(),
      new SocketsPage(),
      new DatabasePage(),
      new WidgetsPage(),
      new WidgetPage(),
      new RowPage(),
      new NewsPage()
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



