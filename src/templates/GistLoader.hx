package templates;

import lib.core.Body;
import lib.components.HtmlSnippet;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;


/**
  Needs to unload css when navigation is done
**/

typedef GistSnippet = {
  var div: String;
  var stylesheet: String;
}
  
class GistLoader implements Widget{
    var content: String;
    var css: String;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;

    public function new(arg: {
      content: String,
      css: String
    }) {
      this.content = arg.content;
      this.css = arg.css;
    }

    public function init() {}

    public function render(): js.html.Node {
      var body = new Body();
      body.setHeader(css);
      return new HtmlSnippet({snippet: content}).render();
    }


}