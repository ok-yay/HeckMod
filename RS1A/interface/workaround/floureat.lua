require "/scripts/util.lua"

function init()
    player.giveItem({name="money", count=100})

    player.giveBlueprint("parryshield")
    player.giveBlueprint("flourweevil")
    pane.dismiss()
end

function update(dt)

end

function uninit()
    
end
