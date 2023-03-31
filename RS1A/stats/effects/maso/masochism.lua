require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    self.timer = 500
    self.dead = false
    self.damageListener = damageListener("damageTaken", function(notifications)
        for _, notification in pairs(notifications) do
            if notification.hitType == "Hit" then
                if notification.damageDealt > status.resourceMax("health") / 10 then

                    status.setResource("harddmg", status.resource("harddmg") + notification.damageDealt / 6)
                    self.timer = 500

                    if (status.resource("harddmg") > status.resourceMax("health") - 5) then
                        status.setResource("harddmg", status.resource("harddmg") - 5)
                    end
                end
            else
                if (notification.hitType == "kill") then
                    if (self.dead == false) then
                        world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/death.config") -- les goooooo!!!
                        self.dead = true
                    end
                end
            end
        end
    end)
    script.setUpdateDelta(5)
end

function update(dt)
    if (status.resource("health") > status.resourceMax("health") - status.resource("harddmg")) then
        status.setResource("health", status.resourceMax("health") - status.resource("harddmg"))
    end
    if (self.dead && status.resource("health") > 0) then
        self.dead = false
    end
    if (self.timer > 0) then
        self.timer = self.timer - 1
    else
        if status.resource("harddmg") > 0 then
            status.setResource("harddmg", status.resource("harddmg") - 0.1)

        else
            status.setResource("harddmg", 0)

        end
    end
    self.damageListener:update()
end

function uninit()
    status.addPersistentEffects("maso", {"masochism"}) -- incase status.clearAllPersistentEffects happens
end
