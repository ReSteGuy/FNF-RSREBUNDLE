local currkey = 0
function onUpdate(elapsed)
    if getPropertyFromClass('flixel.FlxG', 'keys.pressed.N') and currkey == 0 then
        currkey = 1
        runTimer("disable", 3, 1)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.pressed.E') and currkey == 1 then
        currkey = 2
        cancelTimer("disable")
        runTimer("disable", 3, 1)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.pressed.X') and currkey == 2 then
        currkey = 3
        cancelTimer("disable")
        runTimer("disable", 3, 1)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.pressed.T') and currkey == 3 then
        currkey = 0
        playSong("takeover", "encore")
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "disable" then
        currkey = 0
    end
end