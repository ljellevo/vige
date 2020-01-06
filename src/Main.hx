
import js.Browser;

import lib.core.Body;
import lib.core.Navigate;




class Main {
  static function main() {
    var body = new Body();
    body.font("Lato", "100");
    
    Navigate.routes = [
      new HomePage().component(),
      new SocketsPage().component(),
      new WidgetsPage().component()
    ];

    Navigate.to({url: Browser.location.pathname});

    //Need to move to a different class
    Browser.window.addEventListener('popstate', function(e) {

      //Browser.window.history.pushState(null, null, Browser.window.location.pathname);
      Navigate.navigationEvent();
    });

    body.init();
  }
}