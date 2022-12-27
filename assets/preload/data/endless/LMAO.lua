local defaultNotePos = {};
 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        direc = getPropertyFromGroup('strumLineNotes', i, 'direction')
 
        table.insert(defaultNotePos, {x,y,direc})
    end
end

function onCreatePost()
    setProperty('showRating', false)
    setProperty('showComboNum', false)
    makeLuaText("thing",'Fun Is Infinite',1000,150,0); 
    addLuaText('thing');
    setTextBorder("thing", 1.1, '000011')
    setTextSize('thing',24);
    setProperty('scoreTxt.visible',false)
end

function onUpdatePost(elapsed)
    setProperty('thing.y',getProperty('scoreTxt.y'))
	noteCount = getProperty('notes.length');

	for i = 0, noteCount-1 do

		noteData = getPropertyFromGroup('notes', i, 'noteData')
		if getPropertyFromGroup('notes', i, 'isSustainNote') then
            if (getPropertyFromGroup('notes', i, 'mustPress')) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("playerStrums", noteData, 'direction') - 90)
            else
				
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("opponentStrums", noteData, 'direction') - 90)
            end	
		else
            if (noteData >= 4) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("playerStrums", noteData, 'angle'))
            else
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("opponentStrums", noteData, 'angle'))
            end	
		end
	end
end
function onUpdate()

   
    
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    gurg = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/60))
    currentBeat = (songPos / 1000) * (bpm / 70)
    currentBeat2 = (songPos / 1000) * (bpm / 120)
    if blas == true then
    setProperty('camHUD.y', -10 + 20 * math.sin((gurg *0.2) * math.pi), 0.2)
    setProperty('camHUD.x', -13 + 23 * math.sin((gurg *0.25) * math.pi), 0.5)
    end

for i = 0,7 do
    setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] - 10 * math.cos((currentBeat + i*0.25) * math.pi))
    setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] - 20 * math.cos((currentBeat + i*0.05) * math.pi))
setPropertyFromGroup('strumLineNotes', i, 'direction', defaultNotePos[i + 1][3] - 6 * math.cos((currentBeat2 + i*0.01) * math.pi))
end
end



function onStepHit()
   
    if curStep == 784 then
        makeLuaSprite('fe', 'redVG',0, 0);
		screenCenter('fe', 'xy')
		addLuaSprite('fe', 'false');
		setObjectCamera('fe', 'other');
        setProperty('fe.alpha',0)
        setProperty('fe.color',getColorFromHex('0d29b5'))
        doTweenAlpha('af','fe',1,0.5,'sineOut')
        setBlendMode('af','lighten')
    end
   
    if curStep == 250 then
        setTextString('thing','The Fun Is Endless!')
    end

end

function resetStrums()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
    end
end 

function bumpArrowsY(time, amount, smallamount)
    for i = 0,7 do
        shit = 0;
        if i % 4 == 0 then
            shit = -amount
        end
        if i % 4 == 1 then
            shit = -smallamount
        end
        if i % 4 == 2 then
            shit = smallamount
        end
        if i % 4 == 3 then
            shit = amount
        end
        setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') + shit)
        noteTweenY("movementYbump " .. i, i, getPropertyFromGroup('strumLineNotes', i, 'y') - shit, time, "linear")
    end
end

function bumpArrowsX(time, amount, smallamount)
    for i = 0,7 do
        shit = 0;
        if i % 4 == 0 then
            shit = -amount
        end
        if i % 4 == 1 then
            shit = -smallamount
        end
        if i % 4 == 2 then
            shit = smallamount
        end
        if i % 4 == 3 then
            shit = amount
        end
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + shit)
        noteTweenX("movementXbump " .. i, i, getPropertyFromGroup('strumLineNotes', i, 'x') - shit, time, "linear")
    end
end

function fadeStrums(alpha,time,movebf,movedad)
    if time <= 0 then
        if movebf == true then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end
        end
        if movedad == true then
            for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end
        end
    else
        if movebf == true then
            for i = 4,7 do 
                noteTweenAlpha("movementAlpha " .. i, i, alpha, time, "linear")
            end
        end
        if movedad == true then
            for i = 0,3 do 
                noteTweenAlpha("movementAlpha " .. i, i, alpha, time, "linear")
            end
        end
    end
end