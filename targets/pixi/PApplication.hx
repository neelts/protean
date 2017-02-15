package ;
import display.PContainer;
import pixi.plugins.app.Application;
import protean.Application.ApplicationSettings;
class PApplication extends PContainer {
	
	private static inline var RENDERER_TYPE_AUTO:String = "auto";
	
	private var app:Application;

	public function new(settings:ApplicationSettings) {
		super();
		app = new Application();
		app.backgroundColor = settings.backgroundColor;
		app.start(RENDERER_TYPE_AUTO, settings.parentDOM, settings.canvas);
		app.stage.addChild(this);
		onReady();
	}

	private function onReady():Void {
		
	}
}