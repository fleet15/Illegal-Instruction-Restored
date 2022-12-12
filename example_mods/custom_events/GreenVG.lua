local RedValue = 0
local RedEnable = false
function onCreate()
    makeLuaSprite('RedImage','GreenVG',0,0)
    setObjectCamera('RedImage','other')
    setProperty('RedImage.alpha',0)
    addLuaSprite('RedImage',true)
end

function onEvent(name,v1)
    if name == 'GreenVG' then
        if v1 ~= false and v1 ~= 'False' and v1 ~= 'false' then
            GreenValue = -1
            GreenEnable = true
        else
            GreenEnable = false
            GreenValue = -1
        end
    end
end

function onUpdate()
    if GreenValue == 1 then
        doTweenAlpha('GreenWOW','GreenImage',1,0.8,'linear')
        GreenValue = 2
    elseif GreenValue == -1 then
        doTweenAlpha('GreenWOW','GreenImage',0,1,'linear')
        GreenValue = -2
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        if RedValue < 0 and GreenEnable == true then
            GreenValue = 1
        elseif GreenValue > 0 and GreenEnable == true then
            GreenValue = -1
        end
    end
end