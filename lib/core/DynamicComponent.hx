package lib.core;
import lib.components.Page;
import lib.support.Widget;
import lib.components.Text;

class DynamicComponent {
    var page: Page = null;

    public function setState(component: DynamicComponent, callback: haxe.Constraints.Function) {
        var oldComponent = page.render();
        callback();
        var newComponent = component.component().render();
        Navigate.replaceTo(component.component().render());
        
        // Need to compare both components and identify the changes
        
    }

    public function component(): Widget{

        return new Page({route: "/", child: new Text("Component function not overwritten")});
    }
    
}