package com.vige.components;

import js.html.Node;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;
/*
import lib.core.GlobalState;
import lib.support.StyleManager;
import js.Browser;
import js.html.Node;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;
*/
/**
    Is documented
**/


/**

class HomePage  extends DynamicComponent {
  public function new() {}

  override public function component() : Page {
    page = new Page({
      route: "/",
      title: "Home",
      navbar: new CustomNavbar().navbarComponent(),
      color: new Color({backgroundColor: Colors.fromString("#fafafa")}),

      child: ...
    });
    return page;
  }
}

**/

class Page implements Widget{
    var route: String;
    var title: String = "NOT IMPLEMENTED";
    var navbar: Widget;
    var child: Widget;


    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;



    public function new(arg: {
        route: String,
        ?title: String,
        ?navbar: Widget,
        child: Widget,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        ?overflow: Overflow,
    }) {
        this.route = arg.route;
        this.title = arg.title;
        this.navbar =  arg.navbar;
        this.child = arg.child;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
        this.overflow = arg.overflow;
    }

    public function init(){}



    public function getRoute(): String {
        return route;
    }
    

    public function render() : Node {
        var element = Browser.document.createDivElement();
        if(title != null) {
          var titleElement = Browser.document.createTitleElement();
          titleElement.text = title;

          var existingTitleElements = Browser.document.head.getElementsByTagName("title");
          for(i in 0...existingTitleElements.length){
            Browser.document.head.removeChild(existingTitleElements[i]);
          }
          Browser.document.head.appendChild(titleElement);
        }
        
        element.id = "page";
        navbar != null ? element.appendChild(navbar.render()) : null;
        //element.appendChild(navbar.render());
        element.appendChild(child.render());
        
        new StyleManager().addStyleToDiv({widget: element, color: color, border: border, padding: padding, margin: margin, size: size, overflow: overflow});

        //Need to style container

        return element;
    }

}