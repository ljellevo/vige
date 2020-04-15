package com.vige.utils;

import com.vige.utils.*;

/**
    Is documented
**/


class Shadow {
  var horizontal: String;
  var vertical: String;
  var blur: String;
  var spread: String;
  var color: Color;

  public function new(arg: {
    horizontal: String,
    vertical: String,
    blur: String,
    ?spread: String,
    color: Color,
  }) {
    this.horizontal = arg.horizontal != null ? arg.horizontal : "";
    this.vertical = arg.vertical != null ? arg.vertical : "";
    this.blur = arg.blur != null ? arg.blur : "";
    this.spread = arg.spread != null ? arg.spread + " " : "0px ";
    this.color = arg.color;
  }

  public function getShadow(): String {
    trace("BC: " + color.getBackgroundColor());
    if(color != null) {
      trace("BC: " + color.getBackgroundColor());

      return horizontal + " " + vertical + " " + blur + " " + spread  + "" + color.getBackgroundColor();
    } else {
      return "";
    }
  }
}