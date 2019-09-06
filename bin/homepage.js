// Generated by Haxe 4.0.0-rc.3+e3df7a4
(function ($global) { "use strict";
var $estr = function() { return js_Boot.__string_rec(this,''); },$hxEnums = $hxEnums || {},$_;
function $extend(from, fields) {
	var proto = Object.create(from);
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var Main = function() { };
Main.__name__ = true;
Main.main = function() {
	var body = new lib_core_Body();
	var page = new lib_components_Page({ route : "/", child : new lib_components_Column({ style : new lib_utils_Style({ color : -1}), size : new lib_utils_Size({ height : 100, heigthType : "%"}), padding : lib_utils_Padding.all(10), children : [new lib_components_Row({ children : [new lib_components_Text("Row"),new lib_components_Text("Row"),new lib_components_Text("Row")]}),new lib_components_Text("Hello"),new lib_components_Text("Hello",{ style : new lib_utils_Style({ color : -65281})}),new lib_components_Button({ text : "Click me", onClick : function(e) {
		console.log("src/Main.hx:49:","Clicked");
	}})]})});
	body.routing([{ route : "/", component : page}]);
};
Math.__name__ = true;
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
Std.parseInt = function(x) {
	var v = parseInt(x, x && x[0]=="0" && (x[1]=="x" || x[1]=="X") ? 16 : 10);
	if(isNaN(v)) {
		return null;
	}
	return v;
};
var js__$Boot_HaxeError = function(val) {
	Error.call(this);
	this.val = val;
	if(Error.captureStackTrace) {
		Error.captureStackTrace(this,js__$Boot_HaxeError);
	}
};
js__$Boot_HaxeError.__name__ = true;
js__$Boot_HaxeError.__super__ = Error;
js__$Boot_HaxeError.prototype = $extend(Error.prototype,{
});
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__string_rec = function(o,s) {
	if(o == null) {
		return "null";
	}
	if(s.length >= 5) {
		return "<...>";
	}
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) {
		t = "object";
	}
	switch(t) {
	case "function":
		return "<function>";
	case "object":
		if(o.__enum__) {
			var e = $hxEnums[o.__enum__];
			var n = e.__constructs__[o._hx_index];
			var con = e[n];
			if(con.__params__) {
				s += "\t";
				var tmp = n + "(";
				var _g = [];
				var _g1 = 0;
				var _g2 = con.__params__;
				while(_g1 < _g2.length) {
					var p = _g2[_g1];
					++_g1;
					_g.push(js_Boot.__string_rec(o[p],s));
				}
				return tmp + _g.join(",") + ")";
			} else {
				return n;
			}
		}
		if(((o) instanceof Array)) {
			var str = "[";
			s += "\t";
			var _g3 = 0;
			var _g11 = o.length;
			while(_g3 < _g11) {
				var i = _g3++;
				str += (i > 0 ? "," : "") + js_Boot.__string_rec(o[i],s);
			}
			str += "]";
			return str;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e1 ) {
			var e2 = ((e1) instanceof js__$Boot_HaxeError) ? e1.val : e1;
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") {
				return s2;
			}
		}
		var str1 = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		var k = null;
		for( k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str1.length != 2) {
			str1 += ", \n";
		}
		str1 += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str1 += "\n" + s + "}";
		return str1;
	case "string":
		return o;
	default:
		return String(o);
	}
};
var lib_components_Button = function(arg) {
	this.onClick = null;
	this.text = "";
	this.text = arg.text;
	this.onClick = arg.onClick;
};
lib_components_Button.__name__ = true;
lib_components_Button.prototype = {
	render: function() {
		var button = window.document.createElement("button");
		button.textContent = this.text;
		button.onclick = this.onClick;
		return button;
	}
};
var lib_components_Column = function(arg) {
	this.children = null;
	this.children = arg.children;
	this.style = arg.style != null ? arg.style : new lib_utils_Style({ });
	this.cellStyle = arg.cellStyle != null ? arg.cellStyle : new lib_utils_Style({ });
	this.size = arg.size != null ? arg.size : new lib_utils_Size({ });
	this.cellSize = arg.cellSize != null ? arg.cellSize : new lib_utils_Size({ });
	this.padding = arg.padding != null ? arg.padding : lib_utils_Padding.all(0.0);
};
lib_components_Column.__name__ = true;
lib_components_Column.prototype = {
	render: function() {
		var column = window.document.createElement("div");
		column.style.display = "grid";
		column.style.gridTemplateColumns = "auto/auto";
		column.style.boxSizing = "border-box";
		new lib_support_StyleManager().addStyleToDiv({ size : this.size, widget : column, style : this.style, padding : this.padding});
		var _g = 0;
		var _g1 = this.children;
		while(_g < _g1.length) {
			var child = _g1[_g];
			++_g;
			var columnCell = window.document.createElement("div");
			columnCell.appendChild(child.render());
			new lib_support_StyleManager().addStyleToDiv({ size : this.cellSize, widget : columnCell, style : this.cellStyle, padding : this.padding});
			column.appendChild(columnCell);
		}
		return column;
	}
};
var lib_components_Page = function(arg) {
	this.size = null;
	this.style = null;
	this.navbar = null;
	this.title = "NOT IMPLEMENTED";
	this.route = arg.route;
	this.title = arg.title;
	this.navbar = arg.navbar;
	this.child = arg.child;
	this.style = arg.style != null ? arg.style : new lib_utils_Style({ });
	this.size = arg.size != null ? arg.size : new lib_utils_Size({ });
};
lib_components_Page.__name__ = true;
lib_components_Page.prototype = {
	render: function() {
		var element = window.document.createElement("div");
		if(this.navbar != null) {
			element.appendChild(this.navbar.render());
		}
		element.appendChild(this.child.render());
		new lib_support_StyleManager().addStyleToDiv({ size : this.size, widget : element, style : this.style, padding : lib_utils_Padding.all(0.0)});
		return element;
	}
};
var lib_components_Row = function(arg) {
	this.children = null;
	this.children = arg.children;
	this.style = arg.style != null ? arg.style : new lib_utils_Style({ });
	this.cellStyle = arg.cellStyle != null ? arg.cellStyle : new lib_utils_Style({ });
	this.size = arg.size != null ? arg.size : new lib_utils_Size({ });
	this.cellSize = arg.cellSize != null ? arg.cellSize : new lib_utils_Size({ });
	this.padding = arg.padding != null ? arg.padding : lib_utils_Padding.all(0.0);
	this.cellPadding = arg.cellPadding != null ? arg.cellPadding : lib_utils_Padding.all(0.0);
};
lib_components_Row.__name__ = true;
lib_components_Row.prototype = {
	render: function() {
		var row = window.document.createElement("div");
		row.style.display = "grid";
		row.style.gridTemplateColumns = "auto auto auto";
		row.style.gridAutoFlow = "column";
		new lib_support_StyleManager().addStyleToDiv({ size : this.size, widget : row, style : this.style, padding : this.padding});
		var _g = 0;
		var _g1 = this.children;
		while(_g < _g1.length) {
			var child = _g1[_g];
			++_g;
			var rowCell = window.document.createElement("div");
			rowCell.appendChild(child.render());
			new lib_support_StyleManager().addStyleToDiv({ size : this.cellSize, widget : rowCell, style : this.cellStyle, padding : this.cellPadding});
			row.appendChild(rowCell);
		}
		return row;
	}
};
var lib_components_TextFormat = $hxEnums["lib.components.TextFormat"] = { __ename__ : true, __constructs__ : ["h1","h2","h3","h4","h5","h6","p","a","pre"]
	,h1: {_hx_index:0,__enum__:"lib.components.TextFormat",toString:$estr}
	,h2: {_hx_index:1,__enum__:"lib.components.TextFormat",toString:$estr}
	,h3: {_hx_index:2,__enum__:"lib.components.TextFormat",toString:$estr}
	,h4: {_hx_index:3,__enum__:"lib.components.TextFormat",toString:$estr}
	,h5: {_hx_index:4,__enum__:"lib.components.TextFormat",toString:$estr}
	,h6: {_hx_index:5,__enum__:"lib.components.TextFormat",toString:$estr}
	,p: {_hx_index:6,__enum__:"lib.components.TextFormat",toString:$estr}
	,a: {_hx_index:7,__enum__:"lib.components.TextFormat",toString:$estr}
	,pre: {_hx_index:8,__enum__:"lib.components.TextFormat",toString:$estr}
};
var lib_components_Text = function(text,arg) {
	this.text = "";
	this.text = text;
	if(arg == null) {
		arg = { style : new lib_utils_Style({ })};
	}
	this.style = arg.style;
};
lib_components_Text.__name__ = true;
lib_components_Text.prototype = {
	getText: function() {
		return this.text;
	}
	,render: function() {
		var element = window.document.createElement("p");
		element.style.color = this.style.getColor();
		element.innerText = this.text;
		return element;
	}
};
var lib_core_Body = function() {
};
lib_core_Body.__name__ = true;
lib_core_Body.prototype = {
	routing: function(routes) {
		var currentURL = window.location.pathname;
		console.log("lib/core/Body.hx:13:",currentURL);
		var _g = 0;
		while(_g < routes.length) {
			var route = routes[_g];
			++_g;
			if(route.route == currentURL) {
				window.document.body.appendChild(route.component.render());
			}
		}
	}
	,render: function(widget) {
		window.document.body.appendChild(widget);
	}
};
var lib_support_StyleManager = function() {
};
lib_support_StyleManager.__name__ = true;
lib_support_StyleManager.prototype = {
	addStyleToDiv: function(arg) {
		arg.widget.style.height = arg.size.getHeight();
		arg.widget.style.width = arg.size.getWidth();
		arg.widget.style.backgroundColor = arg.style.getColor();
		arg.widget.style.padding = arg.padding.getPadding();
		return arg.widget;
	}
};
var lib_utils__$Color_Color_$Impl_$ = {};
lib_utils__$Color_Color_$Impl_$.__name__ = true;
lib_utils__$Color_Color_$Impl_$.fromString = function(rgba) {
	var this1 = Std.parseInt(rgba);
	return this1;
};
lib_utils__$Color_Color_$Impl_$.fromRGBAi = function(r,g,b,a) {
	var this1 = r << 16 | g << 8 | b | a << 24;
	return this1;
};
lib_utils__$Color_Color_$Impl_$.fromRGBAf = function(r,g,b,a) {
	var this1 = (r * 255 | 0) << 16 | (g * 255 | 0) << 8 | (b * 255 | 0) | (a * 255 | 0) << 24;
	return this1;
};
lib_utils__$Color_Color_$Impl_$._new = function(rgba) {
	var this1 = rgba;
	return this1;
};
lib_utils__$Color_Color_$Impl_$.get_ai = function(this1) {
	return this1 >> 24 & 255;
};
lib_utils__$Color_Color_$Impl_$.set_ai = function(this1,ai) {
	var this2 = (this1 >> 16 & 255) << 16 | (this1 >> 8 & 255) << 8 | this1 & 255 | ai << 24;
	this1 = this2;
	return ai;
};
lib_utils__$Color_Color_$Impl_$.get_ri = function(this1) {
	return this1 >> 16 & 255;
};
lib_utils__$Color_Color_$Impl_$.set_ri = function(this1,ri) {
	var this2 = ri << 16 | (this1 >> 8 & 255) << 8 | this1 & 255 | (this1 >> 24 & 255) << 24;
	this1 = this2;
	return ri;
};
lib_utils__$Color_Color_$Impl_$.get_gi = function(this1) {
	return this1 >> 8 & 255;
};
lib_utils__$Color_Color_$Impl_$.set_gi = function(this1,gi) {
	var this2 = (this1 >> 16 & 255) << 16 | gi << 8 | this1 & 255 | (this1 >> 24 & 255) << 24;
	this1 = this2;
	return gi;
};
lib_utils__$Color_Color_$Impl_$.get_bi = function(this1) {
	return this1 & 255;
};
lib_utils__$Color_Color_$Impl_$.set_bi = function(this1,bi) {
	var this2 = (this1 >> 16 & 255) << 16 | (this1 >> 8 & 255) << 8 | bi | (this1 >> 24 & 255) << 24;
	this1 = this2;
	return bi;
};
lib_utils__$Color_Color_$Impl_$.get_af = function(this1) {
	return (this1 >> 24 & 255) / 255;
};
lib_utils__$Color_Color_$Impl_$.set_af = function(this1,af) {
	var this2 = ((this1 >> 16 & 255) / 255 * 255 | 0) << 16 | ((this1 >> 8 & 255) / 255 * 255 | 0) << 8 | ((this1 & 255) / 255 * 255 | 0) | (af * 255 | 0) << 24;
	this1 = this2;
	return af;
};
lib_utils__$Color_Color_$Impl_$.get_rf = function(this1) {
	return (this1 >> 16 & 255) / 255;
};
lib_utils__$Color_Color_$Impl_$.set_rf = function(this1,rf) {
	var this2 = (rf * 255 | 0) << 16 | ((this1 >> 8 & 255) / 255 * 255 | 0) << 8 | ((this1 & 255) / 255 * 255 | 0) | ((this1 >> 24 & 255) / 255 * 255 | 0) << 24;
	this1 = this2;
	return rf;
};
lib_utils__$Color_Color_$Impl_$.get_gf = function(this1) {
	return (this1 >> 8 & 255) / 255;
};
lib_utils__$Color_Color_$Impl_$.set_gf = function(this1,gf) {
	var this2 = ((this1 >> 16 & 255) / 255 * 255 | 0) << 16 | (gf * 255 | 0) << 8 | ((this1 & 255) / 255 * 255 | 0) | ((this1 >> 24 & 255) / 255 * 255 | 0) << 24;
	this1 = this2;
	return gf;
};
lib_utils__$Color_Color_$Impl_$.get_bf = function(this1) {
	return (this1 & 255) / 255;
};
lib_utils__$Color_Color_$Impl_$.set_bf = function(this1,bf) {
	var this2 = ((this1 >> 16 & 255) / 255 * 255 | 0) << 16 | ((this1 >> 8 & 255) / 255 * 255 | 0) << 8 | (bf * 255 | 0) | ((this1 >> 24 & 255) / 255 * 255 | 0) << 24;
	this1 = this2;
	return bf;
};
var lib_utils_Padding = function(arg) {
	this.top = arg.top;
	this.right = arg.right;
	this.bottom = arg.bottom;
	this.left = arg.left;
};
lib_utils_Padding.__name__ = true;
lib_utils_Padding.fromTRBL = function(top,right,bottom,left) {
	return new lib_utils_Padding({ top : top, right : right, bottom : bottom, left : left});
};
lib_utils_Padding.all = function(padding) {
	return new lib_utils_Padding({ top : padding, right : padding, bottom : padding, left : padding});
};
lib_utils_Padding.prototype = {
	getPadding: function() {
		return this.top + "px " + this.right + "px " + this.bottom + "px " + this.left + "px";
	}
};
var lib_utils_Size = function(arg) {
	this.height = arg.height != null ? arg.height : -Infinity;
	this.heigthType = arg.heigthType != "" ? arg.heigthType : "px";
	this.width = arg.width != null ? arg.width : -Infinity;
	this.widthType = arg.widthType != "" ? arg.widthType : "px";
};
lib_utils_Size.__name__ = true;
lib_utils_Size.prototype = {
	getHeight: function() {
		if(this.height == -Infinity) {
			return null;
		}
		return Std.string(this.height) + this.heigthType;
	}
	,getWidth: function() {
		if(this.width == -Infinity) {
			return null;
		}
		return Std.string(this.width) + this.widthType;
	}
};
var lib_utils_Style = function(arg) {
	this.color = arg.color;
	console.log("lib/utils/Style.hx:13:","Color from Style constructor: " + this.color);
};
lib_utils_Style.__name__ = true;
lib_utils_Style.prototype = {
	getColor: function() {
		if(this.color == null) {
			return "";
		}
		return "rgba(" + (this.color >> 16 & 255) + ", " + (this.color >> 8 & 255) + ", " + (this.color & 255) + ", " + (this.color >> 24 & 255) / 255 + ")";
	}
};
String.__name__ = true;
Array.__name__ = true;
Object.defineProperty(js__$Boot_HaxeError.prototype,"message",{ get : function() {
	return String(this.val);
}});
js_Boot.__toStr = ({ }).toString;
lib_utils__$Color_Color_$Impl_$.TRANSPARENT = 0;
lib_utils__$Color_Color_$Impl_$.BLACK = -16777216;
lib_utils__$Color_Color_$Impl_$.WHITE = -1;
lib_utils__$Color_Color_$Impl_$.RED = -65536;
lib_utils__$Color_Color_$Impl_$.GREEN = -16711936;
lib_utils__$Color_Color_$Impl_$.BLUE = -16776961;
lib_utils__$Color_Color_$Impl_$.CYAN = -16711681;
lib_utils__$Color_Color_$Impl_$.MAGENTA = -65281;
lib_utils__$Color_Color_$Impl_$.YELLOW = -256;
Main.main();
})({});
