package com.vige.support;

import com.vige.components.*;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;

/*
import lib.utils.Padding;
import lib.utils.Size;
import lib.utils.Margin;
import lib.utils.Border;
import lib.utils.Color;
*/

enum Overflow {
  Visible;
  Hidden;
  Scroll;
  Auto;
  Initial;
  Inherit;
}

interface Widget {
    var color: Color;
    var border: Border;
    var padding: Padding;
    var margin: Margin;
    var size: Size;
    var overflow: Overflow;
    function init(): Void;
    public function render():js.html.Node;
}
