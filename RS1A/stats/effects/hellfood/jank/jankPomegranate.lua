require "/scripts/util.lua" -- i suck at doing starb
require "/scripts/status.lua"

function init()
    status.addPersistentEffects("pastyoudecidedthatfutureyoucantbackdown", {"pomegranateBlock"})
end

function update(dt) -- this does actually run even with an effect length of 0
end

function uninit()
end
