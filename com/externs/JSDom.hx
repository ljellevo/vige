package com.externs;

import js.Lib;
import js.html.Window;

@:jsRequire('jsdom', 'JSDOM')
extern class JSDom {
	public var window:Window;
	public function new(html:String);
}

class JSDomSetup {
	public static function init():Void {
		var dom = new JSDom('');

		Lib.global.document = dom.window.document;
		Lib.global.window = dom.window;
		Lib.global.navigator = {userAgent: 'node.js'};
	}
}