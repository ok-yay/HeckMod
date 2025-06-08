require "/scripts/util.lua"
require "/scripts/status.lua"

-- for CURRENT debugging purposes, ive decided to have it be that the effect is visible; it will not be visible upon release

function init()
    effect.addStatModifierGroup({{stat = "notDead", amount = 1}})
end

function update(dt)
    if (effect.duration()<5.0) then
        effect.modifyDuration(10)
    end
end

function uninit()
end
