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
    <script src="https://gist.github.com/ljellevo/7cbac37d851ce59a45ca45ce6c01fefd.js"></script>
**/



class IFrame implements Widget {
  public var src: String;
  
    
  public var color: Color;
  public var border: Border;
  public var padding: Padding;
  public var margin: Margin;
  public var size: Size;
  public var overflow: Overflow;
  public var shadow: Array<Shadow>;


  public function new(arg: {
    src: String,
  }) {
    this.src = arg.src;
  }

  public function init(){}

    
  public function render():js.html.Node {
    var frame = Browser.document.createIFrameElement();
    frame.src = src;
    return frame;
  }
}