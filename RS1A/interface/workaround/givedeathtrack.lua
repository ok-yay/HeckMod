require "/scripts/util.lua"

function init()
    if (not player.hasQuest("deathtrackquest")) then
        player.startQuest("deathtrackquest") -- lol, lmao even
    end
    pane.dismiss()
end

function update(dt)

end

function uninit()
    
end
