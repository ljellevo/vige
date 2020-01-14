package pages;

import Main.CustomNavbar;
import lib.support.Widget;
import lib.components.Text;
import lib.components.Page;
import lib.core.DynamicComponent;

class SnippetsPage extends DynamicComponent {
  var data: Array<String> = [];

  public function new() {}

  override public function component(): Page {
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/snippets",
      child: new Text("Snippets Page \n\nA collection of user created snippets for ease of life. This might be everything from sorting algorithms to http requests\n\nHere you can find custom components created by the community. Either a fancy button look, advanced layout widget or ease-of-life components")
    });
    return page;
  }
}