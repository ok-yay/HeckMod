require "/scripts/util.lua"
require "/scripts/status.lua"

function init() --hard dmg doesnt go away nearly as easily this time buckaroo!
end

function update(dt)
    if (tostring(world.type()) == "unknown") then
        if status.resource("harddmg") > 0 then
            status.setResource("harddmg", status.resource("harddmg") - 0.9)
            status.setResource("health", status.resourceMax("health")-status.resource("harddmg")) --its far clearer whats happenening, since no bar this time around.

        else
            status.setResource("harddmg", 0)
            world.sendEntityMessage(entity.id(), "removeBar", "harddamage")
        end
    else
        local math = status.resourceMax("health") - status.resource("harddmg")
    if (status.resource("health") < math) then
        if (math > 10) then
            status.setResource("harddmg", status.resourceMax("health")-status.resource("health"))
        else
            status.setResource("harddmg", status.resourceMax("health")-10)
        end
    end
    if (status.resource("health") > status.resourceMax("health") - status.resource("harddmg")) then
        status.setResource("health", status.resourceMax("health") - status.resource("harddmg"))
    end
    
    
    
    end
end

function uninit()
    if status.resource("hellActive") == 2.0 then
        status.addPersistentEffects("butwhy", {"doubledown"}) -- incase status.clearAllPersistentEffects happens
    end
end
