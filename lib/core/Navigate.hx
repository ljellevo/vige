package lib.core;

import lib.support.Widget;

class Navigate {

    public function new() { }

    public function to(arg: {route: String}) {
        new Body().to({route: arg.route});
    }
}