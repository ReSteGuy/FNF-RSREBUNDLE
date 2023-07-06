function onCreate()
    makeLuaSprite("rec", "recSymbol", 0.0, 140.0)
    addLuaSprite("rec", false)
    setObjectCamera("rec", "hud")
    setGraphicSize("rec", 0.5, 0.5)
end
function onSongStart()
    noteTweenAlpha("P1Note1", 0, 0, 2, "circInOut")
    noteTweenAlpha("P1Note2", 1, 0, 2, "circInOut")
    noteTweenAlpha("P1Note3", 2, 0, 2, "circInOut")
    noteTweenAlpha("P1Note4", 3, 0, 2, "circInOut")
end