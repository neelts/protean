package display;
class Containers {

	public static inline function insert<T:PContainer>(container:T, child:PDisplayObject, index:Int = -1):T {
		if (index < 0) {
			container.addChild(cast child);
		} else {
			container.addChildAt(cast child, index);
		}
		return container;
	}

	public static inline function inserts<T:PContainer>(container:T, childs:Array<PDisplayObject>, index:Int = -1):T {
		if (index < 0) {
			for (child in childs) container.addChild(cast child);
		} else {
			for (child in childs) container.addChildAt(cast child, index++);
		}
		return container;
	}

	public static inline function delete<T:PContainer>(container:T, child:PDisplayObject, destroy:Bool = false):T {
		container.removeChild(cast child);
		return container;
	}

	public static inline function deletes<T:PContainer>(container:T, childs:Array<PDisplayObject>, destroy:Bool = false):T {
		for (child in childs) container.removeChild(cast child);
		return container;
	}

	public static inline function removeAt<T:PContainer>(container:T, index:UInt = 0, destroy:Bool = false):T {
		container.removeChildAt(index);
		return container;
	}

	public static inline function get<T:PContainer>(container:T, start = 0, end:Int = -1):Array<PDisplayObject> {
		var childs:Array<PDisplayObject> = [];
		if (end < 0) end = container.numChildren;
		for (i in start...end) childs.push(cast container.getChildAt(i));
		return childs;
	}

	public static inline function getByName<T:PContainer>(container:T, name:String):PDisplayObject {
		return cast container.getChildByName(name);
	}

	public static inline function getAt<T:PContainer>(container:T, index:UInt):PDisplayObject {
		return cast container.getChildAt(index);
	}

}
