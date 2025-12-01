package liop.backend;

import lime.app.Application;
import sys.io.File;
import haxe.Json;
import sys.FileSystem;

class LiopAssetManager
{
	public static var ASSET_PACKS:Array<String> = [];
	public static var ENABLED_ASSET_PACKS:Array<String> = [];

	public static var PACK_FILENAME:String = 'pack.json';

	public static function getAllPacks()
	{
		ASSET_PACKS = [];
		ENABLED_ASSET_PACKS = [];

		for (pack in FileSystem.readDirectory('assets/'))
		{
			var parsed_pack_file:PackFile = getPackFile(pack);

			if (parsed_pack_file == null)
				continue;

			var missing_field = function(field:String)
			{
				Application.current.window.alert('Your asset pack is missing what is deemed as an important field: ' + field,
					'Missing Asset Pack Field: ' + field);
			}

			if (parsed_pack_file.api_version == null)
			{
				missing_field('api_version');
				continue;
			}
			if (parsed_pack_file.name == null)
			{
				missing_field('name');
				continue;
			}

			ASSET_PACKS.push(pack);
			ENABLED_ASSET_PACKS.push(pack);

			trace('Successfully parsed pack: ' + pack);
		}
	}

	public static function getPackFile(pack:String):PackFile
	{
		if (!FileSystem.isDirectory('assets/' + pack))
			return null;

		var pack_file:String = 'assets/' + pack + '/' + PACK_FILENAME;

		if (FileSystem.exists(pack_file))
		{
			var parsed_pack_file:PackFile = null;
			try
			{
				parsed_pack_file = getJSONText(pack_file);
			}
			catch (e)
			{
				trace(e);
			}

			return parsed_pack_file;
		}
		else
		{
			trace('Pack file doesn\'t exist: ' + pack_file);
		}

		return null;
	}

	public static function getText(file:String):String
	{
		return File.getContent(file);
	}

	public static function getJSONText(file:String):Dynamic
	{
		return Json.parse(getText(file));
	}
}
