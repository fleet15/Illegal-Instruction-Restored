package;

#if desktop
import Discord.DiscordClient;
#end
import editors.ChartingState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.effects.FlxFlicker;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class NewtrogicZone extends MusicBeatState
{  
    var songs:Array<String> = [
        'breakout',
        'my-horizon'
    ];

    var portraitImages:FlxTypedGroup<FlxSprite>;

    var curSelected:Int = 0;
    var selected:Bool = false;

    override function create()
    {
        Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

        FlxG.sound.playMusic(Paths.music('NewtrogicMenu'), 0);
		FlxG.sound.music.fadeIn(1.4, 0, 0.7);

        PlayState.isNewtrogicMode = true;

        transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

        FlxG.mouse.visible = true;

        #if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Selecting The New World.", null);
		#end

        var screen:FlxSprite = new FlxSprite().loadGraphic(Paths.image('freeplay/encore/screen'));
        screen.setGraphicSize(FlxG.width, FlxG.height);
        screen.updateHitbox();
        add(screen);

        portraitImages = new FlxTypedGroup<FlxSprite>();
        add(portraitImages);

        for(i in 0...songs.length)
        {
            var portrait:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/encore/' + songs[i] + '-encore'));
            portrait.screenCenter();
            portrait.ID = i;
            switch(portrait.ID)
            {
                case 0:
                    portrait.x -= 430;
                    portrait.y -= 250;
                case 1:
                    portrait.x += 290;
                    portrait.y -= 250;
            }
            portrait.scale.set(2, 2);
            portraitImages.add(portrait);
            portrait.updateHitbox();
        }
    }

    override function update(elapsed:Float)
    {
        if(!selected)
        {
            portraitImages.forEach(function(spr:FlxSprite)
            {
                if(FlxG.mouse.overlaps(spr))
                {
                    spr.alpha = 1;
                    if(FlxG.mouse.justPressed || controls.ACCEPT)
                    {
                        curSelected = spr.ID;
                        selected = true;
                        FlxG.sound.play(Paths.sound('confirmMenu'));
                        doTheTween();
                    }
                }
                else
                    spr.alpha = 0.7;
            });
            if(controls.BACK) {
                FlxG.sound.play(Paths.sound('cancelMenu'));
                MusicBeatState.switchState(new MainMenuState());
            }
        }
        super.update(elapsed);
    }

    override function switchTo(state:FlxState) {
		FlxG.mouse.visible = false;

        FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

		return super.switchTo(state);
	}

    function doTheLoad()
    {
        var songLowercase:String = Paths.formatToSongPath(songs[curSelected]);
        PlayState.SONG = Song.loadFromJson(songLowercase + '-newtrogic', songLowercase);
        PlayState.isStoryMode = false;
        PlayState.storyDifficulty = 3;
        LoadingState.loadAndSwitchState(new PlayState());
    }

    function doTheTween()
    {
        portraitImages.forEach(function(spr:FlxSprite)
        {
            if(spr.ID != curSelected)
            {
                FlxTween.tween(spr, {alpha: 0}, 0.3, {ease: FlxEase.sineOut});
            }
            if(spr.ID == curSelected)
            {
                FlxFlicker.flicker(spr, 1, 0.06, true, false, function(flick:FlxFlicker)
                {
                    doTheLoad();
                });
            }
        });
    }
}