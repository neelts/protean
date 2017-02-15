package ;
import haxe.macro.Context;
class Global {
	
	public static var id:String = target();

	macro public static function target() {
		var map = Context.getDefines();
		return macro $v{map.get("target")};
	}
}
