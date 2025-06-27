-- this... is better than opening a fucking gui and then closing it immediately after but i dont like having an always running quest... it feels icky. oh well, shouldnt impact performance since it cannot be completed
require "/scripts/messageutil.lua"

function isInMech()
    if (player.loungingIn() ~= nil) then
        return world.entityName(player.loungingIn()) == "modularmech"
    end
    return false
end

function init()
    self.mechTime = isInMech()
    self.broYouDied = false
    self.timeTilFail = 0
    self.timeSinceInit = 0 -- incase the effect goes away somehow after init

    message.setHandler("ateBagOfFlour", localHandler(ateBagOfFlour)) --dont think localHandler actually makes any difference but im not going to change it because it works!
    message.setHandler("fillAllTheArmor", localHandler(fillArmor))
    message.setHandler("giveHeckBlueprints", localHandler(giveHeckBlueprints))
    -- unused but they'll stay for now
    message.setHandler("perhapsDied", localHandler(potentialDeath))
    message.setHandler("blowTheHellUp",localHandler(blowUp))
    message.setHandler("resetCount",localHandler(resetCount))
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
    player.giveBlueprint("doubledown")
    player.giveBlueprint("apology")
end

function resetCount()
    sb.logInfo("im going to lose it")
    storage.amountYouHaveDied = nil
end

function potentialDeath()
    --sb.logInfo(tostring(isInMech()) .. tostring(storage.mechStuff))
    if ((status.stat("hellActive") > 0.0 or status.stat("flourEater") > 0.0) and self.timeSinceInit<3 and isInMech() == false and storage.mechStuff == false) then
        sb.logInfo("Server should soon say that you died")
        self.broYouDied = true
    end
end

function update()
    if (storage.mechStuff == nil) then --idk why the fuck its getting freaky sauce
        storage.mechStuff = true
    end
    if (status.stat("notDead") == 0.0) then -- readds the effect
        potentialDeath()
        status.addEphemeralEffect("deathTracker",10)
    end
    if (self.broYouDied == true) then
        sb.logInfo("...any second now it should broadcast it...")
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

    if (self.timeTilFail>10) then
        blowUp()
    end

    if (self.timeSinceInit<10) then -- since delta 60
        self.timeSinceInit = self.timeSinceInit + 1 -- i assume += exists but im too lazy to actually figure that out
    end
    storage.mechStuff = isInMech()
end

function blowUp() -- hopefully shouldn't need to check in update but i may have to depending on circumstances
    if (status.resource("hellActive") == 0.0 and status.resource("flourEater") == 0.0) then
        quest.fail()
        sb.logInfo("Getting rid of death track quest and effect")
        status.removeEphemeralEffect("deathTracker")
    end
end

function uninit()

end

--[[

THE COMPLAINING CORNER

player.isDeployed() is misleading as fuck dude
why the shit are mechs the most fucked things in the world to deal with????

]]