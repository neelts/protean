package display;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.PixelSnapping;
class PImage extends Bitmap implements PDisplayObject {
	public function new(path:String) {
		super(null, PixelSnapping.AUTO, true);
		BitmapData.loadFromFile(Protean.root + path).onComplete(function(b:BitmapData) bitmapData = b);
	}
}