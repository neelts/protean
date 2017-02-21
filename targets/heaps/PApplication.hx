package ;
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
		hxd.System.start(started);
	}

	private function started():Void {
		hxd.Res.initEmbed();
		app = new PApp(init);
	}

	private function init() {
		app.engine.autoResize = false;
		app.s2d.addChild(this);
		Browser.window.onresize = onResize;
		onResize();
		onReady();
	}

	private function onReady():Void {}

	private function onResize() {
		var width = canvas.parentElement.clientWidth;
		var height = canvas.parentElement.clientHeight;
		canvas.style.width = width + "px";
		canvas.style.height = height + "px";
		app.engine.resize(width, height);
	}

}

class PApp extends App {

	private var inits:Void->Void;

	public function new(inits:Void->Void) {
		this.inits = inits;
		super();
	}

	override function init() {
		inits();
		inits = null;
	}
}