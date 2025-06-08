require "/scripts/util.lua"
require "/scripts/status.lua"


function init() --hard dmg doesnt go away nearly as easily this time buckaroo!
    effect.addStatModifierGroup({{stat = "notDead", amount = 1}})
end

function update(dt)
    if (effect.duration()<5) then
        effect.modifyDuration(10)
    end
end

function uninit()
end
