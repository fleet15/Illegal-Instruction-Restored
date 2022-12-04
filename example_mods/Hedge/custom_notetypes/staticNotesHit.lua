function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'staticNotesHit' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'staticNotes');
		end
	end
end

function onUpdate()
	local value = value(math.random(0,6666))
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'staticNotes' then
        playSound('hitStatic1', 1);
		health = getProperty('health')
		setProperty('health', health-0.1)
		debugPrint('ILLEGAL INSTRUCTION$0000' .. value)
	end
end

