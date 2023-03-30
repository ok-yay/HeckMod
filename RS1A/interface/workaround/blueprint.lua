require "/scripts/util.lua"

function init()
    player.giveBlueprint("parryshield")
    pane.dismiss()
end

function update(dt)

end

function uninit()
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "exploreclueworld")
end
