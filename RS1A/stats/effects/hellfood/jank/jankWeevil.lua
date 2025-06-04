require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    status.setResource("flourEater", 0.0)
    status.clearPersistentEffects("flour")

end

function update(dt)

end

function uninit()
end