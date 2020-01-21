package lib.core;

import lib.components.Page;
import lib.support.Widget;
import lib.components.Text;

class StaticComponent {
    @:require
    public function component(): Widget{

        return new Page({route: "/", child: new Text("Component function not overwritten")});
    }
}

