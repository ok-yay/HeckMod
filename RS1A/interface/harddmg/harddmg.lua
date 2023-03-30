require "/scripts/util.lua"

function init()
  world.sendEntityMessage(entity.id(), "queueRadioMessage", "exploreclueplanet")
end

function update(dt)
  
end

function uninit()

end