function onCreate() --modified YCR Stage lmaooooo
    makeLuaSprite('sky','exe/apollyon/Sky',-600,-200);
    addLuaSprite('sky');

    makeLuaSprite('grassback','exe/apollyon/GrassBack',-600,-200);
    setLuaSpriteScrollFactor('grassback', 0.88, 1);
    addLuaSprite('grassback');

    makeLuaSprite('trees','exe/apollyon/Trees',-600,-200);
    setLuaSpriteScrollFactor('trees', 0.88, 1);
    addLuaSprite('trees');

    makeLuaSprite('grass','exe/apollyon/Grass',-600,-200);
    addLuaSprite('grass');

    makeLuaSprite('treesfront','exe/apollyon/TreesFront',-600,-400);
    setLuaSpriteScrollFactor('treesfront', 0.85);
    addLuaSprite('treesfront',true);

    makeLuaSprite('frontoverlay','exe/apollyon/FrontOverlay',-600,-200);
    addLuaSprite('frontoverlay');
    
    close(true);
end 