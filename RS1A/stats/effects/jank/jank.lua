require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    -- testing if update() does anything different

    script.setUpdateDelta(100)
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")

end

function update(dt)
    status.addPersistentEffects("maso", {"masochism"}) -- yeahh
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    player.giveBlueprint("parryshield")

end

function uninit()
end
