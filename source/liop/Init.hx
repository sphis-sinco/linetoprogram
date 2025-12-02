package liop;

import liop.backend.PackManager;
import liop.backend.LiopAssetManager;
import flixel.FlxState;

class Init extends FlxState
{
	override public function create()
	{
		super.create();

		PackManager.getAllPacks();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
