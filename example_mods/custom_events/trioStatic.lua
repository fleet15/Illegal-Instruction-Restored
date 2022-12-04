function onCreate()
    makeAnimatedLuaSprite('trioStatic','Phase3Static',0,0)
    addAnimationByPrefix('trioStatic','staticwow','Phase3Static',24,false)
    setProperty('trioStatic.alpha',0.4)
    scaleObject('trioStatic',3.3,3.3)
    setObjectCamera('trioStatic','other')
end
function onUpdate()
    if getProperty('trioStatic.animation.curAnim.finished') then
        removeLuaSprite('trioStatic',false)
    end
end
function onEvent(name)
    if name == 'trioStatic' then
        addLuaSprite('trioStatic',true)
        objectPlayAnimation('trioStatic','staticwow',true)

    end
end