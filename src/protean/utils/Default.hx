package protean.utils;
class Default {

	public static inline function check<T>(value:Null<T>, defaultValue:T):T {
		return value == null ? defaultValue : value;
	}
	
}
