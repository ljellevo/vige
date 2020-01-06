package lib.support;

import lib.utils.Padding;
import lib.utils.Size;
import lib.utils.Margin;
import lib.utils.Border;
import lib.utils.Color;

interface Widget {
    var color: Color;
    var border: Border;
    var padding: Padding;
    var margin: Margin;
    var size: Size;
    public function render():js.html.Node;
}
