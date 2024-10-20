package screenshot;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.geom.Rectangle;
import openfl.geom.Matrix;
import flash.Lib;
import flash.display.Stage;

class ScreenshotForMarket {

	dynamic private static function logicResize(width:Int, height:Int) { };
	dynamic private static function logicInitialize() { };
	private static var screens:Array<Array<Dynamic>>=null;
	
	
	public static function addScreen (screen:Sprite, functionResize:Dynamic, functionInitialize:Dynamic) {
		if (screens==null) screens=new Array<Array<Dynamic>>();
				
		screens.push([screen, functionResize, functionInitialize]);
	}
	
	public static function removeScreens () {
		if (screens!=null) while (screens.length>0) screens.pop();
	}

	public static function saveCaptures() {
		if (screens==null) return;
		
		var captures:Array<Array<Dynamic>> = [["3.5-Inch 640x960", 640, 960],
									   ["4-Inch 640x1136", 640, 1136],
									   ["4-Inch 720x1280", 720, 1280],
									   ["Amazon 800x1280", 800, 1280],
									   ["4.7-Inch 750x1334", 750, 1334],
									   ["5.5-Inch 1242x2208", 1242, 2208],
									   ["Ipad 768x1024", 768, 1024]
									  ];
		for (sc in 0 ... screens.length) {
			var screen:Sprite=screens[sc][0];
			for (cp in 0 ... captures.length) {
				logicResize=screens[sc][1];
				logicResize(captures[cp][1], captures[cp][2]);
				logicInitialize=screens[sc][2];
				logicInitialize();
				
				Screenshot.capture(screen, new Rectangle(0, 0, captures[cp][1], captures[cp][2]), Std.string(sc)+"_"+captures[cp][0]);
			}
		}
	}
}