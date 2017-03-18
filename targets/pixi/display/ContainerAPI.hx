package display;
class ContainerAPI {

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

	public static inline function remove<T:PContainer>(container:T, child:PDisplayObject, destroy:Bool = false):T {
		container.removeChild(cast child);
		if (destroy) child.destroy(true);
		return container;
	}
	
	public static inline function removes<T:PContainer>(container:T, childs:Array<PDisplayObject>, destroy:Bool = false):T {
		for (child in childs) {
			container.removeChild(cast child);
			if (destroy) child.destroy(true);
		}
		return container;
	}

	public static inline function removeAt<T:PContainer>(container:T, index:UInt = 0, destroy:Bool = false):T {
		if (destroy) {
			container.removeChildAt(index).destroy(true);
		} else {
			container.removeChildAt(index);
		}
		return container;
	}
	
	/*public static inline function removeChildAtIndex<T:PContainer>(container:T, child:PDisplayObject):T {}
	public static inline function getChilds<T:PContainer>(container:T, start = 0, end:Int = -1):Array<PDisplayObject> {}
	public static inline function getChildByName<T:PContainer>(container:T, name:String):PDisplayObject {}
	public static inline function getChildAtIndex<T:PContainer>(container:T, index:UInt):Array<PDisplayObject> {}
	public static inline function swapChilds<T:PContainer>(container:T, index:UInt):T {}*/
	
}
