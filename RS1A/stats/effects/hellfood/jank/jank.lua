require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/blueprint.config") -- les goooooo!!!

    status.addPersistentEffects("maso", {"masochism"}) -- no longer necessary POG
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    status.setResource("hellActive", 1.0) -- player is so FUCKING annoying to get working due to its stupidly limited access

end

function update(dt)

end

function uninit()
end
