require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
  self.harddmg = 0
  self.damageListener = damageListener("damageTaken", function(notifications)
    for _,notification in pairs(notifications) do
	  if notification.hitType == "Hit" then
	    if notification.damageDealt > status.resourceMax("health")/10 then
		  self.harddmg = self.harddmg + notification.damageDealt/6 --i have no fucking clue why but it do be doing 3 times the damage it should
		  if (self.harddmg > status.resourceMax("health")-5) then
	        self.harddmg = status.resourceMax("health")-5
          end
		end
	  end
	  world.sendEntityMessage(entity.id(), "queueRadioMessage", "exploreclueplanet")
    end
  end)
  script.setUpdateDelta(5)
end

function update(dt)
  if (status.resource("health") > status.resourceMax("health") - self.harddmg) then
    status.setResource("health",status.resourceMax("health") - self.harddmg)
  end
  self.damageListener:update()
end

function uninit()
end
