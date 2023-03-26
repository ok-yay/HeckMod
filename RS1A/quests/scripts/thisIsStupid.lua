require "/scripts/util.lua"
require "/quests/scripts/questutil.lua"

function init()
    script.setUpdateDelta(60)
    world.sendEntityMessage(entity.id(), "queueRadioMessage", "exploreclueplanet")

end
function update()
    if status.getPersistentEffects("maso")[0] == "masochism" then
        player.giveBlueprint("parryshield")
        quest.fail()
    end -- its only purpose is to FUCKING give the parry shield... AND I THOUGHT MAKING A BUFF THAT LASTS 0 SECONDS WAS BAD!

end
function uninit()

end
