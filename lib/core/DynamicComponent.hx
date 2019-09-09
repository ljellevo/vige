package lib.core;
import lib.components.Page;

class DynamicComponent {
    var page: Page = null;

    public function setState(callback: haxe.Constraints.Function) {
        trace(page.render());
        trace("SetState Called");
        callback();
        component.
    }
    
}