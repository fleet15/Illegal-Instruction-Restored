function onCreate()
	makeLuaSprite('readthefiletitlelol', 'black', 0, 0);
	scaleObject('readthefiletitlelol', 128, 128);
	setObjectCamera('readthefiletitlelol', 'other');
	addLuaSprite('readthefiletitlelol', true);
	
	makeLuaSprite('introcircle', 'StartScreens/Circle-hog', -400, 0);
	setObjectCamera('introcircle', 'other');
	addLuaSprite('introcircle', true);
	makeLuaSprite('introtext', 'StartScreens/Text-hog', -100, 0);
	setObjectCamera('introtext', 'other');
	addLuaSprite('introtext', true);
end

function onStartCountdown()
	doTweenX('circleTween', 'introcircle', 30, 2, 'quintOut')
	doTweenX('textTween', 'introtext', 100, 2, 'quintOut')
end

local value = 150; --using onUpdate to remove 1 every frame

function onUpdatePost(elapsed)
	if value > 1 then
		value = value-1; --using onUpdate to remove 1 every frame
	end
	if value < 25 then
		doTweenAlpha('graphicAlpha', 'readthefiletitlelol', 0, 0.2, 'quintOut');
		doTweenAlpha('circleAlpha', 'introcircle', 0, 0.2, 'quintOut');
		doTweenAlpha('textAlpha', 'introtext', 0, 0.2, 'quintOut');
	end
	if value == 1 and confirmed == 0 then
        allowCountdown = true
        startCountdown();
        confirmed = 1
    end
end