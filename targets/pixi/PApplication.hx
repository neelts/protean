package ;
import js.Browser;
import js.html.Element;
import js.html.CanvasElement;
import js.html.Event;
import display.PContainer;
import pixi.plugins.app.Application;
import protean.Application.ApplicationSettings;
class PApplication extends PContainer {
	
	private static inline var RENDERER_TYPE_AUTO:String = "auto";
	
	private var app:PTApplication;

	public function new(settings:ApplicationSettings) {
		super();
		app = new PTApplication();
		app.backgroundColor = settings.backgroundColor;
		app.start(RENDERER_TYPE_AUTO, settings.parentDOM, settings.canvas);
		app.stage.addChild(this);
		onReady();
	}

	private function onReady():Void {
		
	}
}

class PTApplication extends Application {

	public function new() {
		super();
	}

	override public function start(?rendererType:String = "auto", ?parentDom:Element, ?canvasElement:CanvasElement) {
		super.start(rendererType, parentDom, canvasElement);
		_onWindowResize(null);
		Browser.window.onload = _onWindowResize;
	}

	override function _onWindowResize(event:Event) {
		width = canvas.parentElement.clientWidth;
		height = canvas.parentElement.clientHeight;
		app.renderer.resize(width, height);
		canvas.style.width = width + "px";
		canvas.style.height = height + "px";
		if (onResize != null) onResize();
	}

}