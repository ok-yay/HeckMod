require "/scripts/util.lua"
require "/scripts/status.lua"
function init() --hard dmg doesnt go away nearly as easily this time buckaroo!
    --status.setStatusProperty("deathReapplier",1.0) -- only on init so shouldnt be an issue BUT dick and balls
    status.setStatusProperty("deathTrack",1.0) --id REALLY, REAAAAAAALLY love to use setResource but for whatever DUMB FUCK reason it keeps resetting the fucking resource values to 0 whenever you die. i dont know why so now i have to use fucking status properties which have the potential to fuck your performance (an issue that starbound is already very familiar with)... YAY!!!!!!!!!!!!
    prevHell = status.resource("hellActive")
    prevFlour = status.resource("flourEater")
end

-- also i probably have a rat on my laptop/crypto miner, should probably format it but eh

function update(dt) -- simply add this and it'll automatically make deathTracker after it so lol
    sb.logInfo(status.resource("hellActive") .. " bro")
    sb.logInfo(status.resource("flourEater") .. " PLEASE bro")
    sb.logInfo(status.resource("deathTrack") .. " its SO over bro")

    status.setResource("deathTrack",1.0)

    if (status.stat("ballsInYoFace") == 0.0) then
        status.addEphemeralEffect("deathTracker",10) -- this is cleary fine
    end
    --[[
    if (status.resource("hellActive")+prevHell == 0.0 and status.resource("flourEater")+prevFlour == 0.0) then
        sb.logInfo("wait what the fuck?")

        status.clearPersistentEffects("deathTracking") -- so if this happen during death it blows up your game?
    end
    ]]-- i dont know why the shit it doesnt want to work. im keeping this here incase i figure out some dumb fuck way to do it but for now removal will be manual. pray that you do not get stuck with this BULLSHIT.
    sb.logInfo("it end..")
end

function uninit()
    status.setStatusProperty("deathTrack",0.0) -- would love to use statusProperty but i fear it lol

    -- guess what time it is? that's right! jank-o-clock!
    -- so things uninitialize (it would seem) in the order that they are applied MEANING this effect should always be applied before deathTracker
    if (status.resource("hellActive") > 0.0 or status.resource("flourEater") > 0.0) then --only track if hell is activated
        status.addPersistentEffects("deathTracking", {"deathTrackReapplier"}) -- incase status.clearAllPersistentEffects happens
    end
end
