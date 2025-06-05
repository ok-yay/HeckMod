require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    status.addPersistentEffects("butwhy", {"doubledown"}) -- no longer necessary POG
    --tracker must appear AFTER the effect, itll suck dick otherwise!
    status.setResource("deathTrack",2.0)

    status.removeEphemeralEffect("deathTracker")
    status.clearPersistentEffects("deathTracking")

    status.addPersistentEffects("deathTracking", {"deathTrackReapplier"})

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
