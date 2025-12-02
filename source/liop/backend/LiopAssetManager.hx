package liop.backend;

import sys.io.File;
import haxe.Json;

class LiopAssetManager
{
	public static function getText(file:String):String
	{
		return File.getContent(file);
	}

	public static function getJSONText(file:String):Dynamic
	{
		return Json.parse(getText(file));
	}
}
