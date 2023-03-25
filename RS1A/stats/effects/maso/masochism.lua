require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    self.timer = 1000
    status.setResource("harddmg", 0.0)
    self.damageListener = damageListener("damageTaken", function(notifications)
        for _, notification in pairs(notifications) do
            if notification.hitType == "Hit" then
                if notification.damageDealt > status.resourceMax("health") / 10 then
                    world.sendEntityMessage(entity.id(), "queueRadioMessage", "exploreclueplanet")

                    status.setResource("harddmg", status.resource("harddmg") + notification.damageDealt / 6)

                    world.sendEntityMessage(entity.id(), "queueRadioMessage", "approachingclue")

                    if (status.resource("harddmg") > status.resourceMax("health") - 5) then
                        status.setResource("harddmg", status.resource("harddmg") - 5)
                    end
                end
            end
            self.timer = 1000
        end
    end)
    script.setUpdateDelta(5)
end

function update(dt)
    if (status.resource("health") > status.resourceMax("health") - status.resource("harddmg")) then
        status.setResource("health", status.resourceMax("health") - status.resource("harddmg"))
    end
    if (self.timer > 0) then
        self.timer = self.timer - 1
    else
        if status.resource("harddmg") > 0 then
            status.setResource("harddmg", status.resource("harddmg") - 0.01)

        end
    end
    self.damageListener:update()
end

function uninit()
end
