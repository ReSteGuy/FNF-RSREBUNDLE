package;

#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import options.GraphicsSettingsSubState;
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.Assets;

class GalleryState extends MusicBeatState
{
	var images:Array<String> = [];
	var descriptions:Array<String> = [];
	var imageSelected:Float = 0;
	var imageDisplaying:Float = 0;
	var displayImage:FlxSprite;
	var selectedSomethin:Bool = false;
	var zoomValue:Float = 1;
	displayImage.antialiasing = ClientPrefs.globalAntialiasing;
	displayImage:screenCenter();

	var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
	bg.screenCenter();
	bg.antialiasing = ClientPrefs.globalAntialiasing;
	add(bg);

	function update(elapsed:Float)
	{	
		
		if (imageDisplaying != imageSelected)
		{
			displayImage.loadGraphic(Paths.image("gallery/" + images[imageSelected]));
			imageDisplaying = imageSelected;
		}
		if (!selectedSomethin)
		{
			if (controls.BACK)
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new ModsMenuState());
			}
			if (controls.UI_UP)
			{	
				zoomValue += 0.5;
				displayImage.scale.set(1 * zoomValue, 1 * zoomValue)
			}
			if (controls.UI_DOWN)
			{
				zoomValue += 0.5;
				displayImage.scale.set(1 * zoomValue, 1 * zoomValue)
			}
			if (controls.UI_LEFT)
			{	
				if (imageSelected != 0)
				{
					imageSelected -= 1;
				}
			}
			if (controls.UI_RIGHT)
			{
				if (imageSelected != images.length)
				{
					imageSelected += 1;
				}
			}
		}
	}
}
