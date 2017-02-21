// Generated by Haxe 3.4.0
(function () { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var Global = function() { };
var display_PDisplayObject = function() { };
var display_PContainer = function() {
	PIXI.Container.call(this);
};
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
	this.clearBeforeRender = true;
	this.preserveDrawingBuffer = false;
	this.backgroundColor = 16777215;
	this.width = window.innerWidth;
	this.height = window.innerHeight;
	this.position = "static";
};
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
		if(rendererType == null) {
			this.app = new PIXI.Application(this.width,this.height,renderingOptions);
		} else if(rendererType == "canvas") {
			this.app = new PIXI.Application(this.width,this.height,renderingOptions,true);
		} else {
			this.app = new PIXI.Application(this.width,this.height,renderingOptions);
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
var protean_Application = function(options) {
	PApplication.call(this,options);
};
protean_Application.__super__ = PApplication;
protean_Application.prototype = $extend(PApplication.prototype,{
});
var Test = function() {
	protean_Application.call(this,{ parentDOM : window.document.getElementById(Protean.id), backgroundColor : 0});
};
Test.main = function() {
	new Test();
};
Test.__super__ = protean_Application;
Test.prototype = $extend(protean_Application.prototype,{
	onReady: function() {
		this.drawRect();
	}
	,drawRect: function() {
		this.s = new protean_display_Shape();
		var shape = this.s;
		shape.lineStyle(1,16711680,1);
		shape.drawRect(0,0,50,50);
		var object = shape;
		object.position.set(200,20);
		object.scale.set(2,2);
		object.rotation = Math.PI / 4;
		this.addChild(object);
		haxe_Timer.delay($bind(this,this.moves),1000);
		this.i = new protean_display_Image("test.png");
		var object1 = this.i;
		object1.position.set(300,20);
		this.addChild(object1);
	}
	,moves: function() {
		console.log(Global.id);
		this.s.x = 100;
	}
});
var display_PImage = function(path) {
	PIXI.Sprite.call(this,PIXI.Texture.fromImage(Protean.root + path));
};
display_PImage.__interfaces__ = [display_PDisplayObject];
display_PImage.__super__ = PIXI.Sprite;
display_PImage.prototype = $extend(PIXI.Sprite.prototype,{
});
var display_PShape = function() {
	PIXI.Graphics.call(this);
};
display_PShape.__interfaces__ = [display_PDisplayObject];
display_PShape.__super__ = PIXI.Graphics;
display_PShape.prototype = $extend(PIXI.Graphics.prototype,{
	lineStyle: function(lineWidth,color,alpha) {
		return PIXI.Graphics.prototype.lineStyle.call(this,lineWidth == null ? 1 : lineWidth,color == null ? 16711680 : color,alpha == null ? 1 : alpha);
	}
});
var haxe_Timer = function(time_ms) {
	var me = this;
	this.id = setInterval(function() {
		me.run();
	},time_ms);
};
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
var protean_display_Image = function(path) {
	display_PImage.call(this,path);
};
protean_display_Image.__super__ = display_PImage;
protean_display_Image.prototype = $extend(display_PImage.prototype,{
});
var protean_display_Shape = function() {
	display_PShape.call(this);
};
protean_display_Shape.__super__ = display_PShape;
protean_display_Shape.prototype = $extend(display_PShape.prototype,{
});
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
Global.id = "pixi";
Protean.id = "pixi";
Protean.root = "assets" + "/";
Test.main();
})();
