require "/scripts/util.lua"

function init()
  player.giveBlueprint("parryshield")
end

function update(dt)
  
end

function uninit()
  player.interact("ScriptPane","/interface/harddmg/harddmg.config")
end