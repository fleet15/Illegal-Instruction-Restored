function onCreate()
	makeLuaSprite('blackout2', "", -1450, -825);
	makeGraphic('blackout2', 4000, 2560, '000000');
    setProperty('blackout2.alpha', '0');
	addLuaSprite('blackout2', true);
	setProperty('timeBar.color', getColorFromHex('330501'))
end
function onCreatePost() -- no countdown
	setProperty('startTimer.finished', true)
	if version > '0.6' then --make sure this only runs on 0.6.1+
	runHaxeCode([[
		game.iconP1.changeIcon('gfbf');
	]])
	triggerEvent('Change Character', 'bf', getProperty('boyfriend.curCharacter'))
	end
end

function onUpdate(elapsed)
	if getProperty('dad.curCharacter') == 'dukep3' then
		setProperty('masteremerald.alpha',0)
		setProperty('emeralds.alpha',1)
	else
		setProperty('masteremerald.alpha',1)
		setProperty('emeralds.alpha',0)
	end
	if curStep == 1072 then
		static()
	end
	if curStep == 1088 then
		setProperty('timeBar.color', getColorFromHex('17361F'))
	end
	if curStep == 2096 then
		static()
	end
	if curStep == 2112 then
		setProperty('timeBar.color', getColorFromHex('330501'))
	end

	if curStep == 2352 then

	end
	if curStep == 2608 then
		static()
	end
	if curStep == 2624 then
		setProperty('timeBar.color', getColorFromHex('BDB1AB'))
	end
	--[[if curStep == 3713 then
		static()
	end
	if curStep == 3807 then
		static2()
	end
	if curStep == 3842 then
		static()
	end--]]
	if curStep == 3376 then
		static()
	end
	if curStep == 3392 then
		setProperty('timeBar.color', getColorFromHex('330501'))
	end
	if curStep == 3791 then
		static()
	end
	if curStep == 3887 then
		static()
	end
	if curStep == 3904 then
		setProperty('blackout2.alpha', '1');
		setProperty('camHUD.alpha', '0');
		setObjectCamera('static', 'other')
	end
	if curStep == 3930 then
		static()
	end
	if curStep == 3967 then
		setProperty('blackout2.alpha', '0');
		setProperty('camHUD.alpha', '1');
		setObjectCamera('static', 'hud')
	end--[[
	if curStep == 5024 then
		static()
	end--]]
end
function onBeatHit()
	if curBeat == 588 then
		doTweenZoom('Zoom3', 'camGame', 1, 0.23, 'cubeInOut')
	end
	if curBeat == 589 then
		doTweenZoom('Zoom2', 'camGame', 1.14, 0.23, 'cubeInOut')
	end
	if curBeat == 590 then
		doTweenZoom('Zoom1', 'camGame', 1.28, 0.23, 'cubeInOut')
	end
	if curBeat == 591 then
		doTweenZoom('Zoom0', 'camGame', 1.42, 0.23, 'cubeInOut')
	end
	if curBeat == 591 then
		doTweenZoom('Unzoom', 'camGame', 0.76, 0.23, 'cubeInOut')
	end
	if curBeat == 1112 then
		doTweenAlpha('noHud', 'camHUD', 0.75, 0.25, 'cubeInOut')
	end
	if curBeat == 1114 then
		doTweenAlpha('noHud', 'camHUD', 0.50, 0.25, 'cubeInOut')
	end
	if curBeat == 1116 then
		doTweenAlpha('noHud', 'camHUD', 0.25, 0.25, 'cubeInOut')
	end
	if curBeat == 1118 then
		doTweenAlpha('noHud', 'camHUD', 0, 0.75, 'cubeInOut')
	end
end

function static() --static shit
	doTweenAlpha('static', 'static', 1, 1.33, cubeInOut);
end
function static2() --static shit
	doTweenAlpha('static', 'static', 1, 1, cubeInOut);
end

function onTweenCompleted(tag)
    if tag == 'static' then
        doTweenAlpha('nostatic', 'static', 0, 0.2);
    end
end