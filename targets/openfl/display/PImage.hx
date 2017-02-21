package display;
import openfl.display.BitmapData;
import openfl.display.PixelSnapping;
import openfl.Assets;
import openfl.display.Bitmap;
class PImage extends Bitmap implements PDisplayObject {
	public function new(path:String) {
		super(null, PixelSnapping.AUTO, true);
		Assets.loadBitmapData(Protean.root + path, true, function (b:BitmapData) {
			trace("!!!");
			bitmapData = b;
		});
	}
}