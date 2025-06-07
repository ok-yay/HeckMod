require "/scripts/util.lua"
require "/scripts/status.lua"

local joinedAlready = false -- i might be thinking of this incorrectly but lmao!!!!!

function init() --hard dmg doesnt go away nearly as easily this time buckaroo!
    -- so APPARENT-FUCKING-LY this motherfucking function gets called on death or some shit when you die?????????
    status.setResource("deathTrack",2.0)
end

function update(dt)
    if ((status.resource("deathTrack") == 0.0 or status.resource("deathTrack") == 2.0) and joinedAlready == true) then
        sb.logInfo("if this is consistent i am actually going to shoot myself")
        stageHandJank()
        status.setResource("deathTrack",1.0)
    end
    if (joinedAlready == false) then
        sb.logInfo("VRO!!!! it could work.")
    end
    joinedAlready = true
end

function stageHandJank()
    world.spawnStagehand(entity.position(),"weirdserverside",{
        playerThatDied = world.entityName(entity.id()),
    })
    
    
end

function uninit()
end
