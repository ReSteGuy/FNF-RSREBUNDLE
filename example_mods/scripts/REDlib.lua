local beat = 0
local miss = false
function onBeatHit()
    beat = beat + 1
    if beat == 2 then
        beat = 0
        if miss == false then
        doTweenZoom("beathit", "camGame", 1.1, 0.2, "quadInOut")
        wait(0.2)
        doTweenZoom("beathit", "camGame", 1, 0.1, "quadInOut")
        end
    end
end

function noteMiss()
    if miss == false then
    miss = true
    doTweenZoom("miss", "camGame", 1.5, 0.2, "quadInOut")
    wait(0.1)
    doTweenZoom("missed", "camGame", 1.5, 0.1, "quadInOut")
    wait(2)
    miss = false
    end
end
function goodNoteHit()
    miss = false
end
function onUpdate()
    if mustHitSection == false then
        miss = false
    end
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.007);
    end
end