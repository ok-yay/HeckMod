require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    -- nothing

end

function update(dt)
    -- nothing really happens its jsut to get the effect up
end

function uninit()
    status.addPersistentEffects("maso", {"masochism"}) -- yeahh
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    player.giveBlueprint("parryshield")

end
