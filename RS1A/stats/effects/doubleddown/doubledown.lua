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
    if (world.type == "unknown") then
        if status.resource("harddmg") > 0 then
            status.setResource("harddmg", status.resource("harddmg") - 0.7)

        else
            status.setResource("harddmg", 0)
            world.sendEntityMessage(entity.id(), "removeBar", "harddamage")

        end
    end

    self.damageListener:update()
end

function uninit()
    if status.resource("hellActive") == 2.0 then
        status.addPersistentEffects("butwhy", {"doubledown"}) -- incase status.clearAllPersistentEffects happens
    end
end
