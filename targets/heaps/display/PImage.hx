package display;
import hxd.res.Image;
import h2d.Bitmap;
import hxd.res.Loader;
class PImage extends Bitmap implements PDisplayObject {
	public function new(path:String) {
		var image:Image = Loader.currentInstance.load(path).toImage();
		super(image.toTile());
	}
}