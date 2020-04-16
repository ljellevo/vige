package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.components.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;
/**

**/

class Responsive implements Widget {
    var children: Array<Widget> = null;
    var stretch: Bool;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;
    public var shadow: Array<Shadow>;

    public function new(arg: {
        ?children: Array<Widget>,
        ?stretch: Bool,

    }) {
        this.children = arg.children != null ? arg.children : [];
        this.stretch = arg.stretch;
    }

    public function init(){}

    private function findCorrectWidget(): Widget {
      for(child in children) {
        if(Std.is(child, Sized)) {
          var sized = Std.downcast(child, Sized);
          var windowWidth: Int = Browser.window.innerWidth;
          if(windowWidth < sized.getMaxWidth()){
            return child;
          } else {
            continue;
          }
        }
        return child;    
      }
      return null;
    }

    function replace(container: js.html.DivElement, onProgressNode: js.html.Node, component: Widget): js.html.Node {
      container.removeChild(onProgressNode);
      return container.appendChild(component.render());
  }
    
    public function render():js.html.Node {
        var responsive = Browser.document.createDivElement();
        var lastComponent = responsive.appendChild(findCorrectWidget().render());

        Browser.window.addEventListener('resize', function(e) {
          var correctWidget = findCorrectWidget();
          if(correctWidget != null) {
            lastComponent = replace(responsive, lastComponent, correctWidget);
          }
        });
        return responsive;
    }
}