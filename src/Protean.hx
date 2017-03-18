package ;
import haxe.PosInfos;
#if (!macro && js)
import js.Browser;
#end
import haxe.macro.Context;
class Protean {
	
	public static function routeTrace(v:Dynamic, ?infos:PosInfos):Void {
		#if (!macro && js) 
		Browser.console.log(infos.className + "." + infos.methodName + ":" + infos.lineNumber + ":");
		Browser.console.log(v);
		#end
	}
	
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