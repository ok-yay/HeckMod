require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    -- nothing
    local pain = {
        name = "parryshield"
    }

    status.addPersistentEffects("maso", {"masochism"}) -- yeahh
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    player.giveBlueprint(pain)
end

function update(dt)
    -- nothing really happens its jsut to get the effect up
end

function uninit()
    local pain = {
        name = "parryshield"
    }

    status.addPersistentEffects("maso", {"masochism"}) -- yeahh
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    player.giveBlueprint(pain)

end
