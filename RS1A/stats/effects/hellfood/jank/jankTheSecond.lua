require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    status.addPersistentEffects("butwhy", {"doubledown"}) -- no longer necessary POG
    world.sendEntityMessage(entity.id(), "removeBar", "harddamage")
    status.setResource("harddmg",0)
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismHAHAHAHAHAHAHAHAHA")
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    status.modifyResource("hellActive", 2.0) -- player is so FUCKING annoying to get working due to its stupidly limited access
    status.clearPersistentEffects("maso")

end

function update(dt)

end

function uninit()
end
