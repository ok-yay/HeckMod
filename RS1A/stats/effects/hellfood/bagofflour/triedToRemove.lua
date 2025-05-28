require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"
-- not used at all btw
function init()
    world.sendEntityMessage(entity.id(), "interact", "ScriptPane", "/interface/workaround/fillarmor.config") -- les goooooo!!!
    -- maybe straight up kill you as well who knows????
end

function update(dt)

end

function uninit()
end
