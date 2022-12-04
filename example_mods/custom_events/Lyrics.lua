function onEvent(name, value1, value2, value3)
    if name == 'Lyrics' then --Created at Fleet Dev's request. also, stinky fart poopoo sex
        local thething = true;
        if value1 == null then
            thething = false;
        end
        if not thething then
            doTweenAlpha('lyricoff','lyric',0,0.2)
        end
        if thething then
            setTextString('lyric', value1)
            doTweenAlpha('lyricin','lyric',1,0.2)
        end
        if value2 == null then
            --setTextColor('lyric', '000000')
            setTextColor('lyric', 'FFFFFF')
        end
        if value2 ~= null then
            setTextColor('lyric', value2)
        end
    end
end

function onCreate()
    makeLuaText('lyric', 'RAHHHH', 800, 0, 0)
    setTextFont('lyric', 'PressStart2P.ttf')
    screenCenter('lyric')
    setProperty('lyric.y', getProperty('lyric.y') + 250)
    setObjectCamera('lyric','other')
	setTextSize('lyric', 24)
    addLuaText('lyric')
    setProperty('lyric.alpha', 0)
end