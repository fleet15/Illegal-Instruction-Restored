local loopSong = false
local pixel = false
function onCreate()
    makeAnimatedLuaSprite('staticSonicPixel','StaticPixel',0,0)
    addAnimationByPrefix('staticSonicPixel','staticwow','Static',24,false)
    scaleObject('staticSonicPixel',2.4,2.4)
    setObjectCamera('staticSonicPixel','other')

    makeAnimatedLuaSprite('staticSonic','screenstatic',0,0)
    addAnimationByPrefix('staticSonic','staticwow','screenSTATIC',24,false)
    setProperty('staticSonic.antialiasing',false)
    setObjectCamera('staticSonic','other')
end
function onUpdate()
    if getProperty('staticSonicPixel.animation.curAnim.finished') then
        removeLuaSprite('staticSonicPixel',false)
        pixel = false
    end
    if getProperty('staticSonic.animation.curAnim.finished') then
        removeLuaSprite('staticSonic',false)
    end
end
function onEvent(name,v1,v2)
    if name == 'static' then
        playSound('staticBUZZ')
        if v1 ~= 'destroy' then
            if v1 == 'true' or getPropertyFromClass('PlayState','isPixelStage') == true and v1 == '' then
                addLuaSprite('staticSonicPixel',true)
                objectPlayAnimation('staticSonicPixel','staticwow',true)
                pixel = true
            elseif v1 == ''  and getPropertyFromClass('PlayState','isPixelStage') == false or v1 == 'false' then
                if pixel == true then
                    removeLuaSprite('staticSonicPixel',false)
                    pixel = false
                end
                addLuaSprite('staticSonic',true)
                objectPlayAnimation('staticSonic','staticwow',true)

            end
        else
            if pixel == true then
                removeLuaSprite('staticSonicPixel',false)
                pixel = false
            else
                removeLuaSprite('staticSonic',false)
            end
            loopSong = false
        end
        if v2 == 'true' then
            runTimer('loopBUZZsong',0.157)
            loopSong = true
        else
            loopSong = false
        end
    end
end
function onTimerCompleted(tag)
    if tag == 'loopBUZZsong' and loopSong == true then
        playSound('staticBUZZ')
        runTimer('loopBUZZsong',0.157)
        objectPlayAnimation('staticSonic','staticwow',true)
    end
end