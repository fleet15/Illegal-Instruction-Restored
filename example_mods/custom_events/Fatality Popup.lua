local PopupLength = 0
local PopupCreate = false


function onCreate()
    precacheImage('error_popups')
    precacheImage('fatal_mouse_cursor')
    makeLuaSprite('fatalCursor','fatal_mouse_cursor',getMouseX('other'),getMouseY('other'))
    setObjectCamera('fatalCursor','other')
    addLuaSprite('fatalCursor',true)

    makeAnimatedLuaSprite('FatalityPopup0','error_popups',math.random(150,700),math.random(0,screenHeight - 264))
    addAnimationByPrefix('FatalityPopup0','error','idle',24,false)
    addAnimationByPrefix('FatalityPopup0','error','bye',24,false)
    setObjectCamera('FatalityPopup0','other')
    scaleObject('FatalityPopup0',1.6,1.6)
    setProperty('FatalityPopup0.alpha',0.001)
    addLuaSprite('FatalityPopup0',true)
end
function onEvent(name,v1,v2)
    if name == 'Fatality Popup' and PopupCreate == false then
        makeAnimatedLuaSprite('FatalityPopup'..PopupLength + 1,'error_popups',math.random(150,700),math.random(0,screenHeight - 264))
        addAnimationByPrefix('FatalityPopup'..PopupLength + 1,'error','idle',24,false)
        addAnimationByPrefix('FatalityPopup'..PopupLength + 1,'byeError','bye',24,false)
        setObjectCamera('FatalityPopup'..PopupLength + 1,'other')
        scaleObject('FatalityPopup'..PopupLength + 1,1.6,1.6)
        addLuaSprite('FatalityPopup'..PopupLength + 1,true)
        setObjectOrder('fatalCursor',getObjectOrder('FatalityPopup'..PopupLength + 1) + 1)

        PopupCreate = true
        if v2 ~= '' and tonumber(v2) ~= nil then
            runTimer('PupopDelete'..PopupLength + 1,v2)
        end
        PopupLength = PopupLength + 1
        runTimer('PopupEnable',0.1)
    end
    if name == 'Clear Fatality Popups' then
        for deletedPopus = 0,PopupLength do
            objectPlayAnimation('FatalityPopup'..deletedPopus,'byeError',true)
        end
    end
end
function onUpdate()
    for PopupCounter = 0,PopupLength do
        if getMouseX('other') >= getProperty('FatalityPopup'..PopupCounter..'.x') + (getProperty('FatalityPopup'..PopupCounter..'.width')/2.5) and getMouseX('other') <= getProperty('FatalityPopup'..PopupCounter..'.x') + (getProperty('FatalityPopup'..PopupCounter..'.width')/1.75) and  getMouseY('other') >= getProperty('FatalityPopup'..PopupCounter..'.y') + (getProperty('FatalityPopup'..PopupCounter..'.height')/1.5) and getMouseY('other') <= getProperty('FatalityPopup'..PopupCounter..'.y') + (getProperty('FatalityPopup'..PopupCounter..'.height')/1.1)  and getPropertyFromClass('flixel.FlxG','mouse.justPressed') == true then
            objectPlayAnimation('FatalityPopup'..PopupCounter,'byeError',false)
        end
        if getProperty('FatalityPopup'..PopupCounter..'.animation.curAnim.finished') and getProperty('FatalityPopup'..PopupCounter..'.animation.curAnim.name') == 'byeError' then
            removeLuaSprite('FatalityPopup'..PopupCounter,false)
        end
    end
    
    setPropertyFromClass('flixel.FlxG','mouse.visible',false)
    setProperty('fatalCursor.x',getMouseX('other'))
    setProperty('fatalCursor.y',getMouseY('other'))

end
function onTimerCompleted(tag)
    for PupopTimerCounter = 0,PopupLength do
        if tag == 'PupopDelete'..PupopTimerCounter then
            objectPlayAnimation('FatalityPopup'..PupopTimerCounter,'byeError',false)
        end
    end
    if tag == 'PopupEnable' then
        PopupCreate = false
    end
end