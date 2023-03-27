require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    -- testing if update() does anything different

    status.addPersistentEffects("maso", {"masochism"}) -- yeahh
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    world.spawnItem("parryshield-recipe", entity.position(), 1)
    status.setStatusProperty("hell",1) --id use player.getStat but player is so FUCKING annoying to get working due to its stupidly limited access

end

function update(dt)

end

function uninit()
end
