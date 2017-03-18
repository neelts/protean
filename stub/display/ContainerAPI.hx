package display;
class ContainerAPI {
	public static inline function insert(container:PContainer, child:PDisplayObject, index:UInt = 0):PContainer {}
	public static inline function inserts(container:PContainer, childs:Array<PDisplayObject>, index:UInt = 0):PContainer {}
	public static inline function remove(container:PContainer, child:PDisplayObject, destroy:Bool = false):PContainer {}
	public static inline function removes(container:PContainer, childs:Array<PDisplayObject>, destroy:Bool = false):PContainer {}
	public static inline function removeAt(container:PContainer, index:UInt = 0, destroy:Bool = false):PContainer {}
	public static inline function get(container:PContainer, start = 0, end:Int = -1):Array<PDisplayObject> {}
	public static inline function getByName(container:PContainer, name:String):PDisplayObject {}
	public static inline function getAt(container:PContainer, index:UInt):Array<PDisplayObject> {}
	public static inline function swap(container:PContainer, index:UInt):Array<PDisplayObject> {}
}