function onEvent(name, value1, value2)
    if name == 'Cam OFF' then
        doTweenAlpha('camHUDOff' ,'camHUD', value1, 0.00000001, 'linear')
        doTweenAlpha('camGameOff' ,'camGame', value1, 0.00000001, 'linear')
    end
end