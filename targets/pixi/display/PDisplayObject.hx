package display;
import pixi.core.math.Point;
interface PDisplayObject { 
	public var x:Float;
	public var y:Float;
	public var position:Point;
	public var scale:Point;
	public var rotation:Float;	
	@:overload(function(?destroyTexture:Bool):Void {})
	public function destroy():Void;
}