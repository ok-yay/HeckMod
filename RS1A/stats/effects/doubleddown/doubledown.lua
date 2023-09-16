require "/scripts/util.lua"
require "/scripts/status.lua"

function init() --hard dmg doesnt go away nearly as easily this time buckaroo!
end

function update(dt)
    if (status.resource("health") < status.resourceMax("health") - status.resource("harddmg") - 2) then
        status.setResource("harddmg", status.resourceMax("health")-status.resource("health") - 2)
    end
    if (status.resource("health") > status.resourceMax("health") - status.resource("harddmg")) then
        status.setResource("health", status.resourceMax("health") - status.resource("harddmg"))
    end
    if (self.timer > 0) then
        self.timer = self.timer - 1
    else
        if status.resource("harddmg") > 0 then
            status.setResource("harddmg", status.resource("harddmg") - 0.3)

        else
            status.setResource("harddmg", 0)
            world.sendEntityMessage(entity.id(), "removeBar", "harddamage")

        end
    end

    if (status.resource("harddmg") ~= 0) then -- MAYBE NOT EFFICIENT AT ALL BUT uhhhh idc
        world.sendEntityMessage(entity.id(), "setBar", "harddamage",
            1.0 - (status.resource("harddmg") / status.resourceMax("health")), {255, 0, 0, 150})

    end

    self.damageListener:update()
end

function uninit()
    if status.resource("hellActive") == 1.0 then
        status.addPersistentEffects("maso", {"masochism"}) -- incase status.clearAllPersistentEffects happens
    end
end
