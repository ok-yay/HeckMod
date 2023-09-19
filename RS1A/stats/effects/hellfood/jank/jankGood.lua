require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    sb.logInfo(status.resource("hellActive"))
    if (status.resource("hellActive") == 2.0) then
        status.addPersistentEffects("maso", {"masochism"}) -- no longer necessary POG
        status.setResource("hellActive", 1.0)
        status.clearPersistentEffects("butwhy")
        world.sendEntityMessage(entity.id(), "removeBar", "harddamage")
        world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismNotFullyCleansed")
        sb.logInfo("yessir")
    elseif (status.resource("hellActive") == 1.0) then
        status.setResource("hellActive", 0.0)
        status.clearPersistentEffects("maso")
        world.sendEntityMessage(entity.id(), "removeBar", "harddamage")
        sb.logInfo("goddamn")
    elseif (status.resource("hellActive") == 0.0) then
        status.addEphemeralEffect("youweremistaken") --UNNECESSARY APOLOGY
        sb.logInfo("what")
    end
end

function update(dt)

end

function uninit()
end
