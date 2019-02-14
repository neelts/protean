package display;
import haxe.extern.EitherType;
import pixi.core.display.DisplayObject.DestroyOptions;
import pixi.core.math.Point;
interface PDisplayObject { 
	public var x:Float;
	public var y:Float;
	public var position:Point;
	public var scale:Point;
	public var rotation:Float;
	function destroy(?options:EitherType<Bool, DestroyOptions>):Void;
}