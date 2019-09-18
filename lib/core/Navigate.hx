package lib.core;

import js.html.History;
import js.Browser;
import lib.support.Widget;

class HistoryComponent {
    var component: js.html.Node;
    var index: Int;

    public function new(component: js.html.Node, index: Int) {
        this.component = component;
        this.index = index;
        //When history component is added then increment historyIndex
    }

    public function getComponent(): js.html.Node {
        return component;
    }

    public function setComponent(newComponent: js.html.Node) {
        component = newComponent;
    }
}


class Navigate {
    
    public static var routes: Array<{route: String, component: Widget}> = [];
    static var history: Array<HistoryComponent> = [];
    static var historyIndex: Int = 0;

    public function new() { }

    public static function to(arg: {route: String, ?param: Array<{param: String, data: String}>, ?main: Bool}) {
        var url = arg.route;
        if (arg.main == null) arg.main = false;
        if (arg.param != null && arg.param.length > 0) {
            url += "?";

            for(i in 0...arg.param.length){
                if(i != 0) url += "&";
                url += arg.param[i].param + "=" + arg.param[i].data;
            }
        }
        
        if (!arg.main) {
            Browser.window.history.pushState(null, "Index", arg.route);
        }
        
        setComponent(true); 
    }

    /**
    TODO: Implement this feature:
        Determines whether a new component needs to be loaded, or an exsisting component from the stack
    **/
    static function setComponent(newHistoryElement: Bool) {
        var currentURL = Browser.location.pathname;
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        for(route in routes) {
            if (route.route == currentURL) {
                //Set component from history if that is applicable. If 
                //user navigates forward from this component then update the component on the stack.

                if(newHistoryElement) {
                    //Add to end of stack and update history index
                    
                    history.push(new HistoryComponent(route.component.render(), historyIndex));
                    historyIndex++;

                } else {
                    //Return component from history stack based on history index
                    trace(history[historyIndex]);
                    Browser.document.body.appendChild(history[historyIndex].getComponent());
                }





                return;
            }
        }
    }

    /**
    TODO: Implement this feature:
        Figures out if user navigates forwards or backwards when using browser navigation buttons
    **/
    public static function navigationEvent() {

        back();

    }

    static function forward() {
        historyIndex++;
        setComponent(false);
    }

    static function back() {
        historyIndex--;
        setComponent(false);
    }

    public static function updateComponent(component: js.html.Node) {
        if (Browser.document.querySelector("#page") != null) {
            Browser.document.querySelector("#page").remove();
        }

        var currentURL = Browser.location.pathname;
        Browser.document.body.appendChild(component);
    }
}