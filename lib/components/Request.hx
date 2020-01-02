package lib.components;

import com.akifox.asynchttp.*;
import lib.core.DynamicComponent;
import lib.support.Widget;
import js.Browser;

class Request implements Widget extends DynamicComponent {
    var url: String = "";
    var parent: DynamicComponent = null;
    var onComplete: haxe.Constraints.Function = null;
    var onProgress: haxe.Constraints.Function = null;
    var onError: haxe.Constraints.Function = null;

    public function new(
    parent: DynamicComponent,
    arg: {
        url: String,
        onComplete: haxe.Constraints.Function,
        ?onProgress: haxe.Constraints.Function,
        ?onError: haxe.Constraints.Function
    }){
        this.url = arg.url;
        this.parent = parent;
        this.onComplete = arg.onComplete;
        this.onProgress = arg.onProgress;
        this.onError = arg.onError;
    }

    override public function component() : Widget {
        return page;
    }

    function replace(container: js.html.DivElement, onProgressNode: js.html.Node, component: Widget) {
        
        container.removeChild(onProgressNode);
        container.appendChild(component.render());
    }
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();
        var progressComponent = onProgress();
        var onProgressNode = container.appendChild(progressComponent.render());
            var request = new HttpRequest({
                url : "http://localhost:3000/test",
                callback : function(response:HttpResponse):Void {
                    if (response.isOK) {
                        trace(response.content);
                        trace('DONE ${response.status}');
                        var component = onComplete(response.content);
                        replace(container, onProgressNode, component);

                    } else {
                        var component = onError(response.content);
                        replace(container, onProgressNode, component);

                        trace('ERROR ${response.status} ${response.error}');
                    }
                }  
            });
        request.send();      
        return container;
    }
}