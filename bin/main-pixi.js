// Generated by Haxe 3.4.7
(function () { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var Global = function() { };
Global.__name__ = true;
Math.__name__ = true;
var display_PDisplayObject = function() { };
display_PDisplayObject.__name__ = true;
var display_PContainer = function() {
	PIXI.Container.call(this);
};
display_PContainer.__name__ = true;
display_PContainer.__interfaces__ = [display_PDisplayObject];
display_PContainer.__super__ = PIXI.Container;
display_PContainer.prototype = $extend(PIXI.Container.prototype,{
});
var PApplication = function(settings) {
	display_PContainer.call(this);
	this.app = new PTApplication();
	this.app.backgroundColor = settings.backgroundColor;
	this.app.start("auto",settings.parentDOM,settings.canvas);
	this.app.stage.addChild(this);
	this.onReady();
};
PApplication.__name__ = true;
PApplication.__super__ = display_PContainer;
PApplication.prototype = $extend(display_PContainer.prototype,{
	onReady: function() {
	}
});
var pixi_plugins_app_Application = function() {
	this._animationFrameId = null;
	this.pixelRatio = 1;
	this.autoResize = true;
	this.transparent = false;
	this.antialias = false;
	this.forceFXAA = false;
	this.roundPixels = false;
	this.legacy = false;
	this.clearBeforeRender = true;
	this.preserveDrawingBuffer = false;
	this.backgroundColor = 16777215;
	this.width = window.innerWidth;
	this.height = window.innerHeight;
	this.position = "static";
};
pixi_plugins_app_Application.__name__ = true;
pixi_plugins_app_Application.prototype = {
	start: function(rendererType,parentDom,canvasElement) {
		if(rendererType == null) {
			rendererType = "auto";
		}
		if(canvasElement == null) {
			this.canvas = window.document.createElement("canvas");
			this.canvas.style.width = this.width + "px";
			this.canvas.style.height = this.height + "px";
			this.canvas.style.position = this.position;
		} else {
			this.canvas = canvasElement;
		}
		if(this.autoResize) {
			window.onresize = $bind(this,this._onWindowResize);
		}
		var renderingOptions = { };
		renderingOptions.width = this.width | 0;
		renderingOptions.height = this.height | 0;
		renderingOptions.view = this.canvas;
		renderingOptions.backgroundColor = this.backgroundColor;
		renderingOptions.resolution = this.pixelRatio;
		renderingOptions.antialias = this.antialias;
		renderingOptions.forceFXAA = this.forceFXAA;
		renderingOptions.autoResize = this.autoResize;
		renderingOptions.transparent = this.transparent;
		renderingOptions.clearBeforeRender = this.clearBeforeRender;
		renderingOptions.preserveDrawingBuffer = this.preserveDrawingBuffer;
		renderingOptions.roundPixels = this.roundPixels;
		renderingOptions.legacy = this.legacy;
		if(rendererType == null) {
			this.app = new PIXI.Application(renderingOptions);
		} else if(rendererType == "canvas") {
			renderingOptions.forceCanvas = true;
			this.app = new PIXI.Application(renderingOptions);
		} else {
			this.app = new PIXI.Application(renderingOptions);
		}
		this.stage = this.app.stage;
		this.renderer = this.app.renderer;
		if(parentDom == null) {
			window.document.body.appendChild(this.app.view);
		} else {
			parentDom.appendChild(this.app.view);
		}
		this.app.ticker.add($bind(this,this._onRequestAnimationFrame));
	}
	,_onWindowResize: function(event) {
		this.width = window.innerWidth;
		this.height = window.innerHeight;
		this.app.renderer.resize(this.width,this.height);
		this.canvas.style.width = this.width + "px";
		this.canvas.style.height = this.height + "px";
		if(this.onResize != null) {
			this.onResize();
		}
	}
	,_onRequestAnimationFrame: function() {
		if(this.onUpdate != null) {
			this.onUpdate(this.app.ticker.deltaTime);
		}
	}
};
var PTApplication = function() {
	pixi_plugins_app_Application.call(this);
};
PTApplication.__name__ = true;
PTApplication.__super__ = pixi_plugins_app_Application;
PTApplication.prototype = $extend(pixi_plugins_app_Application.prototype,{
	start: function(rendererType,parentDom,canvasElement) {
		if(rendererType == null) {
			rendererType = "auto";
		}
		pixi_plugins_app_Application.prototype.start.call(this,rendererType,parentDom,canvasElement);
		this._onWindowResize(null);
		window.onload = $bind(this,this._onWindowResize);
	}
	,_onWindowResize: function(event) {
		this.width = this.canvas.parentElement.clientWidth;
		this.height = this.canvas.parentElement.clientHeight;
		this.app.renderer.resize(this.width,this.height);
		this.canvas.style.width = this.width + "px";
		this.canvas.style.height = this.height + "px";
		if(this.onResize != null) {
			this.onResize();
		}
	}
});
var Protean = function() { };
Protean.__name__ = true;
Protean.routeTrace = function(v,infos) {
	window.console.log(infos.className + "." + infos.methodName + ":" + infos.lineNumber + ":");
	window.console.log(v);
};
var protean_Application = function(options) {
	haxe_Log.trace = Protean.routeTrace;
	PApplication.call(this,options);
};
protean_Application.__name__ = true;
protean_Application.__super__ = PApplication;
protean_Application.prototype = $extend(PApplication.prototype,{
});
var Test = function() {
	protean_Application.call(this,{ parentDOM : window.document.getElementById(Protean.id), backgroundColor : 0});
};
Test.__name__ = true;
Test.main = function() {
	new Test();
};
Test.__super__ = protean_Application;
Test.prototype = $extend(protean_Application.prototype,{
	onReady: function() {
		this.drawRect();
	}
	,drawRect: function() {
		this.s = new display_PShape();
		var shape = this.s;
		shape.lineStyle(1,16711680,1);
		shape.drawRect(0,0,50,50);
		shape.position.set(200,20);
		shape.scale.set(2,2);
		shape.rotation = Math.PI / 4;
		this.addChild(shape);
		haxe_Timer.delay($bind(this,this.moves),1000);
		this.i = new display_PImage(Protean.id + ".png");
		this.i.position.set(300,20);
		var container = new display_PContainer();
		container.addChild(this.s);
		var childs = [this.i];
		var index = 0;
		var _g = 0;
		while(_g < childs.length) {
			var child = childs[_g];
			++_g;
			container.addChildAt(child,index++);
		}
		container.removeChild(this.i);
		this.addChild(container);
		this.c = container;
		haxe_Log.trace(this.c.children.splice(0,-1),{ fileName : "Test.hx", lineNumber : 37, className : "Test", methodName : "drawRect"});
		haxe_Log.trace(this.c.getChildByName("shape"),{ fileName : "Test.hx", lineNumber : 38, className : "Test", methodName : "drawRect"});
		haxe_Log.trace(this.c.getChildAt(0),{ fileName : "Test.hx", lineNumber : 39, className : "Test", methodName : "drawRect"});
		this.addChild(this.i);
		var object = this.s;
		haxe_Log.trace([this.s.x,this.s.y,this.s.scale.x,this.s.scale.y,object.scale.x == object.scale.y ? object.scale.x : 0,this.s.rotation],{ fileName : "Test.hx", lineNumber : 41, className : "Test", methodName : "drawRect"});
	}
	,moves: function() {
		haxe_Log.trace(Global.id,{ fileName : "Test.hx", lineNumber : 45, className : "Test", methodName : "moves"});
		this.s.x = 100;
	}
});
var display_PImage = function(path) {
	PIXI.Sprite.call(this,PIXI.Texture.fromImage(Protean.root + path));
};
display_PImage.__name__ = true;
display_PImage.__interfaces__ = [display_PDisplayObject];
display_PImage.__super__ = PIXI.Sprite;
display_PImage.prototype = $extend(PIXI.Sprite.prototype,{
});
var display_PShape = function() {
	PIXI.Graphics.call(this);
};
display_PShape.__name__ = true;
display_PShape.__interfaces__ = [display_PDisplayObject];
display_PShape.__super__ = PIXI.Graphics;
display_PShape.prototype = $extend(PIXI.Graphics.prototype,{
	lineStyle: function(lineWidth,color,alpha) {
		return PIXI.Graphics.prototype.lineStyle.call(this,lineWidth == null ? 1 : lineWidth,color == null ? 16711680 : color,alpha == null ? 1 : alpha);
	}
});
var haxe_Log = function() { };
haxe_Log.__name__ = true;
haxe_Log.trace = function(v,infos) {
	js_Boot.__trace(v,infos);
};
var haxe_Timer = function(time_ms) {
	var me = this;
	this.id = setInterval(function() {
		me.run();
	},time_ms);
};
haxe_Timer.__name__ = true;
haxe_Timer.delay = function(f,time_ms) {
	var t = new haxe_Timer(time_ms);
	t.run = function() {
		t.stop();
		f();
	};
	return t;
};
haxe_Timer.prototype = {
	stop: function() {
		if(this.id == null) {
			return;
		}
		clearInterval(this.id);
		this.id = null;
	}
	,run: function() {
	}
};
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__unhtml = function(s) {
	return s.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;");
};
js_Boot.__trace = function(v,i) {
	var msg = i != null ? i.fileName + ":" + i.lineNumber + ": " : "";
	msg += js_Boot.__string_rec(v,"");
	if(i != null && i.customParams != null) {
		var _g = 0;
		var _g1 = i.customParams;
		while(_g < _g1.length) {
			var v1 = _g1[_g];
			++_g;
			msg += "," + js_Boot.__string_rec(v1,"");
		}
	}
	var d;
	var tmp;
	if(typeof(document) != "undefined") {
		d = document.getElementById("haxe:trace");
		tmp = d != null;
	} else {
		tmp = false;
	}
	if(tmp) {
		d.innerHTML += js_Boot.__unhtml(msg) + "<br/>";
	} else if(typeof console != "undefined" && console.log != null) {
		console.log(msg);
	}
};
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
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) {
					return o[0];
				}
				var str = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i = _g1++;
					if(i != 2) {
						str += "," + js_Boot.__string_rec(o[i],s);
					} else {
						str += js_Boot.__string_rec(o[i],s);
					}
				}
				return str + ")";
			}
			var l = o.length;
			var i1;
			var str1 = "[";
			s += "\t";
			var _g11 = 0;
			var _g2 = l;
			while(_g11 < _g2) {
				var i2 = _g11++;
				str1 += (i2 > 0 ? "," : "") + js_Boot.__string_rec(o[i2],s);
			}
			str1 += "]";
			return str1;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") {
				return s2;
			}
		}
		var k = null;
		var str2 = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str2.length != 2) {
			str2 += ", \n";
		}
		str2 += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str2 += "\n" + s + "}";
		return str2;
	case "string":
		return o;
	default:
		return String(o);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
String.__name__ = true;
Array.__name__ = true;
Global.id = "pixi";
Protean.id = "pixi";
Protean.root = "assets" + "/";
Test.main();
})();
