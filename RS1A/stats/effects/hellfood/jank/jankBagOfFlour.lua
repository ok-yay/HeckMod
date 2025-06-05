require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    if (status.resource("flourEater") == 0.0) then
        world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/floureat.config") -- les goooooo!!!

        status.addPersistentEffects("flour", {"flourEater"}) 
        status.addPersistentEffects("deathTracking", {"deathTracker"})
        status.setResource("deathTrack",1.0)


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