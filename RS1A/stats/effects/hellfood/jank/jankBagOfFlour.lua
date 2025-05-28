require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    if (status.resource("flourEater") == 0.0) then
        status.addPersistentEffects("maso", {"flourEater"}) 
        status.setResource("flourEater", 1.0)
        world.sendEntityMessage(entity.id(), "queueRadioMessage", "masochismFlourEater")

    else
        status.applySelfDamageRequest({
            damageType = "IgnoresDef",
            damage = 99999,
            damageSourceKind = "default",
            sourceEntityId = entity.id()
        })

        -- blow up!!!! probably do something else
    end
end

function update(dt)

end

function uninit()
end