require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    -- testing if update() does anything different

    script.setUpdateDelta(100)

end

function update(dt)
    status.addPersistentEffects("maso", {"masochism"}) -- yeahh
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismPrepareThyself")
    player.giveItem({
        name = "parryshield",
        count = 1
    })

end

function uninit()
end
