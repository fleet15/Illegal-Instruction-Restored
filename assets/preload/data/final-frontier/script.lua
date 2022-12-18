-- thanks bacon for the script im a fucking dumbass   
function onCreate()
	makeAnimatedLuaSprite('kapowf', 'icons/icon-duke3', getProperty('iconP2.x'), getProperty('iconP2.y'))
	addAnimationByPrefix('kapowf', 'normal', 'neutralbozo', 24, true)
	addAnimationByPrefix('kapowf', 'losing', 'guh', 24, true)
	setScrollFactor('kapowf', 0, 0)
	setObjectCamera('kapowf', 'HUD')
	addLuaSprite('kapowf', true)
	setObjectOrder('kapowf', 99)
	objectPlayAnimation('kapowf', 'normal', false)
end

function onUpdate(elapsed)
	if getProperty('health') > 1.6 then
		objectPlayAnimation('kapowf', 'losing', false)
		setProperty('kapowf.x', getProperty('iconP2.x') - 75)
		setProperty('kapowf.y', getProperty('iconP2.y') - 100)
	else
		objectPlayAnimation('kapowf', 'normal', false)
		setProperty('kapowf.x', getProperty('iconP2.x') - 15)
		setProperty('kapowf.y', getProperty('iconP2.y') - 10)
	end
	if dadName == 'dukep3' then
		setProperty('kapowf.alpha', 1)
		setProperty('iconP2.alpha', 0)
	else
		setProperty('kapowf.alpha', 0)
		setProperty('iconP2.alpha', 1)
	end
	setProperty('kapowf.angle', getProperty('iconP2.angle'))
	setProperty('kapowf.scale.x', getProperty('iconP2.scale.x'))
	setProperty('kapowf.scale.y', getProperty('iconP2.scale.y'))
end