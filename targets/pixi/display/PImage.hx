package display;

import Protean;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
class PImage extends Sprite implements PDisplayObject {
	public function new(path:String) {
		super(Texture.fromImage(Protean.root + path));
	}
}