package ;
import haxe.macro.Context;
class Protean {

	public static var id:String = target();
	public static var root:String = assetsRoot() + "/";

	macro public static function target() {
		var map = Context.getDefines();
		return macro $v{map.get("target")};
	}

	macro public static function assetsRoot() {
		var map = Context.getDefines();
		return macro $v{map.get("assetsRoot")};
	}
}