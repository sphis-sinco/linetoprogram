package liop;

import liop.backend.LiopAssetManager;
import flixel.FlxState;

class Init extends FlxState
{
	override public function create()
	{
		super.create();

		LiopAssetManager.getAllPacks();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
