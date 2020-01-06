package lib.components;

import com.akifox.asynchttp.*;
import lib.support.Widget;
import js.Browser;

/**
    new Request({
        url: "http://localhost:3000/test",
        onComplete: function(res: HttpResponse) {
            return new Text("Result: " + res.content);
        },
        onProgress: function() {
            return new Text("Loading");
        },
        onError: function(res: HttpResponse) {
            return new Text("Error: " + res.error);
        },
    }),
**/

class Request implements Widget{
    var url: String = "";
    var onComplete: haxe.Constraints.Function = null;
    var onProgress: haxe.Constraints.Function = null;
    var onError: haxe.Constraints.Function = null;

    public function new(
    arg: {
        url: String,
        onComplete: haxe.Constraints.Function,
        onProgress: haxe.Constraints.Function,
        ?onError: haxe.Constraints.Function
    }){
        this.url = arg.url;
        this.onComplete = arg.onComplete;
        this.onProgress = arg.onProgress;
        this.onError = arg.onError;
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
            url : url,
            callback : function(response:HttpResponse):Void {
                if (response.isOK) {
                    var component = onComplete(response);
                    replace(container, onProgressNode, component);
                } else {
                    if(onError != null) {
                        var component = onError(response);
                        replace(container, onProgressNode, component);
                    }
                }
            }  
        });
        request.send();      
        return container;
    }
}