require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    if (status.stat("cantBackOutNow") == 0.0) then
        status.setResource("flourEater", 0.0)
        status.clearPersistentEffects("flour")
        world.sendEntityMessage(entity.id(), "blowTheHellUp")
    else
        -- evil town!
    end
end

function update(dt)

end

function uninit()
end