package display;
class Shapes {
	public static inline function style(shape:PShape, size:Float = 1, color:Int = 0xff0000, alpha:Float = 1):PShape {
		shape.lineStyle(size, color, alpha);
		return shape;
	}
	public static inline function rect(shape:PShape, x:Float, y:Float, width:Float, height:Float):PShape {
		shape.drawRect(x, y, width, height);
		return shape;
	}
}