package screenshot;

import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.display.Stage;
import flash.display.Sprite;
import openfl.geom.Rectangle;
import flash.geom.Rectangle;
import flash.utils.ByteArray;
import openfl.geom.Matrix;
import flash.Lib;
import flash.display.Stage;
import backend.PNGEncoder;
import haxe.io.Path;

class Screenshot {

	public static function capture(screen:Sprite=null, surface:Rectangle=null, fileName:String="screenshot", codeImg:String="png") {
		var screen = Lib.current.stage; //Lib.current.stage.stageWidth; Lib.current.stage.stageHeight;
		var surface:Rectangle = new Rectangle(0, 0, Lib.current.stage.stageWidth, Lib.current.stage.stageHeight);
		
		saveTmpFileToDisk(screen, surface, fileName, codeImg);
	}

	private static function saveTmpFileToDisk(sp:Dynamic, position:Rectangle, file:String, codeImg:String="png") {
	#if !html5
		// Making a BitmapData from the Sprite
		var image:BitmapData = new BitmapData( Std.int( position.width ), Std.int( position.height ), false, 0xFEFEFE);
		var matrix:Matrix = new Matrix();
		matrix.translate(-position.x, -position.y);
		position.x=0; position.y=0;
		image.draw(sp, matrix, position, false);

		var path:String = file + "." + codeImg;
		var fileStr:String = "screenshots/";
		
		var b:ByteArray = PNGEncoder.encode(image);
		var fo:sys.io.FileOutput = sys.io.File.write(fileStr + path, true);
		//fo.writeString(b.toString());
		//fo.close();

		
		// Saving the bitmapData
		/*var byteArray:ByteArray = PNGEncoder.encode(image);

		var file:File = File.desktopDirectory.resolve(fileName+"."+codeImg);
		var fileStream:FileStream = new FileStream();
		fileStream.open(file, FileMode.WRITE);
		fileStream.writeBytes(byteArray);
		fileStream.close();*/
	#end
	}
}