package;

import flixel.*;
import flixel.FlxSprite;
import flixel.text.FlxText;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import flixel.math.FlxMath;
import sys.FileSystem;
import flixel.addons.ui.FlxInputText;

class Gallery extends MusicBeatState
{
    var itemGroup:FlxTypedGroup<GalleryImage>;
    var imagePaths:Array<String>;
    var imageDescriptions:Array<String>;
    var imageTitle:Array<String>;
    var currentIndex:Int = 0;
    var descriptionText:FlxText;
    var titleText:FlxText;
    var background:FlxSprite;
    var imageSprite:FlxSprite;
    var bg:FlxSprite;

    override public function create():Void
    {
        // Set up background
        background = new FlxSprite(10, 50).loadGraphic(Paths.image("menuBG"));
        background.setGraphicSize(Std.int(background.width * 1));
        background.screenCenter();
        add(background);

        // Set up image paths and descriptions
        imagePaths = ["gallery/image1", "gallery/image2", "gallery/image3", "gallery/image4"];
        imageDescriptions = ["Fun fact: The head was made, scrapped for 3 months, then was reused.", "bro gave me back pain from the 3 sketches i had to do.", "he was never planned to be added in the first place", "the sketch is old as crap."];
        imageTitle = ["RSGuy Sketch", "Glitchi Sketch", "Flputer Sketch", "Test Guy Sketch"];

        itemGroup = new FlxTypedGroup<GalleryImage>();
        
        for (id => i in imagePaths) {
            var newItem = new GalleryImage();
            newItem.loadGraphic(Paths.image(i));
            newItem.ID = id;
            itemGroup.add(newItem);
        }
        
        add(itemGroup);

        descriptionText = new FlxText(50, -100, FlxG.width - 100, imageDescriptions[currentIndex]);
        descriptionText.setFormat(null, 25, 0xffffff, "center");
        descriptionText.screenCenter();
        descriptionText.y += 250;
        descriptionText.setFormat(Paths.font("vcr.ttf"), 32);
        add(descriptionText);

        titleText = new FlxText(50, 50, FlxG.width - 100, imageTitle[currentIndex]);
        titleText.screenCenter(X);
        titleText.setFormat(null, 40, 0xffffff, "center");
        titleText.setFormat(Paths.font("vcr.ttf"), 32);
        add(titleText);
        
        persistentUpdate = true;
        changeSelection();
    }

    var allowInputs:Bool = true;
    
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Handle left and right arrow keys to scroll through image
        if ((controls.UI_LEFT_P || controls.UI_RIGHT_P) && allowInputs) {
            changeSelection(controls.UI_LEFT_P ? -1 : 1);
            FlxG.sound.play(Paths.sound("scrollMenu"));
        }
        
        if (controls.BACK && allowInputs)
        {
            allowInputs = false;
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new MainMenuState());
        }
    }
    
    private function changeSelection(i = 0)
    {
        currentIndex = FlxMath.wrap(currentIndex + i, 0, imageTitle.length - 1);
        
        descriptionText.text = imageDescriptions[currentIndex];

        titleText.text = imageTitle[currentIndex]; 
        
        var change = 0;
        for (item in itemGroup) {
            item.posX = change++ - currentIndex;
            item.alpha = item.ID == currentIndex ? 1 : 0.6;
        }
    }
}

class GalleryImage extends FlxSprite {
    public var posX:Float = 0;
    
    // Edit the 760 to change the distance between each image
    override function update(elapsed:Float) {
        super.update(elapsed);
        x = FlxMath.lerp(x, (FlxG.width - width) / 2 + posX * 760, CoolUtil.boundTo(elapsed * 3, 0, 1));
    }
}