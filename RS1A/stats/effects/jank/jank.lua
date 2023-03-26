require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    -- testing if update() does anything different

    status.addPersistentEffects("maso", {"masochism"}) -- yeahh
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    world.spawnItem("parryshield-recipe", entity.position(), 1)

end

function update(dt)

end

function uninit()
end
