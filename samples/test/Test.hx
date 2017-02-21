package ;

import protean.display.Image;
import haxe.Timer;
import protean.display.Shape;
import js.Browser;
import protean.Application;

using display.DisplayObjectAPI;
using display.ShapeAPI;

class Test extends Application {
	
	public function new() {
		super({ 
			parentDOM:Browser.document.getElementById(Protean.id), backgroundColor:0
		});
	}

	override private function onReady():Void {
		drawRect();
	}

	private var s:Shape;
	private var i:Image;

	private function drawRect():Void {
		s = new Shape();
		s.style().rect(0, 0, 50, 50).setXY(200, 20).setScale(2).setRotation(Math.PI / 4).addTo(this);
		Timer.delay(moves, 1000);
		i = new Image(Protean.id + ".png");
		i.setXY(300, 20).addTo(this);
	}

	private function moves():Void {
		trace(Global.id);
		s.setX(100);
	}
	
	public static function main():Void {
		new Test();
	}
}