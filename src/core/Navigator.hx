package core;

import js.Browser;
import js.html.Element;
import js.html.HtmlElement;
import components.Page;
import support.Widget;

class Navigator {
    
    public function new() { }

    public static function navigateTo(arg: {widget: Page}) {
        var route = arg.widget.getRoute();
        var body = new Body().getBody();
        var page = body.querySelector("#page");
        page.remove();
        new Body().init(arg.widget.render());
        Browser.location.pathname = Browser.location.href + route;
    }
}