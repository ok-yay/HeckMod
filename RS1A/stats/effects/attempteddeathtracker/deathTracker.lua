require "/scripts/util.lua"
require "/scripts/status.lua"

function init() --hard dmg doesnt go away nearly as easily this time buckaroo!
    effect.addStatModifierGroup({{stat = "ballsInYoFace", amount = 1}}) --might be possible in json but idrk
end

function update(dt)
    if (effect.duration() < 5.0) then
        effect.modifyDuration(10.0)
    end
end

function uninit()
    -- this also executes when you leave, gonna have to find a way to prevent that specific thing!
    if (status.resource("hellActive") > 0.0 or status.resource("flourEater") > 0.0) then --only track if hell is activated
        sb.logInfo("YOU DIED!!!!!!")
        --status.addEphemeralEffect("deathTracker",10) -- it DOES detect (hell yeah!) but it doesn't add itself back (boo...)
    end
end
