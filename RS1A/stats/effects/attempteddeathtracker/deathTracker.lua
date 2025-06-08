require "/scripts/util.lua"
require "/scripts/status.lua"


function init() --hard dmg doesnt go away nearly as easily this time buckaroo!
    effect.addStatModifierGroup({{stat = "notDead", amount = 1}})
end

function update(dt)
    if (not effect.duration() == nil) then --i guess i need this?
        if (effect.duration()<5.0) then
            effect.modifyDuration(10)
        end
    else
        sb.logInfo("bro why is it nil?")
    end
end

function uninit()
end
