require "/scripts/util.lua"
require "/scripts/status.lua"

function init() --hard dmg doesnt go away nearly as easily this time buckaroo!
    -- so APPARENT-FUCKING-LY this motherfucking function gets called on death or some shit when you die?????????
    status.setResource("deathTrack",2.0)
end

function update(dt)
    if (status.resource("deathTrack") == 0.0 or status.resource("deathTrack") == 2.0) then
        sb.logInfo("if this is consistent i am actually going to shoot myself")
        status.setResource("deathTrack",1.0)
    end
end

function uninit()
end
