package ;

import haxe.Timer;
import protean.display.DisplayObject;
import js.html.KeyboardEvent;
import js.Browser;
import js.html.MouseEvent;
import protean.Application;
import protean.display.Container;
import protean.display.Shape;

using display.DisplayObjects;
using display.Shapes;
using display.Containers;

class Fractals extends Application {

	private static var I:Int = 1000;
	
	public function new() {
		super({ 
			parentDOM:Browser.document.getElementById(Protean.id), backgroundColor:0
		});
	}

	private var current:Container;

	override private function onReady():Void {
		trace("!!!");
		current = this;
		Browser.document.addEventListener("click", onClick);
		Browser.document.addEventListener("keyup", onKeyUp);
	}

	private function onKeyUp(e:KeyboardEvent):Void {
		if (e.keyCode == 13) build();
	}

	private function build():Void {
		var cs:Array<Container> = [];
		for (i in 0...current.getCount()) {
			var cc:DisplayObject = current.getAt(i);
			if (Std.is(cc, Container)) cs.push(cast cc);
		}
		trace(cs);
		var qe:Array<Container> = [];
		qe = cs.copy();
		while (qe.length > 0) {
			var c:Container = qe.pop();
			for (s in cs) if (I-- > 0) qe.unshift(
				getFigure().setXY(
					s.getX(), s.getY()
				).setScaling(s.getScaling()).setRotation(s.getRotation()).addTo(c)
			);
		}
	}

	private function onClick(e:MouseEvent):Void {
		var f:Container = getFigure().addTo(current);
		if (current == this) {
			f.setXY(e.clientX, e.clientY);
			current = f;
		} else {
			f.setXY(e.clientX - current.getX(), e.clientY - current.getY()).setScaling(0.7);
		}
	}

	private function getFigure():Container {
		return new Figure();
	}
	
	public static function main():Void {
		new Fractals();
	}
}

class Figure extends Container {

	public function new() {
		super();
		var s:Shape = new Shape();
		s.style(10).fillStart(0).rect(-200, -200, 400, 400).setScaling(Math.random() * .3 + .3);
		this.insert(s).setRotation(Math.PI * Math.random());
		new Timer(100).run = update;
	}

	private function update():Void {
		this.setRotation(this.getRotation() + .05);
	}
	
}