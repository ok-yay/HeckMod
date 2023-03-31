--THANK YOU VERY MUCH FOR THIS!!!!!
require"/scripts/messageutil.lua"

local old = init;

function init()
  message.setHandler("death", handleDeath)
  if old then old() end
  message.setHandler( "interact", localHandler(player.interact) )
end

function handleDeath()
  world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/death.config") -- les goooooo!!!
  world.sendEntityMessage(entity.id(), "queueRadioMessage", "exploreclueplanet")

end
