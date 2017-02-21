package display;
class DisplayObjectAPI {
	public static inline function addTo<T>(object:T, container:PContainer):T {}
	public static inline function setX(object:PDisplayObject, y:Float):PDisplayObject {}
	public static inline function setY(object:PDisplayObject, x:Float):PDisplayObject {}
	public static inline function setXY(object:PDisplayObject, x:Float, y:Float):PDisplayObject {}
	public static inline function setScale(object:PDisplayObject, value:Float):PDisplayObject {}
	public static inline function setRotation(object:PDisplayObject, value:Float):PDisplayObject {}
}