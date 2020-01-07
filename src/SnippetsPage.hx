
import lib.support.Widget;
import lib.components.Text;
import lib.components.Page;
import lib.core.DynamicComponent;

class SnippetsPage extends DynamicComponent {
  var data: Array<String> = [];

  public function new() {}

  override public function component(): Page {
    page = new Page({
      route: "/snippets",
      child: new Text("Snippets Page")
    });
    return page;
  }
}