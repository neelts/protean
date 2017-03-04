package ;
import display.PContainer;
import lime.app.Config;
import openfl.display.Application;
import protean.Application.ApplicationSettings;
class PApplication extends PContainer {

	public var app:Application;

	public function new(settings:ApplicationSettings) {
		super();
		app = new Application();
		app.create({
			windows:[
				{
					element: settings.parentDOM, antialiasing: 0,
					background: settings.backgroundColor,
					width: 0, height: 0, x: 0, y: 0, resizable: true,
					hardware: true, stencilBuffer: true, display: 0, depthBuffer: false
				}
			]
		});
		app.exec();
		app.window.stage.addChild(this);
		onReady();
	}

	private function onReady():Void {}
}
