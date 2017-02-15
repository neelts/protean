package {

	import com.xtdstudios.DMT.persistency.IAssetsGroupPersistencyManager;
	import com.xtdstudios.DMT.persistency.IByteArrayPersistencyManager;
	import com.xtdstudios.DMT.persistency.impl.AssetGroupToFilePersistencyManagerFactory;
	import com.xtdstudios.DMT.persistency.impl.ByteArrayToFilePersistencyManagerFactory;

	import fl.motion.Color;
	import flash.display.DisplayObject;
	import flash.display.IGraphicsData;
	import flash.display.GraphicsSolidFill;
	import flash.display.GraphicsEndFill;
	import flash.display.GraphicsPath;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.display.BlendMode;
	import flash.display.BitmapData;
	import flash.display.IBitmapDrawable;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.filesystem.FileMode;
	import flash.desktop.NativeApplication;
	import com.xtdstudios.DMT.DMTBasic;

	import flash.utils.getQualifiedClassName;

	public class Export extends MovieClip {

		private static const EXPORT:String = "Export";
		private static const ASSETS:String = "assets";

		private static const BLEND_MODES:Object = {
			normal:         0,
			add:            1,
			multiply:       2,
			screen:         3,
			overlay:        4,
			darken:         5,
			lighten:        6,
			colorDodge:	    7,
			colorBurn:	    8,
			hardLight: 	    9,
			softLight:	    10,
			difference:     11,
			erase:		    12,
			hue:            13,
			saturation:     14,
			color:          15,
			luminosity:     16
		}

		private var _export:MovieClip;
		private var _atlases:MovieClip;

		private var _assets:MovieClip;

		// supported values: 0 - half scale, 1...Infinity - scale
		protected var scales:Vector.<uint> = new <uint>[1];

		private var assetsDir:String;

		public function Export() {
			super();
			init();
		}

		protected function init():void {
			_export = MovieClip(getChildByName("export"));
			_atlases = MovieClip(getChildByName("atlases"));
			_assets = MovieClip(_atlases.getChildByName(ASSETS));
			if (!_assets) _assets = new MovieClip();
			exportUI();
			exportAtlases();
		}

		private var map:Object;

		private function exportUI() {
			map = {};
			var s = [];
			var o;
			for (var i:uint = 0; i < _export.numChildren; i++) {
				o = get(_export.getChildAt(i));
				map[o.i] = o;
				o.x = o.y = 0;
				s.push(o);
			}
			var fs:FileStream = new FileStream();
			assetsDir = new File("app:/").nativePath.replace("src\\", "bin\\");
			fs.open(new File(assetsDir + "/ui.json"), FileMode.WRITE);
			fs.writeUTFBytes(JSON.stringify(s));
			fs.close();
		}

		private var atlasCount:uint;

		private function exportAtlases():void {
			var atlas:MovieClip;
			atlasCount = _atlases.numChildren;
			var tpm:IByteArrayPersistencyManager = ByteArrayToFilePersistencyManagerFactory.generate(assetsDir);
			var apm:IAssetsGroupPersistencyManager = AssetGroupToFilePersistencyManagerFactory.generate(EXPORT, assetsDir);
			var s:Number = scales.pop();
			var scale:String = (s == 1 ? "" : "@" + (s > 0 ? s + "x" : "h"));
			for (var i:uint = 0; i < atlasCount; i++) {
				atlas = _atlases.getChildAt(i) as MovieClip;
				var dmt:DMTBasic = new DMTBasic(atlas.name + scale, true, EXPORT, tpm, apm);
				var child:DisplayObject;
				for (var j:uint = 0; j < atlas.numChildren; j++) {
					child = atlas.getChildAt(j);
					child.scaleX = child.scaleY = s;
					dmt.addItemToRaster(child);
				}
				dmt.addEventListener(Event.COMPLETE, checkExport);
				dmt.process(true, -1, true);
			}
		}

		private function checkExport(event:Event):void {
			if (atlasCount) atlasCount--;
			if (!atlasCount) {
				if (scales.length) {
					exportAtlases();
				} else {
					exit();
				}
			}
		}

		private function exit():void {
			trace(">>> Exported");
			NativeApplication.nativeApplication.exit();
		}

		private function getClass(c:Object):String {
			var i = getQualifiedClassName(c).replace("::", ".");
			return i == "MovieClip" ? c.name.charAt(0).toUpperCase() + c.name.slice(1) : i;
		}

		private function getSpriteProps(c:DisplayObject, r:Rectangle = null):Object {
			var r:Rectangle = r ? r : c.getBounds(c);
			var p:Object = { x:-r.x, y:-r.y, c:0, a:c.alpha, b:0 };
			if (c.transform.colorTransform) p.c = c.transform.colorTransform.color;
			if (c.blendMode != BlendMode.LAYER && c.blendMode != BlendMode.NORMAL) p.b = BLEND_MODES[c.blendMode];
			return p;
		}

		private function getMeshProps(c:DisplayObject):Object {
			var r:Rectangle = c.getBounds(c);
			var p:Object = getSpriteProps(c, r);
			p.g = getScaleGrid(c, r);
			return p;
		}

		private function getScaleGrid(c:DisplayObject, r:Rectangle):Object {
			var g:Rectangle = c.scale9Grid;
			return {
				l:Math.round(g.left), r:Math.round(r.width - g.right),
				t:Math.round(g.top), b:Math.round(r.height - g.bottom)
			};
		}

		private function get(c:Object):Object {

			var s = {};
			if (c.hasOwnProperty('numChildren')) {
				if (c.totalFrames > 1) {
					s.t = 'movieclip';
					s.i = getClass(c);
					s.m = {l: c.totalFrames};
				} else if (c.blendMode == BlendMode.LAYER) {
					s.t = 'shape';
					s.s = {g: getShape(c)};
				} else if (c.numChildren == 1 && (!c.cacheAsBitmap || (c.filters && c.filters.length))) {
					s.t = c.scale9Grid ? 'mesh' : 'sprite';
					s.i = getClass(c);
					s.b = c.scale9Grid ? getMeshProps(DisplayObject(c)) : getSpriteProps(DisplayObject(c));
				} else {
					s.t = 'container';
					s.i = getClass(c);
					if (!map[s.i]) {
						s.c = [];
						for (var i = 0; i < c.numChildren; i++) {
							s.c.push(get(c.getChildAt(i)));
						}
					}
				}
			} else if (c is TextField) {
				s.t = c.type == TextFieldType.INPUT ? 'plainText' : 'text';
				var f:TextFormat = c.defaultTextFormat;
				if (c.type == TextFieldType.DYNAMIC && f.font.indexOf("_") != -1 && f.font.split("_").length > 1) {
					f.font = f.font.split("_").slice(0, 2).join("_");
				}
				trace(f.font);
				s.p = {
					t: c.text, c: f.color, s: f.size, a: f.align, w: c.width, b: f.bold, i: f.italic,
					f: c.type == TextFieldType.DYNAMIC ? f.font.split(" ").join("") : f.font
				};
			}

			s.n = c.name.indexOf("instance") == -1 ? (c.name.charAt(0).toLowerCase() + c.name.slice(1)) : null;
			s.x = c.x;
			s.y = c.y;
			s.sx = c.scaleX;
			s.sy = c.scaleY;
			s.r = c.rotation;

			return s;
		}

		private function getShape(c):Array {
			var s:Shape;
			var g:Array = [];
			var d:Vector.<IGraphicsData>;
			for (var i:uint = 0; i < c.numChildren; i++) {
				s = c.getChildAt(i) as Shape;
				if (s) {
					d = s.graphics.readGraphicsData();
					for each (var o in d) {
						switch (true) {
							case o is GraphicsSolidFill:
								g.push({i: 0, f: o.color, a: o.alpha});
								break;
							case o is GraphicsPath:
								g.push({i: 1, c: o.commands, d: o.data});
								break;
							case o is GraphicsEndFill:
								g.push({i: 2});
								break;
						}
					}
				}
			}
			return g;
		}
	}
}