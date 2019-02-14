package ;
import display.PContainer;
import openfl.display.Application;
import protean.Application.ApplicationSettings;
class PApplication extends PContainer {

	public var app:Application;

	public function new(settings:ApplicationSettings) {
		super();
		app = new Application();
		app.createWindow({
			context:{
				antialiasing: 0,
				background: settings.backgroundColor,
				depth: false,
				stencil: true,
				hardware: true,
			},
			element: settings.parentDOM,
			width: 0, height: 0, x: 0, y: 0, resizable: true
		});
		app.exec();
		app.window.stage.addChild(this);
		onReady();
	}

	private function onReady():Void {}
}
