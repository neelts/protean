package display;
import hxd.res.Any;
import haxe.io.Bytes;
import hxd.net.BinaryLoader;
import h2d.Bitmap;
class PImage extends Bitmap implements PDisplayObject {

	public function new(path:String) {
		var loader = new BinaryLoader(Protean.root + path);
		loader.onLoaded = function(data:Bytes) {
			tile = Any.fromBytes(path, data).toImage().toTile();
			visible = true;
		};
		loader.load();
		super(null);
		visible = false;
	}
}