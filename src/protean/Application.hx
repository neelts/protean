package protean;
import js.html.CanvasElement;
import js.html.Element;
class Application extends PApplication {

	public function new(options:ApplicationSettings) {
		super(options);
	}
}

typedef ApplicationSettings = {
	@:optional var backgroundColor:Int;
	@:optional var parentDOM:Element;
	@:optional var canvas:CanvasElement;
};