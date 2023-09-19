require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    if (status.resource("hellActive") == 2.0) then
        status.addPersistentEffects("maso", {"masochism"}) -- no longer necessary POG
        status.modifyResource("hellActive", 1.0)
        status.clearPersistentEffects("butwhy")
        world.sendEntityMessage(entity.id(), "removeBar", "harddamage")
        world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismNotFullyCleansed")
    elseif (status.resource("hellActive") == 1.0) then
        status.modifyResource("hellActive", 0.0)
        status.clearPersistentEffects("maso")
        world.sendEntityMessage(entity.id(), "removeBar", "harddamage")
    elseif (status.resource("hellActive") == 0.0)
        status.addEphemeralEffect("youweremistaken") --UNNECESSARY APOLOGY
    end
end

function update(dt)

end

function uninit()
end
