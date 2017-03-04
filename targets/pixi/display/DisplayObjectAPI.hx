package display;
class DisplayObjectAPI {

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
		object.position.set(x, y);
		return object;
	}

	public static inline function setScaleX<T:PDisplayObject>(object:T, scale:Float):T {
		object.scale.x = scale;
		return object;
	}
	
	public static inline function setScaleY<T:PDisplayObject>(object:T, scale:Float):T {
		object.scale.y = scale;
		return object;
	}
	
	public static inline function setScaling<T:PDisplayObject>(object:T, scale:Float):T {
		object.scale.set(scale, scale);
		return object;
	}

	public static inline function setRotation<T:PDisplayObject>(object:T, rotation:Float):T {
		object.rotation = rotation;
		return object;
	}
}
