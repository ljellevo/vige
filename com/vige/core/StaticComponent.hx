package com.vige.core;

import com.vige.components.*;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
/*
import lib.components.Page;
import lib.support.Widget;
import lib.components.Text;

*/

class StaticComponent {
    @:require
    public function component(): Widget{

        return new Page({route: "/", child: new Text("Component function not overwritten")});
    }
}

