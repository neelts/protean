package ;
import display.PContainer;
import protean.Application.ApplicationSettings;
extern class PApplication extends PContainer {
	public var stage:Stage;
	public function new(settings:ApplicationSettings):Void;
}

typedef Stage = {
	function addChild():Void;
}
