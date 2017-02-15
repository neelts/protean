package display;
import openfl.display.Shape;

class PShape extends Shape implements PDisplayObject {

	public function new() {
		super();
	}

	public inline function lineStyle(lineWidth:Float = 1, color:Int = 0xff0000, alpha:Float = 1):PShape {
		graphics.lineStyle(lineWidth, color, alpha);
		return this;
	}
	public inline function drawRect(x:Float, y:Float, width:Float, height:Float):PShape {
		graphics.drawRect(x, y, width, height);
		return this;
	}
}