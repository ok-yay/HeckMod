require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/givedeathtrack.config")

    status.addPersistentEffects("maso", {"masochism"})
    --status.addPersistentEffects("deathTracking", {"deathTracker"})
    status.addEphemeralEffects({{effect = "deathTracker", duration = 5}})
    status.setResource("deathTrack",1.0) -- may not be necessary anymore depending on circumstance

    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    status.setResource("hellActive", 1.0) -- player is so FUCKING annoying to get working due to its stupidly limited access

end

function update(dt) -- this does actually run even with an effect length of 0
    world.sendEntityMessage(entity.id(), "giveHeckBlueprints")
end

function uninit()
end
