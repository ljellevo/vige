package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;
/*
import lib.support.StyleManager;
import js.Browser;
import lib.support.Widget;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;
*/


/**
Not done
**/

/**
    Is not documented
**/



class Embeded implements Widget {
  public var src: String;
  public var name: String;
  public var height: Int;
  public var width: Int;
  public var type: String;
  public var align: String;
    
  public var color: Color;
  public var border: Border;
  public var padding: Padding;
  public var margin: Margin;
  public var size: Size;
  public var overflow: Overflow;


  public function new(arg: {
    src: String,
    ?name: String,
    ?height: Int,
    ?width: Int,
    ?type: String,
    ?align: String,

    ?color: Color,
    ?border: Border,
    ?padding: Padding,
    ?margin: Margin,
    ?size: Size, 
  }) {
    this.src = arg.src;
    this.name = arg.name != null ? arg.name : "";
    this.height = arg.height;
    this.width = arg.width;
    this.type = arg.type != null ? arg.type : "";
    this.align = arg.align;

    this.color = arg.color;
    this.border = arg.border;
    this.padding = arg.padding;
    this.margin = arg.margin;
    this.size = arg.size;
  }

  public function init(){}

    
  public function render():js.html.Node {
    var embeded = Browser.document.createEmbedElement();
    embeded.src = src;
    embeded.name = name;
    if(height != null) {
      embeded.height = Std.string(height);
    }
    
    if(width != null) {
      embeded.width = Std.string(width);
    }

    embeded.type = type;
    if(align != null) {
      embeded.align = align;
    }
    

    
    new StyleManager().addStyleToEmbeded({widget: embeded, color: color, border: border, padding: padding, margin: margin, size: size});

    return embeded;
  }
}