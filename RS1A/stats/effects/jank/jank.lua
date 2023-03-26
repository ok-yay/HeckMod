require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    -- nothing

    script.setUpdateDelta(100)

end

function update(dt)
    -- nothing really happens its jsut to get the effect up
    status.addPersistentEffects("maso", {"masochism"}) -- yeahh
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    player.giveBlueprint("parryshield")

end

function uninit()
end
