require "/scripts/util.lua"

-- not gonna lie this scriptpane workaround is pretty fuckin nice
-- the ui should only appear on the consumption of the hell food so it shouldnt have any possibility of pulling some shit
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
