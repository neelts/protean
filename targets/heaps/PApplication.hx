package ;
import h3d.Engine;
import hxd.Stage;
import display.PContainer;
import hxd.App;
import js.Browser;
import js.html.CanvasElement;
import protean.Application.ApplicationSettings;
class PApplication extends PContainer {
	
	private var app:App;
	private var canvas:CanvasElement;
	
	public function new(settings:ApplicationSettings) {
		super();
		canvas = Browser.document.createCanvasElement();
		canvas.id = "webgl";
		settings.parentDOM.appendChild(canvas);
		Browser.window.onresize = onResize;
		onResize();
		hxd.System.start(function() {
			app = new PApp(init);
		});
	}

	private function init() {
		app.s2d.addChild(this);
		onReady();
	}
	
	private function onReady():Void {
		
	}

	private function onResize() {
		canvas.style.width = canvas.parentElement.clientWidth + "px";
		canvas.style.height = canvas.parentElement.clientHeight + "px";
	}

}

class PApp extends App {

	private var inits:Void->Void;
	
	public function new(inits:Void->Void) {
		this.inits = inits;
		super(new PEngine());
	}

	override function init() {
		inits();
		inits = null;
	}
}

class PEngine extends Engine {

	@:access(hxd.Stage)
	public function new() {
		super();
	}

	override public function resize(width, height) {
		/*super.resize(
			Math.round(width / Browser.window.devicePixelRatio), 
			Math.round(height / Browser.window.devicePixelRatio)
		);*/
		super.resize(width, height);
	}

}