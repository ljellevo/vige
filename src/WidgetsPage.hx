
import lib.components.Text;
import lib.components.Page;
import lib.core.DynamicComponent;

class WidgetsPage extends DynamicComponent {
  var data: Array<String> = [];

  public function new() {}

  override public function component(): Page {
    page = new Page({
      route: "/widgets",
      child: new Text("Widgets Page")
    });
    return page;
  }
}