package display;
class DisplayObjectAPI {

	public static inline function addTo(object:PDisplayObject, container:PContainer):PDisplayObject {
		container.addChild(cast object);
		return object;
	}
	
	public static inline function setX(object:PDisplayObject, x:Float):PDisplayObject {
		object.x = x;
		return object;
	}

	public static inline function setY(object:PDisplayObject, y:Float):PDisplayObject {
		object.y = y;
		return object;
	}

	public static inline function setXY(object:PDisplayObject, x:Float, y:Float):PDisplayObject {
		object.x = x;
		object.y = y;
		return object;
	}

	public static inline function setScale(object:PDisplayObject, scale:Float):PDisplayObject {
		object.scaleX = object.scaleY = scale;
		return object;
	}

	public static inline function setRotation(object:PDisplayObject, rotation:Float):PDisplayObject {
		object.rotation = rotation;
		return object;
	}
}
