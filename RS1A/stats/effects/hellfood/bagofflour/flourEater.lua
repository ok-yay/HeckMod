require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    script.setUpdateDelta(5)

end

function update(dt)
    status.setResource("flourEater",1.0)
    if (status.stat("flourWornLegs") == 0.0 or status.stat("flourWornHead") == 0.0 or status.stat("flourWornChest") == 0.0) then
        world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/fillarmor.config") -- les goooooo!!!
    end
end

function uninit()

    if status.resource("flourEater") == 1.0 then
        status.addPersistentEffects("flour", {"flourEater"}) -- incase status.clearAllPersistentEffects happens
    end
end
