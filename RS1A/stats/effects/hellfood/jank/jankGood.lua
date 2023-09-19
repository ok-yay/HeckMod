require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    if (status.resource("hellActive") == 2.0) {
        status.modifyResource("hellActive", 1.0)
        status.clearPersistentEffects("butwhy")
        status.addPersistentEffects("maso", {"masochism"}) -- no longer necessary POG
    } else if (status.resource("hellActive") == 1.0) {
        status.modifyResource("hellActive", 0.0)
        status.clearPersistentEffects("maso")
    } else {
        
    }
end

function update(dt)

end

function uninit()
end
