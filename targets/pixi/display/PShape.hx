package display;
import pixi.core.graphics.Graphics;

using protean.utils.Default;

class PShape extends Graphics implements PDisplayObject {
	
	public function new() {
		super();
	}

	override function lineStyle(?lineWidth:Float, ?color:Int, ?alpha:Float):Graphics {
		return super.lineStyle(lineWidth.check(1), color.check(0xff0000), alpha.check(1));
	}
}