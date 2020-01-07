
import lib.components.Text;
import lib.components.Page;
import lib.core.DynamicComponent;

class DocsPage extends DynamicComponent {
  var data: Array<String> = [];

  public function new() {}

  override public function component(): Page {
    page = new Page({
      route: "/docs",
      child: new Text("Docs Page")
    });
    return page;
  }
}