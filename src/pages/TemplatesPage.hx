package pages;

import Main.CustomNavbar;
import lib.components.Text;
import lib.components.Page;
import lib.core.DynamicComponent;

class TemplatesPage extends DynamicComponent {
  var data: Array<String> = [];

  public function new() {}

  override public function component(): Page {
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/templates",
      child: new Text("Templates Page")
    });
    return page;
  }
}