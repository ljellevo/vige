package com.vige.utils;

import com.vige.utils.*;

/**
    Is documented
**/


class Shadow {
  var horizontal: String;
  var vertical: String;
  var blur: String;
  var color: Color;

  public function new(arg: {
    horizontal: String,
    vertical: String,
    blur: String,
    color: Color,
  }) {
    this.horizontal = arg.horizontal != null ? arg.horizontal : "";
    this.vertical = arg.vertical != null ? arg.vertical : "";
    this.blur = arg.blur != null ? arg.blur : "";
    this.color = arg.color;
  }

  public function getShadow(): String {
    if(color != null) {
      return horizontal + " " + vertical + " " + blur + " " + color.getBackgroundColor();
    } else {
      return "";
    }
  }
}