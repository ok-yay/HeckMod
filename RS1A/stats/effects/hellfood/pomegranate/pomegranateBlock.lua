require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    effect.addStatModifierGroup({{stat = "cantBackOutNow", amount = 1}})
end

function update(dt)
    
end

function uninit()
    status.addPersistentEffects("pomegranate", {"pomegranateBlock"}) -- it must stay
end
