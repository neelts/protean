package protean;
import Protean;
#if js
import js.html.CanvasElement;
import js.html.Element;
#end
class Application extends PApplication {
	public function new(options:ApplicationSettings) {
		#if js
		haxe.Log.trace = Protean.routeTrace;
		#end
		super(options);
	}
}

typedef ApplicationSettings = {
	@:optional var backgroundColor:Int;
	#if js
	@:optional var parentDOM:Element;
	@:optional var canvas:CanvasElement;
	#end
};