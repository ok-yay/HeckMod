require "/scripts/util.lua"

function init()
    player.consumeCurrency("money", math.floor((player.currency("money")*2)/7))
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "exploreclueplanet")

    sb.logInfo(player.id() + " the " + player.species() + " is dumb as shit.")
    pane.dismiss()
end

function update(dt)

end

function uninit()

end
