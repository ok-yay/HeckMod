-- this... is better than opening a fucking gui and then closing it immediately after but i dont like having an always running quest... it feels icky. oh well, shouldnt impact performance since it cannot be completed

function init()
    self.theTime = 0
    message.setHandler("ateBagOfFlour", ateBagOfFlour)
    message.setHandler("fillAllTheArmor", fillArmor)
    message.setHandler("giveHeckBlueprints", giveHeckBlueprints)
    message.setHandler("perhapsDied", potentialDeath)
    message.setHandler("blowTheHellUp",blowUp)
    sb.logInfo("now i gotta see if this gets reinitialized upon death. i dont think so but i could be wrong")
    -- if it does then GUESS WHO'S GONNA COPY CODE FROM FRACKIN AGAIN??? THATS RIGHT! ITS ME!!!

end

-- could just do lambda or whatever but uhhhh shut up :)

function ateBagOfFlour()
    player.giveItem({name="money", count=100})
    player.giveBlueprint("parryshield")
    player.giveBlueprint("flourweevil")

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
    if (self.theTime > 5 and (status.resource("hellActive") > 0.0 or status.resource("flourEater") > 0.0)) then
        world.spawnStagehand(entity.position(),"weirdserverside",{
            playerThatDied = world.entityName(entity.id()),
        })
    end
end

function update()
    sb.logInfo("im updating it. im updating it")
    if (self.theTime<10) then -- could use storage here maybe, would have to check of course if the quest gets reinitialized on death
        self.theTime = self.theTime + 1
    end
end

function blowUp() -- hopefully shouldn't need to check in update but i may have to depending on circumstances
    if (status.resource("hellActive") == 0.0 and status.resource("flourEater") == 0.0)
        quest.fail()
    end
end

function uninit()
    sb.logInfo("Not a fan I see...")
end