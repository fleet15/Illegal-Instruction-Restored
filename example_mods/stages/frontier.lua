function onCreate()
    makeLuaSprite('sky', 'exe/frontier/sky', -1050, -300)
    scaleObject('sky', 1.5, 1.5);
    addLuaSprite('sky');

    makeLuaSprite('thing1', 'exe/frontier/1', -1050, -300)
    scaleObject('thing1', 1.25, 1.25);
    setLuaSpriteScrollFactor('thing1', 0.85, 0.95);
    --addLuaSprite('thing1');
    makeLuaSprite('thing2', 'exe/frontier/2', 1050, -50)
    scaleObject('thing2', 1.25, 1.25);
    setLuaSpriteScrollFactor('thing2', 0.85, 0.95);
    addLuaSprite('thing2');

    makeLuaSprite('thing4', 'exe/frontier/4', -760, -20)
    scaleObject('thing4', 1.25, 1.25);
    setLuaSpriteScrollFactor('thing4', 0.85, 0.95);
    addLuaSprite('thing4');

    makeLuaSprite('thing5', 'exe/frontier/5', -780, -50)
    scaleObject('thing5', 1.25, 1.25);
    setLuaSpriteScrollFactor('thing5', 0.85, 0.95);
    addLuaSprite('thing5');

    makeLuaSprite('thing8', 'exe/frontier/8', 1450, 350)
    scaleObject('thing8', 0.5, 0.5);
    setLuaSpriteScrollFactor('thing8', 0.85, 0.95);
    addLuaSprite('thing8');

    makeAnimatedLuaSprite('masteremerald', 'exe/frontier/masteremerald', -495, -47);
    --scaleObject('masteremerald', 1.5, 1.5);
    addAnimationByPrefix('masteremerald', 'glow', 'emeraldglow', 24, true);
    addAnimationByIndices('masteremerald', 'glow_static', 'emeraldglow', 1, 24);
    if flashingLights then
        objectPlayAnimation('masteremerald', 'glow');
    else
        objectPlayAnimation('masteremerald', 'glow_static');
    end
    setProperty('masteremerald.alpha',0)
    addLuaSprite('masteremerald');

    makeAnimatedLuaSprite('emeralds', 'exe/frontier/emeralds', -790, -12);
    --scaleObject('masteremerald', 1.5, 1.5);
    addAnimationByPrefix('emeralds', 'glow', 'emeraldsBOP', 24, true);
    addAnimationByIndices('emeralds', 'glow_static', 'emeraldsBOP', 1, 24);
    if flashingLights then
        objectPlayAnimation('emeralds', 'glow');
    else
        objectPlayAnimation('emeralds', 'glow_static');
    end
    addLuaSprite('emeralds');


    makeLuaSprite('floor', 'exe/frontier/fgground', -1050, -300)
    scaleObject('floor', 1.5, 1.5);
    addLuaSprite('floor');

    makeLuaSprite('thing7', 'exe/frontier/7', 1250, 440)
    --scaleObject('thing7', 1.25, 1.25);
    setLuaSpriteScrollFactor('thing7', 0.85, 1);
    addLuaSprite('thing7',true);

    makeAnimatedLuaSprite('static', 'exe/staticc', 0, 0)
    addAnimationByPrefix('static', 'idle', 'staticc', 24, true);
    scaleObject('static', 2.67, 2.67);
    screenCenter('static', 'xy')
    setObjectCamera('static', 'hud')
    doTweenAlpha('hidestatic', 'static', 0, 0.00001);
    addLuaSprite('static', true)
    

end