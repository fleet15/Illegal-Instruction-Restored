function onCreate()
	byegf = false;
	hoamingcheck = 0;
	setProperty('skipCountdown', true);
	----------------------
	--	HOG NORMAL BG	--
	----------------------
	makeLuaSprite('hog_sky', 'hog/bg', -1200, -400);
	addLuaSprite('hog_sky', false)
	setScrollFactor('hog_sky', 0.3, 0.3);
	
	makeLuaSprite('hog_mountain', 'hog/mountains', -600, -100);
	setScrollFactor('hog_mountain', 0.4, 0.4);
	addLuaSprite('hog_mountain', false)
	
	makeAnimatedLuaSprite('hog_waterfall', 'hog/Waterfalls', -1200, 100);
	addAnimationByPrefix('hog_waterfall', 'idle', 'British', 18, true);
	addLuaSprite('hog_waterfall', false)
	objectPlayAnimation('hog_waterfall', 'idle', true);
	setScrollFactor('hog_waterfall', 0.5, 0.5);
	
	makeAnimatedLuaSprite('hog_hills', 'hog/HillsandHills', -500, 0);
	addAnimationByPrefix('hog_hills', 'idle', 'DumbassMF', 12, true);
	addLuaSprite('hog_hills', false)
	objectPlayAnimation('hog_hills', 'idle', true);
	setScrollFactor('hog_hills', 0.7, 0.7);
	scaleObject('hog_hills', 1.25, 1.25)
	
	makeLuaSprite('hog_trees', 'hog/trees', -500, -200);
	setScrollFactor('hog_trees', 0.8, 0.8);
	addLuaSprite('hog_trees', false)
	
	makeLuaSprite('hog_floor', 'hog/floor', -600, 550);
	setScrollFactor('hog_floor', 1, 1);
	addLuaSprite('hog_floor', false)
	
	makeLuaSprite('hog_rocks', 'hog/rocks', -650, 450);
	setScrollFactor('hog_rocks', 1.1, 1.1);
	addLuaSprite('hog_rocks', false)
	
	makeLuaSprite('hog_overlay', 'hog/overlay', -1000, -500);
	addLuaSprite('hog_overlay', true)
	setScrollFactor('hog_overlay', 0.3, 0.3);
end

function HoamingAttack()
	makeAnimatedLuaSprite('hoaming_attack', 'hog/TargetLock', 725, 160);
	addAnimationByPrefix('hoaming_attack', 'idle', 'TargetLock target', 24, false);
	objectPlayAnimation('hoaming_attack', 'idle', true);
	addLuaSprite('hoaming_attack', true)
	
	--Adding Warning
	makeAnimatedLuaSprite('warning_attack', 'spacebar_icon', 350, 175);
	addAnimationByPrefix('warning_attack', 'idle', 'spacebar', 24, true);
	objectPlayAnimation('warning_attack', 'idle', true);
	addLuaSprite('warning_attack', true)
	scaleObject('warning_attack', 0.5, 0.5)
	setObjectCamera('warning_attack', 'other')
end

local allowCountdown = false
local soundhitplayed = false
local hogAttackCheck = 0;
local waitThing = false
local confirmed = 0
local bfdodged = false;
local value = 150; --using onUpdate to remove 1 every frame
local bfdedlol = false;

function onStartCountdown()
    if not allowCountdown then
        return Function_Stop
    end
    if allowCountdown then
        return Function_Continue
    end
    return Function_Continue;
end

function onUpdatePost(elapsed)
	if value > 1 then
		value = value-1; --using onUpdate to remove 1 every frame
	end
	if value == 1 and confirmed == 0 then
		setProperty("timeBar.color",getColorFromHex("FF0000"))
        allowCountdown = true
        startCountdown();
        confirmed = 1
    end
	if getProperty('dad.animation.curAnim.name') == 'Getfucked' then
		if hogAttackCheck == 0 then
			HoamingAttack()
			bfdodged = false;
			hogAttackCheck = hogAttackCheck + 1;
			runTimer('warningTimer', 1.6);
		else
			--nothing
		end
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and bfdodged == false then
			playSound('Ring', 2)
			removeLuaSprite('warning_attack')
			removeLuaSprite('hoaming_attack')
			bfdodged = true;
		end
		
		if bfdodged == true then
			triggerEvent('Play Animation', 'dodge', 'bf')
		end
	else
		removeLuaSprite('warning_attack')
		removeLuaSprite('hoaming_attack')
		hogAttackCheck = 0;
		soundhitplayed = false;
	end
	if bfhurt == true then
		health = getProperty('health');
		setProperty('health', health- 1);
		triggerEvent('Play Animation', 'hurt', 'bf');
		cameraShake('camGame', 0.1, 0.1);
		if soundhitplayed == false then
			playSound('hit', 1);
			soundhitplayed = true;
		end
		bfhurt = false;
	end
	if byegf == false then
		setProperty('gf.alpha', 0);
		setProperty('gf.visible', false)
		
		--making sure these characters can load properly
		triggerEvent('Change Character', '0', 'hog_glitch');
		triggerEvent('Change Character', '0', 'hog');
		triggerEvent('Change Character', '0', 'bf');
		
		makeAnimatedLuaSprite('hoaming_attack', 'hog/TargetLock', 725, 160);
		addAnimationByPrefix('hoaming_attack', 'idle', 'TargetLock target', 24, false);
		objectPlayAnimation('hoaming_attack', 'idle', true);
		addLuaSprite('hoaming_attack', true)
		
		--Adding Warning
		makeAnimatedLuaSprite('warning_attack', 'spacebar_icon', 350, 175);
		addAnimationByPrefix('warning_attack', 'idle', 'spacebar', 24, true);
		objectPlayAnimation('warning_attack', 'idle', true);
		addLuaSprite('warning_attack', true)
		scaleObject('warning_attack', 0.5, 0.5)
		setObjectCamera('warning_attack', 'other')
		
		removeLuaSprite('hoaming_attack')
		removeLuaSprite('warning_attack')
		
		byegf = true;
	end
	if dadName == 'hog_glitch' then
		setProperty('defaultCamZoom', 1)
	else
		setProperty('defaultCamZoom', 0.7)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'warningTimer' then
		if bfdodged == false then
			bfhurt = true;
		end
	end
end

function onDestroy() --Basically, if the player quits the song
	setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine")
	clearUnusedMemory();
end