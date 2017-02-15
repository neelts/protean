package ;
import haxe.macro.Context;
class Main {

	public static function main():Void {
		
	}

	macro public static function target() {
		var map = Context.getDefines();
		return macro $v{map.get("target")};
	}
	
}
