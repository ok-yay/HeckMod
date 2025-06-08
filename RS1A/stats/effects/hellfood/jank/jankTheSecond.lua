require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/givedeathtrack.config")

    status.addPersistentEffects("butwhy", {"doubledown"})
    status.addPersistentEffects("deathTracking", {"deathTracker"}) -- i do wonder if this can cause it to double up, would need to check tbh and i could use status.resource to solve it despite the fact that i hate doing that
    status.setResource("deathTrack",1.0)

    world.sendEntityMessage(entity.id(), "removeBar", "harddamage")
    
    status.setResource("harddmg",0)
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismHAHAHAHAHAHAHAHAHA")
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    status.setResource("hellActive", 2.0)
    status.clearPersistentEffects("maso")

end

function update(dt)

end

function uninit()
end
