
import lib.components.Text;
import lib.components.Page;
import lib.core.DynamicComponent;

class GuidesPage extends DynamicComponent {
  var data: Array<String> = [];

  public function new() {}

  override public function component(): Page {
    page = new Page({
      route: "/guides",
      child: new Text("Guides Page")
    });
    return page;
  }
}