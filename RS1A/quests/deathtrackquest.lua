-- this... is better than opening a fucking gui and then closing it immediately after but i dont like having an always running quest... it feels icky. oh well, shouldnt impact performance since it cannot be completed
require "/scripts/messageutil.lua"

function init()
    self.deathTrack = false
    self.broYouDied = false
    self.timeTilFail = 0
    self.timeSinceInit = 0 -- incase the effect goes away somehow after init

    message.setHandler("ateBagOfFlour", localHandler(ateBagOfFlour))
    message.setHandler("fillAllTheArmor", localHandler(fillArmor))
    message.setHandler("giveHeckBlueprints", localHandler(giveHeckBlueprints))
    -- unused but they'll stay for now
    message.setHandler("perhapsDied", localHandler(potentialDeath))
    message.setHandler("blowTheHellUp",localHandler(blowUp))
end

-- could just do lambda or whatever but uhhhh shut up :)

function ateBagOfFlour()
    player.giveItem({name="money", count=100})
    player.giveBlueprint("parryshield")
    player.giveBlueprint("flourweevil")
    fillArmor()
end

function fillArmor()
    player.setEquippedItem("head","donttakeitoffhead")
    player.setEquippedItem("chest","donttakeitoffchest")
    player.setEquippedItem("legs","donttakeitofflegs")
end

function giveHeckBlueprints()
    player.giveBlueprint("parryshield")
    player.giveBlueprint("doubledown") -- :)
    player.giveBlueprint("apology")
end

function potentialDeath()
    -- ensuring that you're still actively doing the thing
    --[[
    if (storage.veryActiveTime > 3 and (status.resource("hellActive") > 0.0 or status.resource("flourEater") > 0.0)) then
        sb.logInfo("ddammm")
        if (status.stat("notDead") == 0.0) then
            sb.logInfo("WHERES THE FUCKING")
            status.addEphemeralEffect("deathTracker",10)
            self.broYouDied = true
        end
    end
    ]] --epic test rq to see if the timer is even fucking necessary
     if ((status.resource("hellActive") > 0.0 or status.resource("flourEater") > 0.0) and self.timeSinceInit<2) then
        sb.logInfo("oh my lord. its necessary.")
        self.broYouDied = true
    end
end

function update()
    --[[
    if (self.deathTrack == false) then
        self.deathTrack = true
        potentialDeath() -- because it being in init could cause some issues

    end
    ]]--
    if (self.broYouDied == true) then
        storage.amountYouHaveDied = (storage.amountYouHaveDied or 0)+1 -- in theory at least
        world.spawnStagehand(entity.position(),"weirdserverside",{
            playerThatDied = world.entityName(entity.id()),
            amountTheyHaveDied = storage.amountYouHaveDied,
        })
        self.broYouDied = false
    end

    if (status.resource("hellActive") == 0.0 and status.resource("flourEater") == 0.0) then
        self.timeTilFail = self.timeTilFail + 1
    end

    if (self.timeTilFail>5) then
        blowUp()
    end

    if (self.timeSinceInit<2) then -- since delta 60
        self.timeSinceInit = self.timeSinceInit + 1 -- i assume += exists but im too lazy to actually figure that out
    end

    if (status.stat("notDead") == 0.0) then --this should only really happen if the effect gets cleansed by non-death
        potentialDeath()
        status.addEphemeralEffect("deathTracker",10)
    end
end

function blowUp() -- hopefully shouldn't need to check in update but i may have to depending on circumstances
    if (status.resource("hellActive") == 0.0 and status.resource("flourEater") == 0.0) then
        quest.fail()
        sb.logInfo("Getting rid of death-tracking")
    end
end

function uninit()

end

--[[

ok so here's as good of an explanation i can give for how this hunk of shit works:

basically ephemeral effects go away on death (or something)

]]