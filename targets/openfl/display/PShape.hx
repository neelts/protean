package display;
import openfl.display.JointStyle;
import openfl.display.CapsStyle;
import openfl.display.Shape;

class PShape extends Shape implements PDisplayObject {

	public function new() {
		super();
	}

	public inline function beginFill(color:Int = 0xff0000, alpha:Float = 1):PShape {
		graphics.beginFill(color, alpha);
		return this;
	}

	public inline function endFill():PShape {
		graphics.endFill();
		return this;
	}

	public inline function lineStyle(lineWidth:Float = 1, color:Int = 0xff0000, alpha:Float = 1):PShape {
		graphics.lineStyle(lineWidth, color, alpha, null, null, CapsStyle.NONE, JointStyle.MITER);
		return this;
	}

	public inline function drawRect(x:Float, y:Float, width:Float, height:Float):PShape {
		graphics.drawRect(x, y, width, height);
		return this;
	}
}