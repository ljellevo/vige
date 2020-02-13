package com.vige.core;

import js.Browser;
import com.vige.components.*;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;

/*
import lib.support.Widget;
import js.Browser;
*/
class Body {

    public function new() { }


    

    public function to(arg: {route: String}) {
        
    }

    public function init() {
        Browser.document.body.style.margin = "0px";
    }

    public function font(fontFamily: String, fontWeight: String) {
        //font-family: 'Quicksand', sans-serif;
        var style = Browser.document.body.style;
        style.fontFamily = fontFamily;
        style.fontWeight = fontWeight;
        //style.fontSize = "48";
    }

    public function globalBackgroundColor(color: Color) {
      Browser.document.body.style.backgroundColor = color.getBackgroundColor();
    }

    public function setHeader(stylesheetUrl: String) {
        //font-family: 'Quicksand', sans-serif;
        var element = '<link href="' + stylesheetUrl + '", rel="stylesheet">';
        var style = Browser.document.head.innerHTML += element;
        
    }


    /**
      If overwritten then it will not reset back to this value
    */
    public function setGlobalTitle(title: String) {
      var titleElement = Browser.document.createTitleElement();
      titleElement.text = title;

      var existingTitleElements = Browser.document.head.getElementsByTagName("title");
      for(i in 0...existingTitleElements.length){
        Browser.document.head.removeChild(existingTitleElements[i]);
      }
      Browser.document.head.appendChild(titleElement);
    }


    public function render(widget: js.html.Node) {
        Browser.document.body.appendChild(widget);
    }
}