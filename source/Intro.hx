package;

import flixel.graphics.FlxGraphic;
import sys.FileSystem;
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
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;

using StringTools;


class Intro extends MusicBeatState
{
    override public function create()
    {
        FlxG.mouse.visible = false;
		FlxG.sound.volume = 10;

        FlxG.sound.muteKeys = [];
  		FlxG.sound.volumeDownKeys = [];
  		FlxG.sound.volumeUpKeys = [];

        if(FlxG.save.data.video == null)
            FlxG.save.data.video = false;

        if(!FlxG.save.data.video) {
            var video:MP4Handler = new MP4Handler();
            video.playVideo(Paths.video('Intro'));
            video.finishCallback = function()
            {
                FlxG.save.data.video = true;

                FlxG.sound.muteKeys = TitleState.muteKeys;
                FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
                FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;    

                LoadingState.loadAndSwitchState(new TitleState());
            }
        }
        else {
            LoadingState.loadAndSwitchState(new TitleState());
        }
    }
}