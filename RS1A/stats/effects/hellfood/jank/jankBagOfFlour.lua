require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    --world.spawnItem("parryshield-recipe", entity.position(), 1)
    if (status.resource("flourEater") == 0.0) then
        world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/givedeathtrack.config")

        status.addPersistentEffects("flour", {"flourEater"}) 
        status.addEphemeralEffect("deathTracker",10) -- these go away upon death :)
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
    if (status.resource("flourEater") == 1.0) then
        world.sendEntityMessage(entity.id(), "ateBagOfFlour")
    end

end

function uninit()
    bruh = false
end