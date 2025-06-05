require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    status.addPersistentEffects("butwhy", {"doubledown"})
    status.addPersistentEffects("deathTracking", {"deathTracker"})
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
