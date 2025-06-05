require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/blueprint.config") -- les goooooo!!!

    status.addPersistentEffects("maso", {"masochism"})
    --tracker must appear AFTER the effect, itll suck dick otherwise!
    status.setResource("deathTrack",2.0)
    status.removeEphemeralEffect("deathTracker")
    status.clearPersistentEffects("deathTracking")

    status.addPersistentEffects("deathTracking", {"deathTrackReapplier"})

    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    status.setResource("hellActive", 1.0) -- player is so FUCKING annoying to get working due to its stupidly limited access

end

function update(dt)

end

function uninit()
end
