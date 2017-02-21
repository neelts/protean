package display;
import h2d.Bitmap;
import hxd.res.Loader;
class PImage extends Bitmap implements PDisplayObject {
	public function new(path:String) {
		super(Loader.currentInstance.load(path).toImage().toTile());
	}
}