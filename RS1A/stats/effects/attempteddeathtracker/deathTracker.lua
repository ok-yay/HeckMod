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
    --sb.logInfo("ok")
    -- in terms of jank, this is certainly jank! it also (far as im aware) is very consistent
    if (status.resource("hellActive") > 0.0 or status.resource("flourEater") > 0.0) then --only track if hell is activated
        if (status.statusProperty("deathTrack",0.0) == 0.0) then
            sb.logInfo("Disconnected")
        elseif (status.statusProperty("deathTrack",0.0) == 1.0) then
            sb.logInfo("YOU DIED!!!!!! IDIOT!!!!!!!!")
        end
    end
end
