require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    status.addPersistentEffects("maso", {"masochism"}) -- yeahh

    if status.statusProperty("hellActive",0) == 0 then
        item.setCount(0)
    end
end

function uninit()
    
end
