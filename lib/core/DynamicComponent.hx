package lib.core;
import js.Browser;
import lib.components.Page;
import lib.support.Widget;
import lib.components.Text;

class DynamicComponent {
    var page: Page = null;

    public function setState(component: DynamicComponent, callback: haxe.Constraints.Function) {
        var oldComponent;
        if(page != null){
            
            oldComponent = page.render();
        }
        
        callback();
        var newComponent = component.component().render();
        Navigate.updateComponent(component.component().render());
        
        // Need to compare both components and identify the changes
    }

    @:require
    public function component(): Page{
        return new Page({route: "/", child: new Text("Component function not overwritten")});
    }
    
}