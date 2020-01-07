
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
    GlobalState.instance.setNavbar(CustomNavbar.getNavbar());
    body.init();
    


  }
}

/*


*/