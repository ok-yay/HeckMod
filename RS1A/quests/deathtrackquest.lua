-- this... is better than opening a fucking gui and then closing it immediately after but i dont like having an always running quest... it feels icky. oh well, shouldnt impact performance since it cannot be completed
require "/scripts/messageutil.lua"

function init()
    self.deathTrack = false
    self.timed = 0

    message.setHandler("ateBagOfFlour", localHandler(ateBagOfFlour))
    message.setHandler("fillAllTheArmor", localHandler(fillArmor))
    message.setHandler("giveHeckBlueprints", localHandler(giveHeckBlueprints))
    -- unused but they'll stay for now
    message.setHandler("perhapsDied", localHandler(potentialDeath))
    message.setHandler("blowTheHellUp",localHandler(blowUp))
    checkInitGap() -- DEFINITELY not from frackin i dont know what you're talking about
    potentialDeath()
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
    if (storage.veryActiveTime > 3 and (status.resource("hellActive") > 0.0 or status.resource("flourEater") > 0.0)) then
        if (status.stat("notDead") == 0.0) then
            world.spawnStagehand(entity.position(),"weirdserverside",{
                playerThatDied = world.entityName(entity.id()),
            })
        end
    end
end

function update()
    --[[
    if (self.deathTrack == false) then
        self.deathTrack = true
        potentialDeath() -- because it being in init could cause some issues

    end
    ]]--
    sb.logInfo(storage.veryActiveTime)
    if (storage.veryActiveTime<10) then -- could use storage here maybe, would have to check of course if the quest gets reinitialized on death
        storage.veryActiveTime=(storage.veryActiveTime or 0)+1
    end

    if (status.resource("hellActive") == 0.0 and status.resource("flourEater") == 0.0) then
        self.timed = self.timed + 1
    end

    if (self.timed>5) then
        blowUp()
    end
end

function blowUp() -- hopefully shouldn't need to check in update but i may have to depending on circumstances
    if (status.resource("hellActive") == 0.0 and status.resource("flourEater") == 0.0) then
        quest.fail()
        sb.logInfo("vro..")
    end
end


-- shamelessly copied from frackin, like a lot of things in this mod :)

function checkInitGap()
	--sb.logInfo("storage.activeTime a %s %s",storage.activeTime,storage.lastTime)
	local currentTime=os.time()
	storage.someKindOfLastTime=storage.someKindOfLastTime or currentTime
	local gap=math.abs(currentTime-storage.someKindOfLastTime)
    sb.logInfo(gap)
	--sb.logInfo("storage.activeTime b %s %s",storage.activeTime,storage.lastTime)
	storage.veryActiveTime=((not (gap > 5.0)) and storage.veryActiveTime) or 0 -- if you're loading for longer than 5 seconds you have some fucking issues
end

function uninit()
    storage.someKindOfLastTime=os.time()
end