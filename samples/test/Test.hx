package ;

import protean.display.Container;
import protean.display.Image;
import haxe.Timer;
import protean.display.Shape;
import js.Browser;
import protean.Application;

using display.DisplayObjectAPI;
using display.ShapeAPI;
#if pixi
using display.ContainerAPI;
#end

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
	private var c:Container;

	private function drawRect():Void {
		s = new Shape();
		s.style().rect(0, 0, 50, 50).setXY(200, 20).setScaling(2).setRotation(Math.PI / 4).addTo(this);
		Timer.delay(moves, 1000);
		i = new Image(Protean.id + ".png");
		i.setXY(300, 20);
		#if pixi
		c = new Container().insert(s).inserts([i], 0).remove(i).addTo(this);
		#end
		i.addTo(this);
		//trace([s.getX(), s.getY(), s.getScaleX(), s.getScaleY(), s.getScaling(), s.getRotation()]);
	}

	private function moves():Void {
		trace(Global.id);
		s.setX(100);
	}
	
	public static function main():Void {
		new Test();
	}
}