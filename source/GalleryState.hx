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
	var images:Array<String> = ["pic1", "pic2"];
	var titlesImg:Array<String> = ["This is test for title", "This is test for title 2 WOW"];
	var descriptions:Array<String> = ["This is test for desc", "This is test for desc 2 WOW"];
	var imageSelected:Float = 0;
	var imageDisplaying:Float = 0;
	var displayImage:FlxSprite;
	var selectedSomethin:Bool = false;
	var zoomValue:Float = 1;
	var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
	var descText:FlxText;
    var titleTxt:FlxText;
	
	override public function create():Void
	{
		add(bg);
		add(displayImage);

		displayImage.antialiasing = true;
		displayImage.screenCenter();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		
		descText = new FlxText(50, -100, FlxG.width - 100, descriptions[imageSelected]);
        descText.setFormat(null, 25, 0xffffff, "center");
        descText.screenCenter();
        descText.y += 265;
        descText.setFormat(Paths.font("vcr.ttf"), 32);
        add(descText);

        titleTxt = new FlxText(50, 50, FlxG.width - 100, titleImg[imageSelected]);
        titleTxt.screenCenter(X);
        titleTxt.setFormat(null, 40, 0xffffff, "center");
        titleTxt.setFormat(Paths.font("vcr.ttf"), 32);
        add(titleTxt);
	}


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
				MusicBeatState.switchState(new MainMenuState());
			}
			if (controls.UI_UP)
			{	
				zoomValue += 0.5;
				displayImage.scale.set(1 * zoomValue, 1 * zoomValue);
			}
			if (controls.UI_DOWN)
			{
				zoomValue += 0.5;
				displayImage.scale.set(1 * zoomValue, 1 * zoomValue);
			}
			if (controls.UI_LEFT)
			{	
				if (imageSelected != 0)
				{
					imageSelected -= 1;
					FlxG.sound.play(Paths.sound("scrollMenu"));
				}
			}
			if (controls.UI_RIGHT)
			{
				if (imageSelected != images.length)
				{
					imageSelected += 1;
					FlxG.sound.play(Paths.sound("scrollMenu"));
				}
			}
		}
	}
}
