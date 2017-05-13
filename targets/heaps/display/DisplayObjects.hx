package display;
class DisplayObjects {

	public static inline function addTo<T:PDisplayObject>(object:T, container:PContainer):T {
		container.addChild(cast object);
		return object;
	}
	
	public static inline function setX<T:PDisplayObject>(object:T, x:Float):T {
		object.x = x;
		return object;
	}

	public static inline function setY<T:PDisplayObject>(object:T, y:Float):T {
		object.y = y;
		return object;
	}

	public static inline function setXY<T:PDisplayObject>(object:T, x:Float, y:Float):T {
		object.x = x;
		object.y = y;
		return object;
	}

	public static inline function setScaleX<T:PDisplayObject>(object:T, scale:Float):T {
		object.scaleX = scale;
		return object;
	}

	public static inline function setScaleY<T:PDisplayObject>(object:T, scale:Float):T {
		object.scaleY = scale;
		return object;
	}
	
	public static inline function setScaling<T:PDisplayObject>(object:T, scale:Float):T {
		object.scaleX = scale;
		object.scaleY = scale;
		return object;
	}

	public static inline function setRotation<T:PDisplayObject>(object:T, rotation:Float):T {
		object.rotation = rotation;
		return object;
	}

	public static inline function getX(object:PDisplayObject):Float return object.x;
	public static inline function getY(object:PDisplayObject):Float return object.y;
	public static inline function getScaleX(object:PDisplayObject):Float return object.scaleX;
	public static inline function getScaleY(object:PDisplayObject):Float return object.scaleY;
	public static inline function getScaling(object:PDisplayObject):Float {
		return object.scaleX == object.scaleY ? object.scaleX : 0;
	}
	public static inline function getRotation(object:PDisplayObject):Float return object.rotation;
}
