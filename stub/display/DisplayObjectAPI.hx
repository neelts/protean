package display;
class DisplayObjectAPI {
	public static inline function addTo(object:PDisplayObject, container:PContainer):PDisplayObject {}
	public static inline function setX(object:PDisplayObject, y:Float):PDisplayObject {}
	public static inline function setY(object:PDisplayObject, x:Float):PDisplayObject {}
	public static inline function setXY(object:PDisplayObject, x:Float, y:Float):PDisplayObject {}
	public static inline function setScaleX(object:PDisplayObject, value:Float):PDisplayObject {}
	public static inline function setScaleY(object:PDisplayObject, value:Float):PDisplayObject {}
	public static inline function setScaling(object:PDisplayObject, value:Float):PDisplayObject {}
	public static inline function setRotation(object:PDisplayObject, value:Float):PDisplayObject {}
	public static inline function getX(object:PDisplayObject):Float {}
	public static inline function getY(object:PDisplayObject):Float {}
	public static inline function getScaleX(object:PDisplayObject):Float {}
	public static inline function getScaleY(object:PDisplayObject):Float {}
	public static inline function getScaling(object:PDisplayObject):Float {}
	public static inline function getRotation(object:PDisplayObject):Float {}
}