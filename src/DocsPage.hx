
import lib.support.Widget;
import Main.CustomNavbar;
import lib.components.Text;
import lib.components.Page;
import lib.core.DynamicComponent;

class DocsPage extends DynamicComponent {
  var data: Array<String> = [];

  public function new() {}

  override public function component(): Page {
    trace("Page was re-rendered");
    page = new Page({
      navbar: new CustomNavbar().navbarComponent(),
      route: "/docs",
      child: textElement()
    });
    return page;
  }

  public function textElement(): Widget{
    return new Text("Docs Page");
  }
}